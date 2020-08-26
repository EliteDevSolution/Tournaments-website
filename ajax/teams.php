<?php
if (IS_LOGGED == false) {
    $data = array('status' => 400, 'error' => 'Not logged in');
    echo json_encode($data);
    exit();
}

if ($first == 'new-game') 
{
    $error = false;
    if (empty($_POST['name']) || empty($_POST['description']) || empty($_POST['gameid']) || empty($_FILES["image"])) {
        $error = $lang->please_check_details;
    }
    else{

        if (strlen($_POST['name']) < 5) {
            $error = $lang->short_title; 
        }

        else if(strlen($_POST['description']) < 15){
            $error = $lang->short_description; 
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
                'width' => 600,
                'height' => 400
            )
        );

        $file_upload     = PT_ShareFile($file_info);
        $insert          = false;

        if (!empty($file_upload['filename'])) {
            $post_image  = PT_Secure($file_upload['filename']);
            $insert_data = array(
                'createid' => $pt->user->id,
                'name' => PT_Secure(PT_ShortText($_POST['name'],150)),
                'description' => PT_Secure(PT_ShortText($_POST['description'],200)),
                'gameid' => PT_Secure($_POST['gameid']),
                'image' => $post_image,
                'time' => time(),
                'active' => 1
            );

            $insert = $db->insert(T_TEAMS,$insert_data);
            $data['status'] = 200 ;
	        $data['link']    = PT_Link('teams/read/' . PT_URLSlug($insert_data['name'],$insert));
        }
    } else{
        $data['status'] = 400;
        $data['message'] = $error;
    }
}

if ($first == 'delete-team') {
	$data['status'] = 400;
    $delete = false;
	if (!empty($_POST['id']) && is_numeric($_POST['id']) && $_POST['id'] > 0) {
		$team = $db->where('id',PT_Secure($_POST['id']))->getOne(T_TEAMS);
		if (!empty($team) && (PT_IsAdmin() || $team->createid == $pt->user->id)) {
			//$s3 = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on') ? true : false;
            if (file_exists($team->image)) {
                unlink($team->image);
            } 
            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_TEAMS);
            $delete  = $db->where('teamid',PT_Secure($_POST['id']))->delete(T_TEAMINVITE);
            if ($delete) {
                $data = array('status' => 200);
            }
		}
	}
}

if($first == 'accept-request')
{
    $data['status'] = 400;
    if (!empty($_POST['id']) && is_numeric($_POST['id']) && $_POST['id'] > 0) 
    {
        $status = PT_Secure($_POST['status']);
        $db->where('id', PT_Secure($_POST['id']));
        $update_data = array();
        if($status == 'JOIN')
        {
            $update_data = array(
                'time' => time(),
                'accept' => '1'
            );
        } else
        {
            $update_data = array(
                'time' => time(),
                'accept' => '0'
            );
        }
        $result = $db->update(T_TEAMINVITE, $update_data);
        if($result)
        {
            $data['status'] = 200;
        }
    }    
}

if ($first == 'update-team') {
    $error = false;
    if (empty($_POST['name']) || empty($_POST['description']) || empty($_POST['id']) 
        || !is_numeric($_POST['id']) || $_POST['id'] < 1) 
    {
        $error = $lang->please_check_details;
    }
    else{
        $team = $db->where('id',PT_Secure($_POST['id']))->getOne(T_TEAMS);
        if (empty($team) || $team->createid != $pt->user->id) {
            $error = $lang->please_check_details;
        }

        if (strlen($_POST['name']) < 5) {
            $error = $lang->short_title; 
        }

        else if(strlen($_POST['description']) < 15){
            $error = $lang->short_description; 
        }
    }
    if (empty($error)) {
        $insert      = false;
        $id          = PT_Secure($_POST['id']);

        $update_data = array(
            'name' => PT_Secure(PT_ShortText($_POST['name'],150)),
            'description' => PT_Secure(PT_ShortText($_POST['description'],200)),
            'gameid' => PT_Secure($_POST['gameid']),
            'time' => time()
        );

        if (!empty($_FILES["image"])) {
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

        $insert         = $db->where('id',$id)->update(T_TEAMS, $update_data);
        $data['status'] = 200;
        $data['url']    = PT_Link('myteam/read/' . PT_URLSlug($update_data['name'],$id));
    }

    else{
        $data['status'] = 400;
        $data['message'] = $error;
    }
}   

if ($first == 'add-invite-request') {
    $data['status'] = 400;
    $teamid = $_POST['team_id'];
    $invitedata = $_POST['text'];
    $tblname = T_USERS;
    $tblInvite = T_TEAMINVITE;
    $tblnotify = T_NOTIFICATIONS;
    $strQuery = "Select id From $tblname where username = '$invitedata' or email='$invitedata'";
    $result = $db->rawQuery($strQuery);
    $insert_data = array();
    $insert = false;
    $currentuserid = $pt->user->id;
    $time = time();
    $inviteurl = 'myteam';
    if(!empty($result))
    {
        $inviteuserid = $result[0]->id;
        $db->where('teamid',$teamid);
        $db->where('userid', $inviteuserid);
        $existval = $db->getOne(T_TEAMINVITE);
        if($inviteuserid == $pt->user->id)
        {
            $data['status'] = 100;
        } else if(!empty($existval))
        {
            if($existval->accept == '1')
            {
                $data['status'] = 50;
            }
            else
            {
                $update_data = array(
                    'userid' => $inviteuserid,
                    'teamid' => $teamid,
                    'resend' => 'resend+1'
                );
                $update = $db->rawQuery("update $tblInvite set resend=resend+1 where userid='$inviteuserid' and teamid='$teamid'");
                $db->rawQuery("insert into $tblnotify set notifier_id = '$currentuserid', recipient_id='$inviteuserid',
                    type='invite_request', text='Team invite request Re-recived', time='$time', url='$inviteurl'");
                $data['status'] = 220;
            }
        } else
        {
            $insert_data = array(
                    'userid' => $inviteuserid,
                    'teamid' => $teamid,
                    'time' => time()
                );
            $insert = $db->insert(T_TEAMINVITE, $insert_data);

            if($insert)
            {
                $db->rawQuery("insert into $tblnotify set notifier_id = '$currentuserid', recipient_id='$inviteuserid',
                    type='invite_request', text='Team invite request recived', time='$time', url='$inviteurl'");
                $data['status'] = 200;
            }
        }
    } else
    {
        $data['status'] = 300;
    }
}


