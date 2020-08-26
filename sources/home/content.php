<?php

$pt->page        = 'home';
$pt->title       = $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = @$pt->config->keyword;
$pro_users       = array();
$pro_system      = ($pt->config->go_pro == 'on');

$pt->page_url_ = $pt->config->site_url;

// $home_top_videos = $db->where('privacy', 0)->orderby('views', 'DESC')->get(T_VIDEOS, 6);
// $top_videos_html = '';

// foreach ($home_top_videos as $key => $video) {
//     $video = PT_GetVideoByID($video, 0, 0, 0);
//     $top_videos_html .= PT_LoadPage('home/top-videos', array(
//         'ID' => $video->id,
//         'TITLE' => $video->title,
//         'VIEWS' => $video->views,
//         'USER_DATA' => $video->owner,
//         'THUMBNAIL' => $video->thumbnail,
//         'URL' => $video->url,
//     ));
// }

$limit = ($pt->theme_using == 'youplay') ? 10 : 4;
$db->where('converted', '2','<>');
$video_obj = $db->where('featured', '1')->where('privacy', 0)->orderBy('RAND()')->getOne(T_VIDEOS);
$get_video = PT_GetVideoByID($video_obj, 0, 1, 0);

if (empty($get_video)) {

    $db->where('converted', '2','<>');
    $get_video = PT_GetVideoByID($db->where('privacy', 0)->orderBy('id', 'DESC')->getOne(T_VIDEOS), 0, 1, 0);
}

if (empty($get_video)) {
    $pt->content = PT_LoadPage('home/no-content');
    return;
}

$user_data   = $get_video->owner;
$save_button = '<i class="fa fa-floppy-o fa-fw"></i> ' . $lang->save;
$is_saved    = 0;


if (IS_LOGGED == true) {
    $db->where('video_id', $get_video->id);
    $db->where('user_id', $user->id);
    $is_saved = $db->getValue(T_SAVED, "count(*)");
}

if ($is_saved > 0) {
    $save_button = '<i class="fa fa-check fa-fw"></i> ' . $lang->saved;
}

$trending_list = '';

$trending_data =array();

if (empty($trending_data)) {
    //$db->where('time', time() - 172800, '>');
    $trending_data = $db->orderBy('reclike', 'DESC')->get(T_GAMES, $limit);
} 

foreach ($trending_data as $key => $value) {
    $trending_list .= PT_LoadPage('home/trendinglist', array(
        'ID' => $value->id,
        'TITLE' => PT_ShortText($value->name,40),
        'THUMBNAIL' => $value->logo,
        'NAME' => $user->username,
        'LIKE' => $value->reclike,
        'USER_URL' => $user->username,
        'CURTIME' => date('F/m/Y h:i',$value->time),
        'TIME' => PT_Time_Elapsed_String($value->time),
        'GAME_ID' => PT_Slug($value->name, $value->id)
    ));
}

$news_list = '';
$news_data = array();
if (empty($new_data)) 
{
    $news_data = $db->orderBy('views', 'DESC')->get(T_POSTS, $limit);
}

foreach ($news_data as $key => $value) {
    $news_list .= PT_LoadPage('home/newslist', array(
        'ID' => $value->id,
        'TITLE' => PT_ShortText($value->title,40),
        'VIEWS' => $value->views,
        'NAME' => $user->username,
        'VIEWS_NUM' => number_format($value->views),
        'THUMBNAIL' => $value->image,
        'TIME' => PT_Time_Elapsed_String($value->time),
        'CURTIME' => date('F/m/Y h:i',$value->time),
        'URL' => 'news/read/'.PT_URLSlug($value->title, $value->id),
        'VIDEO_ID_' => PT_URLSlug($value->title, $value->id)
    ));
}

$upcomming_list = '';
$tbltours = T_TOURNAMENTS;
$upcomming_array = array();
if (empty($upcomming_list)) 
{
    $upcomming_array = $db->rawQuery("Select * from $tbltours where state='open' order by time desc limit 0, $limit");
}
foreach ($upcomming_array as $key => $value) {
    $upcomming_list .= PT_LoadPage('home/upcomminglist', array(
        'ID' => $value->id,
        'TITLE' => PT_ShortText($value->title, 40),
        'JOINCNT' => number_format($value->joincount),
        'STARTTIME' => $value->startdate,
        'THUMBNAIL' => $value->image,
        'STATE' => $value->state,
        'TIME' =>  PT_Time_Elapsed_String($value->time)
    ));
}

$latest_list = '';
if (!empty($pro_users)) {
    $db->where('user_id', $pro_users, 'IN');
    $db->where('privacy', 0);
    $db->orderBy('id', 'DESC');
    $latest_data = $db->get(T_VIDEOS, $limit);
}

if (empty($latest_data)) {
    $db->where('privacy', 0);
    $latest_data = $db->orderBy('id', 'DESC')->get(T_VIDEOS, $limit);
}

