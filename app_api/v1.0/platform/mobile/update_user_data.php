<?php

if (!IS_LOGGED) {
    $response_data = array(
        'api_status' => '400',
        'api_version' => $api_version,
        'errors' => array(
            'error_id' => '1',
            'error_text' => 'Not logged in'
        )
    );
}

if (empty($_POST['settings_type'])) {
    $response_data = array(
        'api_status' => '400',
        'api_version' => $api_version,
        'errors' => array(
            'error_id' => '2',
            'error_text' => 'settings_type is not sent'
        )
    );
}

$response_data['status'] = 400;

$is_owner = false;
if (!empty($user->id)) {
    $is_owner = true;
}

if ($_POST['settings_type'] == 'general') {
    if (empty($_POST['username']) OR empty($_POST['email'])) {
        $errors = $lang->please_check_details;
    } 

    else {
        $user_data = PT_UserData($user->id);
        if (!empty($user_data->id)) {
            if ($_POST['email'] != $user_data->email) {
                if (PT_UserEmailExists($_POST['email'])) {
                    $errors = $lang->email_exists;
                }
            }
            if ($_POST['username'] != $user_data->username) {
                $is_exist = PT_UsernameExists($_POST['username']);
                if ($is_exist) {
                    $errors = $lang->username_is_taken;
                }
            }
            if (in_array($_POST['username'], $pt->site_pages)) {
                $errors = $lang->username_invalid_characters;
            }
            if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
                $errors = $lang->email_invalid_characters;
            }
            if (strlen($_POST['username']) < 4 || strlen($_POST['username']) > 32) {
                $errors = $lang->username_characters_length;
            }
            if (!preg_match('/^[\w]+$/', $_POST['username'])) {
                $errors = $lang->username_invalid_characters;
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
            if (empty($errors)) {
                $update_data = array(
                    'username' => PT_Secure($_POST['username']),
                    'email' => PT_Secure($_POST['email']),
                    'gender' => PT_Secure($gender),
                    'first_name' => PT_Secure($_POST['first_name']),
	                'last_name' => PT_Secure($_POST['last_name']),
	                'about' => PT_Secure($_POST['about']),
                );
                if ($is_owner == true) {
                    $update = $db->where('id', PT_Secure($user->id))->update(T_USERS, $update_data);
                    if ($update){ 
                        $response_data = array(
	                        'api_status' => '200',
	                        'api_version' => $api_version,
	                        'message' => $lang->setting_updated
	                    );
                    }
                }
            } else {
            	$response_data = array(
                    'api_status' => '400',
                    'api_version' => $api_version,
                    'errors' => array(
                        'error_id' => '2',
                        'error_text' => $errors
                    )
                );
            }
        }
    }
}

if ($_POST['settings_type'] == 'avatar') {
    $user_data = PT_UserData($user->id);
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
        $update = $db->where('id', PT_Secure($user->id))->update(T_USERS, $update_data);
        if ($update) {
           $response_data = array(
                'api_status' => '200',
                'api_version' => $api_version,
                'message' => $lang->setting_updated
            );
        }
    }
}