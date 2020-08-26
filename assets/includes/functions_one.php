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
require_once('app_start.php');
use Aws\S3\S3Client;

function PT_UserData($user_id = 0, $options = array()) {
    global $db, $pt, $lang, $countries_name;
    if (!empty($options['data'])) {
        $fetched_data   = $user_id;
    } 

    else {
        $fetched_data   = $db->where('id', $user_id)->getOne(T_USERS);
    }

    if (empty($fetched_data)) {
        return false;
    }

    $fetched_data->name   = $fetched_data->username;
    $fetched_data->avatar = PT_GetMedia($fetched_data->avatar);
    $fetched_data->cover  = PT_GetMedia($fetched_data->cover);
    $fetched_data->url    = PT_Link('@' . $fetched_data->username);
    $fetched_data->about_decoded = br2nl($fetched_data->about);

    if (!empty($fetched_data->first_name)) {
        $fetched_data->name = $fetched_data->first_name . ' ' . $fetched_data->last_name;
    }

    if (empty($fetched_data->about)) {
        $fetched_data->about = '';
    }
    $fetched_data->balance_or = $fetched_data->balance;
    $fetched_data->balance  = number_format($fetched_data->balance, 2);
    $fetched_data->name_v   = $fetched_data->name;
    if ($fetched_data->verified == 1 && $pt->config->verification_badge == 'on') {
        $fetched_data->name_v = $fetched_data->name . ' <i class="fa fa-check-circle fa-fw verified"></i>';
    }
    
    $fetched_data->country_name  = $countries_name[$fetched_data->country_id];
    @$fetched_data->gender_text  = ($fetched_data->gender == 'male') ? $lang->male : $lang->female;
    return $fetched_data;
}

function PT_GetConfig() {
    global $db;
    $data  = array();
    $configs = $db->get(T_CONFIG);
    foreach ($configs as $key => $config) {
        $data[$config->name] = $config->value;
    }
    return $data;
}

function PT_GetAllUsers() {
    global $db;
    $data         = array();
    $fetched_data = $db->get(T_USERS);
    foreach ($fetched_data as $key => $value) {
        $data[] = PT_UserData($value->id);
    }
    return $data;
}

function PT_getDemo_video()
{
    global $db;
    $data = array();
    $query_one = "SELECT * FROM " . T_VIDEOS . " WHERE `demo` = '1'";
    $data = $db->rawQuery($query_one);
    return $data;
}

function PT_getSlider_image()
{
    global $db;
    $data = array();
    $tablename = T_GAMES;
    $strQuery = "Select * from $tablename where slidershow = '1' order by reclike DESC";
    return $db->rawQuery($strQuery);
}

function PT_getGames()
{
    global $db;
    $data = array();
    $tablename = T_GAMES;
    $strQuery = "Select * from $tablename where active='1' order by id";
    return $db->rawQuery($strQuery);
}

function PT_getPlatforms()
{
    global $db;
    $data = array();
    $tablename = T_PLATFORMS;
    $strQuery = "Select * from $tablename order by id";
    return $db->rawQuery($strQuery);
}   

function PT_IsAdmin() {
    global $pt;
    if (IS_LOGGED == false) {
        return false;
    }
    if ($pt->user->admin == 1) {
        return true;
    }
    return false;
}

function PT_IsUpgraded(){
    global $pt;
    if (IS_LOGGED == false) {
        return false;
    }

    if ($pt->user->is_pro > 0) {
        return true;
    }

    return false;
}


function PT_GetMessageButton($username = '') {
    global $pt, $db, $lang;
    if (empty($username)) {
        return false;
    }
    if (IS_LOGGED == false) {
        return false;
    }
    if ($username == $pt->user->username) {
        return false;
    }
    $button_text  = $lang->message;
    $button_icon  = 'plus-square';
    $button_class = 'subscribe';
    return PT_LoadPage('buttons/message', array(
        'BUTTON' => $button_class,
        'ICON' => $button_icon,
        'TEXT' => $button_text,
        'USERNAME' => $username,
    ));
}
function PT_GetSubscribeButton($user_id = 0) {
    global $pt, $db, $lang;
    if (empty($user_id)) {
        return false;
    }
    
    $button_text  = $lang->subscribe;
    $button_icon  = '<line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line>';
    $button_class = 'subscribe';
    if (IS_LOGGED == true) {
        if ($user_id == $pt->user->id) {
            return PT_LoadPage('buttons/manage-videos', array(
                'SUBS' => number_format($db->where('user_id', $pt->user->id)->getValue(T_SUBSCRIPTIONS, "count(*)"))
            ));
        }
        $check_if_sub = $db->where('user_id', $user_id)->where('subscriber_id', $pt->user->id)->getValue(T_SUBSCRIPTIONS, 'count(*)');
        if ($check_if_sub == 1) {
            $button_text  = $lang->subscribed;
            $button_icon  = '<polyline points="20 6 9 17 4 12"></polyline>';
            $button_class = 'subscribed';
        }
    }
    return PT_LoadPage('buttons/subscribe', array(
        'IS_SUBSCRIBED_BUTTON' => $button_class,
        'IS_SUBSCRIBED_ICON' => $button_icon,
        'IS_SUBSCRIBED_TEXT' => $button_text,
        'USER_ID' => $user_id,
        'SUBS' => number_format($db->where('user_id', $user_id)->getValue(T_SUBSCRIPTIONS, "count(*)"))
    ));
}

