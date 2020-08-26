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
if (!IS_LOGGED) {
    $response_data = array(
        'api_status' => '400',
        'api_version' => $api_version,
        'errors' => array(
            'error_id' => '1',
            'error_text' => 'Not logged in'
        )
    );
} else {
    $response_data = array(
        'api_status' => '200',
        'api_version' => $api_version,
        'notifications' => array()
    );
    $user_id       = $pt->user->id;
    $type          = (!empty($_POST['get'])) ? PT_Secure($_POST['get']) : 'all';
    $show_all      = (!empty($_POST['count'])) ? PT_Secure($_POST['count']) : false;
    $html          = "";
    $t_notif       = T_NOTIFICATIONS;

    $notif_set     = pt_get_notification(array(
        'recipient_id' => $user_id,
        'type' => $type
    ));

    if (!empty($show_all)) {
    	$response_data['count_unread_notifications'] = (!empty($notif_set)) ? count($notif_set) : 0;
    }
    
    $update = array();
    $new    = 0;
    if (is_array($notif_set)) {
    	foreach ($notif_set as $data_row) {
	        $data_row['notifier'] = PT_UserData($data_row['notifier_id']);
	        unset($data_row['notifier']->password);
	        $icon                 = $pt->notif_data[$data_row['type']]['icon'];
	        $title                = $pt->notif_data[$data_row['type']]['text'];
	        $response_data['notifications'][] = array(
	            'ID' => $data_row['id'],
	            'USER_DATA' => $data_row['notifier'],
	            'TITLE' => $title,
	            'URL' => PT_Link($data_row['url']),
	            'TIME' => PT_Time_Elapsed_String($data_row['time']),
	            'ICON' => $icon
	        );
	        $update[] = $data_row['id'];
	        if (empty($data_row['seen'])) {
	            $new++;
	        }
	    }
    }
   
    if (!empty($show_all) && $type != 'new') {
		$db->where('recipient_id', $pt->user->id)->update($t_notif,array('seen' => time()));
	}
}
