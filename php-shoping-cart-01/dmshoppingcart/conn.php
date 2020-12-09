<?php
require ("config.php");
$link= mysql_connect($dbhost,$dbuser,$dbpassword) or die("Not connect to database".mysql_error());
mysql_select_db($dbdatabase,$link);
mysql_query('SET NAMES "utf8"',$link);
?>