function PT_GetVideoByID($video_id = '', $add_views = 0, $likes_dislikes = 0, $run_query = 1, $short_id = 0) {
    global $pt, $db, $categories;

    if (empty($video_id)) {
        return false;
    }
    if ($short_id == 1) {
        $get_video = $db->where('short_id', $video_id)->getOne(T_VIDEOS);
    } else if ($run_query == 1) {
        $get_video = $db->where('video_id', $video_id)->getOne(T_VIDEOS);
    } else if ($run_query == 2) {
         $get_video = $db->where('id', $video_id)->getOne(T_VIDEOS);
    } else {
        $get_video = $video_id;
    }

    if (!empty($get_video)) {

        $get_video->org_thumbnail = $get_video->thumbnail;
        $get_video->video_id_      = $get_video->video_id;
        if (strpos($get_video->thumbnail, 'upload/photos') !== false) {
            $get_video->thumbnail      = PT_GetMedia($get_video->thumbnail); 
            $get_video->source         = 'Uploaded';
            $get_video->video_type     = 'video/mp4';
            
            if ($get_video->type == 4) {
                $get_video->video_location = urldecode($get_video->video_location);
            }
            
            else{
                $get_video->video_location = PT_GetMedia($get_video->video_location);
            }

        }
        if (!empty($get_video->youtube)) {
            $get_video->video_type     = 'video/youtube';
            $get_video->video_location = 'https://www.youtube.com/watch?v=' . $get_video->youtube;
            $get_video->video_id_      = $get_video->youtube;
            $get_video->source         = 'YouTube';
        }
        if (!empty($get_video->daily)) {
            $get_video->video_type = 'video/dailymotion';
            $get_video->video_id_  = $get_video->daily;
            $get_video->source         = 'Dailymotion';
        }
        if (!empty($get_video->vimeo)) {
            $get_video->video_type = 'video/vimeo';
            $get_video->video_id_  = $get_video->vimeo;
            $get_video->source         = 'Vimeo';
        }
        if (!empty($get_video->facebook)) {
            $get_video->video_type = 'video/facebook';
            $get_video->video_id_  = $get_video->facebook;
            $get_video->source         = 'Facebook';
        }
        if (!empty($get_video->twitch)) {
            $get_video->video_type = 'video/twitch';
            $get_video->video_id_  = $get_video->twitch;
            $get_video->source         = 'Twitch';
        }
        $get_video->url                = PT_Link('watch/' . PT_Slug($get_video->title, $get_video->video_id));
        $get_video->edit_description   = PT_EditMarkup($get_video->description);
        $get_video->markup_description = PT_Markup($get_video->description);
        $get_video->owner              = PT_UserData($get_video->user_id);
        $get_video->is_liked           = 0;
        $get_video->is_disliked        = 0;
        $get_video->is_owner           = false;
        if (IS_LOGGED == true) {
            $get_video->is_liked    = $db->where('user_id', $pt->user->id)->where('video_id', $get_video->id)->where('type', 1)->getValue(T_DIS_LIKES, 'count(*)');
            $get_video->is_disliked = $db->where('user_id', $pt->user->id)->where('video_id', $get_video->id)->where('type', 2)->getValue(T_DIS_LIKES, 'count(*)');
            if ($get_video->owner->id == $pt->user->id || PT_IsAdmin()) {
                $get_video->is_owner           = true;
            }
        }
        $get_video->time_alpha    = gmdate('d M Y', $get_video->time);
        $get_video->time_ago      = PT_Time_Elapsed_String($get_video->time);
        $get_video->category_name = (!empty($categories[$get_video->category_id])) ? $categories[$get_video->category_id] : ''; 
        if ($likes_dislikes == 1) {
            $db->where('video_id', $get_video->id);
            $db->where('type', 1);
            $get_video->likes = $db->getValue(T_DIS_LIKES, 'count(*)');
            
            $db->where('video_id', $get_video->id);
            $db->where('type', 2);
            $get_video->dislikes = $db->getValue(T_DIS_LIKES, 'count(*)');
            
            $total                    = $get_video->likes + $get_video->dislikes;
            $get_video->likes_percent = 0;
            if ($get_video->likes > 0) {
                $get_video->likes_percent = round(($get_video->likes / $total) * 100);
            }
            $get_video->dislikes_percent = 0;
            if ($get_video->dislikes > 0) {
                $get_video->dislikes_percent = round(($get_video->dislikes / $total) * 100);
            }
            
            if ($get_video->likes_percent == 0 && $get_video->dislikes_percent == 0) {
                $get_video->dislikes_percent = 100;
                $get_video->likes_percent    = 0;
            }
        }
        return $get_video;
    }
    return array();
}
function addhttp($url) {
    if (!preg_match("~^(?:f|ht)tps?://~i", $url)) {
        $url = "http://" . $url;
    }
    return $url;
}
function PT_GetMedia($media = '', $is_upload = false){
    global $pt;
    if (empty($media)) {
        return '';
    }

    $media_url     = $pt->config->site_url . '/' . $media;
    if ($pt->config->s3_upload == 'on' && $is_upload == false) {
        $media_url = "https://" . $pt->config->s3_bucket_name . ".s3.amazonaws.com/" . $media;
    } else if ($pt->config->ftp_upload == "on") {
        return addhttp($pt->config->ftp_endpoint) . '/' . $media;
    }

    return $media_url;
}

function PT_UserActive($user_id = 0) {
    global $db;
    $db->where('active', '1');
    $db->where('id', PT_Secure($user_id));
    return ($db->getValue(T_USERS, 'count(*)') > 0) ? true : false;
}

function PT_UserEmailExists($email = '') {
    global $db;
    return ($db->where('email', PT_Secure($email))->getValue(T_USERS, 'count(*)') > 0) ? true : false;
}

function PT_UsernameExists($username = '') {
    global $db;
    return ($db->where('username', PT_Secure($username))->getValue(T_USERS, 'count(*)') > 0) ? true : false;
}

function PT_ImportImageFromLogin($media) {
    global $pt;
    if (!file_exists('upload/photos/' . date('Y'))) {
        mkdir('upload/photos/' . date('Y'), 0777, true);
    }
    if (!file_exists('upload/photos/' . date('Y') . '/' . date('m'))) {
        mkdir('upload/photos/' . date('Y') . '/' . date('m'), 0777, true);
    }
    $dir               = 'upload/photos/' . date('Y') . '/' . date('m');
    $file_dir          = $dir . '/' . PT_GenerateKey() . '_avatar.jpg';
    $getImage          = connect_to_url($media);
    if (!empty($getImage)) {
        $importImage = file_put_contents($file_dir, $getImage);
        if ($importImage) {
            PT_Resize_Crop_Image(400, 400, $file_dir, $file_dir, 100);
        }
    }
    if (file_exists($file_dir)) {
        if ($pt->config->s3_upload == 'on') {
            PT_UploadToS3($file_dir);
        }
        return $file_dir;
    } else {
        return $pt->userDefaultAvatar;
    }
}

