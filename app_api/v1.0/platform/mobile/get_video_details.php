<?php
// +------------------------------------------------------------------------+
// | @author Deen Doughouz (DoughouzForest)
// | @author_url 1: http://www.playtubescript.com
// | @author_url 2: http://codecanyon.net/user/doughouzforest
// | @author_email: wowondersocial@gmail.com   
// +------------------------------------------------------------------------+
// | PlayTube - The Ultimate Video Sharing Platform
// | Copyright (c) 2017 PlayTube. All rights reserved.
// +------------------------------------------------------------------------+


  

if (empty($_GET['video_id'])) {
	$response_data       = array(
        'api_status'     => '400',
        'api_version'    => $api_version,
        'errors'         => array(
            'error_id'   => '1',
            'error_text' => 'Bad Request, Invalid or missing parameter'
        )
    );
}

else{

	$video_id = PT_Secure($_GET['video_id']);
	$video    = $db->where('video_id',$video_id)->getOne(T_VIDEOS,array('video_id','user_id'));

	if (empty($video)) {
		$response_data       = array(
	        'api_status'     => '404',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '2',
	            'error_text' => 'Video does not exist'
	        )
	    );
	}


	else{

		$video_data = PT_GetVideoByID($video->video_id,0,1);

		if (!empty($video_data)) {
			$t_videos                     = T_VIDEOS;
			$video_data->is_subscribed    = 0;
			$video_data->suggested_videos = array();
			$video_data->owner            = array_intersect_key(
				ToArray($video_data->owner), 
				array_flip($user_public_data)
			);

			if (IS_LOGGED && $video_data->user_id != $user->id) {
				$db->where('subscriber_id',$user->id);
				$db->where('user_id',$video_data->user_id);
				$db->where('active',1);
				$subscribed = ($db->getValue(T_SUBSCRIPTIONS,'count(*)') > 0);

				if (($subscribed === true)) {
					$video_data->is_subscribed = 1;
				}
			}


			$video_title       = PT_Secure($video_data->title);

			$sql_query         = "
				SELECT * FROM `$t_videos` 
				WHERE MATCH (title) 
				AGAINST ('$video_title') 
				AND id <> '{$video_data->id}' 
				ORDER BY `id` DESC 
				LIMIT 20";

			$related_videos = $db->rawQuery($sql_query);

			foreach ($related_videos as $related_video) {
				$related_video         = PT_GetVideoByID($related_video, 0, 1, 0);
				$user_data             = PT_UserData($related_video->user_id);
				$related_video->owner  = array_intersect_key(
					ToArray($user_data), 
					array_flip($user_public_data)
				);

				$video_data->suggested_videos[] = $related_video;
			}
			
			$response_data     = array(
		        'api_status'   => '200',
		        'api_version'  => $api_version,
		        'data'         => $video_data
		    );

		    $update = array('views' => ($video_data->views += 1));
		    $db->where('video_id',$video_id)->update($t_videos,$update);
		}

		else{

			$response_data       = array(
		        'api_status'     => '500',
		        'api_version'    => $api_version,
		        'errors'         => array(
		            'error_id'   => '3',
		            'error_text' => 'Error: an unknown error occurred. Please try again later'
		        )
		    );
		}
	}
}