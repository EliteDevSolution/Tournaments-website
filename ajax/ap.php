<?php

if (IS_LOGGED == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
}
if (PT_IsAdmin() == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not admin'
    );
    echo json_encode($data);
    exit();
}

if ($first == 'save-settings') {
    $submit_data = array();
    foreach ($_POST as $key => $settings_to_save) {
        $submit_data[$key] = $settings_to_save;
    }
    $update = false;
    if (!empty($submit_data)) {
        foreach ($submit_data as $key => $value) {
            $update = $db->where('name', $key)->update(T_CONFIG, array('value' => PT_Secure($value, 0)));
            if ($key == 'ftp_upload') {
                if ($value == "on") {
                    if ($pt->config->s3_upload == "on") {
                        $update = $db->where('name', 's3_upload')->update(T_CONFIG, array('value' => "off"));
                    }
                }
            }
            if ($key == 's3_upload') {
                if ($value == "on") {
                    if ($pt->config->ftp_upload == "on") {
                        $update = $db->where('name', 'ftp_upload')->update(T_CONFIG, array('value' => "off"));
                    }
                }
            }
            if ($key == 'admin_com_sell_videos') {
                if (empty($value) || $value < 0 || !is_numeric($value)) {
                    $update = $db->where('name', $key)->update(T_CONFIG, array('value' => 0));
                }
            }
            if($key == 'queue_count' && (!($value >= 0) || !is_numeric($value))){
                $update = $db->where('name', $key)->update(T_CONFIG, array('value' => 0));
            }
            
        }
        if (isset($submit_data['s3_upload'])) {
            $get_config_json = file_get_contents('./nodejs/config.json');
            if (!empty($get_config_json)) {
                $config_json = json_decode($get_config_json);
                $config_json->amazon = ($submit_data['s3_upload'] == 'on') ? true : false;
                $config_json->amazon_bucket = $submit_data['s3_bucket_name'];
                $encode = json_encode($config_json, JSON_PRETTY_PRINT);
                $write_file = file_put_contents('./nodejs/config.json', $encode);
            }
        }
    }
    if ($update) {
        $data = array('status' => 200);
    }
}

if ($first == 'delete-comment') {
    if (!empty($_POST['id'])) {
        $id = PT_Secure($_POST['id']);
        $delete_comment = $db->where('id', $id)->delete(T_COMMENTS);
        if ($delete_comment) {
            $delete_comments_likes   = $db->where('comment_id', $id)->delete(T_COMMENTS_LIKES);
            $comments_replies        = $db->where('comment_id', $id)->get(T_COMM_REPLIES);
            $delete_comments_replies = $db->where('comment_id', $id)->delete(T_COMM_REPLIES);
            if (!empty($comments_replies)) {
                foreach ($comments_replies as $reply) {
                    $db->where('reply_id', $reply->id)->delete(T_COMMENTS_LIKES);
                }
            }

            if ($delete_comments_likes && $delete_comments_replies) 
            {
                $data = array('status' => 200);
            }
        }
    }
}

if($first == 'get-participants')
{
    $data['status'] = 400;
    if(!empty($_POST['tourid']))
    {
        $tblparti = T_PARTICIPANTS;
        $tblusers = T_USERS;
        $tourid = PT_Secure($_POST['tourid']);
        $strQuery = "SELECT * FROM $tblparti AS T1 LEFT JOIN $tblusers AS T2 ON(T1.userid = T2.id) WHERE tourid = $tourid order by T2.wallet, T2.point desc";
        $partilst = $db->rawQuery($strQuery);
        $reshtml = "";
        foreach ($partilst as $key => $value) 
        {
            $imglink = PT_Link($value->reportimg);
            $curpoint = $value->curpoint;
            $curpool = $value->curpool;
            $userid = $value->userid;
            $tourid = $value->tourid;
            $verified = ($value->verified == 1) ? '<span class="label label-success">Verifed</span>' : '<span class="label label-danger">No Verifed</span>';
            $reshtml .= "<tr>";
            $reshtml .= "<td><a href=javascript:viewimg('$imglink',$curpoint,$curpool,$userid,$tourid);>".$value->checkout."</a></td>";
            $reshtml .= "<td>".$value->username."</td>";
            $reshtml .= "<td>".$value->email."</td>";
            $reshtml .= "<td>".$verified."</td>";
            $reshtml .= "<td>".$value->wallet."</td>";
            $reshtml .= "<td>".$value->point."</td>";   
            $reshtml .= "<td>".$value->curpoint."</td>";
            $reshtml .= "<td>".$value->curpool."</td>";   
            $reshtml .= "</tr>";
        }
        $data['status'] = 200;
        $data['result'] = $reshtml;       
    }
}

if($first == 'send-score')
{
    $data['status'] = 400;
    $userid = $_POST['userid'];
    $tourid = $_POST['tourid'];
    $score = $_POST['score'];
    $money = $_POST['money'];
    if(empty($userid) || empty($tourid) || (intval($score) == 0 && intval($money) == 0))
    {
        exit;
    }
    $db->where('tourid', $tourid);
    $db->where('userid', $userid);
    $db->where('report', 1);    
    $res = $db->getOne(T_PARTICIPANTS);
    $prevmoney = $res->curpool;
    $prevsocre = $res->curpoint;
    $db->where('tourid', $tourid);
    $db->where('userid', $userid);
    $db->where('state', 1);
    $db->where('report', 1);
    $update_data = array(
        'curpoint'=>$score,
        'curpool'=>$money
    );
    $db->update(T_PARTICIPANTS, $update_data);
    ///Alert = 1 users tbl directly point & wallet boost.
    $tbluser = T_USERS;
    $tblparti = T_PARTICIPANTS;
    $strQuery = "update $tbluser set point=point+$score-$prevsocre, wallet= wallet+$money-$prevmoney where id=(Select userid from $tblparti where alert=1 and userid=$userid)";
    $db->rawQuery($strQuery);
    $data['status'] = 200;
}

if ($first == 'delete-user') {
    if (!empty($_POST['id'])) {
        $delete = PT_DeleteUser(PT_Secure($_POST['id']));
        if ($delete) {
            $data = array('status' => 200);
        }
    }
}

if($first == 'tour-completed')
{
    $data['status'] = 400;  
    $tbluser = T_USERS;
    $tblparti = T_PARTICIPANTS;
    $tbltour = T_TOURNAMENTS;
    if(!empty($_POST['tourid']))
    {
        $tourid = PT_Secure($_POST['tourid']);
        $strQuery = "UPDATE $tbluser SET wallet = wallet + (SELECT curpool FROM $tblparti WHERE tourid = $tourid AND $tbluser.id = userid), point = point + (SELECT curpoint FROM $tblparti WHERE tourid = $tourid AND $tbluser.id = userid) WHERE id IN (SELECT userid FROM $tblparti WHERE tourid = $tourid)";
        $db->rawQuery($strQuery);
        $db->rawQuery("Update $tblparti set alert=1 where tourid=$tourid and report=1");
        $db->rawQuery("Update $tbltour set state='COMPLETED' where id=$tourid");
        
        //Participants rank update
        $strQuery = "UPDATE $tbluser AS T1 LEFT JOIN (SELECT id, point, 
        IF(point = @_last_age,
        @curRank := @curRank,
        @curRank := @_sequence) AS rank,
        @_sequence := @_sequence + 1,
        @_last_age := point FROM $tbluser p,
        (SELECT @curRank := 1, @_sequence := 1, @_last_age := 0) r ORDER BY point DESC) AS T2 ON(T1.id=T2.id)
        SET T1.ranking = T2.rank";
        $db->rawQuery($strQuery);
        //Notification Participants sender
        $db->where('tourid', $tourid);
        $db->where('report', 1);
        $res =$db->get(T_PARTICIPANTS);
        foreach ($res as $key => $value) 
        {
            $p_currency        = '$';
            if ($pt->config->payment_currency == 'EUR') 
            {
                $p_currency    = '€';
            } else if($pt->config->payment_currency == 'INR')
            {
                $p_currency = '₹';
            }
            if(number_format($value->curpool) == 0 && number_format($value->curpoint) == 0) continue;
            $pool = $p_currency.' '.PT_formatMoney($value->curpool);
            $point = PT_formatMoney($value->curpoint);  

            $insertdata = [
                'notifier_id' => $pt->user->id,
                'recipient_id' => $value->userid,
                'type' => 'refresh_rank',
                'text' => "Your rank has been updated. You got $point point and $pool as a tournament pool.",
                'time' => time(),
            ];
            $db->insert(T_NOTIFICATIONS, $insertdata);
       }
    }
    $data['status'] = 200;
}

