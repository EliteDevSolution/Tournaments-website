<?php 
	
	//$user_id   = $pt->user->id;
	//$type      = (!empty($_GET['t'])) ? PT_Secure($_GET['t']) : 'all';
	//$show_all  = (!empty($_GET['hash'])) ? PT_Secure($_GET['hash']) : false;
		$data['state'] = 400;
		if(!empty($_GET['hash']) && $_GET['hash'] == "8e7c40fdd7caa2334a21a5f40e5d4c0f6fccd21c" )
		{
			date_default_timezone_set('Asia/Kolkata');
			// First function is tournament starting detection.
			$tbltour = T_TOURNAMENTS;
			$tbluser = T_USERS;
			$tblparti = T_PARTICIPANTS;	
			$tblnoti = T_NOTIFICATIONS;
			$strQuery = "Select * from $tbltour where state = 'OPEN' and id=1 order by time DESC";
    		$tourlst = $db->rawQuery($strQuery);
    		//04/30/2019 10:55 PM
    		$regtime = 0;
			foreach ($tourlst as $key => $value) {
				$curtourid = $value->id;
				$title = $value->title;
				$partilst = array();
				$regtime = strtotime($value->startdate);
				$time_elapse = 	time_ago($regtime);
				var_dump(date('d M Y h:i:s A',$regtime));
				 var_dump(date('d M Y h:i:s A',time()));
				 echo $time_elapse;
				 //exit;
				if($time_elapse > 5 || $time_elapse < 16)	//Send Tournament Live Action....
				{
					$db->rawQuery("Update $tbltour set state='LIVE' where id=$curtourid");
					$strQuery = "Select * from $tblparti where tourid = $curtourid order by time asc";
					$partilst =  $db->rawQuery($strQuery);
					foreach ($partilst as $key => $value) 
					{	
						$curcheckoutkey = PT_GenerateKey();
						$userid = $value->userid;
						$id = $value->id;
						$title = PT_ShortText($title, 10);
						$strQuery = "update $tblparti set checkout='$curcheckoutkey' where id=$id";
						$db->rawQuery($strQuery);
						$insertdata = array(
							'recipient_id' => $userid,
							'type' => 'tournament_checkout',
							'text' => "Checkout the $title Tournaments  [Key: $curcheckoutkey]",
							'url'  => 'tournament_read?id='.$value->tourid.'&checkout='.$curcheckoutkey,
							'time' => time()
 						);
						$res = $db->insert(T_NOTIFICATIONS, $insertdata);
					}
				}
			 }    		
   //  $data_insert = false;
	// $data_insert = array(
   //  'time' => time(),
   //  'count' => 100);
			// $db->insert('cron', $data_insert);
			$data['state'] = 200;		
			$data['result'] = "OK";
	}
	
	function time_ago($ptime)
	{
		$etime = $ptime - time();
		    if ($etime < 1) {
		        return '0';
		    }
		    $a = array(
		        365 * 24 * 60 * 60 => 'year',
		        30 * 24 * 60 * 60 => 'month',
		        24 * 60 * 60 => 'day',
		        60 * 60 => 'hour',
		        60 => 'min',
		        1 => 'second'
		    );
		    $a_plural = array(
		        'year' => 'years',
		        'month' => 'months',
		        'day' => 'days',
		        'hour' => 'hours',
		        'min' => 'mins',
		        'second' => 'seconds'
		    );
		    // foreach ($a as $secs => $str) {
		    //     $d = $etime / $secs;
		    //     if ($d >= 1) {
		    //         $r = round($d);
		    //         $time_ago = $r . ' ' . ($r > 1 ? $a_plural[$str] : $str);
		    //         return $time_ago;
		    //     }
		    // }
		    return round($etime/60);
	}	
?>