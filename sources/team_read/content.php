<?php 
if (empty($_GET['id'])) {
    header('Location: ' .PT_Link('404'));
    exit();
}

$teamid = PT_GetIdFromURL($_GET['id']);
$db->where('id',$teamid);
if (!PT_IsAdmin()) {
    $db->where('active','1');
}
$team = $db->getOne(T_TEAMS);

if (empty($team)) {
    header('Location: ' .PT_Link('404'));
    exit();
}

$keyword = $team->name;

$gamename = '';

$db->where('id', $team->gameid);
$invite_users = array();

$gamename = $db->getValue(T_GAMES,'name');


    if (IS_LOGGED === true) {
        //Check is invite user my team
        
        $tblinvite = T_TEAMINVITE;
        $tbluser = T_USERS;

        $strQuery = "Select T2.id,T2.username,T2.first_name,T2.last_name, T2.ranking, T2.point, T2.avatar From $tblinvite as T1 left join $tbluser as T2 on(T1.userid=T2.id) where T1.teamid = '$teamid' and T1.accept = 1 order by T2.point desc";
        $invite_users = $db->rawQuery($strQuery);
    }
    $invitelist = '';
    foreach ($invite_users as $uservalue) 
    {
        $username = $uservalue->username;
        if (strlen($username) > 25) 
        {
            $username = substr($username, 0,20).'..';
        }
        $invitelist .= PT_LoadPage('myteam/invitelist', array(
                'ID' => $uservalue->userid,
                'USER_NAME' => $username,
                'RANKING' => $uservalue->ranking,
                'POINT' => $uservalue->point,
                'IMAGE' => PT_GetMedia($uservalue->avatar) == '' ? PT_GetMedia('upload/photos/avatar.jpg') : 
                PT_GetMedia($uservalue->avatar),
                'URL' => $pt->config->site_url."/@$username"
        ));
    }

if (empty($invitelist))
{
    $invitelist = '<div class="text-center no-comments-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>' . 'No InviteUser found.' . '</div>';
}

$pt->page_url_ = $pt->config->site_url.'/myteam/readteam/'.PT_URLSlug($team->name,$team->id);
$pt->page        = 'read';
$pt->title       = $article->title . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = @$pt->config->keyword;
$pt->user_team = $team;
$pt->cnt_inviteuser = count($invite_users);
$pt->content     = PT_LoadPage('myteam/readteam', array(
    'ID' => $team->id,
    'TITLE' => $team->name,
    'DESC' => $team->description,
    'IMAGE' => PT_GetMedia($team->image),
    'TIME' => date('F/m/Y h:i',$team->time),
    'GAMENAME' => $gamename,
    'INVITEUSERLIST' => $invitelist,
    'INVITECNT' => count($invite_users),
    'POST_ENCODED_URL' => urlencode(PT_Link('myteam/readteam/' . PT_URLSlug($team->name,$team->id)))
));
?>