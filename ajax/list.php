<?php
if (IS_LOGGED == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
}

if (!empty($_GET['a']) && $_GET['a'] == "add" && !empty($_GET['id']) && is_numeric($_GET['id'])) {
    $user_id           = PT_Secure($user->id);
    $lists             = "";
    $pt->video_id      = PT_Secure($_GET['id']);
    $pt->user_list     = $db->where('user_id', $user_id)->get(T_LISTS);
    $pt->wlater_exists = ($db->where('user_id', $user_id)
                            ->where('video_id',$pt->video_id)
                            ->getValue(T_WLATER, 'count(*)') > 0);

    foreach ($pt->user_list as $playlist) {
        $playlist_id      = $playlist->list_id;
        $playlist->exists = ($db->where('user_id', $user_id)
                            ->where('list_id',$playlist_id)
                            ->where('video_id',$pt->video_id)
                            ->getValue(T_PLAYLISTS, 'count(*)') > 0);

        if (strlen($playlist->name) > 25) {
            $playlist->name = PT_ShortText($playlist->name,28);
        }
    }

    if (count($pt->user_list) > 0) {
        $lists .= PT_LoadPage('playlist/includes/sa-list');
    }

    else{
       $lists = PT_LoadPage('playlist/includes/sa-nolists'); 
    }

    $data = array(
        'html' => $lists,
        'status' => 200
    );

}

if (!empty($_GET['a']) && $_GET['a'] == "new") {
    $user_id   = PT_Secure($user->id);
    $name      = (!empty($_POST['name'])) ? PT_ShortText(PT_Secure($_POST['name']),30) : "";
    $desc      = (!empty($_POST['desc'])) ? PT_ShortText(PT_Secure($_POST['desc']),500) : "";
    $privacy   = (isset($_POST['pr']) && is_numeric($_POST['pr']) && $_POST['pr'] > -1 && $_POST['pr'] < 2) ? PT_Secure($_POST['pr']) : 1;
    $data      = array('status' => 400);
    if (!empty($name)) {
        $data_insert      = array(
            'list_id'     => PT_GenerateKey(15, 15),
            'user_id'     => $user_id,
            'name'        => $name,
            'description' => $desc,
            'privacy'     => $privacy,
            'time'        => time()
        );
        $insert           = $db->insert(T_LISTS, $data_insert);
        if ($insert) {
            $data = array(
                'status' => 200
            );
        }
    }
}

if (!empty($_GET['a']) && $_GET['a'] == "update") {
    $user_id   = PT_Secure($user->id);
    $name      = (!empty($_POST['name'])) ? PT_ShortText(PT_Secure($_POST['name']),30) : "";
    $desc      = (!empty($_POST['desc'])) ? PT_ShortText(PT_Secure($_POST['desc']),500) : "";
    $privacy   = (isset($_POST['pr']) && is_numeric($_POST['pr']) && $_POST['pr'] > -1 && $_POST['pr'] < 2) ? PT_Secure($_POST['pr']) : 1;
    $data      = array('status' => 400);
    $request   = (!empty($name) && !empty($_POST['id']) && is_numeric($_POST['id']) && $_POST['id'] > 0);
    if ($request === true) {
        $data_insert      = array(
            'name'        => $name,
            'description' => $desc,
            'privacy'     => $privacy,
        );
        $update           = $db->where('id',$_POST['id'])->where('user_id',$user_id)->update(T_LISTS, $data_insert);
        if ($update) {
            $data = array(
                'status' => 200
            );
        }
    }
}

if (!empty($_GET['a']) && $_GET['a'] == "delist") {
    $user_id   = PT_Secure($user->id);
    $data      = array('status' => 400);
    $request   = (!empty($_GET['id']) && is_numeric($_GET['id']) && $_GET['id'] > 0);
    if ($request === true) {
        $list_data = $db->where('id',$_GET['id'])->where('user_id',$user_id)->getOne(T_LISTS);
        if (!empty($list_data)) {
            $db->where('id',$_GET['id'])->where('user_id',$user_id)->delete(T_LISTS);
            $db->where('list_id',$list_data->list_id)->where('user_id',$user_id)->delete(T_PLAYLISTS);
            $data['status'] = 200;
            $data['name']   = $list_data->name;
        }
    }
}

