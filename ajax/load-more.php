<?php
if (empty($_GET['first']) || empty($_POST['last_id'])) {
 	$data = array('status' => 404);
} 

else {
	$type = PT_Secure($_GET['first']);
	$id = PT_Secure($_POST['last_id']);
	$views = 0;
	if (!empty($_GET['views'])) {
		$views = PT_Secure($_GET['views']);
	}
	$tr_id = 0;
	if (!empty($_GET['tr_id'])) {
		$tr_id = PT_Secure($_GET['tr_id']);
	}
	$final = '';
	$user_id = 0;
	if (!empty($_POST['user_id'])) {
		$user_id = PT_Secure($_POST['user_id']);
	}
	if ($type == 'subscriptions') {
		$get = $db->where('subscriber_id', $user->id)->get(T_SUBSCRIPTIONS);
		$userids = array();
		foreach ($get as $key => $userdata) {
		    $userids[] = $userdata->user_id;
		}
		$get_subscriptions_videos = false;
		$userids = implode(',', ToArray($userids));
		if (!empty($userids)) {
			$get_subscriptions_videos = $db->rawQuery("SELECT * FROM " . T_VIDEOS . " WHERE id < $id AND id <> $id AND user_id IN ($userids) AND privacy = 0 ORDER BY `id` DESC LIMIT 40");
		}
		if (!empty($get_subscriptions_videos)) {
		    $len = count($get_subscriptions_videos);
		    foreach ($get_subscriptions_videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('subscriptions/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} if ($type == 'my_videos') {
		$videos = $db->where('user_id', $user->id)->where('id', $id, '<')->orderBy('id', 'DESC')->get(T_VIDEOS, 40);
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('manage-videos/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} elseif ($type == 'video_studio') {

		
		$data = array();
		$videos = array();
		$types = array('likes','dislikes','comments');
		if (!empty($_POST['video_studio_type']) && in_array($_POST['video_studio_type'], $types) && !empty($_POST['video_studio_ids'])) {
			$limit = 2;
			$video_studio_ids = array();
			foreach ($_POST['video_studio_ids'] as $key => $value) {
				$video_studio_ids[] = PT_Secure($value);
			}
			$video_studio_ids_string = implode(',', $video_studio_ids);

			if ($_POST['video_studio_type'] == 'likes') {
				$videos_array = $db->rawQuery('SELECT video_id, COUNT(*) AS count FROM '.T_DIS_LIKES.' l WHERE (SELECT id FROM '.T_VIDEOS.' WHERE user_id = '.$pt->user->id.' AND id = l.video_id) = video_id AND video_id NOT IN ('.$video_studio_ids_string.') AND type = 1  GROUP BY video_id ORDER BY count DESC LIMIT '.$limit);
			}
			elseif ($_POST['video_studio_type'] == 'dislikes') {
				$videos_array = $db->rawQuery('SELECT video_id, COUNT(*) AS count FROM '.T_DIS_LIKES.' l WHERE (SELECT id FROM '.T_VIDEOS.' WHERE user_id = '.$pt->user->id.' AND id = l.video_id) = video_id AND video_id NOT IN ('.$video_studio_ids_string.') AND type = 2  GROUP BY video_id ORDER BY count DESC LIMIT '.$limit);
			}
			elseif ($_POST['video_studio_type'] == 'comments') {
				$videos_array = $db->rawQuery('SELECT video_id, COUNT(*) AS count FROM '.T_COMMENTS.' c WHERE (SELECT id FROM '.T_VIDEOS.' WHERE user_id = '.$pt->user->id.' AND id = c.video_id) = video_id AND video_id NOT IN ('.$video_studio_ids_string.') GROUP BY video_id ORDER BY count DESC LIMIT '.$limit);

			}
			if (empty($videos_array)) {
				$videos = $db->where('user_id', $pt->user->id)->where('id', $video_studio_ids, 'NOT IN')->orderBy('id', 'DESC')->get(T_VIDEOS, $limit);
			}




			// if ($_POST['video_studio_by_id'] == 1) {
			// 	 $videos = $db->where('user_id', $pt->user->id)->where('id', $video_studio_ids, 'NOT IN')->orderBy('id', 'DESC')->get(T_VIDEOS, $limit);
			// 	 foreach ($videos as $key => $value) {
	  //       		$in_ids[] = $value->id;
		 //         }
		 //         $data['video_ids_'] = $video_studio_ids.','.implode(',', $in_ids);
		 //         $data['by_ids'] = 1;
			// }
			// else{
				
				

   //              $in_ids = explode(',', PT_Secure($_POST['video_studio_ids']));
   //              if (!empty($videos_array)) {
   //              	if (count($videos_array) < $limit) {
			//         	$data['by_ids'] = 1;
			//         	foreach ($videos_array as $key => $value) {
			//         		$in_ids[] = $value->video_id;
			//         		$videos[] = $db->where('id',  $value->video_id)->getOne(T_VIDEOS);
			//         	}
			        	
			//         	$other_videos = $db->where('id',$in_ids, 'NOT IN')->where('user_id',  $pt->user->id)->orderBy('id', 'DESC')->get(T_VIDEOS, $limit - count($videos_array));
			//         	foreach ($other_videos as $key => $value) {
			//         		$in_ids[] = $value->id;
			//         		$videos[] = $db->where('id',  $value->id)->getOne(T_VIDEOS);
			//         	}
			//         }
			//         else{
			//         	$data['by_ids'] = 0;
			//         	foreach ($videos_array as $key => $value) {
			//         		$in_ids[] = $value->video_id;
			//         		$videos[] = $db->where('id',  $value->video_id)->getOne(T_VIDEOS);
			//         	}
			//         }
   //              }else{
   //              	$data['by_ids'] = 1;
   //              	$other_videos = $db->where('id',$in_ids, 'NOT IN')->where('user_id',  $pt->user->id)->orderBy('id', 'DESC')->get(T_VIDEOS, $limit);
		 //        	foreach ($other_videos as $key => $value) {
		 //        		$in_ids[] = $value->id;
		 //        		$videos[] = $db->where('id',  $value->id)->getOne(T_VIDEOS);
		 //        	}
   //              }

				
		 //        $data['video_ids_'] = $video_studio_ids.','.implode(',', $in_ids);
			// }
		}
		elseif (!empty($_POST['video_studio_type']) && $_POST['video_studio_type'] == 'views' && !empty($_POST['video_studio_ids'])) {
			$video_studio_ids = array();
			foreach ($_POST['video_studio_ids'] as $key => $value) {
				$video_studio_ids[] = PT_Secure($value);
			}
			$videos = $db->where('user_id', $user->id)->where('id',$video_studio_ids, 'NOT IN')->orderBy('views', 'DESC')->get(T_VIDEOS, 20);
		}
		else{
			$videos = $db->where('user_id', $user->id)->where('id', $id, '<')->orderBy('id', 'DESC')->get(T_VIDEOS, 40);
		}
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 1, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $comments_count = $db->rawQuery('SELECT COUNT(*) AS count FROM '.T_COMMENTS.' c WHERE  video_id = '.$video->id);
		        $final .= PT_LoadPage('video_studio/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id),
		            'V_ID'      => $video->video_id,
			        'LIKES'     => number_format($video->likes),
			        'DISLIKES'  => number_format($video->dislikes),
			        'COMMENTS'  => number_format($comments_count[0]->count)
		        ));
		    }
		    $data['status'] = 200;
		    $data['videos'] = $final;
		}
	} else if ($type == 'top') {
	    $ids = array();
	    if (!empty($_POST['ids'])) {
	    	foreach ($_POST['ids'] as $key => $one_id) {
	    		$ids[] = PT_Secure($one_id);
	    	}
	    }
	    $db->where('privacy', 0);
	    $videos = $db->where('views', $views, '<=')->where('id', $ids, 'NOT IN')->orderBy('views', 'DESC')->get(T_VIDEOS, 100);
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('videos/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'latest') {
		$db->where('privacy', 0);
		$videos = $db->where('id', $id, '<')->orderBy('id', 'DESC')->get(T_VIDEOS, 100);
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('videos/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'trending') {
		$db->where('privacy', 0);
		$videos = $db->where('time', time() - 172800, '>')->where('id', $id, '>')->orderBy('views', 'DESC')->get(T_VIDEOS, 40);
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('videos/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'history') {
		$videos = array();
		$get = $db->where('user_id', $user->id)->where('id', $id, '<')->orderby('id', 'DESC')->get(T_HISTORY, 40);
		if (!empty($get)) {
		    foreach ($get as $key => $video_) {
		       $fetched_video = $db->where('id', $video_->video_id)->getOne(T_VIDEOS);
		       $fetched_video->history_id = $video_->id;
		       $videos[] = $fetched_video;
		    }
		}
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('history/list', array(
		            'ID' => $video->history_id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'saved_videos') {
		$videos = array();
		$get = $db->where('user_id', $user->id)->where('id', $id, '<')->orderby('id', 'DESC')->get(T_SAVED, 40);
		if (!empty($get)) {
		    foreach ($get as $key => $video_) {
		       $fetched_video = $db->where('id', $video_->video_id)->getOne(T_VIDEOS);
		       $fetched_video->history_id = $video_->id;
		       $videos[] = $fetched_video;
		    }
		}
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('saved/list', array(
		            'ID' => $video->history_id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'liked_videos') {
		$videos = array();
		$get = $db->where('user_id', $user->id)->where('type', 1)->where('id', $id, '<')->orderby('id', 'DESC')->get(T_DIS_LIKES, 40);
		if (!empty($get)) {
		    foreach ($get as $key => $video_) {
		       $fetched_video = $db->where('id', $video_->video_id)->getOne(T_VIDEOS);
		       $fetched_video->like_id = $video_->id;
		       $videos[] = $fetched_video;
		    }
		}
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('liked-videos/list', array(
		            'ID' => $video->like_id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'category') {
		$videos = '';
		if (!empty($_GET['c_id'])) {
			if (in_array($_GET['c_id'], array_keys($categories))) {
				$cateogry = PT_Secure($_GET['c_id']);
				$is_found = $db->where('type',$cateogry)->where('lang_key',PT_Secure($_GET['sub_category']))->getValue(T_LANGS,'COUNT(*)');
                if ($is_found > 0) {
                    $db->where('sub_category', PT_Secure($_GET['sub_category']));
                }
	            
	            $db->where('privacy', 0);
	            $videos   = $db->where('category_id', $cateogry)->where('id', $id, '<')->orderBy('id', 'DESC')->get(T_VIDEOS, 40);
	        }
		}
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('videos/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'search') {
		$keyword = '';
		$category = '';
		$date = '';
		if (!empty($_POST['keyword'])) {
			$keyword = PT_Secure($_POST['keyword']);
		}
		if (!empty($keyword)) {
			if (isset($_POST['category']) && !empty($_POST['category'])) {
		        $cat_id = $_POST['category'];
		        $category = " AND category_id IN (".$cat_id.") ";
		    }
		    if (isset($_POST['date']) && !empty($_POST['date'])) {
		        if ($_POST['date'] == 'last_hour') {
		            $time = time()-(60*60);
		            $date = " AND time >= ".$time." ";
		        }
		        elseif ($_POST['date'] == 'today') {
		            $time = time()-(60*60*24);
		            $date = " AND time >= ".$time." ";
		        }
		        elseif ($_POST['date'] == 'this_week') {
		            $time = time()-(60*60*24*7);
		            $date = " AND time >= ".$time." ";
		        }
		        elseif ($_POST['date'] == 'this_month') {
		            $time = time()-(60*60*24*30);
		            $date = " AND time >= ".$time." ";
		        }
		        elseif ($_POST['date'] == 'this_year') {
		            $time = time()-(60*60*24*365);
		            $date = " AND time >= ".$time." ";
		        }
		    }
			if ($pt->config->total_videos > 1000000) {
			    $videos = $db->rawQuery("SELECT * FROM " . T_VIDEOS . " WHERE MATCH (title) AGAINST ('$keyword') AND id > $id AND privacy = 0 ".$category.$date." ORDER BY id ASC LIMIT 40");
			} else {
			    $videos = $db->rawQuery("SELECT * FROM " . T_VIDEOS . " WHERE title LIKE '%$keyword%' AND id > $id AND privacy = 0 ".$category.$date." ORDER BY id ASC LIMIT 40");
			}
			if (!empty($videos)) {
			    $len = count($videos);
			    foreach ($videos as $key => $video) {
			        $video = PT_GetVideoByID($video, 0, 0, 0);
			        $pt->last_video = false;
			        if ($key == $len - 1) {
			            $pt->last_video = true;
			        }
			        $final .= PT_LoadPage('search/list', array(
			            'ID' => $video->id,
			            'USER_DATA' => $video->owner,
			            'THUMBNAIL' => $video->thumbnail,
			            'URL' => $video->url,
			            'TITLE' => $video->title,
			            'DESC' => $video->markup_description,
			            'VIEWS' => $video->views,
			            'TIME' => $video->time_ago,
			            'DURATION' => $video->duration,
			            'VIEWS_NUM' => number_format($video->views),
			            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
			        ));
			    }
			    $data = array('status' => 200, 'videos' => $final);
			}
		}
	} else if ($type == 'profile_videos') {
		$videos = $db->where('user_id', $user_id)->where('id', $id, '<')->orderBy('id', 'DESC')->get(T_VIDEOS, 40);
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('videos/list', array(
		            'ID' => $video->id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	} else if ($type == 'liked_videos_profile') {
		$videos = array();
		$get = $db->where('user_id', $user_id)->where('type', 1)->where('id', $id, '<')->orderby('id', 'DESC')->get(T_DIS_LIKES, 40);
		if (!empty($get)) {
		    foreach ($get as $key => $video_) {
		       $fetched_video = $db->where('id', $video_->video_id)->getOne(T_VIDEOS);
		       $fetched_video->like_id = $video_->id;
		       $videos[] = $fetched_video;
		    }
		}
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('videos/list', array(
		            'ID' => $video->like_id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	}

	else if ($type == 'articles') {
		$request  = (!empty($_POST['last_id']) && is_numeric($_POST['last_id']));
		$articles = array();
		$data     = array('status' => 404);
		$posts    = "";

		if ($request === true) {
			$id              = PT_Secure($_POST['last_id']);

			if (empty($_POST['cat'])){
				$articles    = $db->where('active', '1')->where('id', $id, '<')->orderby('id', 'DESC')->get(T_POSTS, 10);
			}

			else if (!empty($_POST['cat']) && is_numeric($_POST['cat'])) {	
				$category_id = PT_Secure($_POST['cat']);
				$articles    = $db->where('active', '1')->where('id', $id, '<')->where('category', $category_id)->orderby('id', 'DESC')->get(T_POSTS, 10);
			}

			

			if (count($articles) > 0) {
				foreach ($articles as $key => $article) {
			        $posts .= PT_LoadPage('articles/list', array(
			            'ID' => $article->id,
				        'TITLE' => $article->title,
				        'DESC'  => PT_ShortText($article->description,150),
			            'VIEWS_NUM' => number_format($article->views),
				        'THUMBNAIL' => PT_GetMedia($article->image),
				        'URL' => PT_Link('articles/read/' . PT_URLSlug($article->title,$article->id)),
				        'TIME' => date('d-F-Y',$article->time),
				        'CAT' => $article->category,
				        'ARTICLE_URL' => PT_URLSlug($article->title,$article->id)
			        ));
			    }

			    $data = array('status' => 200, 'posts' => $posts);
			}

		    
		}
	}
	 else if ($type == 'paid_videos') {
		$videos = array();
		$get = $db->where('paid_id', $pt->user->id)->where('id', $tr_id, '<')->orderby('id', 'DESC')->get(T_VIDEOS_TRSNS, 40);
		if (!empty($get)) {
		    foreach ($get as $key => $video_) {
		       $fetched_video = $db->where('id', $video_->video_id)->getOne(T_VIDEOS);
		       $fetched_video->like_id = $video_->id;
		       $videos[] = $fetched_video;
		    }
		}
		if (!empty($videos)) {
		    $len = count($videos);
		    foreach ($videos as $key => $video) {
		        $video = PT_GetVideoByID($video, 0, 0, 0);
		        $pt->last_video = false;
		        if ($key == $len - 1) {
		            $pt->last_video = true;
		        }
		        $final .= PT_LoadPage('paid-videos/list', array(
		            'ID' => $video->like_id,
		            'USER_DATA' => $video->owner,
		            'THUMBNAIL' => $video->thumbnail,
		            'URL' => $video->url,
		            'TITLE' => $video->title,
		            'DESC' => $video->markup_description,
		            'VIEWS' => $video->views,
		            'TIME' => $video->time_ago,
		            'DURATION' => $video->duration,
		            'VIEWS_NUM' => number_format($video->views),
		            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id)
		        ));
		    }
		    $data = array('status' => 200, 'videos' => $final);
		}
	}else if ($type == 'video_comment') {
		$comment_id = PT_Secure($_POST['last_id']);
		$comments = $db->rawQuery('SELECT * FROM '.T_COMMENTS.' c WHERE (SELECT id FROM '.T_VIDEOS.' WHERE user_id = '.$pt->user->id.' AND id = c.video_id) = video_id AND c.id < '.$comment_id.' ORDER BY time DESC LIMIT 20');
		
		$html = '';
		foreach ($comments as $key => $comment) {
			$comment->text = PT_Duration($comment->text);
		    $is_liked_comment = 0;
		    $pt->is_comment_owner = false;      
		    $replies              = "";
		    $is_liked_comment     = '';
		    $is_comment_disliked  = '';
		    $comment_user_data    = PT_UserData($comment->user_id);
		    $pt->is_verified      = ($comment_user_data->verified == 1) ? true : false;

		    $db->where('comment_id', $comment->id);
		    $db->where('user_id', $pt->user->id);
		    $db->where('type', 1);
		    $is_liked_comment   = ($db->getValue(T_COMMENTS_LIKES, 'count(*)') > 0) ? 'active' : '';

		    $db->where('comment_id', $comment->id);
		    $db->where('user_id', $pt->user->id);
		    $db->where('type', 2);
		    $is_comment_disliked = ($db->getValue(T_COMMENTS_LIKES, 'count(*)') > 0) ? 'active' : '';

			$video = PT_GetVideoByID($comment->video_id, 0, 1,2);
			$html .= PT_LoadPage("comments/list", array(
											            'TITLE' => $video->title,
											            'URL' => $video->url,
											            'LIST_ID' => 1,
											            'VID_ID' => $video->id,
											            'ID' => $video->video_id,
											            'THUMBNAIL' => $video->thumbnail,
											            'VID_NUMBER' => ($video->video_id == $id) ? "<i class='fa fa-circle'></i>" : 1,
											            'VIDEO_ID_' => PT_Slug($video->title, $video->video_id),
											            'VIEWS' => $video->views,
											            'LIKES' => $video->likes,
											            'DISLIKES' => $video->dislikes,
											            'COMMENT' => PT_LoadPage('comments/comments', array(
															            'ID' => $comment->id,
															            'TEXT' => PT_Markup($comment->text),
															            'TIME' => PT_Time_Elapsed_String($comment->time),
															            'USER_DATA' => $comment_user_data,
															            'LIKES' => $comment->likes,
															            'DIS_LIKES' => $comment->dis_likes,
															            'LIKED' => $is_liked_comment,
															            'DIS_LIKED' => $is_comment_disliked,
															            'COMM_REPLIES' => $replies,
															            'VID_ID' => $video->id
															        )),
											            'COMMENT_ID' => $comment->id
											        ));
			$data = array('status' => 200, 'comments' => $html);
		}
	}else if ($type == 'popular_channels') {
		$types = array('views','subscribers');
		$type = 'views';

		if (!empty($_POST['sort_by']) && in_array($_POST['sort_by'], $types)) {
			$type = $_POST['sort_by'];
		}

		$sort_types = array('today','this_week','this_month','this_year','all_time');
		$sort_type = 'all_time';

		if (!empty($_POST['sort_type']) && in_array($_POST['sort_type'], $sort_types)) {
			$sort_type = $_POST['sort_type'];
		}
		if ($sort_type == 'today') {
			$start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
			$end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
		}
		else if ($sort_type == 'this_week') {
			$time = strtotime(date('l').", ".date('M')." ".date('d').", ".date('Y'));
			if (date('l') == 'Saturday') {
				$start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
			}
			else{
				$start = strtotime('last saturday, 12:00am', $time);
			}

			if (date('l') == 'Friday') {
				$end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
			}
			else{
				$end = strtotime('next Friday, 11:59pm', $time);
			}
		}
		else if ($sort_type == 'this_month') {
			$start = strtotime("1 ".date('M')." ".date('Y')." 12:00am");
			$end = strtotime(cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'))." ".date('M')." ".date('Y')." 11:59pm");
		}
		else if ($sort_type == 'this_year') {
			$start = strtotime("1 January ".date('Y')." 12:00am");
			$end = strtotime("31 December ".date('Y')." 11:59pm");
		}

		if ($type == 'views') {
			$ids = implode(',', $_POST['channels_ids']);
			$last_view = PT_Secure($_POST['last_id']);
			if ($sort_type == 'all_time') {
				$videos = $db->rawQuery('SELECT user_id, SUM(views) AS count FROM '.T_VIDEOS.' WHERE user_id NOT IN ('.$ids.') GROUP BY user_id HAVING count <= '.$last_view.' ORDER BY count DESC LIMIT 20');
			}
			else{
				
				$videos = $db->rawQuery('SELECT u.user_id AS user_id , v.video_id, COUNT(*) AS count FROM '.T_VIEWS.' v ,'.T_VIDEOS.' u WHERE v.time >= '.$start.' AND v.time <= '.$end.' AND u.id = v.video_id AND  u.user_id NOT IN ('.$ids.') GROUP BY u.user_id HAVING count <= '.$last_view.' ORDER BY count DESC LIMIT 20');
			}
			
			// if (count($videos) < 20) {
			// 	$users_ids = explode(',', $ids);
			// 	foreach ($videos as $key => $value) {
			// 		$users_ids[] = $value->user_id;
			// 	}

			// 	$limit = (20 - count($videos) == 1)  ? 2 : (20 - count($videos));
			// 	$last_videos = $db->where('id',$users_ids,'NOT IN')->orderBy("id","DESC")->get(T_USERS,$limit);
			// 	if (!empty($last_videos)) {
			// 		foreach ($last_videos as $key => $value) {
			// 			$value->user_id = $value->id;
			// 			$value->count = 0;
			// 			$videos[] = $value;
			// 		}
			// 	}
			// }
		}
		elseif ($type == 'subscribers') {
			$ids = implode(',', $_POST['channels_ids']);
			$last_view = PT_Secure($_POST['last_id']);
			if ($sort_type == 'all_time') {
				$videos = $db->rawQuery('SELECT user_id, COUNT(*) AS count FROM '.T_SUBSCRIPTIONS.' WHERE user_id NOT IN ('.$ids.') GROUP BY user_id HAVING count <= '.$last_view.' ORDER BY count DESC LIMIT 20');
			}
			else{
				$videos = $db->rawQuery('SELECT user_id, COUNT(*) AS count FROM '.T_SUBSCRIPTIONS.' WHERE time >= '.$start.' AND time <= '.$end.' AND user_id NOT IN ('.$ids.')  GROUP BY user_id HAVING count <= '.$last_view.' ORDER BY count DESC LIMIT 20');

			}
			// if (count($videos) < 20) {
			// 	$users_ids = explode(',', $ids);
			// 	foreach ($videos as $key => $value) {
			// 		$users_ids[] = $value->user_id;
			// 	}

			// 	$limit = (20 - count($videos) == 1)  ? 2 : (20 - count($videos));
			// 	$last_videos = $db->where('id',$users_ids,'NOT IN')->orderBy("id","DESC")->get(T_USERS,$limit);
			// 	if (!empty($last_videos)) {
			// 		foreach ($last_videos as $key => $value) {
			// 			$value->user_id = $value->id;
			// 			$value->count = 0;
			// 			$videos[] = $value;
			// 		}
			// 	}
			// }
		}

		$html = '';
		if (!empty($videos)) {
			foreach ($videos as $key => $value) {
				if ($type == 'views') {
					$views_count = number_format($value->count);
					$views_ = $value->count;
					$subscribers = $db->rawQuery('SELECT COUNT(*) AS count FROM '.T_SUBSCRIPTIONS.' WHERE user_id = '.$value->user_id.' GROUP BY user_id LIMIT 1');
					
					$subscribers_count = 0;
					if (isset($subscribers[0])) {
						$subscribers_count = ($subscribers[0]->count > 0) ? number_format($subscribers[0]->count) : 0;
					}
				}
				elseif ($type == 'subscribers') {
					$subscribers_count = number_format($value->count);
					$views_ = $value->count;
					$views = $db->rawQuery('SELECT SUM(views) AS count FROM '.T_VIDEOS.' WHERE user_id = '.$value->user_id.' GROUP BY user_id LIMIT 1');
					$views_count = 0;
					if (isset($views[0])) {
						$views_count = ($views[0]->count > 0) ? number_format($views[0]->count) : 0;
					}
					
				}
		    	$user = PT_UserData($value->user_id);
		    	if (!empty($user)) {
		    		if (strlen($user->name) > 25) {
			    		$user->name = mb_substr($user->name, 0,25, "UTF-8").'..';
			    	}
		    		$html .= PT_LoadPage('popular_channels/list', array(
					    'ID' => $user->id,
					    'USER_DATA' => $user,
					    'VIEWS' => $views_count,
					    'VIEWS_COUNT' => $views_,
					    'SUB' => $subscribers_count
					));
		    	}
		    	
		    }
		    $data['status'] = 200;
			$data['videos'] = $html;
		}
	}
}  