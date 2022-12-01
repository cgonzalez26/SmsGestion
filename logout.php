<?php
	session_start();
	include_once("_global.php");
	unset($_SESSION);
	$_SESSION = array();
	session_destroy();			
	go_url( BASE_URL ."/index.php");

?>