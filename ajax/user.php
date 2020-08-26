<?php

if (empty($_POST['user_id']) || !IS_LOGGED) {
    exit("Undefined Dolphin.");
}

$is_owner = false;
if ($_POST['user_id'] == $user->id || PT_IsAdmin()) {
    $is_owner = true;
}

if ($first == 'general') {
    if (empty($_POST['username']) OR empty($_POST['email'])) {
        $errors[] = $error_icon . $lang->please_check_details;
    } 

    else {
        $user_data = PT_UserData($_POST['user_id']);
        if (!empty($user_data->id)) {
            if ($_POST['email'] != $user_data->email) {
                if (PT_UserEmailExists($_POST['email'])) {
                    $errors[] = $error_icon . $lang->email_exists;
                }
            }
            if ($_POST['username'] != $user_data->username) {
                $is_exist = PT_UsernameExists($_POST['username']);
                if ($is_exist) {
                    $errors[] = $error_icon . $lang->username_is_taken;
                }
            }
            if (in_array($_POST['username'], $pt->site_pages)) {
                $errors[] = $error_icon . $lang->username_invalid_characters;
            }
            if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                $errors[] = $error_icon . $lang->email_invalid_characters;
            }
            if (!empty($_POST['donation_paypal_email'])) {
                if (!filter_var($_POST['donation_paypal_email'], FILTER_VALIDATE_EMAIL)) 
                {
                    $errors[] = $error_icon . $lang->email_invalid_characters;
                }
            }

            if (strlen($_POST['username']) < 4 || strlen($_POST['username']) > 32) {
                $errors[] = $error_icon . $lang->username_characters_length;
            }
            if (!preg_match('/^[\w]+$/', $_POST['username'])) {
                $errors[] = $error_icon . $lang->username_invalid_characters;
            }
            $active = $user_data->active;
            if (!empty($_POST['activation']) && PT_IsAdmin()) {
                if ($_POST['activation'] == '1') {
                    $active = 1;
                } else {
                    $active = 2;
                }
                if ($active == $user_data->active) {
                    $active = $user_data->active;
                }
            }
            $type = $user_data->admin;
            if (!empty($_POST['type']) && PT_IsAdmin()) {
                if ($_POST['type'] == '2') {
                    $type = 1;
                } 

                else if ($_POST['type'] == '1') {
                    $type = 0;
                }
                if ($type == $user_data->admin) {
                    $type = $user_data->admin;
                }
            }

            $is_pro = $user_data->is_pro;
            if (isset($_POST['is_pro']) && PT_IsAdmin()) {
                if ($_POST['is_pro'] == 1) {
                    $is_pro = 1;
                } 

                else if ($_POST['is_pro'] == 0) {
                    $is_pro = 0;
                }
            }


            
            $gender       = 'male';
            $gender_array = array(
                'male',
                'female'
            );
            if (!empty($_POST['gender'])) {
                if (in_array($_POST['gender'], $gender_array)) {
                    $gender = $_POST['gender'];
                }
            }

            $field_data         = array();
            if (!empty($_POST['cf'])) {
                $fields         = $db->where('placement','general')->get(T_FIELDS);
                foreach ($fields as $key => $field) {
                    $field_id   = $field->id;
                    $field->fid = "fid_$field_id";
                    $name       = $field->fid;
                    if (isset($_POST[$name])) {
                        if (mb_strlen($_POST[$name]) > $field->length) {
                            $errors[] = $error_icon . $field->name . ' field max characters is ' . $field->length;
                        }
                        else{
                            $field_data[] = array(
                                $name => $_POST[$name]
                            );
                        } 
                    }
                }
            }
            $age = $user_data->age;
            $age_changed = $user_data->age_changed;
            if (($_POST['age'] >= 0 && $_POST['age'] < 100) && $age != $_POST['age']) {
                if (!PT_IsAdmin()) {
                    if ($user_data->age_changed > 1) {
                        $errors[] = $error_icon . $lang->not_allowed_change_age;
                    } else {
                        $age = PT_Secure($_POST['age']);
                        $age_changed = $user_data->age_changed + 1;
                    }
                } else {
                    $age = PT_Secure($_POST['age']);
                }
            }
            
            if (empty($errors)) {
                $update_data = array(
                    'username' => PT_Secure($_POST['username']),
                    'email' => PT_Secure($_POST['email']),
                    'gender' => PT_Secure($gender),
                    'country_id' => PT_Secure($_POST['country']),
                    'active' => PT_Secure($active),
                    'admin' => PT_Secure($type),
                    'is_pro' => $is_pro,
                    'age' => $age,
                    'age_changed' => $age_changed,
                    'donation_paypal_email' => PT_Secure($_POST['donation_paypal_email'])
                );

                // user max upload 
                $limit_array = array('0','2000000','6000000','12000000','24000000','48000000','96000000','256000000','512000000','1000000000','10000000000','unlimited');
                if (isset($_POST['user_upload_limit']) && PT_IsAdmin()) {
                    if (in_array($_POST['user_upload_limit'], $limit_array)) {
                        $update_data['user_upload_limit'] = PT_Secure($_POST['user_upload_limit']);
                    } 
                }
                // user max upload 
              
                if (!empty($_POST['verified'])) {
                    if ($_POST['verified'] == 'verified') {
                        $verification = 1;
                    } else {
                        $verification = 0;
                    }
                    if ($verification == $user_data->verified) {
                        $verification = $user_data->verified;
                    }
                    $update_data['verified'] = $verification;
                }
                if ($is_owner == true) {
                    $update = $db->where('id', PT_Secure($_POST['user_id']))->update(T_USERS, $update_data);
                    if ($update){ 
                        if (!empty($field_data)) {
                            $insert = PT_UpdateUserCustomData($_POST['user_id'], $field_data);
                        }

                        $data = array(
                            'status' => 200,
                            'message' => $success_icon . $lang->setting_updated
                        );
                    }
                }
            }
        }
    }
}

