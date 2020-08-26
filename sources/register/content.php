<?php
if (IS_LOGGED == true || $pt->config->user_registration != 'on') {
    header("Location: " . PT_Link(''));
    exit();
}

$color1      = '2ec0bc';
$color2      = '8ef9f6';
$errors      = array();
$erros_final = '';
$username    = '';
$email       = '';
$success     = '';
$recaptcha   = '<div class="g-recaptcha" data-sitekey="' . $pt->config->recaptcha_key . '"></div>';
$pt->custom_fields = $db->where('registration_page','1')->get(T_FIELDS);
$field_data        = array();
if ($pt->config->recaptcha != 'on') {
    $recaptcha = '';
}
if (!empty($_POST)) {
    if (empty($_POST['username']) || empty($_POST['password']) || empty($_POST['email']) || empty($_POST['c_password']) || empty($_POST['gender'])) {
        $errors[] = $lang->please_check_details;
    } else {
        $username        = PT_Secure($_POST['username']);
        $password        = PT_Secure($_POST['password']);
        $c_password      = PT_Secure($_POST['c_password']);
        $password_hashed = sha1($password);
        $email           = PT_Secure($_POST['email']);
        $gender          = PT_Secure($_POST['gender']);
        if ($gender != 'female' && $gender != 'male') {
            $errors[] = $lang->gender_is_invalid;
        }
        if (PT_UsernameExists($_POST['username'])) {
            $errors[] = $lang->username_is_taken;
        }
        if (strlen($_POST['username']) < 4 || strlen($_POST['username']) > 32) {
            $errors[] = $lang->username_characters_length;
        }
        if (!preg_match('/^[\w]+$/', $_POST['username'])) {
            $errors[] = $lang->username_invalid_characters;
        }
        if (PT_UserEmailExists($_POST['email'])) {
            $errors[] = $lang->email_exists;
        }
        if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            $errors[] = $lang->email_invalid_characters;
        }
        if ($password != $c_password) {
            $errors[] = $lang->password_not_match;
        }
        if (strlen($password) < 4) {
            $errors[] = $lang->password_is_short;
        }
        if ($pt->config->recaptcha == 'on') {
            if (!isset($_POST['g-recaptcha-response']) || empty($_POST['g-recaptcha-response'])) {
                $errors[] = $lang->reCaptcha_error;
            }
        }

        if (empty($_POST['accept_terms'])) {
            $errors[] = $lang->terms_accept;
        } elseif ($_POST['accept_terms'] != 'on') {
            $errors[] = $lang->terms_accept;
        }
        

        if (!empty($pt->custom_fields) && count($pt->custom_fields) > 0) {
            foreach ($pt->custom_fields as $field) {
                $field_id   = $field->id;
                $field->fid = "fid_$field_id";

                if (!empty($_POST[$field->fid])) {
                    $name = $field->fid;
                    if (!empty($_POST[$name])) {
                        $field_data[] = array(
                            $name => $_POST[$name]
                        );
                    }
                }
            }
        }


        $active = ($pt->config->validation == 'on') ? 0 : 1;
        if (empty($errors)) {
            $email_code = sha1(time() + rand(111,999));
            $insert_data = array(
                'username' => $username,
                'password' => $password_hashed,
                'email' => $email,
                'ip_address' => get_ip_address(),
                'gender' => $gender,
                'active' => $active,
                'email_code' => $email_code,
                'last_active' => time(),
                'registered' => date('Y') . '/' . intval(date('m'))
            );
            $insert_data['language'] = $pt->config->language;
            if (!empty($_SESSION['lang'])) {
                if (in_array($_SESSION['lang'], $langs)) {
                    $insert_data['language'] = $_SESSION['lang'];
                }
            }
            $user_id = $db->insert(T_USERS, $insert_data);
            if (!empty($user_id)) {
                if (!empty($field_data)) {
                    PT_UpdateUserCustomData($user_id,$field_data,false);
                }


                if ($pt->config->validation == 'on') {
                     $link = $email_code . '/' . $email; 
                     $data['EMAIL_CODE'] = $link;
                     $data['USERNAME']   = $username;
                     $send_email_data = array(
                        'from_email' => $pt->config->email,
                        'from_name' => $pt->config->name,
                        'to_email' => $email,
                        'to_name' => $username,
                        'subject' => 'Confirm your account',
                        'charSet' => 'UTF-8',
                        'message_body' => PT_LoadPage('emails/confirm-account', $data),
                        'is_html' => true
                    );
                    $send_message = PT_SendMessage($send_email_data);
                    $success = $success_icon . $lang->successfully_joined_desc;
                } 

                else {
                    $session_id          = sha1(rand(11111, 99999)) . time() . md5(microtime());
                    $insert_data         = array(
                        'user_id' => $user_id,
                        'session_id' => $session_id,
                        'time' => time()
                    );
                    $insert              = $db->insert(T_SESSIONS, $insert_data);
                    $_SESSION['user_id'] = $session_id;
                    setcookie("user_id", $session_id, time() + (10 * 365 * 24 * 60 * 60), "/");
                    $pt->loggedin = true;
                    header("Location: $site_url");
                    exit();
                }
            }
        }
    }
}
$pt->page          = 'login';
$pt->title         = $lang->register . ' | ' . $pt->config->title;
$pt->description   = $pt->config->description;
$pt->keyword       = $pt->config->keyword;
$custom_fields     = "";
if (!empty($errors)) {
    foreach ($errors as $key => $error) {
        $erros_final .= $error_icon . $error . "<br>";
    }
}
if (!empty($pt->custom_fields)) {
    foreach ($pt->custom_fields as $field) {
        $field_id       = $field->id;
        $fid            = "fid_$field_id";
        $pt->filed      = $field;
        $custom_fields .= PT_LoadPage('auth/register/custom-fields',array(
            'NAME'      => $field->name,
            'FID'       => $fid
        ));
    }
}

$pt->content     = PT_LoadPage('auth/register/content', array(
    'COLOR1' => $color1,
    'COLOR2' => $color2,
    'ERRORS' => $erros_final,
    'USERNAME' => $username,
    'EMAIL' => $email,
    'SUCCESS' => $success,
    'RECAPTCHA' => $recaptcha,
    'CUSTOM_FIELDS' => $custom_fields
));