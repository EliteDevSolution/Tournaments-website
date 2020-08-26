<?php

if (IS_LOGGED == false) {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
}


use PayPal\Api\Payer;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Details;
use PayPal\Api\Amount;
use PayPal\Api\Transaction;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;


$payment_currency = $pt->config->payment_currency;
$payer        = new Payer();
$item         = new Item();
$itemList     = new ItemList();
$details      = new Details();
$amount       = new Amount();
$transaction  = new Transaction();
$redirectUrls = new RedirectUrls();
$payment      = new Payment();
$payer->setPaymentMethod('paypal');

if($first == 'donate')
{
	$amount  = floatval($_POST['amount']);
	$me_email = $pt->user->email;
	$tblname = T_USERS;
	$donate_email = $pt->user->donation_paypal_email;
	$res = $db->rawQuery("Select count(*) cnt from $tblname where email = '$donate_email'");
	if(intval($res[0]->cnt) != 1) exit;
	$balance = floatval($pt->user->balance_or);
	if($amount > $balance) exit;
	if(empty($donate_email)) exit;
	if($amount > $balance) exit;
	$strQuery = "UPDATE $tblname SET balance = balance - $amount WHERE email = '$me_email';";
	$db->rawQuery($strQuery);
	$strQuery = "UPDATE $tblname SET balance = balance + $amount WHERE email = '$donate_email';";
	$db->rawQuery($strQuery);	
	$data = array('status' => 200);
}


if($first == 'paidwallet')
{
	$data = array('status' => 400);
	$amount  = floatval($_POST['amount']);
	$me_email = $pt->user->email;
	$tblname = T_USERS;
	$curwallet = floatval($pt->user->wallet);
	if($amount > $curwallet) exit;
	$strQuery = "UPDATE $tblname SET wallet = wallet - $amount WHERE email = '$me_email';";
	$db->rawQuery($strQuery);
	$data = array('status' => 200);
}

if($first == 'paidcash')
{
	$data    = array('status' => 400);
	$request = (!empty($_POST['amount']) && is_numeric($_POST['amount']));
	if ($request === true) 
	{
		if($pt->config->payment_mode == 'paytm')
		{
			// $tourid = $_POST['tourid'];
			// $post_data = array();
		 //    $rep_amount  = $_POST['amount'];
   //          $redirectUrl = PT_Link("aj/wallet/get_paid?status=success&amount=$rep_amount");
			// $redirectUrls->setReturnUrl($redirectUrl)->setCancelUrl(PT_Link(''));    
		 //    $item->setName('Replenish your balance')->setQuantity(1)->setPrice($rep_amount)->setCurrency($payment_currency);  
		 //    $itemList->setItems(array($item));    
		 //    $details->setSubtotal($rep_amount);
		 //    $amount->setCurrency($payment_currency)->setTotal($rep_amount)->setDetails($details);
		 //    $transaction->setAmount($amount)->setItemList($itemList)->setDescription('Replenish your balance')->setInvoiceNumber(time());

		 //    //Paytm
		 //    $orderId = "ORDS" . rand(10000,99999999);
		 //    $merchantMid = PAYTM_MERCHANT_MID;
		 //    $merchantKey = PAYTM_MERCHANT_KEY;
		 //    $paytmParams["MID"] = $merchantMid;
		 //    $paytmParams["ORDERID"] = $orderId; 
		 //    $paytmChecksum = getChecksumFromArray($paytmParams, $merchantKey);
		 //    $paytmParams['CHECKSUMHASH'] = urlencode($paytmChecksum);
		 //    $postData = "JsonData=".json_encode($paytmParams, JSON_UNESCAPED_SLASHES);
		 //    $connection = curl_init(); // initiate curl
		 //    // $transactionURL = "https://securegw.paytm.in/order/status"; // for production
		 //    $transactionURL = "https://securegw-stage.paytm.in/order/status";
		 //    curl_setopt($connection, CURLOPT_SSL_VERIFYHOST, 0);
		 //    curl_setopt($connection, CURLOPT_SSL_VERIFYPEER, 0);
		 //    curl_setopt($connection, CURLOPT_URL, $transactionURL);
		 //    curl_setopt($connection, CURLOPT_POST, true);
		 //    curl_setopt($connection, CURLOPT_POSTFIELDS, $postData);
		 //    curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
		 //    curl_setopt($connection, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
		 //    $responseReader = curl_exec($connection);
		 //    $responseData = json_decode($responseReader, true);
		 //    echo "<pre>"; print_r($responseData); echo "</pre>";
      	
		} else if($pt->config->payment_mode == 'paypal')
		{
			$tourid = $_POST['tourid'];
			$rep_amount  = $_POST['amount'];
			$redirectUrl = PT_Link("aj/wallet/get_join_paid?status=success&amount=$rep_amount&tourid=$tourid");
			$redirectUrls->setReturnUrl($redirectUrl)->setCancelUrl(PT_Link(''));    
		    $item->setName('Replenish your balance')->setQuantity(1)->setPrice($rep_amount)->setCurrency($payment_currency);  
		    $itemList->setItems(array($item));    
		    $details->setSubtotal($rep_amount);
		    $amount->setCurrency($payment_currency)->setTotal($rep_amount)->setDetails($details);
		    $transaction->setAmount($amount)->setItemList($itemList)->setDescription('Join paid')->setInvoiceNumber(time());
		    $payment->setIntent('sale')->setPayer($payer)->setRedirectUrls($redirectUrls)->setTransactions(array(
		        $transaction
		    ));

		    try {
		        $payment->create($paypal);
		    }

		    catch (Exception $e) {
		        $data = array(
		            'type' => 'ERROR',
		            'details' => json_decode($e->getData())
		        );

		        if (empty($data['details'])) {
		            $data['details'] = json_decode($e->getCode());
		        }
		        echo json_encode($data);
		    	exit();
		    }

		    $data = array(
		        'status' => 200,
		        'type' => 'SUCCESS',
		        'url' => $payment->getApprovalLink()
		    );
		}
    }
}

