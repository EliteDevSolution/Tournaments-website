<?php 
if (empty($_GET['id'])) {
    header('Location: ' .PT_Link('404'));
    exit();
}

$tourid = PT_GetIdFromURL($_GET['id']);
$db->where('id',$tourid);
if (!PT_IsAdmin()) {
    $db->where('active','1');
}
$tour = $db->getOne(T_TOURNAMENTS);

if (empty($tour)) {
    header('Location: ' .PT_Link('404'));
    exit();
}

$keyword = $tour->title;

$gamename = '';

$db->where('id', $tour->gameid);
$userid = $pt->user->id;
$invite_users = array();

$gamename = $db->getValue(T_GAMES,'name');


    if (IS_LOGGED === true) {
        //Check is invite user my team
        
        $tblinvite = T_PARTICIPANTS;
        $tbluser = T_USERS;

        $strQuery = "Select T2.id,T2.username,T2.first_name,T2.last_name, T2.ranking, T2.point, T2.avatar From $tblinvite as T1 left join $tbluser as T2 on(T1.userid=T2.id) where T1.tourid = '$tourid' and T1.join = 1 and T2.id <> $userid order by T2.point desc";
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
        $invitelist .= PT_LoadPage('mytournament/participants', array(
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
    $invitelist = '<div class="text-center no-comments-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>' . 'No Participants found.' . '</div>';
}

function formatMoney($number, $fractional=false) {
    if ($fractional) {
        $number = sprintf('%.2f', $number);
    }
    while (true) {
        $replaced = preg_replace('/(-?\d+)(\d\d\d)/', '$1,$2', $number);
        if ($replaced != $number) {
            $number = $replaced;
        } else {
            break;
        }
    }
    return $number;
} 

$pt->page_url_ = $pt->config->site_url.'/mytournament/readtour/'.PT_URLSlug($tour->title,$tour->id);
$pt->page        = 'readtour';
$pt->title       = $tour->title . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = @$pt->config->keyword;
$pt->tour = $tour;
$pt->cnt_inviteuser = count($invite_users);
$db->where('tourid', $pt->tour->id);
$db->where('userid', $pt->user->id);
$exists = $db->getOne(T_PARTICIPANTS);
$currency = "$";
if($pt->config->payment_currency == "EUR")
{
    $currency = "€";
} else if($pt->config->payment_currency == "INR" || $pt->config->payment_currency == "₹")
{
    $currency = "₹";
}
$pt->currency = $currency;
$checkoutcode = $_GET['checkout'];
$pt->surecheckout = 0;
$pt->surereport = 0;
$pt->reportimg = '';
if(isset($checkoutcode) && !empty($checkoutcode))
{
    $db->where('checkout', $checkoutcode);
    $res = $db->update(T_PARTICIPANTS, array('state'=>1, 'time'=>time()));
    $pt->surecheckout = 1;
}

if($tour->state == 'LIVE' )
{
    $db->where('tourid', $tour->id);
    $db->where('userid', $userid);
    $db->where('state', 1);
    $res = $db->getOne(T_PARTICIPANTS);
    if(!empty($res))
    {
        $checkoutcode = $res->checkout;
        $pt->surecheckout = 1;
        if($res->report == 1)
        {
            $pt->reportimg = $res->reportimg;
            $pt->surereport = 1;
        }
    }    
}

$pt->checkoutcode = $checkoutcode;


/// Paytm pay

$paytmChecksum = "";
$paramList = array();
$isValidChecksum = "FALSE";

$paramList = $_POST;
$paytmChecksum = isset($_POST["CHECKSUMHASH"]) ? $_POST["CHECKSUMHASH"] : ""; //Sent by Paytm pg

//Verify all parameters received from Paytm pg to your application. Like MID received from paytm pg is same as your application’s MID, TXN_AMOUNT and ORDER_ID are same as what was sent by you to Paytm PG for initiating transaction etc.
$isValidChecksum = verifychecksum_e($paramList, PAYTM_MERCHANT_KEY, $paytmChecksum); //will return TRUE or FALSE string.

$paytmstate = false;
if($isValidChecksum == "TRUE") {
    if ($_POST["STATUS"] == "TXN_SUCCESS") {
        $paytmstate = true;
        $id = $tour->id;
        $db->where('tourid', $id);
        $db->where('userid', $pt->user->id);
        $exists = $db->getOne(T_PARTICIPANTS);
        if(empty($exists))
        {
            $insert_data = array();
            $insert_data = array(
                'tourid' => $id,
                'userid' => $pt->user->id,
                'time' => time(),
                'join' => 1,
                'state' => 0
            );
            $res = $db->insert(T_PARTICIPANTS, $insert_data);
            $tblname = T_TOURNAMENTS;
            $db->rawQuery("Update $tblname Set joincount=joincount+1 where id=$id");
        }
        //Process your transaction here as success transaction.
        //Verify amount & order id received from Payment gateway with your application's order id and amount.
    }
}

$pt->paytmChecksum = $paytmChecksum;
$pt->paytmstate = $paytmstate;

///////////////////////////

$pt->joined = (empty($exists) && $tour->state != 'COMPLETED') ? 'JOIN NOW':'JOINED';
$pt->content     = PT_LoadPage('mytournament/readtour', array(
    'ID' => $tour->id,
    'TITLE' => $tour->title,
    'DESC'  => PT_Decode(PT_ShortText($tour->description,200)),
    'RULE' => PT_Decode($tour->rule),
    'STATE' => $tour->state,
    'IMAGE' => PT_GetMedia($tour->image),
    'TIME' => date('F/m/Y h:i',$tour->time),
    'PLATFORM' => $tour->platform,
    'TYPE' => $tour->type,
    'FEETYPE' => $tour->feetype,
    'EVENTFEE' => number_format($tour->eventfee),
    'POOL'  => $tour->pool,
    'POOLSHOW' => formatMoney(floatval($tour->pool)),
    'MAXNUMBER' => $tour->maxnumber,
    'STARTDATETIME' => $tour->startdate,
    'GAMENAME' => $gamename,
    'REPORTIMG' => $pt->reportimg,
    'INVITEUSERLIST' => $invitelist,
    'INVITECNT' => count($invite_users),
    'JOINCNT' => $tour->joincount,
    'CURRENCY' =>$currency,
    'MAXPLAYER'=> $tour->maxnumber,
    'CHECKOUT' => $checkoutcode,
    'JOINED' => $pt->joined,
    'POST_ENCODED_URL' => urlencode(PT_Link('mytournament/readtour/' . PT_URLSlug($tour->title,$tour->id)))
));
?>