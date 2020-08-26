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
$team = $db->where('id', $id)->where('active', '1')->getOne(T_TEAMS);
if (empty($team) || $team->createid != $pt->user->id) {
    header("Location: " . PT_Link(''));
    exit();
}



$pt->page_url_ = $pt->config->site_url.'/edit_team/'.$id;
$pt->team       = $team;
$pt->page        = 'edit_team';
$pt->title       = 'Edit Team' . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = $pt->config->keyword;
$pt->content     = PT_LoadPage('edit_team/content',array(
    'ID' => $team->id,
    'TITLE' => $team->name,
    'DESC' => $team->description,
    'IMAGE' => PT_GetMedia($team->image),
    'TIME' => date('F/m/Y h:i',$article->time),
    'GAMEID' => $tean->gameid,
    'POST_ENCODED_URL' => urlencode(PT_Link('teams/read/' . PT_URLSlug($team->name,$team->id))),
));