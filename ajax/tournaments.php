<?php
$mytment = $pt->challonge;

if ($first == 'new-tournament') 
{
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description'])|| empty($_POST['rule']) || empty($_POST['platform-list'])
        || empty($_POST['type']) || empty($_POST['feetype']) || empty($_POST['start_date_time']) || empty($_POST['event_pool'])
        || empty($_POST['max_player']) || empty($_POST['gameid']) || empty($_FILES["image"])) 
    {
        if($_POST['feetype'] == 'fee_paid')
        {
            if(empty($_POST['event_fee']))
            {
                $error = $lang->please_check_details;        
            }
        }
        $error = $lang->please_check_details;
    }
    else{
        if (strlen($_POST['title']) < 5) 
        {
            $error = $lang->short_title; 
        }

        else if(strlen($_POST['description']) < 15){
            $error = $lang->short_description; 
        } else if(strlen($_POST['rule']) < 20)
        {
            $error = "Rule contents is too low short";   
        }
        else if (!empty($_FILES["image"]["error"]) || !file_exists($_FILES["image"]["tmp_name"])) 
        {
            $error = $lang->image_not_valid; 
        } 
        else if (file_exists($_FILES["image"]["tmp_name"])) {
            $image = getimagesize($_FILES["image"]["tmp_name"]);
            if (!in_array($image[2], array(
                IMAGETYPE_GIF,
                IMAGETYPE_JPEG,
                IMAGETYPE_PNG,
                IMAGETYPE_BMP
            ))){
                $error = $lang->image_not_valid; 
            }
        }
    }
    if (empty($error)) {

        $file_info   = array(
            'file' => $_FILES['image']['tmp_name'],
            'size' => $_FILES['image']['size'],
            'name' => $_FILES['image']['name'],
            'type' => $_FILES['image']['type'],
            'crop' => array(
                'width' => 1140,
                'height' => 420
            )
        );

        $title = PT_Secure(PT_ShortText($_POST['title'],150));
        $description = PT_Secure($_POST['description']);
        $rule = htmlspecialchars($_POST['rule']);
        $platform = $_POST['platform-list'];
        $platformval = "";
        foreach($platform as $value) 
        {
            $platformval.= $value.",";
        }
        $platformval = trim($platformval);
        $platformval = substr($platformval, 0, -1);
        $gameid = PT_Secure($_POST['gameid']);
        $type = PT_Secure($_POST['type']);
        $feetype = PT_Secure($_POST['feetype']);
        $eventfee = PT_Secure($_POST['event_fee']);
        $pool = PT_Secure($_POST['event_pool']);
        $maxnumber = PT_Secure($_POST['max_player']);
        $startdate = PT_Secure($_POST['start_date_time']);
        $time = time();
        $file_upload     = PT_ShareFile($file_info);
        $insert          = false;

        if (!empty($file_upload['filename'])) {
            $post_image  = PT_Secure($file_upload['filename']);
            $insert_data = array(
                'title' => PT_Secure(PT_ShortText($_POST['title'],150)),
                'description' => PT_Secure($_POST['description']),
                'rule' => htmlspecialchars($_POST['rule']),
                'platform' => $platformval,
                'gameid' => PT_Secure($_POST['gameid']),
                'type' => PT_Secure($_POST['type']),
                'feetype' => PT_Secure($_POST['feetype']),
                'eventfee' => PT_Secure($_POST['event_fee']),
                'pool' => PT_Secure($_POST['event_pool']),
                'maxnumber' => PT_Secure($_POST['max_player']),
                'startdate' => PT_Secure($_POST['start_date_time']),
                'image' => $post_image,
                'time' => time(),
                'active' => 1,
                'createid' => $pt->user->id
            );
           ///Challong Api Create TOurnament
           // $params = array(
           //   "tournament[name]" => $title,
           //   "tournament[tournament_type]" => "single elimination",
           //   "tournament[url]" => $time.'_'.$gameid,
           //   "tournament[description]" => $description,
           //   "tournament[start_at]" => $startdate,
           //   "tournament[signup_cap]" => $maxnumber,
           //   "tournament[check_in_duration]" => 15,
           //   "tournament [notify_users_when_matches_open]" => true
           //   );
          //  $tournament = $mytment->makeCall("tournaments", $params, "post");
          //  $tournament = $mytment->createTournament($params);
          //  var_dump(xml2array($tournaments));exit;
            $insert = $db->insert(T_TOURNAMENTS, $insert_data);
            $data['status'] = 200 ;
	        $data['link']    = PT_Link('tournaments/read/' . PT_URLSlug($insert_data['title'], $insert));
        }
    } else{
        $data['status'] = 400;
        $data['message'] = $error;
    }
}