if ($first == 'replenish') 
{
	$data    = array('status' => 400);
	$request = (!empty($_POST['amount']) && is_numeric($_POST['amount']));
	if ($request === true) 
	{
		if($pt->config->payment_mode == 'fastpay')
		{
                $post_data = array();
                $rep_amount  = $_POST['amount'];
                $redirectUrl = PT_Link("aj/wallet/get_paid?status=success&amount=$rep_amount");
				$redirectUrls->setReturnUrl($redirectUrl)->setCancelUrl(PT_Link(''));    
			    $item->setName('Replenish your balance')->setQuantity(1)->setPrice($rep_amount)->setCurrency($payment_currency);  
			    $itemList->setItems(array($item));    
			    $details->setSubtotal($rep_amount);
			    $amount->setCurrency($payment_currency)->setTotal($rep_amount)->setDetails($details);
			    $transaction->setAmount($amount)->setItemList($itemList)->setDescription('Replenish your balance')->setInvoiceNumber(time());
                $post_data['merchant_mobile_no'] = $pt->config->fastpay_id;
                $post_data['store_password'] = $pt->config->fastpay_secret;
                $post_data['order_id'] = "replenish_".time();
                $post_data['bill_amount'] = $rep_amount;
                $post_data['success_url'] = $redirectUrl;
                $post_data['fail_url'] = PT_Link('');
                $post_data['cancel_url'] = PT_Link('');
               	try
               	{
               		if($pt->config->fastpay_mode == 'live')
               		{
               			$direct_api_url = "https://secure.fast-pay.cash/merchant/generate-payment-token";               			
               		} else
               		{
               			$direct_api_url = "https://dev.fast-pay.cash/merchant/generate-payment-token";               			
               		}
					$handle = curl_init();
					curl_setopt($handle, CURLOPT_URL, $direct_api_url );
					curl_setopt($handle, CURLOPT_TIMEOUT, 10);
					curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 10);
					curl_setopt($handle, CURLOPT_POST, 1 );
					curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
					curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);

					$content = curl_exec($handle );

					$code = curl_getinfo($handle, CURLINFO_HTTP_CODE);
                    
					if($code == 200 && !( curl_errno($handle))) {
						curl_close( $handle);
						$response = $content;
					} else {
						curl_close( $handle);
						$data = array('type' => 'ERROR', 'details' => '');
					}
					# PARSE THE JSON RESPONSE
					$response = json_decode($response, true );
					if($response["code"] == 200)
					{
                        $token = $response["token"];
                        if($pt->config->fastpay_mode == 'live')
                   		{
                   			$aproval_url = "https://secure.fast-pay.cash/merchant/payment?token=$token";
                   		} else
                   		{
                   			$aproval_url = "https://dev.fast-pay.cash/merchant/payment?token=$token";             			
                   		}
                        $data = array(
    			        'status' => 200,
    			        'type' => 'SUCCESS',
    			        'url' => $aproval_url);
					}   
    			        //var_dump($data);
               	} catch(Exception $e)
               	{
               		$data = array(
			            'type' => 'ERROR',
			            'details' => json_decode($e->getData())
			        );
               	}
               	
			} else
			{
				$rep_amount  = $_POST['amount'];
				$redirectUrl = PT_Link("aj/wallet/get_paid?status=success&amount=$rep_amount");
				$redirectUrls->setReturnUrl($redirectUrl)->setCancelUrl(PT_Link(''));    
			    $item->setName('Replenish your balance')->setQuantity(1)->setPrice($rep_amount)->setCurrency($payment_currency);  
			    $itemList->setItems(array($item));    
			    $details->setSubtotal($rep_amount);
			    $amount->setCurrency($payment_currency)->setTotal($rep_amount)->setDetails($details);
			    $transaction->setAmount($amount)->setItemList($itemList)->setDescription('Replenish your balance')->setInvoiceNumber(time());
			    $payment->setIntent('sale')->setPayer($payer)->setRedirectUrls($redirectUrls)->setTransactions(array(
			        $transaction
			    ));

			    try {
			        $payment->create($paypal);
			    }

			    catch (Exception $e) {
			        $data = array(
			            'type' => 'ERROR',
			            'details' => json_decode($e->getData())
			        );

			        if (empty($data['details'])) {
			            $data['details'] = json_decode($e->getCode());
			        }
			        echo json_encode($data);
			    	exit();
			    }

			    $data = array(
			        'status' => 200,
			        'type' => 'SUCCESS',
			        'url' => $payment->getApprovalLink()
			    );
		}
    }
}
if ($first == 'get_paid') {
	$data['status'] = 500;
	$request        = (
		!empty($_GET['paymentId']) && 
		!empty($_GET['PayerID']) && 
		!empty($_GET['status']) && 
		!empty($_GET['amount']) && 
		is_numeric($_GET['amount']) && 
		$_GET['status'] == 'success'
	);

	if ($request === true) {

		$paymentId = PT_Secure($_GET['paymentId']);
		$PayerID   = PT_Secure($_GET['PayerID']);
		$payment   = Payment::get($paymentId, $paypal);
	    $execute   = new PaymentExecution();
	    $execute->setPayerId($PayerID);

	    try{
	        $result = $payment->execute($execute, $paypal);
	    }

	    catch (Exception $e) {
	        $data = array(
	            'type' => 'ERROR',
	            'details' => json_decode($e->getData())
	        );

	        if (empty($data['details'])) {
	            $data['details'] = json_decode($e->getCode());
	        }

	        echo json_encode($data);
	    	exit();
	    }

		$amount  = $_GET['amount'];
		$update  = array('wallet' => ($user->wallet += $amount));
		$db->where('id',$user->id)->update(T_USERS,$update);
		$_SESSION['upgraded'] = true;
		$url     = PT_Link('ads');
    	header("Location: $url");
    	exit();
	}
}

