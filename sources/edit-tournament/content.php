<?php
if (IS_LOGGED == false) {
    header("Location: " . PT_Link('login'));
    exit();
}
if (empty($_GET['id'])) {
    header("Location: " . PT_Link('login'));
    exit();
}
$id    = PT_Secure($_GET['id']);
$tour = $db->where('id', $id)->where('active', '1')->getOne(T_TOURNAMENTS);
if (empty($tour) || $tour->createid != $pt->user->id) {
    header("Location: " . PT_Link(''));
    exit();
}

$pt->page_url_ = $pt->config->site_url.'/edit-tournament/'.$id;
$pt->tour       = $tour;
$pt->page        = 'edit-tournament';
$pt->title       = 'Edit Tournament' . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = $pt->config->keyword;
$pt->content     = PT_LoadPage('edit-tournament/content',array(
    'ID' => $tour->id,
    'TITLE' => $tour->title,
    'DESC' => $tour->description,
    'RULE' => PT_Decode($tour->rule),
    'IMAGE' => PT_GetMedia($tour->image),
    'TIME' => date('F/m/Y h:i',$tour->time),
    'GAMEID' => $tour->gameid,
    'PLATFORM' => $tour->platform,
    'TYPE' => $tour->type,
    'FEETYPE' => $tour->feetype,
    'EVENTFEE' => $tour->eventfee,
    'POOL'  => $tour->pool,
    'MAXNUMBER' => $tour->maxnumber,
    'STARTDATETIME' => $tour->startdate,
    'POST_ENCODED_URL' => urlencode(PT_Link('edit-tournament/read/' . PT_URLSlug($tour->title,$tour->id)))
));