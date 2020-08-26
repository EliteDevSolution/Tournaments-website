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

$channel_id   = (!empty($_GET['channel_id']) && is_numeric($_GET['channel_id'])) ? $_GET['channel_id'] : 0;

if (!IS_LOGGED && empty($channel_id)) {

	$response_data    = array(
	    'api_status'  => '400',
	    'api_version' => $api_version,
	    'errors' => array(
            'error_id' => '1',
            'error_text' => 'Not logged in'
        )
	);
}
else{
	
	$response_data     = array(
        'api_status'   => '200',
        'api_version'  => $api_version,
        'data'         => array()
    );

	$user_id = $user->id;
	$t_lists = T_LISTS;
	$offset  = (!empty($_GET['offset']) && is_numeric($_GET['offset'])) ? $_GET['offset'] : 0;
	$limit   = (!empty($_GET['limit']) && is_numeric($_GET['limit'])) ? $_GET['limit'] : 10;
	$channel_id   = (!empty($_GET['channel_id']) && is_numeric($_GET['channel_id'])) ? $_GET['channel_id'] : 0;

	
	if ($offset) {
		#offset list by id
		$db->where('id',$offset,'>');
	}
	if (!empty($channel_id)) {
		$db->where('user_id', $channel_id);
	} else {
		$db->where('user_id', $user_id);
	}
	$lists   = $db->get($t_lists, $limit);
	
	foreach ($lists as $list) {

		$db->where('list_id',$list->list_id);
		$play_list    = $db->get(T_PLAYLISTS);
		$list->videos = array();

		foreach ($play_list as $row) {

			$video_data = PT_GetVideoByID($row->video_id,0,0,2);
			if (!empty($video_data)) {

				$user_data           = PT_UserData($video_data->user_id);
				$video_data->owner = array_intersect_key(
					ToArray($user_data), 
					array_flip($user_public_data)
				);

				$list->videos[]    = $video_data;
			}
		}

		$response_data['data'][]   = $list;
	}
	$response_data['my_all_playlists'] = $db->where('user_id', $user_id)->get($t_lists);
}
