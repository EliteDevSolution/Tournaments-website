<?php

$pt_cats      = array_keys(get_object_vars($pt->games_array));
$html_posts   = '';
$html_p_posts = '';
$category     = 0;
$query        = false;
$pt->page_url_ = $pt->config->site_url.'/myteam';

$db->where('active', '1');
$db->where('createid', $pt->user->id);
$posts = $db->orderBy('id', 'DESC')->get(T_TEAMS, 20);

if (!empty($posts)) {
    foreach ($posts as $key => $post) {
        $html_posts .= PT_LoadPage('myteam/list', array(
            'ID' => $post->id,
	        'TITLE' => $post->name,
	        'DESC'  => PT_ShortText($post->description,190),
	        'THUMBNAIL' => PT_GetMedia($post->image),
	        'GAMEID' => ($post->gameid),
	        'URL' => PT_Link('myteam/readteam/' . PT_URLSlug($post->name,$post->id)),
	        'TIME' => date('d-F-Y',$post->time),
            'TEAM_URL' => PT_URLSlug($post->name,$post->id)
        ));
    }
}

if ($query && empty($html_posts)) {
	$html_posts = PT_LoadPage('myteam/404');
}

else if(empty($html_posts)){
	$html_posts = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book-open"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>Your Team is not found.</div>';
}

$requestTeamLst = array();
$myuserid = $pt->user->id;
$invitetable = T_TEAMINVITE;
$teamtable = T_TEAMS;
$requestQuery = "Select T1.id as id, T1.userid, T2.name, T2.image, T2.time, T1.teamid, T1.accept From $invitetable AS T1 left join $teamtable AS T2 ON(T1.teamid = T2.id) where T1.userid= $myuserid order by T1.time desc";
$requestTeamLst = $db->rawQuery($requestQuery);
$html_requestTeamLst = '';
if(empty($requestTeamLst))
{
    $html_requestTeamLst = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book-open"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>Invited Team is not found.</div>';
} else
{
    foreach ($requestTeamLst as $value) {
        $statue = $value->accept == '0' ? 'JOIN' : 'ACCEPTED';
        $html_requestTeamLst .= PT_LoadPage('myteam/requestlist', array(
            'USERID' => $value->userid,
            'INDEX' => $value->id,
            'TITLE' => $value->name,
            'IMAGE' => $value->image,
            'TIME' => date('d-F-Y',$value->time),
            'URL' => PT_Link('myteam/readteam/' . PT_URLSlug($value->name,$value->teamid)),
            'TEAMREAD_URL' => PT_URLSlug($value->name,$value->teamid),
            'STATUE' => $statue,
            'TEAMID' => $value->teamid
        ));
    }
}

$sidebar_ad = '';
$sidebarAd              = pt_get_user_ads(2);
if (!empty($sidebarAd)) {
    $get_random_ad      = $sidebarAd;
    $random_ad_id       = $get_random_ad->id;
    $_SESSION['pagead'] = $random_ad_id;
    $sidebar_ad    = PT_LoadPage('ads/includes/sidebar',array(
        'ID' => $random_ad_id,
        'IMG' => PT_GetMedia($get_random_ad->media),
        'TITLE' => PT_ShortText($get_random_ad->headline,30),
        'NAME' => PT_ShortText($get_random_ad->name,20),
        'DESC' => PT_ShortText($get_random_ad->description,70),
        'URL' => PT_Link("redirect/$random_ad_id?type=pagead"),
        'URL_NAME' => pt_url_domain(urldecode($get_random_ad->url))
    ));
}

$pt->title       =  'Teams | ' . $pt->config->title;
$pt->page        = "myteam";
$pt->description = $pt->config->description;
$pt->posts_count = count($posts);
$pt->content     = PT_LoadPage('myteam/content', array(
    'POSTS'         => $html_posts,
    'INVITELST'     => $html_requestTeamLst,
    'WATCH_SIDEBAR_AD' => $sidebar_ad
));
