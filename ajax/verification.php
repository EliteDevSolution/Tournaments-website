<?php 
if (IS_LOGGED == false) {
    $data = array('status' => 400, 'error' => 'Not logged in');
    echo json_encode($data);
    exit();
}


if ($_GET['first'] == 'request') {
	$error          = false;
	$user_id        = $pt->user->id;
	$request_exists = ($db->where('user_id',$user_id)->getValue(T_VERIF_REQUESTS,'count(*)'));
	$post           = (empty($_POST['first_name']) || empty($_POST['last_name']) || empty($_POST['message']) || empty($_FILES['identity']));

	if (!empty($request_exists)) {
		$error = $lang->submit_verif_request_error;
	}

	elseif ($post == true) {
		$error = $lang->please_check_details;
	}

	else{

		if (!empty($_FILES["identity"]["error"]) || ($_FILES["identity"]["size"] > $pt->config->max_upload)) {
	        $max   = pt_size_format($pt->config->max_upload);
        	$error = ($lang->file_is_too_big .": $max");
	    } 

	    else if (strlen($_POST['first_name']) < 4 || strlen($_POST['first_name']) > 32) {
	        $error = $lang->username_characters_length;
	    } 

	    else if (strlen($_POST['last_name']) > 32) {
	        $error = $lang->ivalid_last_name;
	    } 

	    else if (!file_exists($_FILES['identity']['tmp_name'])) {
	        $error = $lang->ivalid_image_file;
	    } 

	    else if (file_exists($_FILES["identity"]["tmp_name"])) {
	        $image = getimagesize($_FILES["identity"]["tmp_name"]);
	        if (!in_array($image[2], array(IMAGETYPE_GIF,IMAGETYPE_JPEG,IMAGETYPE_PNG,IMAGETYPE_BMP))) {
	            $error = $lang->ivalid_id_file;
	        }
	    }  
	}

	if (empty($error)) {

        $file_info = array(
            'file' => $_FILES['identity']['tmp_name'],
            'size' => $_FILES['identity']['size'],
            'name' => $_FILES['identity']['name'],
            'type' => $_FILES['identity']['type']
        );

        $upload          = PT_ShareFile($file_info);
    	$re_data         = array(
            'user_id'    => $user_id,
            'name'       => PT_Secure($_POST['first_name']) . ' ' . PT_Secure($_POST['last_name']),
            'message'    => PT_Secure($_POST['message']),
            'time'       => time(),
            'media_file' => $upload['filename']
        );

    	$insert = $db->insert(T_VERIF_REQUESTS,$re_data);

    	if ($insert) {
    		$data['status']  = 200;
        	$data['message'] = $lang->verif_request_sent;
    	}

    	else{
        	$data['status']  = 500;
        	$data['message'] = $lang->unknown_error;
        }
	}
	else{
		$data['status']  = 400;
		$data['message'] = $error;
	}
}

if($first == 'phone-verify')
{
	$data['status'] = 400;
	$code = PT_GenerateKey(5,5,false,false,true,false);
	$number = PT_Secure($_POST['phonenumber']);
	if(!isset($number) || empty($number))
	{
		exit;
	}
	$number = preg_replace('/\D/', '', $number);
    $len = strlen($number);
    if($len == 12)
    {
		$res = PT_sendMobileSMS($number);
		if($res)
		{
			$tblname = T_PHONEVERI_REQUESTS;
			$userid = $pt->user->id;
			$time = time();
			$db->rawQuery("Replace into $tblname value($userid, $number, $code, $time);");
			$data['status'] = 200;
		}
    }
}

if($first == 'phone-code-verify')
{
	$data['status'] = 400;
	$code = PT_Secure($_POST['phonecode']);
	$code = preg_replace('/\D/', '', $code);
	if(empty($code)) exit;
	$db->where('userid',$pt->user->id);
	$db->where('code',$code);
	$res = $db->getOne(T_PHONEVERI_REQUESTS);
	if(!empty($res))
	{
		$db->where('id',$pt->user->id);
		$db->update(T_USERS, ['phone_code'=>$code]);
		$data['status'] = 200;
	}
}