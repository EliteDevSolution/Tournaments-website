<?php 

if (!IS_LOGGED || $pt->config->all_create_articles != 'on') {
	header('Location: ' . PT_Link('login'));
	exit;
}

$pt->page_url_ = $pt->config->site_url.'/create-team';
$pt->title       = $lang->create_article .' | ' . $pt->config->title;
$pt->page        = "create-team";
$pt->description = $pt->config->description;
$pt->keyword     = @$pt->config->keyword;
$pt->content     = PT_LoadPage('create-team/content');