function PT_SendMessage($data = array()) {
    global $pt, $db, $mail;
    $email_from      = $data['from_email'] = PT_Secure($data['from_email']);
    $to_email        = $data['to_email'] = PT_Secure($data['to_email']);
    $subject         = $data['subject'];
    $data['charSet'] = PT_Secure($data['charSet']);
    
    if ($pt->config->smtp_or_mail == 'mail') {
        $mail->IsMail();
    } 

    else if ($pt->config->smtp_or_mail == 'smtp') {
        $mail->isSMTP();
        $mail->Host        = $pt->config->smtp_host;
        $mail->SMTPAuth    = true;
        $mail->Username    = $pt->config->smtp_username;
        $mail->Password    = $pt->config->smtp_password;
        $mail->SMTPSecure  = $pt->config->smtp_encryption;
        $mail->Port        = $pt->config->smtp_port;
        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );
    } 

    else {
        return false;
    }

    $mail->IsHTML($data['is_html']);
    $mail->setFrom($data['from_email'], $data['from_name']);
    $mail->addAddress($data['to_email'], $data['to_name']);
    $mail->Subject = $data['subject'];
    $mail->CharSet = $data['charSet'];
    $mail->MsgHTML($data['message_body']);
    if ($mail->send()) {
        $mail->ClearAddresses();
        return true;
    }
}

function PT_sendMobileSMS($phonenumber)
{
    if(empty($phonenumber)) exit;
    $code = PT_GenerateKey(5,5,false,false,true,false);
    $route = "default";
    //$authKey = "e187ab52cddbb5ef4d995e80d4528aa";
    $authKey = "c4413516749807917a37e9633a58bd1";
    $serverUrl="msg.msgclub.net";
    $senderId="DEMOOS";
    $getData = 'mobileNos='.$phonenumber.'&message='.$code.'&senderId='.$senderId.'&routeId='.$routeId;
      //API URL
    $url="http://".$serverUrl."/rest/services/sendSMS/sendGroupSms?AUTH_KEY=".$authKey."&".$getData;

      // init the resource
            
      $ch = curl_init();
      curl_setopt_array($ch, array(
      CURLOPT_URL => $url,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_SSL_VERIFYHOST => 0,
      CURLOPT_SSL_VERIFYPEER => 0
      ));
           
      //get response

      $output = curl_exec($ch);
      
      $output = json_decode($output, true);       
      $responseCode = $output['responseCode'];
      $responseMsg = $output['response'];
      if($responseCode == '3011' && is_numeric($responseMsg) > 0)
      {
        return true;  
      } else
      {
        return false;
      }
      //Print error if any

      if(curl_errno($ch))
      {
        return false;
      }
      curl_close($ch);
}

