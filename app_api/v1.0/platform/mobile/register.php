<?php
// +------------------------------------------------------------------------+
// | @author Deen Doughouz (DoughouzForest)
// | @author_url 1: http://www.playtubescript.com
// | @author_url 2: http://codecanyon.net/user/doughouzforest
// | @author_email: wowondersocial@gmail.com   
// +------------------------------------------------------------------------+
// | PlayTube - The Ultimate Video Sharing Platform
// | Copyright (c) 2017 PlayTube. All rights reserved.
// +------------------------------------------------------------------------+

if (IS_LOGGED === true) {
    $response_data       = array(
        'api_status'     => '304',
        'api_version'    => $api_version,
        'errors'         => array(
            'error_id'   => '1',
            'error_text' => 'You are already logged in'
        )
    );
}
else if ($pt->config->user_registration != 'on') {
	$response_data       = array(
        'api_status'     => '400',
        'api_version'    => $api_version,
        'errors'         => array(
            'error_id'   => '2',
            'error_text' => 'Sorry, User registration is currently disabled'
        )
    );
}
else{

	if (empty($_POST['username'])) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '3',
	            'error_text' => 'Please write your username'
	        )
	    );
	} 

	else if (strlen($_POST['username']) < 5 OR strlen($_POST['username']) > 32) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '4',
	            'error_text' => 'Username must be between 5 / 32'
	        )
	    );
	} 

	else if (PT_UsernameExists($_POST['username'])) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '5',
	            'error_text' => 'Username is already exists'
	        )
	    );
	} 

	else if (!preg_match('/^[\w]+$/', $_POST['username'])) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '6',
	            'error_text' => 'Invalid username characters'
	        )
	    );
	} 

	else if (empty($_POST['email'])) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '7',
	            'error_text' => 'Please write your email'
	        )
	    );
	} 

	else if (PT_UserEmailExists($_POST['email']) === true) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '8',
	            'error_text' => 'This e-mail is already in use'
	        )
	    );
	} 

	else if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '9',
	            'error_text' => 'This e-mail is invalid'
	        )
	    );
	} 

	else if (empty($_POST['password'])) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '10',
	            'error_text' => 'Please write your password'
	        )
	    );
	} 

	else if (strlen($_POST['password']) < 6) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '11',
	            'error_text' => 'Password is too short'
	        )
	    );
	} 

	else if (empty($_POST['confirm_password'])) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '12',
	            'error_text' => 'Please confirm your password'
	        )
	    );
	} 

	else if ($_POST['password']  != $_POST['confirm_password']) {
	    $response_data       = array(
	        'api_status'     => '400',
	        'api_version'    => $api_version,
	        'errors'         => array(
	            'error_id'   => '13',
	            'error_text' => 'Password not match'
	        )
	    );
	}  

	else if (empty($response_data['errors'])) {
	    $username                   = PT_Secure($_POST['username'], 0);
	    $password                   = PT_Secure($_POST['password'], 0);
	    $email                      = PT_Secure($_POST['email'], 0);
	    $email_code                 = sha1(time() + rand(111,999));
	    $gender                     = 'male';

	    if (!empty($_POST['gender'])) {
	    	if ($_POST['gender'] == 'female') {
	    		$gender             = 'female';
	    	}
	    }

	    $active           = ($pt->config->validation == 'on') ? 0 : 1;
	    $password_hashed  = sha1($password);
	    $email_code       = sha1(time() + rand(111,999));
        $insert_data      = array(
            'username'    => $username,
            'password'    => $password_hashed,
            'email'       => $email,
            'gender'      => $gender,
            'active'      => $active,
            'email_code'  => $email_code,
            'last_active' => time(),
            'registered'  => date('Y') . '/' . intval(date('m'))
        );
        if (!empty($_POST['device_id'])) {
        	$insert_data['device_id'] = PT_Secure($_POST['device_id']);
        }

        $user_id          = $db->insert(T_USERS, $insert_data);
	    if (!empty($user_id)) {
	        if ($active == 0) {
                $link = $email_code . '/' . $email; 
                $data['EMAIL_CODE'] = $link;
                $data['USERNAME']   = $username;
                $send_email_data    = array(
                    'from_email'    => $pt->config->email,
                    'from_name'     => $pt->config->name,
                    'to_email'      => $email,
                    'to_name'       => $username,
                    'subject'       => 'Confirm your account',
                    'charSet'       => 'UTF-8',
                    'message_body'  => PT_LoadPage('emails/confirm-account', $data),
                    'is_html'       => true
                );


                $send_message        = PT_SendMessage($send_email_data);
                $response_data       = array(
			        'api_status'     => '200',
			        'api_version'    => $api_version,
			        'success_type'   => 'confirm_account',
			        'data'           => array(
			            'email'      => $email   
			        )
			    );
			    $response_data     = array(
			        'api_status'   => '200',
			        'api_version'  => $api_version,
			        'success_type' => 'registered',
			        'message'      => 'Registration successful! We have sent you an email, Please check your inbox/spam to verify your account.'
			    );
            } 

            else {
                $session_id      = sha1(rand(11111, 99999)) . time() . md5(microtime());
                $platforms       = array('phone','web');

                foreach ($platforms as $platform_name) {
                	$insert_data     = array(
	                    'user_id'    => $user_id,
	                    'session_id' => $session_id,
	                    'time'       => time(),
	                    'platform'   => $platform_name
	                );

                	$insert = $db->insert(T_SESSIONS, $insert_data);
                }
                
                if (!empty($insert)) {
                	$response_data     = array(
				        'api_status'   => '200',
				        'api_version'  => $api_version,
				        'success_type' => 'registered',
				        'message'      => 'Successfully joined, Please wait..',
				        'data'         => array(
				            'user_id'  => $user_id,
				            's'        => $session_id,
				            'cookie'   => $session_id
				        )
				    );
                }

                else{
                	$response_data       = array(
				        'api_status'     => '500',
				        'api_version'    => $api_version,
				        'errors'         => array(
				            'error_id'   => '14',
				            'error_text' => 'Error: an unknown error occurred. Please try again later'
				        )
				    );
                }
            }
	    }
	}
}