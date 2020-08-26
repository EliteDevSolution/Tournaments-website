<?php 
if (IS_LOGGED == false) {
	header("Location: " . PT_Link('login'));
	exit();
}

$list = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video-off"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>' .'No Data found for now!'. '</div>';
$final = '';
$games = array();
$pt->show_textarea = false;

$games = $db->orderBy('time', 'DESC')->get(T_GAMES, $limit);

if (!empty($games)) {
	$len = count($games);
	foreach ($games as $key => $game) {
	    $pt->last_game = false;
	    if ($key == $len - 1) {
	        $pt->last_game = true;
	    }
	    $final .= PT_LoadPage('games/list', array(
			        'ID' => $game->id,
			        'THUMBNAIL' => $game->logo,
			        'TITLE'     => $game->name,
		            'LIKE'		=> number_format($game->reclike),
		            'UNLIKE' 	=> number_format($game->unlike),
			        'DESC'      => $game->description,
			        'CURTIME'	=> date('F/m/Y h:i',$game->time),
			        'TIME'      => PT_Time_Elapsed_String($game->time)
			    ));
	}
}

if (empty($final)) {
	$final = $list;
}
$pt->page_url_ = $pt->config->site_url.'/games';
$pt->page = "gamelist";
$pt->title = 'Games' . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword = $pt->config->keyword;
$pt->content = PT_LoadPage('games/content', array('GAMES' => $final));