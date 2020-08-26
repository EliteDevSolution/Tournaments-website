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

if (!PT_IsAdmin()) {
	$config = array_intersect_key($config, array_flip($site_public_data));
}

$response_data       = array(
    'api_status'     => '200',
    'api_version'    => $api_version,
    'data'           => array(
        'site_settings'  => $config,
        'categories'     => $categories
    )
);
