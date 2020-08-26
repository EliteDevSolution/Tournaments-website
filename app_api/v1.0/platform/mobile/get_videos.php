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

$table                = T_VIDEOS;
$response_data        = array(
    'api_status'      => '200',
    'api_version'     => $api_version,
    'data'            => array(
    	'featured'    => array(),
    	'top'         => array(),
    	'latest'      => array(),
    )
);

$get_params           = array(
	'featured_offset' => null,
	'top_offset'      => null,
	'latest_offset'   => null,
	'limit'           => null
);

foreach ($get_params as $key => $value) {
	if (!empty($_GET[$key]) && is_numeric($_GET[$key])) {
		$get_params[$key] = $_GET[$key];
	}	
}




# Home Page Featured Videos
if (!empty($get_params['featured_offset'])) {
	$db->where('id', $get_params['featured_offset'],'<');
}

$db->where('featured', '1')->orderBy('RAND()');
$featured = array();
$limit    = ((!empty($get_params['limit'])) ? $get_params['limit'] : 10);
$featured = $db->get($table,$limit,array('video_id','user_id'));

if (empty($featured)) {
	if (!empty($get_params['featured_offset'])) {
		$db->where('id', $get_params['featured_offset'],'<');
	}
    $featured = $db->orderBy('id', 'DESC')->get(T_VIDEOS,$limit,array('video_id','user_id'));
}


foreach ($featured as $video) {
	$video = PT_GetVideoByID($video->video_id);
	if (!empty($video)) {
		$video->owner = array_intersect_key(ToArray($video->owner), array_flip($user_public_data));
		$response_data['data']['featured'][] = $video;
	}
}

#Home Page Top Videos
if (!empty($get_params['top_offset'])) {
	$db->where('id', $get_params['top_offset'],'<');
}

$limit = ((!empty($get_params['limit'])) ? $get_params['limit'] : 6);
$top   = $db->orderby('views', 'DESC')->get(T_VIDEOS, $limit,array('video_id','user_id'));

foreach ($top as $video) {
	$video = PT_GetVideoByID($video->video_id);
	if (!empty($video)) {
		$video->owner = array_intersect_key(ToArray($video->owner), array_flip($user_public_data));
		$response_data['data']['top'][] = $video;
	}
}


#Home Page Latest Videos
if (!empty($get_params['latest_offset'])) {
	$db->where('id', $get_params['latest_offset'],'<');
}

$limit  = ((!empty($get_params['limit'])) ? $get_params['limit'] : 10);
$latest = $db->orderby('id', 'DESC')->get(T_VIDEOS, $limit,array('video_id','user_id'));

foreach ($latest as $video) {
	$video = PT_GetVideoByID($video->video_id);
	if (!empty($video)) {
		$video->owner = array_intersect_key(ToArray($video->owner), array_flip($user_public_data));
		$response_data['data']['latest'][] = $video;
	}
}