if($first == "delete-tournament")
{
    $data['status'] = 400;
    $delete = false;
    if (!empty($_POST['id']) && is_numeric($_POST['id']) && $_POST['id'] > 0) {
        $tournament = $db->where('id',PT_Secure($_POST['id']))->getOne(T_TOURNAMENTS);
        if (!empty($tournament) && (PT_IsAdmin() || $tournament->createid == $pt->user->id)) {
            //$s3 = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on') ? true : false;
            if (file_exists($tournament->image)) {
                unlink($tournament->image);
            } 
            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_TOURNAMENTS);
            $delete  = $db->where('tourid',PT_Secure($_POST['id']))->delete(T_PARTICIPANTS);
            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}

if($first ==  'edit-tournament')
{
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description'])|| empty($_POST['rule']) || empty($_POST['platform-list'])
        || empty($_POST['type']) || empty($_POST['feetype']) || empty($_POST['start_date_time']) || empty($_POST['event_pool'])
        || empty($_POST['max_player']) || empty($_POST['gameid']) || empty($_POST['id']) || 
        !is_numeric($_POST['id']) || $_POST['id'] < 1) 
    {
        if($_POST['feetype'] == 'fee_paid')
        {
            if(empty($_POST['event_fee']))
            {
                $error = $lang->please_check_details;        
            }
        }
        $error = $lang->please_check_details;
    }
    else{
        if (strlen($_POST['title']) < 5) 
        {
            $error = $lang->short_title; 
        }

        else if(strlen($_POST['description']) < 15){
            $error = $lang->short_description; 
        } else if(strlen($_POST['rule']) < 20)
        {
            $error = "Rule contents is too low short";   
        }
    }
    if (empty($error)) {
        $update_data = array();
        $id = PT_Secure($_POST['id']);
        $title = PT_Secure(PT_ShortText($_POST['title'],150));
        $description = PT_Secure($_POST['description']);
        $rule = htmlspecialchars($_POST['rule']);
        $platform = $_POST['platform-list'];
        $platformval = "";
        foreach($platform as $value) 
        {
            $platformval.= $value.",";
        }
        $platformval = trim($platformval);
        $platformval = substr($platformval, 0, -1);
        $gameid = PT_Secure($_POST['gameid']);
        $type = PT_Secure($_POST['type']);
        $feetype = PT_Secure($_POST['feetype']);
        $eventfee = PT_Secure($_POST['event_fee']);
        $pool = PT_Secure($_POST['event_pool']);
        $maxnumber = PT_Secure($_POST['max_player']);
        $startdate = PT_Secure($_POST['start_date_time']);
        $time = time();
        $insert          = false;
        $update_data = array(
            'title' => PT_Secure(PT_ShortText($_POST['title'],150)),
            'description' => PT_Secure($_POST['description']),
            'rule' => htmlspecialchars($_POST['rule']),
            'platform' => $platformval,
            'gameid' => PT_Secure($_POST['gameid']),
            'type' => PT_Secure($_POST['type']),
            'feetype' => PT_Secure($_POST['feetype']),
            'eventfee' => PT_Secure($_POST['event_fee']),
            'pool' => PT_Secure($_POST['event_pool']),
            'maxnumber' => PT_Secure($_POST['max_player']),
            'startdate' => PT_Secure($_POST['start_date_time']),
            'time' => time(),
            'active' => 1);
        if (!empty($_FILES["image"])) 
        {
            $file_info   = array(
                'file' => $_FILES['image']['tmp_name'],
                'size' => $_FILES['image']['size'],
                'name' => $_FILES['image']['name'],
                'type' => $_FILES['image']['type'],
                'crop' => array(
                    'width' => 600,
                    'height' => 400
                )
            );
            $file_upload     = PT_ShareFile($file_info);
            if (!empty($file_upload['filename'])) {
                $update_data['image'] = PT_Secure($file_upload['filename']);  
            }
            else{
                $error = true;
            }
        }
        $insert = $db->where('id', $id)->update(T_TOURNAMENTS, $update_data);
        $data['status'] = 200 ;
        $data['link']    = PT_Link('tournaments/read/' . PT_URLSlug($update_data['title'], $id));
    } else
    {
        $data['status'] = 400;
        $data['message'] = $error;
    }   
}

if($first == 'send-report')
{
    $data['status'] = 400;
    if(empty($_FILES["image"]))
    {
         $error = $lang->please_check_details;
    }
    $tourid = PT_Secure($_POST['tourid']);
    $checkcode = PT_Secure($_POST['checkcode']);

    $file_info   = array(
                'file' => $_FILES['image']['tmp_name'],
                'size' => $_FILES['image']['size'],
                'name' => $_FILES['image']['name'],
                'type' => $_FILES['image']['type'],
                'crop' => array(
                    'width' => 800,
                    'height' => 600
                )
            );
    $file_upload     = PT_ShareFile($file_info);
    if (!empty($file_upload['filename'])) 
    {
        $update_data['image'] = PT_Secure($file_upload['filename']);  
    } else 
    {
        $error = $lang->please_check_details;
    }
    $data['message'] = $error;
    if(empty($error))
    {
        $db->where('tourid', $tourid);
        $db->where('userid', $pt->user->id);
        $db->where('checkout', $checkcode);
        $db->where('report', 1);
        $result = $db->getOne(T_PARTICIPANTS);
        if(empty($result))
        {
            $db->where('tourid', $tourid);
            $db->where('userid',$pt->user->id);
            $db->where('checkout', $checkcode);
            $db->where('report', 0);
            $logo = PT_Secure($file_upload['filename']);
            $update_data = array('report'=>1,'time'=>time(), 'reportimg'=>$logo);
            $db->update(T_PARTICIPANTS, $update_data);
            $data['status'] = 200 ;
        }
    }
}

if($first == 'tour-join')
{
    $data['status'] = 400;
    $id = PT_Secure($_POST['id']);
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
        $data['status'] = 200;
    }
}

if($first == 'testapi')
{
	//$tournaments = $mytment->makeCall('tournaments');
	//$tournaments = $mytment->getTournaments();
    //print_r(xml2array($tournaments));
}

function xml2array ( $xmlObject, $out = array () )
{
    foreach ( (array) $xmlObject as $index => $node )
        $out[$index] = ( is_object ( $node ) ) ? xml2array ( $node ) : $node;
    return $out;
}



?>

