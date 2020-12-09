<?php
	//session_start();
	require("header.php");

	//require("conn.php");
	
	if(isset($_SESSION['SESS_ADMINLOGGEDIN']) == TRUE) {
		header("Location: " . $config_basedir);
	}
	
	if(isset($_POST['submit'])==TRUE)
	{
		$loginsql = "SELECT * FROM admins
			WHERE username = '" . $_POST['userBox'] . "'
			AND password = '" . $_POST['passBox'] . "'";
		$loginres = mysql_query($loginsql);
		
		$numrows = mysql_num_rows($loginres);	
		
		
		if($numrows == 1)
		{
			$loginrow = mysql_fetch_assoc($loginres);
			
			session_register("SESS_ADMINLOGGEDIN");
			session_register("SESS_ADMIN_NAME");			
			
			$_SESSION['SESS_ADMINLOGGEDIN'] = 1;
			$_SESSION['SESS_ADMIN_NAME'] = $loginrow['username'];
			
			
			header("Location: " . $config_basedir  . "adminorders.php");

		}
		else
		{
			header("Location: " . $config_basedir  . "adminlogin.php?error=1");
		}
	}
	else
	{

	///require("header.php");
		
	echo "<h1>Admin Login</h1>";
	
	if(isset($_GET['error']) == TRUE) {
		echo "<strong>Incorrect username/password!</strong>";
	}
?>
	<p>
	<form action="<?php echo $_SERVER['SCRIPT_NAME']; ?>" method="POST">
	<table>
		<tr>
			<td>Username</td>
			<td><input type="textbox" name="userBox">
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="passBox">
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="submit" value="Log in">
		</tr>		
	</table>
	</form>
	
<?php
	}
	
	require("footer.php");
?>
	
