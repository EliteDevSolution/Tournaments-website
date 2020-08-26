<?php 
if (IS_LOGGED == false) {
	header("Location: " . PT_Link('login'));
	exit();
}

$list = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video-off"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>' .'No Data found for now!'. '</div>';
$final = '';
$tours = array();
$pt->show_textarea = false;
if(isset($_GET['go']) && !empty($_GET['go']))
{
	if($_GET['go'] == 'Upcomming')
	{
		$tours = $db->where('state', 'OPEN')->orderBy('time', 'DESC')->get(T_TOURNAMENTS, $limit);	
	} else if ($_GET['go'] == 'Completed') 
	{
		$tours = $db->where('state', 'COMPLETED')->orderBy('time', 'DESC')->get(T_TOURNAMENTS, $limit);	
	} else
	{
		$tours = $db->orderBy('time', 'DESC')->get(T_TOURNAMENTS, $limit);		
	}
} else if (isset($_POST['type']) && !empty($_POST['type'])) 
{
    if ($_POST['type'] == 'Upcomming') 
    {
        $tours = $db->where('state', 'OPEN')->orderBy('time', 'DESC')->get(T_TOURNAMENTS, $limit);
    }
    elseif ($_POST['type'] == 'Completed') 
    {
    	$tours = $db->where('state', 'COMPLETED')->orderBy('time', 'DESC')->get(T_TOURNAMENTS, $limit);
	}
	else
	{
		$tours = $db->orderBy('time', 'DESC')->get(T_TOURNAMENTS, $limit);		
	}
}  else 
{
	$tours = $db->orderBy('time', 'DESC')->get(T_TOURNAMENTS, $limit);
}
    
if (!empty($tours)) {
	$len = count($tours);
	foreach ($tours as $key => $tour) {
	    $pt->last_tour = false;
	    if ($key == $len - 1) {
	        $pt->last_tour = true;
	    }
	    $final .= PT_LoadPage('tournaments/list', array(
			        'ID' => $tour->id,
			        'THUMBNAIL' => $tour->image,
			        'TITLE'     => $tour->title,
			        'STATE'		=> $tour->state,
		            'POOL' => PT_formatMoney(floatval($tour->pool)),
		            'MAXPLAYER'=> number_format($tour->maxnumber),
		            'JOINCNT' => number_format($tour->joincount),
		            'CURRENCY' =>$pt->config->payment_currency,
		            'TEAM_URL' => PT_URLSlug($tour->title,$tour->id),
			        'DESC'      => PT_ShortText($tour->description, 100),
			        'STARTDATE' => $tour->startdate,
			        'TIME'      => PT_Time_Elapsed_String($tour->time)
			    ));
	}
}

if (empty($final)) {
	$final = $list;
}
$pt->page_url_ = $pt->config->site_url.'/tournaments';
$pt->page = 'tournaments';
$pt->tours  = $tours;
$pt->title = 'Tournaments' . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword = $pt->config->keyword;
$pt->content = PT_LoadPage('tournaments/content', array('TOURS' => $final));