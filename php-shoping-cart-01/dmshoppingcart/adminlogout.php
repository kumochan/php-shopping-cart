<?php

	session_start();

	require("config.php");

	session_unregister("SESS_ADMINLOGGEDIN");
	session_unregister("SESS_ADMIN_NAME");
	
	header("Location: " . $config_basedir);
?>
	
