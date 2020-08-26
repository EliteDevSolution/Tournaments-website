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

// You can access the admin panel by using the following url: http://yoursite.com/admincp 

require 'assets/init.php';

if (IS_LOGGED == false || PT_IsAdmin() == false) {
	header("Location: " . PT_Link(''));
    exit();
}

// autoload admin panel files
require 'admin-panel/autoload.php';