if (!empty($_GET['a']) && $_GET['a'] == "delvid") {
    $user_id   = PT_Secure($user->id);
    $data      = array('status' => 400);
    $request   = ((!empty($_GET['video_id']) && is_numeric($_GET['video_id']) && $_GET['video_id'] > 0) && !empty($_GET['list_id']));

    if ($request === true) {
        $list_id  = PT_Secure($_GET['list_id']);
        $video_id = $_GET['video_id'];
        $db->where('list_id',$list_id)->where('user_id',$user_id)->where('video_id',$video_id)->delete(T_PLAYLISTS);
        $data['status'] = 200;
    }
}

if (!empty($_GET['a']) && $_GET['a'] == "delwl") {
    $user_id   = PT_Secure($user->id);
    $data      = array('status' => 400);
    $request   = ((!empty($_GET['video_id']) && is_numeric($_GET['video_id']) && $_GET['video_id'] > 0));

    if ($request === true) {
        $video_id = $_GET['video_id'];
        $db->where('user_id',$user_id)->where('video_id',$video_id)->delete(T_WLATER);
        $data['status'] = 200;
    }
}

if (!empty($_GET['a']) && $_GET['a'] == "edit") {
    $user_id   = PT_Secure($user->id);
    $data      = array('status' => 400);
    $request   = (!empty($_GET['id']) && is_numeric($_GET['id']) && $_GET['id'] > 0);
    
    if ($request === true) {
        $list_data     = $db->where('user_id', $user_id)->where('id',$_GET['id'])->getOne(T_LISTS);
        if (!empty($list_data)) {

            $data = array(
                'status' => 200,
                'html'   => PT_LoadPage('playlist/includes/edit',array(
                    'NAME'    => $list_data->name,
                    'DESC'    => $list_data->description,
                    'ID'      => $list_data->id,
                    'PUBLIC'  => (($list_data->privacy == 1) ? 'selected' : ''),
                    'PRIVATE' => (($list_data->privacy == 0) ? 'selected' : '')
                ))
            );

        }
    }
}


if (!empty($_GET['a']) && $_GET['a'] == "tg" && !empty($_GET['id']) && !empty($_GET['list'])) {
    $user_id   = PT_Secure($user->id);
    $id        = (is_numeric($_GET['id'])) ? PT_Secure($_GET['id']) : false;
    $list      = PT_Secure($_GET['list']);
    $data      = array('status' => 400);
    $request   = ($id && $list);
    $table     = T_PLAYLISTS;

    if ($request === true) {
        $list_name = $db->where('list_id', $list)->getValue(T_LISTS,'name');
        if ($db->where('user_id', $user_id)->where('list_id', $list)->where('video_id', $id)->getValue($table, 'count(*)') > 0) {
            $db->where('user_id', $user_id)->where('list_id', $list)->where('video_id', $id);
            if($db->delete($table)){
                $data['status'] = 200;
                $data['code']   = 0;
                $data['name']   = $list_name;
            }
        }
        else{
            $data_insert   = array(
                'list_id'  => $list,
                'video_id' => $id,
                'user_id'  => $user_id
            );

            $insert = $db->insert($table,$data_insert);
            if ($insert) {
                $data['status'] = 200;
                $data['code']   = 1;
                $data['name']   = $list_name;
            }
        }

    }
}

if (!empty($_GET['a']) && $_GET['a'] == "wl-tg" && !empty($_GET['id'])) {
    $user_id   = PT_Secure($user->id);
    $id        = (is_numeric($_GET['id'])) ? PT_Secure($_GET['id']) : false;
    $data      = array('status' => 400);
    $table     = T_WLATER;

    if ($id) {
        if ($db->where('user_id', $user_id)->where('video_id', $id)->getValue($table, 'count(*)') > 0) {
            $db->where('user_id', $user_id)->where('video_id', $id);
            if($db->delete($table)){
                $data['status'] = 200;
                $data['code']   = 0;
            }
        }
        else{
            $data_insert   = array(
                'video_id' => $id,
                'user_id'  => $user_id,
                'time'     => time()
            );

            $insert = $db->insert($table,$data_insert);
            if ($insert) {
                $data['status'] = 200;
                $data['code']   = 1;
            }
        }
    }
}