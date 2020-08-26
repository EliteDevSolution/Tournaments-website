<?php
if (!empty($_POST['name']) && isset($_POST['value'])) {
 	$_SESSION[$_POST['name']] = PT_Secure($_POST['value']);
} 