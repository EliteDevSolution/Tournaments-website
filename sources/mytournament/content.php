<?php

$pt_cats      = array_keys(get_object_vars($pt->games_array));
$posts   = '';
$query        = false;
$pt->page_url_ = $pt->config->site_url.'/mytournament';

// pagination system 
$pt->page_number = isset($_GET['page_id']) && is_numeric($_GET['page_id']) && $_GET['page_id'] > 0 ? $_GET['page_id'] : 1;
$pt->limit_per_page = 5;
$db->pageLimit = $pt->limit_per_page;
// pagination system 
$pt->page_url_ = $pt->config->site_url.'/mytournament'.'?page_id='.$pt->page_number;

//$posts   = $db->where('createid', $pt->user->id)->where('active', '1')->orderBy('id', 'DESC')->get(T_TOURNAMENTS);
// pagination system 

$posts = $db->where('createid', $pt->user->id)->where('active', '1')->orderBy('id', 'DESC')->objectbuilder()->paginate(T_TOURNAMENTS, $pt->page_number);
$pt->total_pages = $db->totalPages;



if (!empty($posts)) {
    foreach ($posts as $key => $post) {
        $html_posts .= PT_LoadPage('mytournament/list', array(
            'ID' => $post->id,
	        'TITLE' => $post->title,
	        'DESC'  => PT_ShortText($post->description,190),
	        'THUMBNAIL' => PT_GetMedia($post->image),
	        'GAMEID' => ($post->gameid),
	        'URL' => PT_Link('mytournament/readtour/' . PT_URLSlug($post->title,$post->id)),
	        'TIME' => $post->startdate,
            'POOL' => PT_formatMoney(floatval($post->pool)),
            'JOINFEE' => PT_formatMoney(floatval($post->event_fee)),
            'MAXPLAYER'=> $post->maxnumber,
            'JOINCNT' => $post->joincount,
            'CURRENCY' =>$pt->config->payment_currency,
            'TEAM_URL' => PT_URLSlug($post->title,$post->id)
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
$parttable = T_PARTICIPANTS;
$tourtable = T_TOURNAMENTS;
$requestQuery = "Select T1.id as id, T1.userid, T2.title, T2.image, T2.time, T1.tourid From $parttable AS T1 left join $tourtable AS T2 ON(T1.tourid = T2.id) where T1.userid= $myuserid order by T1.time desc";
$requestTeamLst = $db->rawQuery($requestQuery);
$html_requestTeamLst = '';
if(empty($requestTeamLst))
{
    $html_requestTeamLst = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book-open"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>Joined Tournaments is not found.</div>';
} else
{
    foreach ($requestTeamLst as $value) {
        $statue = 'JOINED';
        $html_requestTeamLst .= PT_LoadPage('mytournament/requestlist', array(
            'USERID' => $value->userid,
            'INDEX' => $value->id,
            'TITLE' => $value->title,
            'IMAGE' => $value->image,
            'TIME' => date('d-F-Y',$value->time),
            'URL' => PT_Link('mytournament/readtour/' . PT_URLSlug($value->title,$value->tourid)),
            'TEAMREAD_URL' => PT_URLSlug($value->titles,$value->tourid),
            'STATUE' => $statue,
            'TOURID' => $value->tourid
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

$pt->title       =  'Touranment | ' . $pt->config->title;
$pt->page        = "mytournament";
$pt->description = $pt->config->description;
$pt->posts_count = count($posts);
$pt->content     = PT_LoadPage('mytournament/content', array(
    'POSTS'         => $html_posts,
    'TOURLIST'     => $html_requestTeamLst,
    'WATCH_SIDEBAR_AD' => $sidebar_ad
));
