<?php 

if (!IS_LOGGED || $pt->config->user_ads != 'on') {
	header('Location: ' . PT_Link('404'));
	exit;
}


$payment_currency = $pt->config->payment_currency;
$currency         = "";
if ($payment_currency == "USD") {
	$currency     = "$";
}
else if($payment_currency == "EUR"){
	$currency     = "€";
}
$pt->page_url_ = $pt->config->site_url.'/ads/create';
$pt->title       = 'Create Advertising | ' . $pt->config->title;
$pt->page        = "user_ads";
$pt->description = $pt->config->description;
$pt->keyword     = @$pt->config->keyword;
$pt->content     = PT_LoadPage('create-ads/content',array(
	'CURRENCY'   => $currency
));