if ($first == 'profile') {
    $user_data = PT_UserData($_POST['user_id']);
    $field_data         = array();
    if (!empty($_POST['cf'])) {
        $fields         = $db->where('placement',array('profile','social'), 'IN')->get(T_FIELDS);
        foreach ($fields as $key => $field) {
            $field_id   = $field->id;
            $field->fid = "fid_$field_id";
            $name       = $field->fid;
            if (isset($_POST[$name])) {
                if (mb_strlen($_POST[$name]) > $field->length) {
                    $errors[] = $error_icon . $field->name . ' field max characters is ' . $field->length;
                }
                else{
                    $field_data[] = array(
                        $name => $_POST[$name]
                    );
                } 
            }
        }
    }

    if (!empty($user_data->id)) {
        if (empty($errors)) {
            $update_data = array(
                'first_name' => PT_Secure($_POST['first_name']),
                'last_name' => PT_Secure($_POST['last_name']),
                'about' => PT_Secure($_POST['about']),
                'phonenumber' => PT_Secure($_POST['phonenumber']),
                'facebook' => PT_Secure($_POST['facebook']),
                'google' => PT_Secure($_POST['google']),
                'twitter' => PT_Secure($_POST['twitter']),
                'instagram' => PT_Secure($_POST['instagram']),
            );
            if ($is_owner == true) {
                $update = $db->where('id', PT_Secure($_POST['user_id']))->update(T_USERS, $update_data);
                if ($update) {
                    if (!empty($field_data)) {
                        $insert = PT_UpdateUserCustomData($_POST['user_id'], $field_data);
                    }

                    $data = array(
                        'status' => 200,
                        'message' => $success_icon . $lang->setting_updated
                    );
                }
            }
        }
    }
}

if ($first == 'change-pass') {
    $user_data = PT_UserData($_POST['user_id']);
    if (!empty($user_data->id)) {
        if (empty($_POST['current_password']) || empty($_POST['new_password']) || empty($_POST['confirm_new_password'])) {
            $errors[] = $error_icon . $lang->please_check_details;
        } else {
            if ($user_data->password != sha1($_POST['current_password'])) {
                $errors[] = $error_icon . $lang->current_password_dont_match;
            }
            if (strlen($_POST['new_password']) < 4) {
                $errors[] = $error_icon . $lang->password_is_short;
            }
            if ($_POST['new_password'] != $_POST['confirm_new_password']) {
                $errors[] = $error_icon . $lang->new_password_dont_match;
            }
            if (empty($errors)) {
                $update_data = array(
                    'password' => sha1($_POST['new_password'])
                );
                if ($is_owner == true) {
                    $update = $db->where('id', PT_Secure($_POST['user_id']))->update(T_USERS, $update_data);
                    if ($update) {
                       $data = array(
                            'status' => 200,
                            'message' => $success_icon . $lang->setting_updated
                        );
                    }
                }
            }
        }
    }
}

if ($first == 'avatar') {
    $user_data = PT_UserData($_POST['user_id']);
    $update_data = array();
    if (!empty($user_data->id)) {
        if (!empty($_FILES['avatar']['tmp_name'])) {
            $file_info = array(
                'file' => $_FILES['avatar']['tmp_name'],
                'size' => $_FILES['avatar']['size'],
                'name' => $_FILES['avatar']['name'],
                'type' => $_FILES['avatar']['type'],
                'crop' => array('width' => 400, 'height' => 400)
            );
            $file_upload = PT_ShareFile($file_info);
            if (!empty($file_upload['filename'])) {
                $update_data['avatar'] = $file_upload['filename'];
            }
        }
        if (!empty($_FILES['cover']['tmp_name'])) {
            $file_info = array(
                'file' => $_FILES['cover']['tmp_name'],
                'size' => $_FILES['cover']['size'],
                'name' => $_FILES['cover']['name'],
                'type' => $_FILES['cover']['type'],
                'crop' => array('width' => 1200, 'height' => 200)
            );
            $file_upload = PT_ShareFile($file_info);
            if (!empty($file_upload['filename'])) {
                $update_data['cover'] = $file_upload['filename'];
            }
        }
    }
    if ($is_owner == true) {
        $update = $db->where('id', PT_Secure($_POST['user_id']))->update(T_USERS, $update_data);
        if ($update) {
           $data = array(
                'status' => 200,
                'message' => $success_icon . $lang->setting_updated
            );
        }
    }
}