function PT_ShareFile($data = array(), $type = 0) {
    global $pt, $mysqli;
    $allowed = '';
    if (!file_exists('upload/photos/' . date('Y'))) {
        @mkdir('upload/photos/' . date('Y'), 0777, true);
    }
    if (!file_exists('upload/photos/' . date('Y') . '/' . date('m'))) {
        @mkdir('upload/photos/' . date('Y') . '/' . date('m'), 0777, true);
    }
    if (!file_exists('upload/videos/' . date('Y'))) {
        @mkdir('upload/videos/' . date('Y'), 0777, true);
    }
    if (!file_exists('upload/videos/' . date('Y') . '/' . date('m'))) {
        @mkdir('upload/videos/' . date('Y') . '/' . date('m'), 0777, true);
    }
    if (isset($data['file']) && !empty($data['file'])) {
        $data['file'] = $data['file'];
    }
    if (isset($data['name']) && !empty($data['name'])) {
        $data['name'] = PT_Secure($data['name']);
    }
    if (isset($data['name']) && !empty($data['name'])) {
        $data['name'] = PT_Secure($data['name']);
    }
    if (empty($data)) {
        return false;
    }
    $allowed           = 'jpg,png,jpeg,gif,mp4,mov,webm,mpeg,3gp,mkv,mk3d,mks';
    if (!empty($data['allowed'])) {
        $allowed  = $data['allowed'];
    }
    $new_string        = pathinfo($data['name'], PATHINFO_FILENAME) . '.' . strtolower(pathinfo($data['name'], PATHINFO_EXTENSION));
    $extension_allowed = explode(',', $allowed);
    $file_extension    = pathinfo($new_string, PATHINFO_EXTENSION);
    if (!in_array($file_extension, $extension_allowed)) {
        return array(
            'error' => 'File format not supported'
        );
    }
    if ($file_extension == 'jpg' || $file_extension == 'jpeg' || $file_extension == 'png' || $file_extension == 'gif') {
        $folder   = 'photos';
        $fileType = 'image';
    } else {
        $folder   = 'videos';
        $fileType = 'video';
    }
    if (empty($folder) || empty($fileType)) {
        return false;
    }
    $ar = array(
        'video/mp4',
        'video/mov',
        'video/3gp',
        'video/3gpp',
        'video/mpeg',
        'video/flv',
        'video/avi',
        'video/webm',
        'audio/wav',
        'audio/mpeg',
        'video/quicktime',
        'audio/mp3',
        'image/png',
        'image/jpeg',
        'image/gif',
        'video/x-msvideo',
        'video/msvideo',
        'video/x-ms-wmv',
        'video/x-flv',
        'video/x-matroska',
        'video/webm'
    );

    if (!in_array($data['type'], $ar)) {
        return array(
            'error' => 'File format not supported'
        );
    }
    $dir         = "upload/{$folder}/" . date('Y') . '/' . date('m');
    $filename    = $dir . '/' . PT_GenerateKey() . '_' . date('d') . '_' . md5(time()) . "_{$fileType}.{$file_extension}";
    $second_file = pathinfo($filename, PATHINFO_EXTENSION);
    if (move_uploaded_file($data['file'], $filename)) {
        if ($second_file == 'jpg' || $second_file == 'jpeg' || $second_file == 'png' || $second_file == 'gif') {
            if ($type == 1) {
                @PT_CompressImage($filename, $filename, 50);
                $explode2  = @end(explode('.', $filename));
                $explode3  = @explode('.', $filename);
                $last_file = $explode3[0] . '_small.' . $explode2;
                @PT_Resize_Crop_Image(400, 400, $filename, $last_file, 60);

                if (($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on') && !empty($last_file)) {
                    $upload_s3 = PT_UploadToS3($last_file);
                }
            } 

            else {
                if ($second_file != 'gif') {
                    if (!empty($data['crop'])) {
                        $crop_image = PT_Resize_Crop_Image($data['crop']['width'], $data['crop']['height'], $filename, $filename, 60);
                    }
                    @PT_CompressImage($filename, $filename, 90);
                }

                if (($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on') && !empty($filename)) {
                    $upload_s3 = PT_UploadToS3($filename);
                }
            }
        }

        else{
            if (($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on') && !empty($filename)) {
                $upload_s3 = PT_UploadToS3($filename);
            }
        }

        $last_data             = array();
        $last_data['filename'] = $filename;
        $last_data['name']     = $data['name'];
        return $last_data;
    }
}

function PT_DeleteUser($id = 0) {
    global $pt, $db;
    if (empty($id)) {
        return false;
    }
    if ($pt->user->id != $id) {
       if (PT_IsAdmin() == false) {
           return false;
       }
    }
    $get_videos = $db->where('user_id', $id)->get(T_VIDEOS, null, 'id');
    foreach ($get_videos as $key => $video) {
        $delete_video = PT_DeleteVideo($video->id);
    }
    $get_cover_and_avatar = PT_UserData($id);
    if ($get_cover_and_avatar->avatar != 'upload/photos/d-avatar.jpg') {
        @unlink($get_cover_and_avatar->avatar);
        if (($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on')) { 
            PT_DeleteFromToS3($get_cover_and_avatar->avatar);
        }  
    }
    if ($get_cover_and_avatar->cover != 'upload/photos/d-cover.jpg') {
        @unlink($get_cover_and_avatar->cover);
        if (($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on')) { 
            PT_DeleteFromToS3($get_cover_and_avatar->cover);
        } 
    }
    $delete_user = $db->where('id', $id)->delete(T_USERS);
    $delete_user = $db->where('user_id', $id)->delete(T_USR_ADS);
    if ($delete_user) {
        return true;
    }
}

function PT_DeleteVideo($id = 0) {
    global $pt, $db;
    if (empty($id)) {
        return false;
    }

    $get_video = $db->where('id', $id)->getOne(T_VIDEOS);
    $s3        = (($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on')) ? true : false;
    if (strpos($get_video->thumbnail, 'upload/photos') !== false) {
        if ($get_video->thumbnail != 'upload/photos/thumbnail.jpg') {
            if (file_exists($get_video->thumbnail)) {
                unlink($get_video->thumbnail);
            }

            if (($pt->config->s3_upload == 'on' || $pt->config->ftp_upload == 'on')) { 
                PT_DeleteFromToS3($get_video->thumbnail);
            }  
        }
        
    }
    

    if (!empty($get_video->video_location)) {
        unlink($get_video->video_location);
        PT_DeleteFromToS3($get_video->video_location);
    }

    $explode_video = @explode('_video', $get_video->video_location);
    if (!empty($explode_video)) {
        if (!empty($get_video->{"240p"})) {
            @unlink($explode_video[0] . '_video_240p_converted.mp4');
            PT_DeleteFromToS3($explode_video[0] . '_video_240p_converted.mp4');
        }

        if (!empty($get_video->{"360p"})) {
            @unlink($explode_video[0] . '_video_360p_converted.mp4');
            PT_DeleteFromToS3($explode_video[0] . '_video_360p_converted.mp4');
        }

        if (!empty($get_video->{"480p"})) {
            @unlink($explode_video[0] . '_video_480p_converted.mp4');
            PT_DeleteFromToS3($explode_video[0] . '_video_480p_converted.mp4');
        }

        if (!empty($get_video->{"720p"})) {
            @unlink($explode_video[0] . '_video_720p_converted.mp4');
            PT_DeleteFromToS3($explode_video[0] . '_video_720p_converted.mp4');
        }

        if (!empty($get_video->{"1080p"})) {
            @unlink($explode_video[0] . '_video_1080p_converted.mp4');
            PT_DeleteFromToS3($explode_video[0] . '_video_1080p_converted.mp4');
        }

        if (!empty($get_video->{"4096p"})) {
            @unlink($explode_video[0] . '_video_4096p_converted.mp4');
            PT_DeleteFromToS3($explode_video[0] . '_video_4096p_converted.mp4');
        }

        if (!empty($get_video->{"2048p"})) {
            @unlink($explode_video[0] . '_video_2048p_converted.mp4');
            PT_DeleteFromToS3($explode_video[0] . '_video_2048p_converted.mp4');
        }
    }

    $delete = $db->where('id', $id)->delete(T_VIDEOS);
    $user_ = $db->where('id', $get_video->user_id)->getOne(T_USERS);
    $size = $get_video->size;
    $db->where('id', $get_video->user_id)->update(T_USERS,array('uploads' => ($user_->uploads - $size)));

    $get_comments = $db->where('video_id', $id)->get(T_COMMENTS);
    foreach ($get_comments as $key => $comment) {
        $delete  = $db->where('comment_id', $comment->id)->delete(T_COMMENTS_LIKES);
        $r_votes = $db->where('comment_id', $comment->id)->get(T_COMM_REPLIES);
        $delete  = $db->where('comment_id', $comment->id)->delete(T_COMM_REPLIES);
        foreach ($r_votes as $reply_vote) {
            $db->where('reply_id', $reply_vote->id)->delete(T_COMMENTS_LIKES);
        }
    }
    
    $delete = $db->where('video_id', $id)->delete(T_COMMENTS);
    $delete = $db->where('video_id', $id)->delete(T_HISTORY);
    $delete = $db->where('video_id', $id)->delete(T_DIS_LIKES);
    $delete = $db->where('video_id', $id)->delete(T_SAVED);
    $delete = $db->where('video_id', $id)->delete(T_PLAYLISTS);
    $delete = $db->where('video_id', $id)->delete(T_NOTIFICATIONS);
    $delete = $db->where('video_id', $id)->delete(T_VIDEOS_TRSNS);
    if ($delete) {
        return true;
    }
    return false;
}

function PT_UpdateAdminDetails() {
    global $pt, $db;

    $get_videos_count = $db->getValue(T_VIDEOS, 'count(*)');
    $update_videos_count = $db->where('name', 'total_videos')->update(T_CONFIG, array('value' => $get_videos_count));

    $get_views_count = $db->getValue(T_VIDEOS, 'SUM(views)');
    $update_views_count = $db->where('name', 'total_views')->update(T_CONFIG, array('value' => $get_views_count));

    $get_users_count = $db->getValue(T_USERS, 'count(*)');
    $update_users_count = $db->where('name', 'total_users')->update(T_CONFIG, array('value' => $get_users_count));

    $get_subs_count = $db->getValue(T_SUBSCRIPTIONS, 'count(*)');
    $update_subs_count = $db->where('name', 'total_subs')->update(T_CONFIG, array('value' => $get_subs_count));

    $get_comments_count = $db->getValue(T_COMMENTS, 'count(*)');
    $update_comments_count = $db->where('name', 'total_comments')->update(T_CONFIG, array('value' => $get_comments_count));

    $get_likes_count = $db->where('type', 1)->getValue(T_DIS_LIKES, 'count(*)');
    $update_likes_count = $db->where('name', 'total_likes')->update(T_CONFIG, array('value' => $get_likes_count));

    $get_dislikes_count = $db->where('type', 2)->getValue(T_DIS_LIKES, 'count(*)');
    $update_dislikes_count = $db->where('name', 'total_dislikes')->update(T_CONFIG, array('value' => $get_dislikes_count));

    $get_saved_count = $db->getValue(T_SAVED, 'count(*)');
    $update_saved_count = $db->where('name', 'total_saved')->update(T_CONFIG, array('value' => $get_saved_count));
    
    $user_statics = array();
    $videos_statics = array();

    $months = array('1','2','3','4','5','6','7','8','9','10','11','12');
    $date = date('Y');

    foreach ($months as $value) {
       $monthNum  = $value;
       $dateObj   = DateTime::createFromFormat('!m', $monthNum);
       $monthName = $dateObj->format('F'); 
       $user_statics[] = array('month' => $monthName, 'new_users' => $db->where('registered', "$date/$value")->getValue(T_USERS, 'count(*)'));
       $videos_statics[] = array('month' => $monthName, 'new_videos' => $db->where('registered', "$date/$value")->getValue(T_VIDEOS, 'count(*)'));
    }
    $update_user_statics = $db->where('name', 'user_statics')->update(T_CONFIG, array('value' => PT_Secure(json_encode($user_statics))));
    $update_videos_statics = $db->where('name', 'videos_statics')->update(T_CONFIG, array('value' => PT_Secure(json_encode($videos_statics))));
    
    
    $update_saved_count = $db->where('name', 'last_admin_collection')->update(T_CONFIG, array('value' => time()));
}

function PT_GetAd($type, $admin = true) {
    global $db;
    $type      = PT_Secure($type);
    $query_one = "SELECT `code` FROM " . T_ADS . " WHERE `placement` = '{$type}'";
    if ($admin === false) {
        $query_one .= " AND `active` = '1'";
    }
    $fetched_data = $db->rawQuery($query_one);
    if (!empty($fetched_data)) {
        return htmlspecialchars_decode($fetched_data[0]->code);
    }
    return '';
}

function PT_GetThemes() {
    global $pt;
    $themes = glob('themes/*', GLOB_ONLYDIR);
    return $themes;
}

function PT_UploadLogo($data = array()) {
    global $pt, $db;
    if (isset($data['file']) && !empty($data['file'])) {
        $data['file'] = PT_Secure($data['file']);
    }
    if (isset($data['name']) && !empty($data['name'])) {
        $data['name'] = PT_Secure($data['name']);
    }
    if (isset($data['name']) && !empty($data['name'])) {
        $data['name'] = PT_Secure($data['name']);
    }
    if (empty($data)) {
        return false;
    }
    $allowed           = 'png';
    $new_string        = pathinfo($data['name'], PATHINFO_FILENAME) . '.' . strtolower(pathinfo($data['name'], PATHINFO_EXTENSION));
    $extension_allowed = explode(',', $allowed);
    $file_extension    = pathinfo($new_string, PATHINFO_EXTENSION);
    if (!in_array($file_extension, $extension_allowed)) {
        return false;
    }
    $logo_name = 'logo';
    if (!empty($data['light-logo'])) {
        $logo_name = 'logo-light';
    }
    if (!empty($data['favicon'])) {
        $logo_name = 'icon';
    }
    $dir      = "themes/" . $pt->config->theme . "/img/";
    $filename = $dir . "$logo_name.png";
    if (move_uploaded_file($data['file'], $filename)) {
        return true;
    }
}

function PT_GetTerms() {
    global $db;
    $data  = array();
    $terms = $db->get(T_TERMS);
    foreach ($terms as $key => $term) {
        $data[$term->type] = $term->text;
    }
    return $data;
}

function PT_CreateMainSession() {
    $hash = substr(sha1(rand(1111, 9999)), 0, 70);
    if (!empty($_SESSION['main_hash_id'])) {
        $_SESSION['main_hash_id'] = $_SESSION['main_hash_id'];
        return $_SESSION['main_hash_id'];
    }
    $_SESSION['main_hash_id'] = $hash;
    return $hash;
}

function PT_CheckMainSession($hash = '') {
    if (!isset($_SESSION['main_hash_id']) || empty($_SESSION['main_hash_id'])) {
        return false;
    }
    if (empty($hash)) {
        return false;
    }
    if ($hash == $_SESSION['main_hash_id']) {
        return true;
    }
    return false;
}

function PT_UploadToS3($filename, $config = array()) {
    global $pt;

    if ($pt->config->s3_upload != 'on' && $pt->config->ftp_upload != 'on') {
        return false;
    }
    if ($pt->config->ftp_upload == "on") {
        $ftp = new \FtpClient\FtpClient();
        $ftp->connect($pt->config->ftp_host, false, $pt->config->ftp_port);
        $login = $ftp->login($pt->config->ftp_username, $pt->config->ftp_password);
        if ($login) {
            if (!empty($pt->config->ftp_path)) {
                if ($pt->config->ftp_path != "./") {
                    $ftp->chdir($pt->config->ftp_path);
                }
            }
            $file_path = substr($filename, 0, strrpos( $filename, '/'));
            $file_path_info = explode('/', $file_path);
            $path = '';
            if (!$ftp->isDir($file_path)) {
                foreach ($file_path_info as $key => $value) {
                    if (!empty($path)) {
                        $path .= '/' . $value . '/' ;
                    } else {
                        $path .= $value . '/' ;
                    }
                    if (!$ftp->isDir($path)) {
                        $mkdir = $ftp->mkdir($path);
                    }
                } 
            }
            $ftp->chdir($file_path);
            $ftp->pasv(true);
            if ($ftp->putFromPath($filename)) {
                if (empty($config['delete'])) {
                    if (empty($config['amazon'])) {
                        @unlink($filename);
                    }
                } 
                $ftp->close();
                return true;
            }
            $ftp->close();
        }
    } else {
        $s3Config = (
            empty($pt->config->amazone_s3_key) || 
            empty($pt->config->amazone_s3_s_key) || 
            empty($pt->config->region) || 
            empty($pt->config->s3_bucket_name)
        );  
        
        if ($s3Config){
            return false;
        }

        $s3 = new S3Client([
            'version'     => 'latest',
            'region'      => $pt->config->region,
            'credentials' => [
                'key'    => $pt->config->amazone_s3_key,
                'secret' => $pt->config->amazone_s3_s_key,
            ]
        ]);

        $s3->putObject([
            'Bucket' => $pt->config->s3_bucket_name,
            'Key'    => $filename,
            'Body'   => fopen($filename, 'r+'),
            'ACL'    => 'public-read',
        ]);

        if (empty($config['delete'])) {
            if ($s3->doesObjectExist($pt->config->s3_bucket_name, $filename)) {
                if (empty($config['amazon'])) {
                    @unlink($filename);
                }
                return true;
            }
        }

        else {
            return true;
        }
    }
}

function PT_DeleteFromToS3($filename, $config = array()) {
    global $pt;

    if ($pt->config->s3_upload != 'on' && $pt->config->ftp_upload != 'on') {
        return false;
    }

    if ($pt->config->ftp_upload == "on") {
        $ftp = new \FtpClient\FtpClient();
        $ftp->connect($pt->config->ftp_host, false, $pt->config->ftp_port);
        $login = $ftp->login($pt->config->ftp_username, $pt->config->ftp_password);
        
        if ($login) {
            if (!empty($pt->config->ftp_path)) {
                if ($pt->config->ftp_path != "./") {
                    $ftp->chdir($pt->config->ftp_path);
                }
            }
            $file_path = substr($filename, 0, strrpos( $filename, '/'));
            $file_name = substr($filename, strrpos( $filename, '/') + 1);
            $file_path_info = explode('/', $file_path);
            $path = '';
            if (!$ftp->isDir($file_path)) {
                return false;
            }
            $ftp->chdir($file_path);
            $ftp->pasv(true);
            if ($ftp->remove($file_name)) {
                return true;
            }
        }
    } else {
        $s3Config = (
            empty($pt->config->amazone_s3_key) || 
            empty($pt->config->amazone_s3_s_key) || 
            empty($pt->config->region) || 
            empty($pt->config->s3_bucket_name)
        ); 

        if ($s3Config){
            return false;
        }
        $s3 = new S3Client([
            'version'     => 'latest',
            'region'      => $pt->config->region,
            'credentials' => [
                'key'    => $pt->config->amazone_s3_key,
                'secret' => $pt->config->amazone_s3_s_key,
            ]
        ]);

        $s3->deleteObject([
            'Bucket' => $pt->config->s3_bucket_name,
            'Key'    => $filename,
        ]);

        if (!$s3->doesObjectExist($pt->config->s3_bucket_name, $filename)) {
            return true;
        }
    }
}

function PT_RegisterNewField($registration_data = array()) {
    global $pt, $mysqli;
    if (empty($registration_data)) {
        return false;
    }

    $fields      = '`' . implode('`, `', array_keys($registration_data)) . '`';
    $data        = '\'' . implode('\', \'', $registration_data) . '\'';
    $table       = T_FIELDS;
    $query       = mysqli_query($mysqli, "INSERT INTO  `$table` ({$fields}) VALUES ({$data})");

    if ($query) {
        $sql_id  = mysqli_insert_id($mysqli);
        $column  = 'fid_' . $sql_id;
        $table   = T_USR_PROF_FIELDS;
        $length  = $registration_data['length'];
        mysqli_query($mysqli, "ALTER TABLE `$table` ADD COLUMN `{$column}` varchar({$length}) NOT NULL DEFAULT ''");
        return true;
    }

    return false;
}

function PT_UpdateUserCustomData($user_id, $update_data, $loggedin = true) {
    global $pt, $sqlConnect;

    if ($loggedin == true) {
        if (IS_LOGGED == false) {
            return false;
        }
    }

    if (empty($user_id) || !is_numeric($user_id)) {
        return false;
    }

    if (empty($update_data)) {
        return false;
    }

    $user_id = PT_Secure($user_id);
    if ($loggedin == true) {
        if (PT_IsAdmin() === false) {
            if ($pt->user->id != $user_id) {
                return false;
            }
        }
    }

    $update = array();
    foreach ($update_data as $field => $data) {
        foreach ($data as $key => $value) {
            $update[] = '`' . $key . '` = \'' . PT_Secure($value, 0) . '\'';
        }
    }

    $impload     = implode(', ', $update);
    $table       = T_USR_PROF_FIELDS;
    $update_sql  = "UPDATE `$table` SET {$impload} WHERE `user_id` = {$user_id}";

    $usr_fields  = mysqli_query($sqlConnect, "SELECT COUNT(`id`) as count FROM `$table` WHERE `user_id` = {$user_id}");
    $usr_fields  = mysqli_fetch_assoc($usr_fields);
    $query       = false;

    if ($usr_fields['count'] == 1) {
        $query   = mysqli_query($sqlConnect, $update_sql);
    }

    else {
        $new_fid = mysqli_query($sqlConnect, "INSERT INTO `$table` (`user_id`) VALUES ({$user_id})");
        if ($new_fid) {
            $query = mysqli_query($sqlConnect, $update_sql);
        }
    }

    return $query;
}

function pt_comm_object_data($comment = null,$pinned = null){
    global $pt,$user,$db;
    if (!IS_LOGGED || empty($comment)) {
        return false;
    }

    $pt->is_comment_owner = false;      
    $replies              = '';
    $pt->pin              = false;
    $html                 = '';
    $comment_replies      = $db->where('comment_id', $comment->id)->get(T_COMM_REPLIES);
    $is_liked_comment     = '';
    $is_comment_disliked  = '';
    $comment_user_data    = PT_UserData($comment->user_id);
    $pt->is_verified      = ($comment_user_data->verified == 1) ? true : false;
    $pt->video_owner      = false;

    $db->where('id',$comment->video_id);
    $db->where('user_id',$user->id);
    $pt->video_owner = ($db->getValue(T_VIDEOS,'count(*)') > 0);
    foreach ($comment_replies as $reply) {
        $pt->is_reply_owner = false;
        $pt->is_ro_verified = false;
        $reply_user_data    = PT_UserData($reply->user_id);
        $is_liked_reply     = '';
        $is_disliked_reply  = '';
        if (IS_LOGGED == true) {
            $is_reply_owner = $db->where('id', $reply->id)->where('user_id', $user->id)->getValue(T_COMM_REPLIES, 'count(*)');
            if ($is_reply_owner || $pt->video_owner) {
                $pt->is_reply_owner = true;
            }

            //Check is this reply  voted by logged-in user
            $db->where('reply_id', $reply->id);
            $db->where('user_id', $user->id);
            $db->where('type', 1);
            $is_liked_reply    = ($db->getValue(T_COMMENTS_LIKES, 'count(*)') > 0) ? 'active' : '';

            $db->where('reply_id', $reply->id);
            $db->where('user_id', $user->id);
            $db->where('type', 2);
            $is_disliked_reply = ($db->getValue(T_COMMENTS_LIKES, 'count(*)') > 0) ? 'active' : '';
        }
        
        if ($reply_user_data->verified == 1) {
            $pt->is_ro_verified = true;
        }

        //Get related to reply likes
        $db->where('reply_id', $reply->id);
        $db->where('type', 1);
        $reply_likes    = $db->getValue(T_COMMENTS_LIKES, 'count(*)');

        $db->where('reply_id', $reply->id);
        $db->where('type', 2);
        $reply_dislikes = $db->getValue(T_COMMENTS_LIKES, 'count(*)');

        $replies    .= PT_LoadPage('watch/replies', array(
            'ID' => $reply->id,
            'TEXT' => PT_Markup($reply->text),
            'TIME' => PT_Time_Elapsed_String($reply->time),
            'USER_DATA' => $reply_user_data,
            'COMM_ID' => $comment->id,
            'LIKES'  => $reply_likes,
            'DIS_LIKES' => $reply_dislikes,
            'LIKED' => $is_liked_reply,
            'DIS_LIKED' => $is_disliked_reply,
        ));
    }

    if (IS_LOGGED == true) {
        $db->where('comment_id', $comment->id);
        $db->where('user_id', $user->id);

        $is_liked_comment = $db->getValue(T_COMMENTS_LIKES, 'count(*)');

        $db->where('comment_id', $comment->id);
        $db->where('user_id', $user->id);
        $db->where('type', 1);
        $is_liked_comment   = ($db->getValue(T_COMMENTS_LIKES, 'count(*)') > 0) ? 'active' : '';

        $db->where('comment_id', $comment->id);
        $db->where('user_id', $user->id);
        $db->where('type', 2);
        $is_comment_disliked = ($db->getValue(T_COMMENTS_LIKES, 'count(*)') > 0) ? 'active' : '';

        if ($user->id == $comment->user_id) {
            $pt->is_comment_owner = true;
        }

        $db->where('id',$comment->video_id);
        $db->where('user_id',$user->id);
        $pt->video_owner = ($db->getValue(T_VIDEOS,'count(*)') > 0);
    }

    $comm = ($pinned == true) ? 'includes/pinned-comments' : "comments";
    $html = PT_LoadPage("watch/$comm", array(
        'ID' => $comment->id,
        'TEXT' => PT_Markup($comment->text),
        'TIME' => PT_Time_Elapsed_String($comment->time),
        'USER_DATA' => $comment_user_data,
        'LIKES' => $comment->likes,
        'DIS_LIKES' => $comment->dis_likes,
        'LIKED' => $is_liked_comment,
        'DIS_LIKED' => $is_comment_disliked,
        'COMM_REPLIES' => $replies,
        'VID_ID' => $comment->video_id
    ));

    return $html;
}

function pt_push_channel_notifiations($video_id = 0) {
    global $pt, $db;
    if (IS_LOGGED == false) {
        return false;
    }
    $get_subscribers = $db->where('user_id', $pt->user->id)->get(T_SUBSCRIPTIONS);
    $userIds         = array();
    if (empty($get_subscribers)) {
        return false;
    }
    $video_uid = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'id');
    if (empty($video_uid)) {
        return false;
    }
    foreach ($get_subscribers as $key => $subscriber) {
        $userIds[] = "('{$pt->user->id}', '{$subscriber->subscriber_id}', '$video_uid', 'added_video', 'watch/{$video_id}', '" . time() . "')";
    }
    $query_implode       = implode(',', $userIds);
    $query_row           = $db->rawQuery("INSERT INTO " . T_NOTIFICATIONS . " (`notifier_id`, `recipient_id`, `video_id`, `type`, `url`, `time`) VALUES $query_implode");
    if ($query_row) {
        return true;
    }
}

function PT_GetMessageData($id = 0) {
    global $pt, $db;
    if (empty($id) || !IS_LOGGED) {
        return false;
    }
    $fetched_data = $db->where('id', PT_Secure($id))->getOne(T_MESSAGES);
    if (!empty($fetched_data)) {
        $fetched_data->text = PT_Markup($fetched_data->text);
        return $fetched_data;
    }
    return false;
}

function PT_GetMessages($id, $data = array(),$limit = 50) {
    global $pt, $db;
    if (IS_LOGGED == false) {
        return false;
    }

    $chat_id = PT_Secure($id);

    if (!empty($data['chat_user'])) {
        $chat_user = $data['chat_user'];
    } else {
        $chat_user = PT_UserData($chat_id);
    }
    

    $where = "((`from_id` = {$chat_id} AND `to_id` = {$pt->user->id} AND `to_deleted` = '0') OR (`from_id` = {$pt->user->id} AND `to_id` = {$chat_id} AND `from_deleted` = '0'))";

    // count messages
    $db->where($where);
    if (!empty($data['last_id'])) {
        $data['last_id'] = PT_Secure($data['last_id']);
        $db->where('id', $data['last_id'], '>');
    }

    if (!empty($data['first_id'])) {
        $data['first_id'] = PT_Secure($data['first_id']);
        $db->where('id', $data['first_id'], '<');
    }

    $count_user_messages = $db->getValue(T_MESSAGES, "count(*)");
    $count_user_messages = $count_user_messages - $limit;
    if ($count_user_messages < 1) {
        $count_user_messages = 0;
    }

    // get messages
    $db->where($where);
    if (!empty($data['last_id'])) {
        $db->where('id', $data['last_id'], '>');
    }

    if (!empty($data['first_id'])) {
        $db->where('id', $data['first_id'], '<');
    }

    $get_user_messages = $db->orderBy('id', 'ASC')->get(T_MESSAGES, array($count_user_messages, $limit));

    $messages_html = '';

    $return_methods = array('obj', 'html');

    $return_method = 'obj';
    if (!empty($data['return_method'])) {
        if (in_array($data['return_method'], $return_methods)) {
            $return_method = $data['return_method'];
        }
    }

    $update_seen = array();

    foreach ($get_user_messages as $key => $message) {
        if ($return_method == 'html') {
            $message_type = 'incoming';
            if ($message->from_id == $pt->user->id) {
                $message_type = 'outgoing';
            }
            $messages_html .= PT_LoadPage("messages/ajax/$message_type", array(
                'ID' => $message->id,
                'AVATAR' => $chat_user->avatar,
                'NAME' => $chat_user->name,
                'TEXT' => PT_MarkUp($message->text)
            ));
        }
        if ($message->seen == 0 && $message->to_id == $pt->user->id) {
            $update_seen[] = $message->id;
        }
    }

    if (!empty($update_seen)) {
        $update_seen = implode(',', $update_seen);
        $update_seen = $db->where("id IN ($update_seen)")->update(T_MESSAGES, array('seen' => time()));
    }

    return (!empty($messages_html)) ? $messages_html : $get_user_messages;
}


function PT_GetMessagesUserList($data = array()) {
    global $pt, $db;
    if (IS_LOGGED == false) {
        return false;
    }

    $db->where("user_one = {$pt->user->id}");
    
    if (isset($data['keyword'])) {
        $keyword = PT_Secure($data['keyword']);
        $db->where("user_two IN (SELECT id FROM users WHERE username LIKE '%$keyword%' OR CONCAT(`first_name`,  ' ', `last_name` ) LIKE '%$keyword%')");
    }

    $users = $db->orderBy('time', 'DESC')->get(T_CHATS, 20);

    $return_methods = array('obj', 'html');

    $return_method = 'obj';
    if (!empty($data['return_method'])) {
        if (in_array($data['return_method'], $return_methods)) {
            $return_method = $data['return_method'];
        }
    }

    $users_html = '';
    $data_array = array();
    foreach ($users as $key => $user) {
        $user = PT_UserData($user->user_two);
        if (!empty($user)) {
            $get_last_message = $db->where("((from_id = {$pt->user->id} AND to_id = $user->id AND `from_deleted` = '0') OR (from_id = $user->id AND to_id = {$pt->user->id} AND `to_deleted` = '0'))")->orderBy('id', 'DESC')->getOne(T_MESSAGES);
            $get_count_seen = $db->where("to_id = {$pt->user->id} AND from_id = $user->id AND `from_deleted` = '0' AND seen = 0")->orderBy('id', 'DESC')->getValue(T_MESSAGES, 'COUNT(*)');
            if ($return_method == 'html') {
                $users_html .= PT_LoadPage("messages/ajax/user-list", array(
                    'ID' => $user->id,
                    'AVATAR' => $user->avatar,
                    'NAME' => $user->name,
                    'LAST_MESSAGE' => (!empty($get_last_message->text)) ? PT_EditMarkup($get_last_message->text) : '',
                    'COUNT' => (!empty($get_count_seen)) ? $get_count_seen : '',
                    'USERNAME' => $user->username
                ));
            } else {
                $data_array[$key]['user'] = $user;
                $data_array[$key]['get_count_seen'] = $get_count_seen;
                $data_array[$key]['get_last_message'] = $get_last_message;
            }
        }
    }
    $users_obj = (!empty($data_array)) ? ToObject($data_array) : array();
    return (!empty($users_html)) ? $users_html : $users_obj;
}

function is_age($user_id = 0) {
    global $pt, $db;
    if (!IS_LOGGED) {
        return false;
    }

    if ($pt->user->age < 18) {
        return false;
    }
    return true;
}

function getTwitch($url){
    $channelsApi = $url;
    $clientId = 'twb88q5mhne1gsrwvkhtlugvrqniks';
    $ch = curl_init();

    curl_setopt_array($ch, array(
       CURLOPT_HTTPHEADER => array(
          'Client-ID: ' . $clientId,
          'Accept: application/vnd.twitchtv.v4+json'
       ),
       CURLOPT_RETURNTRANSFER => true,
       CURLOPT_URL => $channelsApi
    ));

    $response = curl_exec($ch);

    
    curl_close($ch);
    
    return $response;
}

function getTwitchApiUri($type) {
    $apiUrl = "https://api.twitch.tv/kraken";
    $apiCalls = array(
        "streams" => $apiUrl."/streams/",
        "search" => $apiUrl."/search/",
        "channel" => $apiUrl."/channels/",
        "user" => $apiUrl."/user/",
        "teams" => $apiUrl."/teams/",
        "clips" => $apiUrl."/clips/",
        "videos" => $apiUrl."/videos/",
    );
    return $apiCalls[$type];
}