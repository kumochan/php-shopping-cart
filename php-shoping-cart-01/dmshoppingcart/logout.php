<?php

	session_start();

	require("config.php");

	session_unregister("SESS_LOGGEDIN");
	session_unregister("SESS_USERNAME");
	session_unregister("SESS_USERID");
	//session_unregister("SESS_ORDERNUM");
	
	
	header("Location: " . $config_basedir);
?>
	