if ($first == 'delete-video') {
    if (!empty($_POST['id'])) {
        $delete = PT_DeleteVideo(PT_Secure($_POST['id']));
        if ($delete) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'delete-video_ad') {
    if (!empty($_POST['id'])) {
        $delete = $db->where('id', PT_Secure($_POST['id']))->delete(T_VIDEO_ADS);
        if ($delete) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'videos-status') {
    if (!empty($_POST['id']) && !empty($_POST['status'])) {
        if ($_POST['status'] == 'approve') {
            $update_to = 1;
        } else {
            $update_to = 0;
        }
        $db->where('id', PT_Secure($_POST['id']))->update(T_VIDEOS, array('approved' => $update_to));
    }
}

if ($first == 'delete-multi-videos') {
    if (!empty($_POST['ids'])) {
        foreach ($_POST['ids'] as $key => $id) {
            $delete = PT_DeleteVideo(PT_Secure($id));
        }
        if ($delete) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'load-more-youtube')  {
    if (!empty($_POST['query']) && !empty($_POST['pageToken'])) {
        $query = PT_Secure(urlencode($_POST['query']));
        $limit = 50;
        if (!empty($_POST['limit']) && $limit < 51) {
            $limit = (int) PT_Secure($_POST['limit']);
        }
        $token = PT_Secure($_POST['pageToken']);
        try {
            $youtube = new Madcoda\Youtube(array('key' => $pt->config->yt_api));
            $search = array(
                'q'             => $query,
                'type'          => 'video',
                'part'          => 'id',
                'maxResults'    => $limit,
                'pageToken'     => $token,
            );
            if ($_POST['channel'] == 1) {
               $search['q'] = '';
               $search['channelId'] = $query;
            }
            $get_videos = $youtube->searchAdvanced($search, true);
            if (!empty($get_videos)) {
                if ($get_videos['info']['totalResults'] > 0) {
                    $next_token = $get_videos['info']['nextPageToken'];
                    $ids        = array();
                    foreach ($get_videos['results'] as $key => $video) {
                        $check_if_exists = $db->where('youtube', $video->id->videoId)->getValue(T_VIDEOS, 'count(*)');
                        if ($check_if_exists == 0) {
                            $ids[] = $video->id->videoId;
                        }
                    }
                    $ids_implode = implode(',', $ids);
                    if (!empty($ids_implode)) {
                        $youtube_call_url = "https://www.googleapis.com/youtube/v3/videos?part=contentDetails,snippet&id=$ids_implode&key={$pt->config->yt_api}";
                        $get_videos = connect_to_url($youtube_call_url);
                        $get_videos = json_decode($get_videos);
                        if (!empty($get_videos)) {
                            $videos_html = '';
                            foreach ($get_videos->items as $key => $video) {
                                $thumb = PT_GetMedia('upload/photos/thumbnail.jpg');
                                if (!empty($video->snippet->thumbnails->maxres->url)) {
                                    $thumb = $video->snippet->thumbnails->maxres->url;
                                } else if (!empty($video->snippet->thumbnails->medium->url)) {
                                    $thumb = $video->snippet->thumbnails->medium->url;
                                } 
                                $tags = '';
                                if (!empty($video->snippet->tags)) {
                                    $tags_array = array();
                                    if (is_array($video->snippet->tags)) {
                                        $tag_count = 0;
                                        foreach ($video->snippet->tags as $key => $tag) {
                                            if ($tag_count < 11) {
                                                $tags_array[] = $tag;
                                            }
                                            $tag_count++;
                                        }
                                        $tags = implode(',', $tags_array);
                                    }
                                }
                                $duration = '00:00';
                                if (!empty(covtime($video->contentDetails->duration))) {
                                    $duration = covtime($video->contentDetails->duration);
                                }
                                $array_data = array(
                                    'ID' => $video->id,
                                    'TITLE' => $video->snippet->title,
                                    'DESC' => $video->snippet->description,
                                    'THUMB' => $thumb,
                                    'TAGS' => $tags,
                                    'DURATION' => $duration,
                                    'open_from_home_folder' => 1
                                );
                                $videos_html .= PT_LoadAdminPage('import-from-youtube/list', $array_data);
                            }
                            if (!empty($videos_html)) {
                                $data = array('status' => 200, 'html' => $videos_html, 'token' => $next_token);
                            }
                        }
                    }
                }
            }
        } catch (Exception $e) {
            
        }

    }
}
if ($first == 'load-more-daily')  {
    if (!empty($_POST['query']) && !empty($_POST['pageToken'])) {
        $query = PT_Secure(urlencode($_POST['query']));
        $limit = 50;
        if (!empty($_POST['limit']) && $limit < 101) {
            $limit = (int) PT_Secure($_POST['limit']);
        }
        $page_id = PT_Secure($_POST['pageToken']);
        $call_url = "https://api.dailymotion.com/videos/?search=$query&page=$page_id&limit=$limit&fields=thumbnail_1080_url,thumbnail_large_url,title,duration,description,tags,id";
        $get_videos = connect_to_url($call_url);
        $get_videos = json_decode($get_videos);
        if (!empty($get_videos)) {
            if (!empty($get_videos->total)) {
                $ids = array();
                foreach ($get_videos->list as $key => $video) {
                    $check_if_exists = $db->where('daily', $video->id)->getValue(T_VIDEOS, 'count(*)');
                    if ($check_if_exists == 0) {
                        $ids[] = $video->id;
                    }
                }
                $next_token = ($page_id < 100) ? ($page_id + 1) : 1;
                if (!empty($ids)) {
                    $videos_html = '';
                    foreach ($get_videos->list as $key => $video) {
                        $thumb = PT_GetMedia('upload/photos/thumbnail.jpg');
                        if (!empty($video->thumbnail_1080_url)) {
                            $thumb = $video->thumbnail_1080_url;
                        } else if (!empty($video->thumbnail_large_url)) {
                            $thumb = $video->thumbnail_large_url;
                        }
                        $thumb = str_replace('http://', 'https://', $thumb);
                        $tags = '';
                        if (is_array($video->tags)) {
                            $tags_array = array();
                            $tag_count = 0;
                            foreach ($video->tags as $key => $tag) {
                                if ($tag_count < 11) {
                                    $tags_array[] = $tag;
                                }
                                $tag_count++;
                            }
                            $tags = implode(',', $tags_array);
                        }
                        $duration = '00:00';
                        if (!empty($video->duration)) {
                            $duration = gmdate("i:s", $video->duration);
                        }
                        $array_data = array(
                            'ID' => $video->id,
                            'TITLE' => $video->title,
                            'DESC' => $video->description,
                            'THUMB' => $thumb,
                            'TAGS' => $tags,
                            'DURATION' => $duration,
                            'open_from_home_folder' => 1
                        );
                        $videos_html .= PT_LoadAdminPage('import-from-dailymotion/list', $array_data);
                    }
                    if (!empty($videos_html)) {
                        $data = array('status' => 200, 'html' => $videos_html, 'token' => $next_token);
                    }
                } 
            }
        }
    }
}
if ($first == 'import-daily-videos') {
    if (!empty($_POST['videos'])) {
        $ids = array();
        $category_id = 0;
        if (!empty($_POST['category_id'])) {
            if (in_array($_POST['category_id'], array_keys(ToArray($pt->categories)))) {
                $category_id = $_POST['category_id'];
            }
        }
        foreach ($_POST['videos'] as $key => $data_fro_ajax) {
            $video_id  = PT_GenerateKey(15, 15);
            $video_id_ = $data_fro_ajax['video_id'];
            $title = $data_fro_ajax['title'];
            $description = $data_fro_ajax['description'];
            $duration = $data_fro_ajax['duration'];
            $thumb = $data_fro_ajax['thumb'];
            $tags = $data_fro_ajax['tags'];
            $insert = false;
            if (strpos($thumb, 'upload/photos/thumbnail')) {
                $thumb = 'upload/photos/thumbnail.jpg';
            }
            $check_for_video = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'count(*)');
            if ($check_for_video > 0) {
                $video_id = PT_GenerateKey(15, 15);
            }
            $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
            $i          = 0;
            preg_match_all($link_regex, PT_Secure($description), $matches);
            foreach ($matches[0] as $match) {
                $match_url           = strip_tags($match);
                $syntax              = '[a]' . urlencode($match_url) . '[/a]';
                $description = str_replace($match, $syntax, $description);
            }
            
            $user_id = $user->id;
            if (!empty($_POST['user_id']) && is_numeric($_POST['user_id']) && $_POST['user_id'] > 0) {
                $user_id = PT_Secure($_POST['user_id']);
            }
            $data_insert = array(
                'video_id' => $video_id,
                'user_id' => $user_id,
                'title' => PT_Secure($title),
                'description' => PT_Secure($description),
                'tags' => PT_Secure($tags),
                'duration' => $duration,
                'category_id' => $category_id,
                'daily' => $video_id_,
                'thumbnail' => $thumb,
                'time' => time(),
                'registered' => date('Y') . '/' . intval(date('m'))
            );
            $insert      = $db->insert(T_VIDEOS, $data_insert);
            if ($insert) {
                if (empty($_SESSION['imported-videos'])) {
                    $_SESSION['imported-videos'] = 1;
                } else {
                    $_SESSION['imported-videos']++;
                }
            }
        }
        if ($insert) {
            $data = array('status' => 200);
        }
    }
}
if ($first == 'import-youtube-videos') {

    
    if (!empty($_POST['videos'])) {
        $ids = array();
        $category_id = 0;
        if (!empty($_POST['category_id'])) {
            if (in_array($_POST['category_id'], array_keys(ToArray($pt->categories)))) {
                $category_id = $_POST['category_id'];
            }
        }
        foreach ($_POST['videos'] as $key => $data_fro_ajax) {
            $video_id  = PT_GenerateKey(15, 15);
            $video_id_ = $data_fro_ajax['video_id'];
            $title = $data_fro_ajax['title'];
            $description = $data_fro_ajax['description'];
            $duration = $data_fro_ajax['duration'];
            $thumb = $data_fro_ajax['thumb'];
            $tags = $data_fro_ajax['tags'];
            $insert = false;
            if (strpos($thumb, 'upload/photos/thumbnail')) {
                $thumb = 'upload/photos/thumbnail.jpg';
            }
            $check_for_video = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'count(*)');
            if ($check_for_video > 0) {
                $video_id = PT_GenerateKey(15, 15);
            }
            $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
            $i          = 0;
            preg_match_all($link_regex, PT_Secure($description), $matches);
            foreach ($matches[0] as $match) {
                $match_url           = strip_tags($match);
                $syntax              = '[a]' . urlencode($match_url) . '[/a]';
                $description = str_replace($match, $syntax, $description);
            }
            $user_id = $user->id;
            if (!empty($_POST['user_id']) && is_numeric($_POST['user_id']) && $_POST['user_id'] > 0) {
                $user_id = PT_Secure($_POST['user_id']);
            }
            $data_insert = array(
                'video_id' => $video_id,
                'user_id' => $user_id,
                'title' => PT_Secure($title),
                'description' => PT_Secure($description),
                'tags' => PT_Secure($tags),
                'duration' => $duration,
                'category_id' => $category_id,
                'youtube' => $video_id_,
                'thumbnail' => $thumb,
                'time' => time(),
                'registered' => date('Y') . '/' . intval(date('m'))
            );
            $insert      = $db->insert(T_VIDEOS, $data_insert);
            if ($insert) {
                if (empty($_SESSION['imported-videos'])) {
                    $_SESSION['imported-videos'] = 1;
                } else {
                    $_SESSION['imported-videos']++;
                }
            }
        }
        if ($insert) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'create-ads') {
    if (!empty($_POST['type'])) {
        if ((empty($_POST['name']) || empty($_POST['link']) || empty($_POST['ad_link']) || empty($_POST['type'])) && $_POST['type'] != 'vast') {
            $errors = 'Please check your details';
        } else {
            if (filter_var($_POST['link'], FILTER_VALIDATE_URL) === FALSE) {
                $errors = 'The Media is invalid';
            }
            if ( !empty($_POST['ad_link']) && filter_var($_POST['ad_link'], FILTER_VALIDATE_URL) === FALSE && $_POST['type'] != 'vast') {
                $errors = 'The URL is invalid';
            }
            if (!is_numeric($_POST['skip_seconds'])) {
                $errors = 'The skip seconds should be numeric';
            }
            if ($_POST['type'] == 'image') {
                if (!preg_match("([^\s]+(\.(?i)(jpe?g|png|gif|bmp))$)", $_POST['link'])) {
                    $errors = 'The image url is invalid';
                }
            }
            if ($_POST['type'] == 'vast') {
                if (!preg_match("([^\s]+(\.(?i)(xml))$)", $_POST['link'])) {
                    //$errors = 'The XML url is invalid';
                }
            }
            if ($_POST['type'] == 'video') {
                if (!preg_match("([^\s]+(\.(?i)(mp4|webp|mp3|mpeg|mov))$)", $_POST['link'])) {
                    $errors = 'The video url is invalid';
                }
            }
        }
        if (empty($errors)) {
            $seconds = 0;
            if (!empty($_POST['skip_seconds'])) {
                $seconds = PT_Secure($_POST['skip_seconds']);
            }
            $insert_array = array(
                'user_id' => $user->id,
                'name' => PT_Secure($_POST['name']),
                'skip_seconds' => $seconds,
                'ad_link' => !empty($_POST['ad_link']) ? PT_Secure($_POST['ad_link']) : '',
                'active' => 1,
            );
            if ($_POST['type'] == 'video') {
                $insert_array['ad_media'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'image') {
                $insert_array['ad_image'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'vast') {
                $insert_array['vast_xml_link'] = PT_Secure($_POST['link']);
                $insert_array['vast_type'] = ($_POST['vast_type'] == 'vast') ? 'vast' : 'vpaid';
            }
            $insert = $db->insert(T_VIDEO_ADS, $insert_array);
            if ($insert) {
                $data = array('status' => 200);
            }
        } else {
            $data = array('status' => 400, 'error' => $errors);
        }
    }
}

if ($first == 'edit-ads') {
    if (!empty($_POST['type']) && !empty($_POST['id'])) {
        $id = PT_Secure($_POST['id']);
        if ((empty($_POST['name']) || empty($_POST['link']) || empty($_POST['ad_link']) || empty($_POST['type'])) && $_POST['type'] != 'vast') {
            $errors = 'Please check your details';
        } else {
            if (filter_var($_POST['link'], FILTER_VALIDATE_URL) === FALSE) {
                $errors = 'The Media is invalid';
            }
            if (!empty($_POST['ad_link']) && filter_var($_POST['ad_link'], FILTER_VALIDATE_URL) === FALSE && $_POST['type'] != 'vast') {
                $errors = 'The URL is invalid';
            }
            if (!is_numeric($_POST['skip_seconds'])) {
                $errors = 'The skip seconds should be numeric';
            }
            if ($_POST['type'] == 'image') {
                if (!preg_match("([^\s]+(\.(?i)(jpe?g|png|gif|bmp))$)", $_POST['link'])) {
                    $errors = 'The image url is invalid';
                }
            }
            if ($_POST['type'] == 'vast') {
                if (!preg_match("([^\s]+(\.(?i)(xml))$)", $_POST['link'])) {
                   // $errors = 'The XML url is invalid';
                }
            }
            if ($_POST['type'] == 'video') {
                if (!preg_match("([^\s]+(\.(?i)(mp4|webp|mp3|mpeg|mov))$)", $_POST['link'])) {
                    $errors = 'The video url is invalid';
                }
            }
        }
        if (empty($errors)) {
            $seconds = 0;
            if (!empty($_POST['skip_seconds'])) {
                $seconds = PT_Secure($_POST['skip_seconds']);
            }
            $insert_array = array(
                'user_id' => $user->id,
                'name' => PT_Secure($_POST['name']),
                'skip_seconds' => $seconds,
                'ad_link' => !empty($_POST['ad_link']) ? PT_Secure($_POST['ad_link']) : '',
                'active' => 1,
            );
            if ($_POST['type'] == 'video') {
                $insert_array['ad_media'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'image') {
                $insert_array['ad_image'] = PT_Secure($_POST['link']);
            } elseif ($_POST['type'] == 'vast') {
                $insert_array['vast_xml_link'] = PT_Secure($_POST['link']);
                $insert_array['vast_type'] = ($_POST['vast_type'] == 'vast') ? 'vast' : 'vpaid';
            }
            $insert = $db->where('id', $id)->update(T_VIDEO_ADS, $insert_array);
            if ($insert) {
                $data = array('status' => 200);
            }
        } else {
            $data = array('status' => 400, 'error' => $errors);
        }
    }
}

if ($first == 'update-ads') {
    $updated = false;
    foreach ($_POST as $key => $ads) {
        if ($key != 'hash_id') {
            $ad_data = array(
                'code' => htmlspecialchars(base64_decode($ads)),
                'active' => (empty($ads)) ? 0 : 1
            );
            $update = $db->where('placement', PT_Secure($key))->update(T_ADS, $ad_data);
            if ($update) {
                $updated = true;
            }
        }
    }
    if ($updated == true) {
        $data = array(
            'status' => 200
        );
    }
}

if ($first == 'submit-sitemap-settings') {
    if (!file_exists('./sitemaps')) {
        @mkdir('./sitemaps', 0777, true);
    }
    $dom = new DOMDocument();
    $filename = 'sitemaps/sitemap.xml';
    if ($_POST['completed'] == 0) {
        $completed = 0;

        $videos_file_number = (!empty($_POST['videos_file_number'])) ? (int) $_POST['videos_file_number'] : 0;

        $post_file_number = (!empty($_POST['post_file_number'])) ? (int) $_POST['post_file_number'] : 0;

        $percentage = (!empty($_POST['percentage'])) ? (int) $_POST['percentage'] : 0;

        $worked = (!empty($_POST['worked'])) ? (int) $_POST['worked'] : 0;

        $total_videos =  $db->getValue(T_VIDEOS, 'count(*)');

        $total_posts =  $db->getValue(T_POSTS, 'count(*)');

        $total =  $total_videos + $total_posts;

        if (!empty($_POST['post_offset']) && $_POST['post_offset'] > 0) {
            $post_offset = PT_Secure($_POST['post_offset']);
            $db->where('id',$post_offset,'>');
        }
        $posts   = $db->get(T_POSTS,500);


        if (!empty($_POST['videos_offset']) && $_POST['videos_offset'] > 0) {
            $videos_offset = PT_Secure($_POST['videos_offset']);
            $db->where('id',$videos_offset,'>');
        }
        $mysql = $db->get(T_VIDEOS, 500);

        $count = count($mysql) + count($posts) + $worked;
        
        $sitemap_numbers = ceil($total_videos / 20000);

        $new_file = false;

        if ($videos_file_number > 1 || $post_file_number > 1) {
            $new_file = true;
        }
        if ($percentage == 0) {
            $files = glob('./sitemaps/*');
            foreach($files as $file){ 
              if(is_file($file))
                unlink($file);
            }
            for ($i=1; $i <= $sitemap_numbers; $i++) { 
                $open_file = fopen("sitemaps/sitemap-" . $i . ".xml", "w");
                $open_file = fopen("sitemaps/sitemap-a-" . $i . ".xml", "w");
            }
            if (filesize('sitemaps/sitemap-' . $videos_file_number . '.xml') < 1) {
                $write_video_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
            if (filesize('sitemaps/sitemap-a-' . $post_file_number . '.xml') < 1) {
                $write_posts_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
        }
        else if ($videos_file_number > 1) {
            if (filesize('sitemaps/sitemap-' . $videos_file_number . '.xml') < 1) {
                $write_video_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
            $write_posts_data = file_get_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml');
            
            
        }else if ($post_file_number > 1) {
            if (filesize('sitemaps/sitemap-a-' . $post_file_number . '.xml') < 1) {
                $write_posts_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
            }
            $write_video_data = file_get_contents('sitemaps/sitemap-' . $videos_file_number . '.xml');
            
            
        }  else {
            $write_video_data = file_get_contents('sitemaps/sitemap-' . $videos_file_number . '.xml');
            $write_posts_data = file_get_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml');
        }

        if (!empty($mysql)) {
            foreach ($mysql as $key => $video) {
                $video = PT_GetVideoByID($video, 0, 0 , 0);
                $write_video_data .= '<url>
                              <loc>' . $video->url . '</loc>
                              <lastmod>' . date('c', $video->time). '</lastmod>
                              <changefreq>monthly</changefreq>
                              <priority>0.8</priority>
                           </url>' . "\n";
            }
        }
        file_put_contents('sitemaps/sitemap-' . $videos_file_number . '.xml', $write_video_data);

        

        if (!empty($posts)) {
            foreach ($posts as $key => $post) {
                $write_posts_data .= '<url>
                  <loc>' . PT_Link('articles/read/' . PT_URLSlug($post->title,$post->id)) . '</loc>
                  <lastmod>' . date('c', $post->time). '</lastmod>
                  <changefreq>monthly</changefreq>
                  <priority>0.8</priority>
               </url>' . "\n";
            }
        }
        file_put_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml', $write_posts_data);
        if ($total > 0) {
            $percentage = round(($count * 100)/$total, 2);
        }
        if ($count == $total) {
            $percentage = 100;
        }

        if ($percentage >= 100) {
            $write_posts_data .= "\n</urlset>";
            $write_video_data .= "\n</urlset>";
            file_put_contents('sitemaps/sitemap-' . $videos_file_number . '.xml', $write_video_data);
            file_put_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml', $write_posts_data);
            $files = glob('./sitemaps/*');
            $write_final_data = '<?xml version="1.0" encoding="UTF-8"?>
                                <sitemapindex  xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" >';
            foreach($files as $file){ 
                  if (is_file($file)) {
                      $write_final_data .= "\n<sitemap>
                                          <loc>" . $pt->config->site_url . '/' . str_replace('./', '', $file) . "</loc>
                                          <lastmod>" . date('c') . "</lastmod>
                                        </sitemap>";
                  }
            }
            $write_final_data .= '</sitemapindex>';
            $file_final = file_put_contents('sitemap-main.xml', $write_final_data);
            $data['last_created'] = date('d-m-Y');
                $last_created_update =  $update = $db->where('name', 'last_created_sitemap')->update(T_CONFIG, array('value' => PT_Secure($data['last_created'], 0)));
            $completed = 1;
        }
        if (!empty($posts)) {
            $last_post = $posts[count($posts)-1];
            $post_offset = $last_post->id;
        }
        else{
            $post_offset = $_POST['post_offset'];
        }
        if (!empty($mysql)) {
            $last_video = $mysql[count($mysql)-1];
            $videos_offset = $last_video->id;
        }
        else{
            $videos_offset = $_POST['videos_offset'];
        }

        $worked = count($mysql) + count($posts) + $worked;

        if ($total_videos > 20000 && $worked >= 20000 && !empty($mysql) && $percentage < 100) {
            $write_video_data .= "\n</urlset>";
            file_put_contents('sitemaps/sitemap-' . $videos_file_number . '.xml', $write_video_data);
            $videos_file_number = $videos_file_number + 1;
        }
        if ($total_posts > 20000 && $worked >= 20000 && !empty($posts) && $percentage < 100) {
            $write_posts_data .= "\n</urlset>";
            file_put_contents('sitemaps/sitemap-a-' . $post_file_number . '.xml', $write_posts_data);
            $post_file_number = $post_file_number + 1;
        }
        $data = array('status' => 201, 'post_offset' => $post_offset, 'videos_offset' => $videos_offset , 'percentage_full' => $percentage . '%', 'percentage' => $percentage, 'videos_file_number' => $videos_file_number , 'post_file_number' => $post_file_number, 'worked' => $worked, 'completed' => $completed);
    }
    
}

if ($first == 'save-design') {
    $saveSetting = false;
    if (isset($_FILES['logo']['name'])) {
        $fileInfo = array(
            'file' => $_FILES["logo"]["tmp_name"],
            'name' => $_FILES['logo']['name'],
            'size' => $_FILES["logo"]["size"]
        );
        $media    = PT_UploadLogo($fileInfo);
    }
    if (isset($_FILES['light-logo']['name'])) {
        $fileInfo = array(
            'file' => $_FILES["light-logo"]["tmp_name"],
            'name' => $_FILES['light-logo']['name'],
            'size' => $_FILES["light-logo"]["size"],
            'light-logo' => true
        );
        $media    = PT_UploadLogo($fileInfo);
    }
    if (isset($_FILES['favicon']['name'])) {
        $fileInfo = array(
            'file' => $_FILES["favicon"]["tmp_name"],
            'name' => $_FILES['favicon']['name'],
            'size' => $_FILES["favicon"]["size"],
            'favicon' => true
        );
        $media    = PT_UploadLogo($fileInfo);
    }
    $submit_data = array();
    foreach ($_POST as $key => $settings_to_save) {
        $submit_data[$key] = $settings_to_save;
    }
    $update = false;
    if (!empty($submit_data)) {
        foreach ($submit_data as $key => $value) {
            $update = $db->where('name', $key)->update(T_CONFIG, array('value' => PT_Secure($value, 0)));
        }
    }
    if ($update) {
        $data = array('status' => 200);
    }
    $data['status'] = 200;
}

if ($first == 'save-terms') {
    $saveSetting = false;
    foreach ($_POST as $key => $value) {
        if ($key != 'hash_id') {
            $saveSetting = $db->where('type', $key)->update(T_TERMS, array('text' => PT_Secure(base64_decode($value), 0)));
        }
    }
    if ($saveSetting) {
        $data['status'] = 200;
    }
}

if ($first == 'new-article') {
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['text']) || empty($_POST['tags']) || empty($_FILES["image"])) {
        $error = 400; 
    }
    else{

        if (strlen($_POST['title']) < 5) {
            $error = 401; 
        }

        else if(strlen($_POST['description']) < 15){
            $error = 402; 
        }

        else if(empty($_POST['text'])){
            $error = 403; 
        }

        else if (!empty($_FILES["image"]["error"])) {
            $error = 404; 
        } 
 

        else if (!file_exists($_FILES["image"]["tmp_name"])) {
            $error = 405; 
        }

        else if (file_exists($_FILES["image"]["tmp_name"])) {
            $image = getimagesize($_FILES["image"]["tmp_name"]);
            if (!in_array($image[2], array(
                IMAGETYPE_GIF,
                IMAGETYPE_JPEG,
                IMAGETYPE_PNG,
                IMAGETYPE_BMP
            ))){
                $error = 405; 
            }
        }

        else if (empty($_POST['category']) || !in_array($_POST['category'],array_keys(get_object_vars($pt->categories)))) {
            $error = 406; 
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
        $active          = (isset($_POST['draft'])) ? '0' : '1';

        if (!empty($file_upload['filename'])) {
            $post_image  = PT_Secure($file_upload['filename']);
            $insert_data = array(
                'title' => PT_Secure(PT_ShortText($_POST['title'],150)),
                'description' => PT_Secure(PT_ShortText($_POST['description'],200)),
                'category' => PT_Secure($_POST['category']),
                'image' => $post_image,
                'text' => htmlspecialchars($_POST['text']),
                'tags' => PT_Secure(PT_ShortText($_POST['tags']),250),
                'time' => time(),
                'user_id' => $pt->user->id,
                'active' => $active,
                'views' => 0,
                'shared' => 0,
            );

            $insert     = $db->insert(T_POSTS,$insert_data);
        }

        $data['status'] = ($insert) ? 200 : 500;
        $data['url']    = PT_Link('articles/read/' . PT_URLSlug($insert_data['title'],$insert));
    }

    else{
        $data['status'] = $error;
    }
}

if ($first == 'update-article') {
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['text']) || empty($_POST['tags'])) {
        $error = 400; 
    }
    else{

        if (strlen($_POST['title']) < 5) {
            $error = 401; 
        }

        else if(strlen($_POST['description']) < 15){
            $error = 402; 
        }

        else if(empty($_POST['text'])){
            $error = 403; 
        }
        else if (!empty($_FILES["image"])) {

            if (!empty($_FILES["image"]["error"])) {
                $error = 404; 
            } 

            else if (!file_exists($_FILES["image"]["tmp_name"])) {
                $error = 405; 
            }

            else if (file_exists($_FILES["image"]["tmp_name"])) {
                $image = getimagesize($_FILES["image"]["tmp_name"]);
                if (!in_array($image[2], array(
                    IMAGETYPE_GIF,
                    IMAGETYPE_JPEG,
                    IMAGETYPE_PNG,
                    IMAGETYPE_BMP
                ))){
                    $error = 405; 
                }
            }
        }



        else if (empty($_POST['category']) || !in_array($_POST['category'],array_keys(get_object_vars($pt->categories)))) {
            $error = 406; 
        }

        else if(empty($_POST['id']) || !is_numeric($_POST['id'])){
            $error = 500; 
        }
    }

    if (empty($error)) {
        $insert      = false;
        $active      = (isset($_POST['draft'])) ? '0' : '1';
        $active      = (!empty($_POST['status']) && $_POST['status'] == '1') ? '1' : '0';
        $id          = PT_Secure($_POST['id']);

        $update_data = array(
            'title' => PT_Secure(PT_ShortText($_POST['title'],150)),
            'description' => PT_Secure(PT_ShortText($_POST['description'],200)),
            'category' => PT_Secure($_POST['category']),
            'text' => htmlspecialchars($_POST['text']),
            'tags' => PT_Secure(PT_ShortText($_POST['tags']),250),
            'time' => time(),
            'active' => $active,
            'shared' => 0,
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

        $insert         = $db->where('id',$id)->update(T_POSTS,$update_data);
        $data['status'] = ($insert && empty($error)) ? 200 : 500;
        $data['url']    = PT_Link('articles/read/' . PT_URLSlug($update_data['title'],$id));
    }

    else{
        $data['status'] = $error;
    }
}

if ($first == 'delete-article') {
    if (!empty($_POST['id'])) {
        $article = $db->where('id',PT_Secure($_POST['id']))->getOne(T_POSTS);
        if (!empty($article)) {
            $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on') ? true : false;
            if (file_exists($article->image)) {
                unlink($article->image);
            }
            
            else if ($s3 === true) {
                PT_DeleteFromToS3($article->image);
            }
        
            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_POSTS);
            $delete  = $db->where('post_id',PT_Secure($_POST['id']))->delete(T_DIS_LIKES);

            //Delete related data
            $post_comments = $db->where('post_id',PT_Secure($_POST['id']))->get(T_COMMENTS);

            foreach ($post_comments as $comment_data) {
                $delete    = $db->where('comment_id',$comment_data->id)->delete(T_COMMENTS_LIKES);
                $replies   = $db->where('comment_id',$comment_data->id)->get(T_COMM_REPLIES);
                $db->where('comment_id',$comment_data->id)->delete(T_COMM_REPLIES);
                
                foreach ($replies as $comment_reply) {
                    $db->where('reply_id',$comment_reply->id)->delete(T_COMMENTS_LIKES);
                }
            }

            if (!empty($post_comments)) {
                $delete    = $db->where('post_id',PT_Secure($_POST['id']))->delete(T_COMMENTS);   
            }
            
            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}

if ($first == 'delete-user-ad') {
    if (!empty($_POST['id'])) {
        $ad_data = $db->where('id',PT_Secure($_POST['id']))->getOne(T_USR_ADS);
        if (!empty($ad_data)) {
            $s3      = ($pt->config->s3_upload == 'on' || $pt->config->ftp_upload = 'on') ? true : false;
            if (file_exists($ad_data->media)) {
                unlink($ad_data->media);
            }
            
            else if ($s3 === true) {
                PT_DeleteFromToS3($ad_data->media);
            }
        
            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_USR_ADS);
            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}

if ($first == 'backup') {
    $backup = PT_Backup($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
    if ($backup) {
        $data['status'] = 200;
        $data['date']   = date('d-m-Y');
    }
}


use Aws\S3\S3Client;

if ($first == 'testS3') {
    try {
        $s3Client = S3Client::factory(array(
            'version' => 'latest',
            'region' => $pt->config->region,
            'credentials' => array(
                'key' => $pt->config->amazone_s3_key,
                'secret' => $pt->config->amazone_s3_s_key
            )
        ));

        $buckets  = $s3Client->listBuckets();
        if (!empty($buckets)) {
            if ($s3Client->doesBucketExist($pt->config->s3_bucket_name)) {
                $data['status'] = 200;
                $array          = array(
                    'upload/photos/d-cover.jpg',
                    'upload/photos/d-avatar.jpg',
                    'upload/photos/thumbnail.jpg',
                );
                foreach ($array as $key => $value) {
                    $upload = PT_UploadToS3($value, array(
                        'delete' => 'no'
                    ));
                }
            } 

            else {
                $data['status'] = 300;
            }
        }
        else {
            $data['status'] = 500;
        }
    }

    catch (Exception $e) {
        $data['status']  = 400;
        $data['message'] = $e->getMessage();
    }
}

if ($first == 'test_ftp') {
    try {
        $ftp = new \FtpClient\FtpClient();
        $ftp->connect($pt->config->ftp_host, false, $pt->config->ftp_port);
        $login = $ftp->login($pt->config->ftp_username, $pt->config->ftp_password);
        if (!empty($pt->config->ftp_path)) {
            if ($pt->config->ftp_path != "./") {
                $ftp->chdir($pt->config->ftp_path);
            }
        }
        $array          = array(
            'upload/photos/d-cover.jpg',
            'upload/photos/d-avatar.jpg',
            'upload/photos/thumbnail.jpg',
        );
        foreach ($array as $key => $value) {
            $upload = PT_UploadToS3($value, array(
                'delete' => 'no',
            ));
        }
        $data['status'] = 200;
    } catch (Exception $e) {
        $data['status']  = 400;
        $data['message'] = $e->getMessage();
    }
    header("Content-type: application/json");
    echo json_encode($data);
    exit();
}
if ($first == 'add-field') {
    if (!empty($_POST['name']) && !empty($_POST['type']) && !empty($_POST['description'])) {
        $type              = PT_Secure($_POST['type']);
        $name              = PT_Secure($_POST['name']);
        $description       = PT_Secure($_POST['description']);
        $registration_page = 0;
        if (!empty($_POST['registration_page'])) {
            $registration_page = 1;
        }
        $profile_page = 0;
        if (!empty($_POST['profile_page'])) {
            $profile_page = 1;
        }
        $length = 32;
        if (!empty($_POST['length'])) {
            if (is_numeric($_POST['length']) && $_POST['length'] < 1001) {
                $length = PT_Secure($_POST['length']);
            }
        }
        $placement_array = array(
            'profile',
            'general',
            'social',
            'none'
        );
        $placement       = 'profile';
        if (!empty($_POST['placement'])) {
            if (in_array($_POST['placement'], $placement_array)) {
                $placement = PT_Secure($_POST['placement']);
            }
        }
        $re_data = array(
            'name' => $name,
            'description' => $description,
            'length' => $length,
            'placement' => $placement,
            'registration_page' => $registration_page,
            'profile_page' => $profile_page,
            'active' => '1'
        );
        if (!empty($_POST['options'])) {
            $options              = @explode("\n", trim($_POST['options']));
            $re_data['options']   = PT_Secure(implode($options, ','));
        }

        $re_data['type']    = $type;
        $add                = PT_RegisterNewField($re_data);

        if ($add) {
            $data['status'] = 200;
        }
    }

    else {
        $data = array(
            'status' => 400,
            'message' => 'Please fill all the required fields'
        );
    }
}

if ($first == 'delfield' && !empty($_GET['id'])) {
    $data = array('status' => 304);
    if (pt_delete_field($_GET['id']) === true) {
        $data['status'] = 200;
    }
}

if ($first == 'update-field') {
    if (!empty($_POST['name']) && !empty($_POST['description']) && !empty($_POST['id'])) {
        $name              = PT_Secure($_POST['name']);
        $description       = PT_Secure($_POST['description']);
        $registration_page = 0;

        if (!empty($_POST['registration_page'])) {
            $registration_page = 1;
        }
        $profile_page = 0;
        if (!empty($_POST['profile_page'])) {
            $profile_page = 1;
        }
        $active = '0';
        if (!empty($_POST['active'])) {
            $active = '1';
        }
        $length = 32;
        if (!empty($_POST['length'])) {
            if (is_numeric($_POST['length']) && $_POST['length'] < 1001) {
                $length = PT_Secure($_POST['length']);
            }
        }
        $placement_array = array(
            'profile',
            'general',
            'social',
            'none'
        );
        $placement       = 'profile';

        if (!empty($_POST['placement'])) {
            if (in_array($_POST['placement'], $placement_array)) {
                $placement = PT_Secure($_POST['placement']);
            }
        }
        $up_data = array(
            'name' => $name,
            'description' => $description,
            'length' => $length,
            'placement' => $placement,
            'registration_page' => $registration_page,
            'profile_page' => $profile_page,
            'active' => $active
        );

        if (!empty($_POST['options'])) {
            $options            = @explode("\n", trim($_POST['options']));
            $up_data['options'] = implode($options, ',');
            $up_data['type']    = 'select';
        }

        $table = T_FIELDS;
        $add   = $db->where('id',$_POST['id'])->update($table,$up_data);
        if ($add) {
            $data['status'] = 200;
        }
    }

    else{
        $data = array(
            'status' => 400,
            'message' => 'Please fill all the required fields'
        );
    }
}

if ($first == 'withdrawal-requests' && !empty($_POST['id']) && !empty($_POST['a'])) {
    $request = (is_numeric($_POST['id']) && is_numeric($_POST['a']) && in_array($_POST['a'], array(1,2,3)));

    if ($request === true) {
        $request_id = PT_Secure($_POST['id']);
        if ($_POST['a'] == 1) {
            $request_data = $db->where('id',$request_id)->getOne(T_WITHDRAWAL_REQUESTS);
            if (!empty($request_data) && $request_data->status != 1) {
                $requiring = $db->where('id',$request_data->user_id)->getOne(T_USERS);
                if (!empty($requiring)) {
                    $db->where('id',$request_data->user_id)->update(T_USERS,array(
                        'balance' => ($requiring->balance -= $request_data->amount)
                    ));
                }
            }

            $db->where('id',$request_id)->update(T_WITHDRAWAL_REQUESTS,array('status' => 1));
        }

        else if ($_POST['a'] == 2) {
            $db->where('id',$request_id)->update(T_WITHDRAWAL_REQUESTS,array('status' => 2));
        }

        else if ($_POST['a'] == 3) {
            $db->where('id',$request_id)->delete(T_WITHDRAWAL_REQUESTS);
        }

        $data['status'] = 200;
    }
}

if ($first == 'verification' && !empty($_POST['id']) && !empty($_POST['a'])) {
    $request = (is_numeric($_POST['id']) && is_numeric($_POST['a']) && in_array($_POST['a'], array(1,2,3)));

    if ($request === true) {

        $request_id    = PT_Secure($_POST['id']);
        $request_data  = $db->where('id',$request_id)->getOne(T_VERIF_REQUESTS);

        if ($_POST['a'] == 1 && !empty($request_data)) {
            $up_data = array(
                'verified' => 1
            );

            $db->where('id',$request_data->user_id)->update(T_USERS,$up_data);
            $db->where('id',$request_id)->delete(T_VERIF_REQUESTS);
            $data['status'] = 200;
        }

        else if ($_POST['a'] == 2 && !empty($request_data)) {
            $user_data      = PT_UserData($request_data->user_id);
            $data['status'] = 200;
            $data['html']   = PT_LoadAdminPage('verification-requests/view',array(
                'ID' => $request_data->id,
                'USERNAME' => $request_data->name,
                'USER_AVATAR' => $user_data->avatar,
                'TEXT' => $request_data->message,
                'DATE' => date("Y-F-d",$request_data->time),
                'IMG' => PT_GetMedia($request_data->media_file),
            ));
        }

        else if ($_POST['a'] == 3) {
            $db->where('id',$request_id)->delete(T_VERIF_REQUESTS);
            $data['status'] = 200;
        }
    }
}

if ($first == 'reports' && !empty($_POST['id']) && !empty($_POST['a'])) {
    $request = (is_numeric($_POST['id']) && is_numeric($_POST['a']) && in_array($_POST['a'], array(1,2,3)));

    if ($request === true) {

        $report_id     = PT_Secure($_POST['id']);
        $report_data  = $db->where('id',$report_id)->getOne(T_REPORTS);

        if ($_POST['a'] == 1) {
            $db->where('id',$report_id)->delete(T_REPORTS);
            $data['status'] = 200;
        }

        else if ($_POST['a'] == 2 && !empty($report_data)) {
            $user_data      = PT_UserData($report_data->user_id);
            $data['status'] = 200;
            $data['html']   = PT_LoadAdminPage('manage-video-reports/view',array(
                'ID' => $report_data->id,
                'USERNAME' => $user_data->name,
                'USER_AVATAR' => $user_data->avatar,
                'TEXT' => $report_data->text,
                'DATE' => date("Y-F-d",$report_data->time),
            ));
        }

        else if ($_POST['a'] == 3 && !empty($report_data)) {
            $del = PT_DeleteVideo($report_data->video_id);

            if ($del) {
                $data['status'] = 200;
                $db->where('id',$report_id)->delete(T_REPORTS);
            }
        }
    }
}

if ($first == 'add_announcement') {
    $text           = (!empty($_POST['text'])) ? PT_Secure($_POST['text']) : "";
    $data['status'] = 400;
    $re_data        = array(
        'text'      => $text,
        'active'    => '1',
        'time'      => time()
    );

    $insert_id          = $db->insert(T_ANNOUNCEMENTS,$re_data);

    if (!empty($insert_id)) {
        $announcement   = $db->where('id',$insert_id)->getOne(T_ANNOUNCEMENTS);
        $data['status'] = 200;
        $data['html']   =  PT_LoadAdminPage("manage-announcements/active",array(
            'ANN_ID'    => $announcement->id,
            'ANN_VIEWS' => 0,
            'ANN_TEXT'  => PT_Decode($announcement->text),
            'ANN_TIME'  => PT_Time_Elapsed_String($announcement->time),
        ));
    }
}


if ($first == 'delete-announcement') {
    $request        = (!empty($_POST['id']) && is_numeric($_POST['id']));
    $data['status'] = 400;
    if ($request === true) {
        $announcement_id = PT_Secure($_POST['id']);
        $db->where('id',$announcement_id)->delete(T_ANNOUNCEMENTS);
        $data['status'] = 200;
    }
}

if ($first == 'toggle-announcement') {
    $request        = (!empty($_POST['id']) && is_numeric($_POST['id']));
    $data['status'] = 400;

    if ($request === true) {

        $announcement_id    = PT_Secure($_POST['id']);
        $announcement       = $db->where('id',$announcement_id)->getOne(T_ANNOUNCEMENTS);
        if (!empty($announcement)) {
            $status         = ($announcement->active == 1) ? '0' : '1';

            $db->where('id',$announcement_id)->update(T_ANNOUNCEMENTS,array('active' => $status));
            $data['status'] = 200;
            echo $status;
            exit();
        }

    }
}

if ($first == 'banip' && !empty($_POST['ip'])) {
    $data        = array('status' => 400);
    $request     = filter_var($_POST['ip'], FILTER_VALIDATE_IP);
    if (!empty($request)){
        $table   = T_BANNED_IPS;
        $re_data = array(
            'ip_address' => $_POST['ip'],
            'time'       => time()
        );

        $ban_id  =  $db->insert($table,$re_data);
        $ban_ip  = $db->where('id',$ban_id)->getOne($table);
        
        if (!empty($ban_ip)) {
            $data['status']       = 200;
            $data['html']         = PT_LoadAdminPage("ban-users/list",array(
                'BANNEDIP_ID'     => $ban_ip->id,
                'BANNEDIP_TIME'   => PT_Time_Elapsed_String($ban_ip->time),
                'BANNEDIP_ADDR'   => $ban_ip->ip_address,
            ));
        }
    }
}

if ($first == 'unbanip') {
    $data    = array('status' => 400);
    $request = (!empty($_POST['id']) && is_numeric($_POST['id']));
    if (!empty($request)){
        $table  = T_BANNED_IPS;
        $ban_id = PT_Secure($_POST['id']);
        $db->where('id',$ban_id)->delete($table);
        $data['status'] = 200;
    }
}

if ($first == 'save-custom-design-settings') {
    $data     = array('status' => 200);
    $code     = array(); 
    $code[]   = (!empty($_POST['header_js']))  ? $_POST['header_js']  : "";
    $code[]   = (!empty($_POST['footer_js']))  ? $_POST['footer_js']  : "";
    $code[]   = (!empty($_POST['css_styles'])) ? $_POST['css_styles'] : "";
    $errors   = pt_custom_design('save',$code);

    if (!empty($errors)) {
        $data = array('status' => 500,'errors' => $errors);
    }
}

if ($first == 'reset_apps_key') {
    
    $app_key     = md5(time());
    $db->where('name', 'server_key')->update(T_CONFIG, array('value' => $app_key));
    // $data_config = array(
    //     'apps_api_key' => $app_key
    // );

    // foreach ($data_config as $name => $value) {
    //     $db->where('name', $name)->update(T_CONFIG, array('value' => PT_Secure($value, 0)));
    // }

    $data['status']  = 200;
    $data['app_key'] = $app_key;
}


if ($first == 'get_lang_key' && !empty($_GET['lang_name']) && !empty($_GET['id'])) {
    $html     = '';
    $lang_key = PT_Secure($_GET['id']);
    $lang_nm  = PT_Secure($_GET['lang_name']);
    $langs    = $db->where('lang_key',$lang_key)->getOne(T_LANGS,array($lang_nm));

    if (count($langs) > 0) {
        foreach ($langs as $key => $lang_value) {
            $html .= PT_LoadAdminPage('edit-lang/form-list',array(
                'KEY' => ($key),
                'LANG_KEY' => ucfirst($key),
                'LANG_VALUE' => $lang_value,
            ));
        }
    }

    else {
        $html = "<h4 class='text-center'>Keyword not found</h4>";
    }

    $data['status'] = 200;
    $data['html']   = $html;
}


if ($first == 'update_lang_key' && !empty($_POST['id_of_key'])) {
    $up_data   = array(); 
    $id_of_key = PT_Secure($_POST['id_of_key']);

    foreach ($langs as $lang) {
        if (!empty($_POST[$lang])) {
            $up_data[$lang] = PT_Secure($_POST[$lang]);
        }
    }

    $update = $db->where('lang_key',$id_of_key)->update(T_LANGS,$up_data);

    if ($update) {
        $data['status'] = 200;
    }
}

if ($first == 'add_new_lang' && !empty($_POST['lang'])) {

    if (in_array(strtolower($_POST['lang']), $langs)) {
        $data['status']  = 400;
    } 

    else {
        $lang_name = PT_Secure($_POST['lang']);
        $lang_name = strtolower($lang_name);
        $t_langs   = T_LANGS;

        $sql       = "
            ALTER TABLE `$t_langs` ADD `$lang_name` 
            TEXT CHARACTER 
            SET utf8 COLLATE utf8_unicode_ci 
            NULL DEFAULT NULL
        ";

        $query       = mysqli_query($sqlConnect,$sql);

        if ($query) {

            $english = pt_get_langs('english');
            $content = file_get_contents('assets/langs/english.php');
            $fp      = fopen("assets/langs/$lang_name.php", "wb");
            fwrite($fp, $content);
            fclose($fp);

            foreach ($english as $key => $lang) {
                mysqli_query($sqlConnect,"UPDATE `$t_langs` SET `{$lang_name}` = '$lang' WHERE `lang_key` = '{$key}'");
            }

            $data['status'] = 200;
        }
    }
}

if ($first == 'add_new_lang_key' && !empty($_POST['lang_key'])) {
    $lang_key  = PT_Secure($_POST['lang_key']);
    $mysqli    = $db->where('lang_key',$lang_key)->getValue(T_LANGS,'count(*)');

    if ($mysqli == 0) {

        $insert_id = $db->insert(T_LANGS,array('lang_key' => $lang_key));

        if ($insert_id) {
            $data['status'] = 200;
            $data['url']    = PT_LoadAdminLinkSettings('manage-languages');
        }
    } 

    else {
        $data['status']  = 400;
    }
}

if ($first == 'delete_lang' && !empty($_GET['id'])) {
    if (in_array($_GET['id'], $langs)) {
        $lang_name = PT_Secure($_GET['id']);
        $t_langs   = T_LANGS;
        $query     = mysqli_query($sqlConnect, "ALTER TABLE `$t_langs` DROP COLUMN `$lang_name`");
        if ($query) {
            if (file_exists("assets/langs/$lang_name.php")) {
                unlink("assets/langs/$lang_name.php");
            }
            $data['status'] = 200;
        }
    }
}

if ($first == 'get_user_ad' && !empty($_POST['id'])) {
    $data['status'] = 400;
    if (is_numeric($_POST['id']) && $_POST['id'] > 0) {
        $id = PT_Secure($_POST['id']);
        $ad = $db->where('id',$id)->getOne(T_USR_ADS);
        if (!empty($ad)) {
            $pt->type = $ad->category;
            $user_data      = PT_UserData($ad->user_id);
            $data['html']   = PT_LoadAdminPage('manage-user-ads/view',array(
                'ID' => $ad->id,
                'USERNAME' => $user_data->name,
                'USER_AVATAR' => $user_data->avatar,
                'DATE' => date("Y-F-d",$ad->posted),
                'IMG' => PT_GetMedia($ad->media),
            ));
            $data['status'] = 200;
        }
    }
}




if ($first == 'load-more-twitch')  {
    if (!empty($_POST['query']) && !empty($_POST['pageToken'])) {
        $query = PT_Secure(urlencode($_POST['query']));
        $limit = 50;
        if (!empty($_POST['limit']) && $limit < 101) {
            $limit = (int) PT_Secure($_POST['limit']);
        }
        $page_id = PT_Secure($_POST['pageToken']);

        $channelsApi = 'https://api.twitch.tv/kraken/channels/'.$query.'/videos?limit='.$limit.'&offset='.$page_id;
        $clientId = $pt->config->twitch_api;
        $ch = curl_init();

        curl_setopt_array($ch, array(
           CURLOPT_HTTPHEADER => array(
              'Client-ID: ' . $clientId,
              'Accept: application/vnd.twitchtv.v4+json'
           ),
           CURLOPT_RETURNTRANSFER => true,
           CURLOPT_URL => $channelsApi
        ));
        //curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        $response = curl_exec($ch);

        
        curl_close($ch);
        $get_videos = json_decode($response);
        if (!empty($get_videos)) {
            if (!empty($get_videos->_total)) {
                $ids = array();
                foreach ($get_videos->videos as $key => $video) {
                    $check_if_exists = $db->where('daily', substr($video->_id, 1))->getValue(T_VIDEOS, 'count(*)');
                    if ($check_if_exists == 0) {
                        $ids[] = substr($video->_id, 1);
                    }
                }
                $next_token = ($page_id + $limit);
                if (!empty($ids)) {
                    $videos_html = '';
                    foreach ($get_videos->videos as $key => $video) {
                        $thumb = PT_GetMedia('upload/photos/thumbnail.jpg');
                        if (!empty($video->thumbnails->medium[0]->url)) {
                            $thumb = $video->thumbnails->medium[0]->url;
                        } else if (!empty($video->thumbnails->large[0]->url)) {
                            $thumb = $video->thumbnails->large[0]->url;
                        }
                        $thumb = str_replace('http://', 'https://', $thumb);
                        $tags = '';
   //                   if (is_array($video->tags)) {
   //                          $tags_array = array();
   //                          $tag_count = 0;
                        //  foreach ($video->tags as $key => $tag) {
                        //      if ($tag_count < 11) {
   //                                  $tags_array[] = $tag;
   //                              }
   //                              $tag_count++;
                        //  }
                        //  $tags = implode(',', $tags_array);
                        // }
                        $duration = '00:00';
                        if (!empty($video->duration)) {
                            $duration = gmdate("i:s", $video->duration);
                        }
                        $title = '';
                        if (!empty($video->title)) {
                            $title = $video->title;
                        }
                        $description = '';
                        if (!empty($video->description)) {
                            $description = $video->description;
                        }
                        $array_data = array(
                            'ID' => substr($video->_id, 1),
                            'TITLE' => $title,
                            'DESC' => $description,
                            'THUMB' => $thumb,
                            'TAGS' => $tags,
                            'DURATION' => $duration,
                            'open_from_home_folder' => 1
                        );
                        $videos_html .= PT_LoadAdminPage('import-from-dailymotion/list', $array_data);
                    }
                    if (!empty($videos_html)) {
                        $data = array('status' => 200, 'html' => $videos_html, 'token' => $next_token);
                    }
                } 
            }
        }
    }
}
if ($first == 'import-twitch-videos') {
    if (!empty($_POST['videos'])) {
        $ids = array();
        $category_id = 0;
        if (!empty($_POST['category_id'])) {
            if (in_array($_POST['category_id'], array_keys(ToArray($pt->categories)))) {
                $category_id = $_POST['category_id'];
            }
        }
        foreach ($_POST['videos'] as $key => $data_fro_ajax) {
            $video_id  = PT_GenerateKey(15, 15);
            $video_id_ = $data_fro_ajax['video_id'];
            $title = $data_fro_ajax['title'];
            $description = $data_fro_ajax['description'];
            $duration = $data_fro_ajax['duration'];
            $thumb = $data_fro_ajax['thumb'];
            $tags = $data_fro_ajax['tags'];
            $insert = false;
            if (strpos($thumb, 'upload/photos/thumbnail')) {
                $thumb = 'upload/photos/thumbnail.jpg';
            }
            $check_for_video = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'count(*)');
            if ($check_for_video > 0) {
                $video_id = PT_GenerateKey(15, 15);
            }
            $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
            $i          = 0;
            preg_match_all($link_regex, PT_Secure($description), $matches);
            foreach ($matches[0] as $match) {
                $match_url           = strip_tags($match);
                $syntax              = '[a]' . urlencode($match_url) . '[/a]';
                $description = str_replace($match, $syntax, $description);
            }
            
            $user_id = $user->id;
            if (!empty($_POST['user_id']) && is_numeric($_POST['user_id']) && $_POST['user_id'] > 0) {
                $user_id = PT_Secure($_POST['user_id']);
            }
            $data_insert = array(
                'video_id' => $video_id,
                'user_id' => $user_id,
                'title' => PT_Secure($title),
                'description' => PT_Secure($description),
                'tags' => PT_Secure($tags),
                'duration' => $duration,
                'category_id' => $category_id,
                'twitch' => $video_id_,
                'twitch_type' => 'videos',
                'thumbnail' => $thumb,
                'time' => time(),
                'registered' => date('Y') . '/' . intval(date('m'))
            );
            $insert      = $db->insert(T_VIDEOS, $data_insert);
            if ($insert) {
                if (empty($_SESSION['imported-videos'])) {
                    $_SESSION['imported-videos'] = 1;
                } else {
                    $_SESSION['imported-videos']++;
                }
            }
        }
        if ($insert) {
            $data = array('status' => 200);
        }
    }
}

if ($first == 'add_new_category') {
    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $add = false;
    $insert_data = array();
    foreach ($pt->langs as $key => $lang) {
        if (!empty($_POST[$lang])) {
            $insert_data[$lang] = PT_Secure($_POST[$lang]);
            $add = true;
        }
    }
    if ($add == true && !empty($insert_data)) {
        $insert_data['type'] = 'category';
        $id = $db->insert(T_LANGS,$insert_data);
        $db->where('id',$id)->update(T_LANGS,array('lang_key' => $id));
        $data = array('status' => 200);
    }





    // $error = '';
    // if (empty($_POST['english']) && empty($_POST['arabic']) && empty($_POST['dutch']) && empty($_POST['french']) && empty($_POST['german']) && empty($_POST['russian']) && empty($_POST['spanish']) && empty($_POST['turkish'])) {
    //     $error = 'Please check your details';
    //     $data['message'] = $error;
    // }
    // if (empty($error)) {
    //     $insert_data = array();
    //     if (!empty($_POST['english'])) {
    //         $insert_data['english'] = PT_Secure($_POST['english']);
    //     }
    //     if (!empty($_POST['arabic'])) {
    //         $insert_data['arabic'] = PT_Secure($_POST['arabic']);
    //     }
    //     if (!empty($_POST['dutch'])) {
    //         $insert_data['dutch'] = PT_Secure($_POST['dutch']);
    //     }
    //     if (!empty($_POST['french'])) {
    //         $insert_data['french'] = PT_Secure($_POST['french']);
    //     }
    //     if (!empty($_POST['german'])) {
    //         $insert_data['german'] = PT_Secure($_POST['german']);
    //     }
    //     if (!empty($_POST['russian'])) {
    //         $insert_data['russian'] = PT_Secure($_POST['russian']);
    //     }
    //     if (!empty($_POST['spanish'])) {
    //         $insert_data['spanish'] = PT_Secure($_POST['spanish']);
    //     }
    //     if (!empty($_POST['turkish'])) {
    //         $insert_data['turkish'] = PT_Secure($_POST['turkish']);
    //     }
    //     $insert_data['type'] = 'category';
    //     $id = $db->insert(T_LANGS,$insert_data);
    //     $db->where('id',$id)->update(T_LANGS,array('lang_key' => 'category__'.$id));
    //     $data['status'] = 200;
    // }
}
if ($first == 'get_category_langs' && !empty($_POST['lang_key'])) {
    $data['status'] = 400;
    $pt->edit_category = $db->where('lang_key',PT_Secure($_POST['lang_key']))->getOne(T_LANGS);
    if (!empty($pt->edit_category)) {
        $data['html'] = PT_LoadAdminPage('manage_categories/langs_list');
        $data['status'] = 200;
    }
}
if ($first == 'edit_category' && !empty($_POST['lang_key'])) {

    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $update = false;
    $update_data = array();
    foreach ($pt->langs as $key => $lang) {
        if (!empty($_POST[$lang])) {
            $update_data[$lang] = PT_Secure($_POST[$lang]);
            $update = true;
        }
    }
    if ($update == true && !empty($update_data)) {
        $db->where('lang_key',PT_Secure($_POST['lang_key']))->update(T_LANGS,$update_data);
        $data = array('status' => 200);
    }


    // $data['status'] = 400;
    // $error = '';
    // if (empty($_POST['english']) && empty($_POST['arabic']) && empty($_POST['dutch']) && empty($_POST['french']) && empty($_POST['german']) && empty($_POST['russian']) && empty($_POST['spanish']) && empty($_POST['turkish'])) {
    //     $error = 'Please check your details';
    //     $data['message'] = $error;
    // }
    // if (empty($error)) {
    //     $update_data = array();
    //     if (!empty($_POST['english'])) {
    //         $update_data['english'] = PT_Secure($_POST['english']);
    //     }
    //     if (!empty($_POST['arabic'])) {
    //         $update_data['arabic'] = PT_Secure($_POST['arabic']);
    //     }
    //     if (!empty($_POST['dutch'])) {
    //         $update_data['dutch'] = PT_Secure($_POST['dutch']);
    //     }
    //     if (!empty($_POST['french'])) {
    //         $update_data['french'] = PT_Secure($_POST['french']);
    //     }
    //     if (!empty($_POST['german'])) {
    //         $update_data['german'] = PT_Secure($_POST['german']);
    //     }
    //     if (!empty($_POST['russian'])) {
    //         $update_data['russian'] = PT_Secure($_POST['russian']);
    //     }
    //     if (!empty($_POST['spanish'])) {
    //         $update_data['spanish'] = PT_Secure($_POST['spanish']);
    //     }
    //     if (!empty($_POST['turkish'])) {
    //         $update_data['turkish'] = PT_Secure($_POST['turkish']);
    //     }
    //     $db->where('lang_key',PT_Secure($_POST['lang_key']))->update(T_LANGS,$update_data);
    //     $data['status'] = 200;
    // }
}
if ($first == 'delete_category' && !empty($_POST['lang_key'])) {
    if ($_POST['lang_key'] != 'other') {
        $db->where('lang_key',PT_Secure($_POST['lang_key']))->delete(T_LANGS);
        $db->where('type',PT_Secure($_POST['lang_key']))->delete(T_LANGS);
        $db->where('category_id',PT_Secure($_POST['lang_key']))->update(T_VIDEOS,array('sub_category' => '',
            'category_id' => 'other'));
        $data['status'] = 200;
    }
}

if ($first == 'add_sub_category') {
    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $add = false;
    $insert_data = array();
    foreach ($pt->langs as $key => $lang) {
        if (!empty($_POST[$lang])) {
            $insert_data[$lang] = PT_Secure($_POST[$lang]);
            $add = true;
        }
    }
    $count = $db->where('lang_key',PT_Secure($_POST['key']))->getValue(T_LANGS,'COUNT(*)');
    if ($count == 0) {
        $add = false;
    }
    if ($add == true && !empty($insert_data)) {
        $insert_data['type'] = PT_Secure($_POST['key']);
        $id = $db->insert(T_LANGS,$insert_data);
        $db->where('id',$id)->update(T_LANGS,array('lang_key' => 'sub__'.$id));
        $data = array('status' => 200);
    }
}

if ($first == 'delete_sub_category') {
    $data['status'] = 400;
    if (!empty($_POST['sub_id'])) {
        if ($_POST['sub_id'] != 'other') {
            $db->where('lang_key',PT_Secure($_POST['sub_id']))->delete(T_LANGS);
            $db->where('sub_category',PT_Secure($_POST['sub_id']))->update(T_VIDEOS,array('sub_category' => ''));
            $data['status'] = 200;
        }
    }
}

if ($first == 'add_movie_category') {
    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $add = false;
    $insert_data = array();
    foreach ($pt->langs as $key => $lang) {
        if (!empty($_POST[$lang])) {
            $insert_data[$lang] = PT_Secure($_POST[$lang]);
            $add = true;
        }
    }
    if ($add == true && !empty($insert_data)) {
        $insert_data['type'] = 'movie_category';
        $id = $db->insert(T_LANGS,$insert_data);
        $db->where('id',$id)->update(T_LANGS,array('lang_key' => $id));
        $data = array('status' => 200);
    }
}

if($first == 'add_new_platform') 
{
    $data['status'] = 400;
    $data['message'] = 'Please check detail.';
    if(!empty($_POST['platformname']))
    {
        $insert_data = array('name'=>$_POST['platformname']);
        $db->insert(T_PLATFORMS, $insert_data);
        $data = array('status' => 200);    
    }
} 

if ($first == 'delete_platform' && !empty($_POST['del_id'])) 
{
    $db->where('id',PT_Secure($_POST['del_id']))->delete(T_PLATFORMS);
    $data['status'] = 200;
}

if($first == 'get_platform')
{
    $pt->edit_platform = $db->where('id',PT_Secure($_POST['id']))->getOne(T_PLATFORMS);   
    if (!empty($pt->edit_platform)) 
    {
        $data['html'] = PT_LoadAdminPage('add-platforms/getlist');
        $data['status'] = 200;
    }
}

if($first == 'edit_platform')
{
    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $update_data = array('name'=>PT_Secure($_POST['name']));
    $db->where('id',PT_Secure($_POST['id']))->update(T_PLATFORMS, $update_data);
    $data = array('status' => 200);
}

if($first == 'delete_platform')
{
    $data['status'] = 400;
    $data['message'] = 'Please check your details';
    $db->where('id',PT_Secure($_POST['del_id']))->delete(T_PLATFORMS);
    $data = array('status' => 200);
}    


if ($first == 'get_category_langs' && !empty($_POST['lang_key'])) {
    $data['status'] = 400;
    $pt->edit_category = $db->where('lang_key',PT_Secure($_POST['lang_key']))->getOne(T_LANGS);
    if (!empty($pt->edit_category)) {
        $data['html'] = PT_LoadAdminPage('manage_categories/langs_list');
        $data['status'] = 200;
    }
}

if ($first == 'new-game') 
{
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['tags']) || empty($_FILES["image"])) 
    {
        $error = 400; 
    }
    else{
            if (strlen($_POST['title']) < 5) 
            {
                $error = 401; 
            }

            else if(strlen($_POST['description']) < 15)
            {
                $error = 402; 
            }
            
            else if (!empty($_FILES["image"]["error"])) 
            {
                $error = 404; 
            } 
     

            else if (!file_exists($_FILES["image"]["tmp_name"])) 
            {
                $error = 405; 
            }

            else if (file_exists($_FILES["image"]["tmp_name"])) 
            {
                $image = getimagesize($_FILES["image"]["tmp_name"]);
                if (!in_array($image[2], array(
                    IMAGETYPE_GIF,
                    IMAGETYPE_JPEG,
                    IMAGETYPE_PNG,
                    IMAGETYPE_BMP
                ))){
                    $error = 405; 
                }
            }
    }
    $slidershow = (isset($_POST['slidershow'])) ? '1' : '0';
    $file_info = array();
    if (empty($error)) {
        if($slidershow == '0')
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
        } else 
        {
            $file_info   = array(
                'file' => $_FILES['image']['tmp_name'],
                'size' => $_FILES['image']['size'],
                'name' => $_FILES['image']['name'],
                'type' => $_FILES['image']['type']);
        }
        $file_upload     = PT_ShareFile($file_info);
        $insert          = false;
        $active          = (isset($_POST['draft'])) ? '0' : '1';
        $slidershow = (isset($_POST['slidershow'])) ? '1' : '0';

        if (!empty($file_upload['filename'])) 
        {
            $post_image  = PT_Secure($file_upload['filename']);
            $insert_data = array(
                'name' => PT_Secure(PT_ShortText($_POST['title'],150)),
                'description' => $_POST['description'],
                'tags' => PT_Secure(PT_ShortText($_POST['tags']),250),
                'logo' => $post_image,
                'slidershow' => $slidershow,
                'time' => time(),
                'active' => $active,
            );
            $insert = $db->insert(T_GAMES, $insert_data);
        }
        $data['status'] = ($insert) ? 200 : 500;
        $data['url']    = PT_Link('games/read/' . PT_URLSlug($insert_data['title'],$insert));
    }
    else{
        $data['status'] = $error;
    }
}

if ($first == 'delete-game') {
    if (!empty($_POST['id'])) {
        $game = $db->where('id',PT_Secure($_POST['id']))->getOne(T_GAMES);
        if (!empty($game)) {
            if (file_exists($game->logo)) {
                unlink($game->logo);
            }
            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_GAMES);
            //Delete related data
            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}

if ($first == 'delete-tournament') {
    if (!empty($_POST['id'])) {
        $tour = $db->where('id',PT_Secure($_POST['id']))->getOne(T_TOURNAMENTS);
        if (!empty($tour)) {
            if (file_exists($tour->image)) {
                unlink($tour->image);
            }
            $delete  = $db->where('id',PT_Secure($_POST['id']))->delete(T_TOURNAMENTS);
            $delete  = $db->where('tourid',PT_Secure($_POST['id']))->delete(T_PARTICIPANTS);
            //Delete related data
            if ($delete) {
                $data = array('status' => 200);
            }
        }
    }
}




if ($first == 'update-game') 
{
    $error = false;
    if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['tags'])) {
        $error = 400; 
    }
    else{
        if (strlen($_POST['title']) < 5) {
            $error = 401; 
        }
        else if(strlen($_POST['description']) < 15){
            $error = 402; 
        }
        else if (!empty($_FILES["image"])) {

            if (!empty($_FILES["image"]["error"])) {
                $error = 404; 
            } 
            else if (!file_exists($_FILES["image"]["tmp_name"])) {
                $error = 405; 
            }
            else if (file_exists($_FILES["image"]["tmp_name"])) {
                $image = getimagesize($_FILES["image"]["tmp_name"]);
                if (!in_array($image[2], array(
                    IMAGETYPE_GIF,
                    IMAGETYPE_JPEG,
                    IMAGETYPE_PNG,
                    IMAGETYPE_BMP
                ))){
                    $error = 405; 
                }
            }
        }
        else if(empty($_POST['id']) || !is_numeric($_POST['id'])){
            $error = 500; 
        }
    }
    if (empty($error)) 
    {
        $insert      = false;
        $active      = (isset($_POST['draft'])) ? '0' : '1';
        $active      = (!empty($_POST['status']) && $_POST['status'] == '1') ? '1' : '0';
        $id          = PT_Secure($_POST['id']);
        $slidershow = (isset($_POST['slidershow'])) ? '1' : '0';

        $update_data = array(
            'name' => PT_Secure(PT_ShortText($_POST['title'],150)),
            'description' => PT_Secure(PT_ShortText($_POST['description'],200)),
            'tags' => PT_Secure(PT_ShortText($_POST['tags']),250),
            'slidershow' => $slidershow,
            'time' => time(),
            'active' => $active
        );

        $file_info = array();

        if (!empty($_FILES["image"])) 
        {
            if($slidershow == '0')
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
            } else 
            {
                $file_info   = array(
                'file' => $_FILES['image']['tmp_name'],
                'size' => $_FILES['image']['size'],
                'name' => $_FILES['image']['name'],
                'type' => $_FILES['image']['type']);
           }
            $file_upload     = PT_ShareFile($file_info);
            if (!empty($file_upload['filename'])) {
                $update_data['logo'] = PT_Secure($file_upload['filename']);  
            }
            else
            {
                $error = true;
            }
        }
        $update         = $db->where('id',$id)->update(T_GAMES, $update_data);
        $data['status'] = ($update && empty($error)) ? 200 : 500;
        $data['url']    = PT_Link('games/read/' . PT_URLSlug($update_data['title'],$id));
    }

    else{
        $data['status'] = $error;
    }
}