foreach ($latest_data as $key => $video) {
    $video = PT_GetVideoByID($video, 0, 0, 0);
    $latest_list .= PT_LoadPage('home/list', array(
        'ID' => $video->id,
        'TITLE' => $video->title,
        'VIEWS' => $video->views,
        'VIEWS_NUM' => number_format($video->views),
        'USER_DATA' => $video->owner,
        'THUMBNAIL' => $video->thumbnail,
        'URL' => $video->url,
        'TIME' => $video->time_ago,
        'DURATION' => $video->duration,
        'VIDEO_ID' => $video->video_id_,
        'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
    ));
}

$video_categories_html = '';

foreach ($categories as $cat_key => $cat_name) {
    $db->where('category_id', "'".$cat_key."'");
    $db->where('privacy', 0);
    $db->orderBy('id', 'DESC');
    $pt->cat_videos = $db->get(T_VIDEOS, 8);
    if (!empty($pt->cat_videos)) {
        $video_categories_html .= PT_LoadPage('home/categories',array(
            'CATEGORY_ONE_NAME' => $cat_name,
            'CATEGORY_ONE_ID' => $cat_key
        ));
    }
}
$pt->video_240 = 0;
$pt->video_360 = 0;
$pt->video_480 = 0;
$pt->video_720 = 0;

if ($pt->config->ffmpeg_system == 'on') {
    $explode_video = explode('_video', $get_video->video_location);
    if ($get_video->{"240p"} == 1) {
        $pt->video_240 = $explode_video[0] . '_video_240p_converted.mp4';
    }
    if ($get_video->{"360p"} == 1) {
        $pt->video_360 = $explode_video[0] . '_video_360p_converted.mp4';
    }
    if ($get_video->{"480p"} == 1) {
        $pt->video_480 = $explode_video[0] . '_video_480p_converted.mp4';
    }
    if ($get_video->{"720p"} == 1) {
        $pt->video_720 = $explode_video[0] . '_video_720p_converted.mp4';
    }
}

$pt->subscriptions = false;
$get_subscriptions_videos_html = '';
if (IS_LOGGED == true) {
    $get = $db->where('subscriber_id', $user->id)->get(T_SUBSCRIPTIONS);
    $userids = array();
    foreach ($get as $key => $userdata) {
        $userids[] = $userdata->user_id;
    }
    $get_subscriptions_videos = false;
    $userids = implode(',', ToArray($userids));
    if (!empty($userids)) {
        $get_subscriptions_videos = $db->rawQuery("SELECT * FROM " . T_VIDEOS . " WHERE user_id IN ($userids) AND privacy = 0 ORDER BY `id` DESC LIMIT $limit");
    }
    if (!empty($get_subscriptions_videos)) {
        $pt->subscriptions = true;
        $pt->cat_videos = $get_subscriptions_videos;
        $get_subscriptions_videos_html = PT_LoadPage('home/categories',array(
            'CATEGORY_ONE_NAME' => $lang->subscriptions,
            'CATEGORY_ONE_ID' => 'subscriptions'
        ));
        
    }
}
$pt->content = PT_LoadPage('home/content', array(
    'ID' => $get_video->id,
    'THUMBNAIL' => $get_video->thumbnail,
    'DURATION' => $get_video->duration,
    'TITLE' => $get_video->title,
    'DESC' => $get_video->markup_description,
    'URL' => $get_video->url,
    'VIDEO_LOCATION_240' => $pt->video_240,
    'VIDEO_LOCATION' => $get_video->video_location,
    'VIDEO_LOCATION_480' => $pt->video_480,
    'VIDEO_LOCATION_720' => $pt->video_720,
    'VIDEO_TYPE' => $get_video->video_type,
    'VIDEO_MAIN_ID' => $get_video->video_id,
    'VIDEO_ID' => $get_video->video_id_,
    'USER_DATA' => $user_data,
    'SUBSCIBE_BUTTON' => PT_GetSubscribeButton($user_data->id),
    'VIEWS' => $get_video->views,
    'LIKES' => number_format($get_video->likes),
    'DISLIKES' => number_format($get_video->dislikes),
    'LIKES_P' => $get_video->likes_percent,
    'DISLIKES_P' => $get_video->dislikes_percent,
    'RAEL_LIKES' => $get_video->likes,
    'RAEL_DISLIKES' => $get_video->dislikes,
    'ISLIKED' => ($get_video->is_liked > 0) ? 'liked="true"' : '',
    'ISDISLIKED' => ($get_video->is_disliked > 0) ? 'disliked="true"' : '',
    'LIKE_ACTIVE_CLASS' => ($get_video->is_liked > 0) ? 'active' : '',
    'DIS_ACTIVE_CLASS' => ($get_video->is_disliked > 0) ? 'active' : '', 
    'SAVED_BUTTON' => $save_button,
    'IS_SAVED' => ($is_saved > 0) ? 'saved="true"' : '',
    'ENCODED_URL' => urlencode($get_video->url),
    'CATEGORY' => $get_video->category_name,
    'TIME' => $get_video->time_alpha,
    'TRENDING_LIST' => $trending_list,
    'NEWS_LIST' => $news_list,
    'LATEST_LIST' => $latest_list,
    'UPCOMMING_LIST' => $upcomming_list,
    'HOME_PAGE_VIDEOS' => $video_categories_html,
    'SUBSC_HTML' => $get_subscriptions_videos_html,
    'VIDEO_ID_' => PT_Slug($get_video->title, $get_video->video_id)
));