if ($first == 'delete' && $pt->config->delete_account == 'on') {
    $user_data = PT_UserData($_POST['user_id']);
    if (!empty($user_data->id)) {
        if ($user_data->password != sha1($_POST['current_password'])) {
            $errors[] = $error_icon . $lang->current_password_dont_match;
        }
        if (empty($errors) && $is_owner == true) {
            $delete = PT_DeleteUser($user_data->id);
            if ($delete) {
                $data = array(
                    'status' => 200,
                    'message' => $success_icon . $lang->your_account_was_deleted,
                    'url' => PT_Link('')
                );
            }
        }
    }
}

if ($first == 'video-monetization' && $pt->config->usr_v_mon == 'on') {
    
    $user_id        = $user->id;
    $video_mon      = ($user->video_mon == 1) ? 0 : 1;
    $update_data    = array(
        'video_mon' => $video_mon
    );

    $db->where('id',$user_id)->update(T_USERS,$update_data);
    $data['status'] = 200;
}

if ($first == 'request-withdrawal') {

    $error    = none;
    $balance  = $user->balance_or;
    $user_id  = $user->id;
    $currency = $pt->config->payment_currency;
    //$balance = $user->wallet;
    // Check is unprocessed requests exits
    $db->where('user_id',$user_id);
    $db->where('status',0);
    $requests = $db->getValue(T_WITHDRAWAL_REQUESTS, 'count(*)');

    if (!empty($requests)) {
        $error = $lang->cant_request_withdrawal;
    }
     else if ($balance < $_POST['amount']) {
        $error = $lang->please_check_details;;
    }

    else{

        if($pt->config->payment_mode == 'fastpay')
        {
            if (empty($_POST['email']) || mb_strpos($_POST['email'], '+') === false) {
                $error = $lang->please_check_details;
            }
            else if(empty($_POST['amount']) || !is_numeric($_POST['amount'])){
                $error = $lang->please_check_details;
            }
            else if($_POST['amount'] < 1000){
                $error = $lang->min_withdrawal_request_amount_is." 1000:"." $currency";
            }
        } else
        {
            if (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                $error = $lang->please_check_details;
            }
            else if(empty($_POST['amount']) || !is_numeric($_POST['amount'])){
                $error = $lang->please_check_details;
            }

            else if($_POST['amount'] < 50){
                $error = $lang->min_withdrawal_request_amount_is ." 1000:" ." $currency";
            }
        }
    }

    if (empty($error)) {
        $insert_data    = array(
            'user_id'   => $user_id,
            'amount'    => PT_Secure($_POST['amount']),
            'email'     => PT_Secure($_POST['email']),
            'requested' => time(),
            'currency' => $currency,
        );

        $insert  = $db->insert(T_WITHDRAWAL_REQUESTS,$insert_data);
        if (!empty($insert)) {
            $data['status']  = 200;
            $data['message'] = $lang->withdrawal_request_sent;
        }
    }

    else{
        $data['status']  = 400;
        $data['message'] = $error;
    }
}
if ($first == 'get_more_subscribers_' && !empty($_POST['id']) && is_numeric($_POST['id'])) {
    $id = PT_Secure($_POST['id']);
    $subscribers_ = $db->rawQuery("SELECT * FROM ".T_SUBSCRIPTIONS." WHERE subscriber_id = '".$user->id."' AND id < '".$id."' ORDER BY id DESC LIMIT 6");
    $html = '';
    if (!empty($subscribers_)) {
        foreach ($subscribers_ as $key => $user_) {
            $user_subscribers_ = PT_UserData($user_->user_id);
            if (!empty($user_subscribers_)) {
                $html .= '<li data_subscriber_id="'.$user_->id.'" class="subscribers_"><a  href="'.$user_subscribers_->url.'" data-load="?link1=timeline&id='.$user_subscribers_->username.'"><img class="header-image subscribers_img_" src="'.$user_subscribers_->avatar.'" alt="'.$user_subscribers_->name.' avatar" />'.substr($user_subscribers_->name, 0,20)."..".'</a></li>';
            }
        }
    }
    $data['status'] = 200;
    $data['html'] = $html;
}

if ($first == 'two_factor' && in_array($_POST['two_factor'],array('0','1'))) {
    $user_id = $user->id;
    if (!empty($_POST['user_id']) && is_numeric($_POST['user_id']) && $_POST['user_id'] > 0) {
        if (PT_IsAdmin()) {
            $user_id = PT_Secure($_POST['user_id']);
        }
    }
    $update = $db->where('id', $user_id)->update(T_USERS, array('two_factor' => PT_Secure($_POST['two_factor'])));
    $data['status'] = 200;
    $data['message'] = $success_icon . $lang->setting_updated;
}


header("Content-type: application/json");
if (isset($errors)) {
    echo json_encode(array(
        'errors' => $errors
    ));
    exit();
}
