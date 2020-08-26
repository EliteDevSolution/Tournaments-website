<?php 
if ($pt->config->popular_channels != 'on') {
	header("Location: " . PT_Link(''));
	exit();
}
$text = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video-off"><path d="M16 16v1a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2h2m5.66 0H14a2 2 0 0 1 2 2v3.34l1 1L23 7v10"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>' . $lang->no_channels_found_for_now . '</div>';
$final2 = '';

$types = array('views','subscribers');
$type = 'views';

if (!empty($_GET['type']) && in_array($_GET['type'], $types)) {
	$type = $_GET['type'];
}


$sort_types = array('today','this_week','this_month','this_year','all_time');
$sort_type = 'all_time';
$pt->cat_type = 'all_time';

if (!empty($_GET['sort_type']) && in_array($_GET['sort_type'], $sort_types)) {
	$sort_type = $_GET['sort_type'];
}

if ($sort_type == 'today') {
	$start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
	$end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
	$pt->cat_type = 'today';
}
elseif ($sort_type == 'this_week') {
	
	$time = strtotime(date('l').", ".date('M')." ".date('d').", ".date('Y'));
	if (date('l') == 'Saturday') {
		$start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
	}
	else{
		$start = strtotime('last saturday, 12:00am', $time);
	}

	if (date('l') == 'Friday') {
		$end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
	}
	else{
		$end = strtotime('next Friday, 11:59pm', $time);
	}
	$pt->cat_type = 'this_week';
}
elseif ($sort_type == 'this_month') {
	$start = strtotime("1 ".date('M')." ".date('Y')." 12:00am");
	$end = strtotime(cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'))." ".date('M')." ".date('Y')." 11:59pm");
	$pt->cat_type = 'this_month';
}
elseif ($sort_type == 'this_year') {
	$start = strtotime("1 January ".date('Y')." 12:00am");
	$end = strtotime("31 December ".date('Y')." 11:59pm");
	$pt->cat_type = 'this_year';
}

if ($type == 'views') {
	if ($sort_type == 'all_time') {
		$videos = $db->rawQuery('SELECT user_id, SUM(views) AS count FROM '.T_VIDEOS.' GROUP BY user_id ORDER BY count DESC LIMIT 20');
	}
	else{
		$videos = $db->rawQuery('SELECT u.user_id AS user_id , v.video_id, COUNT(*) AS count FROM '.T_VIEWS.' v ,'.T_VIDEOS.' u WHERE v.time >= '.$start.' AND v.time <= '.$end.' AND u.id = v.video_id GROUP BY u.user_id ORDER BY count DESC LIMIT 20');
	}
	
	// if (count($videos) < 20) {
	// 	$users_ids = array();
	// 	foreach ($videos as $key => $value) {
	// 		$users_ids[] = $value->user_id;
	// 	}

	// 	$limit = (20 - count($videos) == 1)  ? 2 : (20 - count($videos));
	// 	$last_videos = $db->where('id',$users_ids,'NOT IN')->orderBy("id","DESC")->get(T_USERS,$limit);
	// 	if (!empty($last_videos)) {
	// 		foreach ($last_videos as $key => $value) {
	// 			$value->user_id = $value->id;
	// 			$value->count = 0;
	// 			$videos[] = $value;
	// 		}
	// 	}
	// }
}
elseif ($type == 'subscribers') {
	if ($sort_type == 'all_time') {
		$videos = $db->rawQuery('SELECT user_id, COUNT(*) AS count FROM '.T_SUBSCRIPTIONS.' GROUP BY user_id ORDER BY count DESC LIMIT 20');
	}
	else{
		$videos = $db->rawQuery('SELECT user_id, COUNT(*) AS count FROM '.T_SUBSCRIPTIONS.' WHERE time >= '.$start.' AND time <= '.$end.'  GROUP BY user_id ORDER BY count DESC LIMIT 20');
	}
	
	// if (count($videos) < 20) {
	// 	$users_ids = array();
	// 	foreach ($videos as $key => $value) {
	// 		$users_ids[] = $value->user_id;
	// 	}

	// 	$limit = (20 - count($videos) == 1)  ? 2 : (20 - count($videos));
	// 	$last_videos = $db->where('id',$users_ids,'NOT IN')->orderBy("id","DESC")->get(T_USERS,$limit);
	// 	if (!empty($last_videos)) {
	// 		foreach ($last_videos as $key => $value) {
	// 			$value->user_id = $value->id;
	// 			$value->count = 0;
	// 			$videos[] = $value;
	// 		}
	// 	}
	// }
}

if (!empty($videos)) {
	foreach ($videos as $key => $value) {
		if ($type == 'views') {
			$views_count = number_format($value->count);
			$views_ = $value->count;
			$subscribers = $db->rawQuery('SELECT COUNT(*) AS count FROM '.T_SUBSCRIPTIONS.' WHERE user_id = '.$value->user_id.' GROUP BY user_id LIMIT 1');
			$subscribers_count = 0;
			if (isset($subscribers[0])) {
				$subscribers_count = ($subscribers[0]->count > 0) ? number_format($subscribers[0]->count) : 0;
			}
		}
		elseif ($type == 'subscribers') {
			$subscribers_count = number_format($value->count);
			$views_ = $value->count;
			$views = $db->rawQuery('SELECT SUM(views) AS count FROM '.T_VIDEOS.' WHERE user_id = '.$value->user_id.' GROUP BY user_id LIMIT 1');
			$views_count = 0;
			if (isset($views[0])) {
				$views_count = ($views[0]->count > 0) ? number_format($views[0]->count) : 0;
			}
			
			
		}
    	$user = PT_UserData($value->user_id);
    	if (!empty($user)) {
    		if (strlen($user->name) > 25) {
	    		$user->name = substr($user->name, 0,20).'..';
	    	}
    		$final2 .= PT_LoadPage('popular_channels/list', array(
			    'ID' => $user->id,
			    'USER_DATA' => $user,
			    'VIEWS' => $views_count,
			    'VIEWS_COUNT' => $views_,
			    'POINT' => number_format($user->point),
			    'SUB' => $subscribers_count
			));
    	}
    	
    }
}

$final = (!empty($final2)) ? $final2 : $text;
$pt->type = $type;
$pt->channels_count = count($videos);
$pt->page_url_ = $pt->config->site_url.'/popular_channels?type='.$type.'&sort_type='.$sort_type;
$pt->page        = 'popular_channels';
$pt->title       = $lang->popular_channels . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = $pt->config->keyword;
$pt->content     = PT_LoadPage('popular_channels/content', array(
    'CHANNELS' => $final
));