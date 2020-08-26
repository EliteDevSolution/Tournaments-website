<?php
if (IS_LOGGED == false || $pt->config->history_system != 'on') {
    header("Location: " . PT_Link('login'));
    exit();
}

$list = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video-off"><path d="M16 16v1a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2h2m5.66 0H14a2 2 0 0 1 2 2v3.34l1 1L23 7v10"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>' . $lang->no_videos_found_history . '</div>';
$final = '';
$get_history_videos = array();
$get = $db->where('user_id', $user->id)->orderby('id', 'DESC')->get(T_HISTORY, 20);

if (!empty($get)) {
    foreach ($get as $key => $video_) {
       $fetched_video = $db->where('id', $video_->video_id)->getOne(T_VIDEOS);
       $fetched_video->history_id = $video_->id;
       $get_history_videos[] = $fetched_video;
    }
}
if (!empty($get_history_videos)) {
    $len = count($get_history_videos);
    foreach ($get_history_videos as $key => $video) {
        $video = PT_GetVideoByID($video, 0, 0, 0);
        $pt->last_video = false;
        if ($key == $len - 1) {
            $pt->last_video = true;
        }
        $final .= PT_LoadPage('history/list', array(
            'ID' => $video->history_id,
            'USER_DATA' => $video->owner,
            'THUMBNAIL' => $video->thumbnail,
            'URL' => $video->url,
            'TITLE' => $video->title,
            'DESC' => $video->markup_description,
            'VIEWS' => $video->views,
            'TIME' => $video->time_ago,
            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
        ));
    }
}
if (empty($final)) {
	$final = $list;
}
$pt->page_url_ = $pt->config->site_url.'/history';
$pt->videos      = $get_history_videos;
$pt->page        = 'history';
$pt->title       = $lang->history . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = $pt->config->keyword;
$pt->content     = PT_LoadPage('history/content', array(
    'HISTORY_LIST' => $final
));