if ($first == 'get_paid_paytm') 
{
	$amount  = $_GET['amount'];

	/// Paytm pay

	$paytmChecksum = "";
	$paramList = array();
	$isValidChecksum = "FALSE";

	$paramList = $_POST;
	$paytmChecksum = isset($_POST["CHECKSUMHASH"]) ? $_POST["CHECKSUMHASH"] : ""; //Sent by Paytm pg

	//Verify all parameters received from Paytm pg to your application. Like MID received from paytm pg is same as your application’s MID, TXN_AMOUNT and ORDER_ID are same as what was sent by you to Paytm PG for initiating transaction etc.
	$isValidChecksum = verifychecksum_e($paramList, PAYTM_MERCHANT_KEY, $paytmChecksum); //will return TRUE or FALSE string.


	$paytmstate = false;
	if($isValidChecksum == "TRUE") 
	{
	    if ($_POST["STATUS"] == "TXN_SUCCESS") 
	    {
	        $paytmstate = true;
	        $id = $tour->id;
       		$pt->paytmChecksum = $paytmChecksum;
			$pt->paytmstate = $paytmstate;
			$update  = array('wallet' => ($user->wallet += $amount));
			$db->where('id',$user->id)->update(T_USERS,$update);
	        //Process your transaction here as success transaction.
	        //Verify amount & order id received from Payment gateway with your application's order id and amount.
	    }
	}
	$url = PT_Link('ads');
	$pt->paytmcheck = true;
	$_SESSION['upgraded'] = true;
	header("Location: $url");
	exit();
}

if($first == "get_join_paid")
{
	$data['status'] = 500;
	$request        = (
		!empty($_GET['paymentId']) && 
		!empty($_GET['PayerID']) && 
		!empty($_GET['status']) && 
		!empty($_GET['amount']) && 
		is_numeric($_GET['amount']) && 
		$_GET['status'] == 'success'
	);

	if ($request === true) {

		$paymentId = PT_Secure($_GET['paymentId']);
		$PayerID   = PT_Secure($_GET['PayerID']);
		$payment   = Payment::get($paymentId, $paypal);
	    $execute   = new PaymentExecution();
	    $execute->setPayerId($PayerID);

	    try{
	        $result = $payment->execute($execute, $paypal);
	    }

	    catch (Exception $e) {
	        $data = array(
	            'type' => 'ERROR',
	            'details' => json_decode($e->getData())
	        );

	        if (empty($data['details'])) {
	            $data['details'] = json_decode($e->getCode());
	        }

	        echo json_encode($data);
	    	exit();
	    }

		$id = PT_Secure($_GET['tourid']);
	    $db->where('tourid', $id);
	    $db->where('userid', $pt->user->id);
	    $exists = $db->getOne(T_PARTICIPANTS);
	    if(empty($exists))
	    {
	        $insert_data = array();
	        $insert_data = array(
	            'tourid' => $id,
	            'userid' => $pt->user->id,
	            'time' => time(),
	            'join' => 1,
	            'state' => 0
	        );
	        $res = $db->insert(T_PARTICIPANTS, $insert_data);
	        $tblname = T_TOURNAMENTS;
	        $db->rawQuery("Update $tblname Set joincount=joincount+1 where id=$id");	
		}
		$url = PT_Link("tournament_read?id=$id");
    	header("Location: $url");
    	exit();
  } 
}
