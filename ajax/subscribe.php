<?php
if (IS_LOGGED == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
}
if (!empty($_POST['user_id'])) {
    $id = PT_Secure($_POST['user_id']);
    $is_subscribed = $db->where('user_id', $id)->where('subscriber_id', $user->id)->getValue(T_SUBSCRIPTIONS, "count(*)");
    
    if ($is_subscribed > 0) {
        $delete_sub = $db->where('user_id', $id)->where('subscriber_id', $user->id)->delete(T_SUBSCRIPTIONS);
        if ($delete_sub) {
            $data = array(
                'status' => 304
            );
        }

        $notif_data = array(
            'notifier_id' => $pt->user->id,
            'recipient_id' => $id,
            'type' => 'unsubscribed_u',
            'url' => ('@' . $pt->user->username),
            'time' => time()
        );

        pt_notify($notif_data);
    } 
    else {
        $insert_data         = array(
            'user_id' => $id,
            'subscriber_id' => $user->id,
            'time' => time(),
            'active' => 1
        );
        $create_subscription = $db->insert(T_SUBSCRIPTIONS, $insert_data);
        if ($create_subscription) {
            $data = array(
                'status' => 200
            );

            $notif_data = array(
                'notifier_id' => $pt->user->id,
                'recipient_id' => $id,
                'type' => 'subscribed_u',
                'url' => ('@' . $pt->user->username),
                'time' => time()
            );

            pt_notify($notif_data);
        }
    }
}