<?php
	session_start();
	
	require("conn.php");
	require("functions.php");

	$validid = pf_validate_number($_GET['id'], "redirect", $config_basedir);

	$prodsql = "SELECT * FROM products WHERE id = " . $validid . ";";
	$prodres = mysql_query($prodsql);
	$numrows = mysql_num_rows($prodres);		
	$prodrow = mysql_fetch_assoc($prodres);

	if($numrows == 0)
	{
		header("Location: " . $config_basedir);
	}
	else
	{
		if($_POST['submit'])
		{
			if(isset($_SESSION['SESS_ORDERNUM']) == TRUE)
			{
					if(isset($_SESSION['SESS_LOGGEDIN']) == TRUE)
					{
						$itemsql = "INSERT INTO order_items(order_id, product_id, quantity) VALUES("
						. $_SESSION['SESS_ORDERNUM'] . ", " . $validid . ", "
						. $_POST['amountBox'] . ")";
						mysql_query($itemsql);
					}
					else
					{
						$sql = "INSERT INTO orders(registered, date, session)
						VALUES(0, NOW(), '" . session_id() . "')";
						mysql_query($sql);
						$_SESSION['SESS_ORDERNUM'] = mysql_insert_id();
						$itemsql = "INSERT INTO order_items(order_id, product_id, quantity) VALUES("
						. $_SESSION['SESS_ORDERNUM'] . ", " . $validid . ", "
						. $_POST['amountBox'] . ")";
						mysql_query($itemsql);
						
						
						
					}
					
			}
			else
			{
				if($_SESSION['SESS_LOGGEDIN'])
				{
					$sql = "INSERT INTO orders(customer_id, registered, date) VALUES("
							. $_SESSION['SESS_USERID'] . ", 1, NOW())";
					mysql_query($sql);
					
					session_register("SESS_ORDERNUM");
					$_SESSION['SESS_ORDERNUM'] = mysql_insert_id();
					//mysql_insert_id get new id is insert late
					$itemsql = "INSERT INTO order_items(order_id, product_id, quantity) VALUES("
						. $_SESSION['SESS_ORDERNUM'] . ", " . $validid . ", "
						. $_POST['amountBox'] . ")";

					mysql_query($itemsql);
				}
				else
				{
					$sql = "INSERT INTO orders(registered, date, session)
						VALUES(" . "0, NOW(), '" . session_id() . "')";
					
					//session_id() get string session_id() on browns exam 7cd56vfpa2lfok8g1vc76rnm31
					
					mysql_query($sql);
					session_register("SESS_ORDERNUM");
					$_SESSION['SESS_ORDERNUM'] = mysql_insert_id();
					
					$itemsql = "INSERT INTO order_items(order_id, product_id, quantity)
						VALUES(" . $_SESSION['SESS_ORDERNUM'] . ", " . $validid . ", " . $_POST['amountBox'] . ")";

					mysql_query($itemsql);
				}					
			}


			
			
			$totalprice = $prodrow['price'] * $_POST['amountBox'] ;

			$updsql = "UPDATE orders SET total = total + " . $totalprice . " WHERE id = " . $_SESSION['SESS_ORDERNUM'] . ";";
			mysql_query($updres);
			
			header("Location: " . $config_basedir . "showcart.php");
		}
		else
		{
			require("header.php");

			echo "<form action='addtobasket.php?id=" . $_GET['id'] . "' method='POST'>";
			echo "<table cellpadding='10'>";
		
		
			echo "<tr>";
				if(empty($prodrow['image'])) {
					echo "<td><img src='./productimages/dummy.jpg' width='50' alt='" . $prodrow['name'] . "'></td>";
				}
				else {
					echo "<td><img src='./productimages/" . $prodrow['image'] . "' width='50' alt='" . $prodrow['name'] . "'></td>";
				}

				echo "<td>" . $prodrow['name'] . "</td>";
				echo "<td>Select Quantity <select name='amountBox'>";
			
				for($i=1;$i<=100;$i++)
				{
					echo "<option>" . $i . "</option>";
				}
			
				echo "</select></td>";
				echo "<td><strong>&pound;" . sprintf('%.2f', $prodrow['price']) . "</strong></td>";
				echo "<td><input type='submit' name='submit' value='Add to basket'></td>";
			echo "</tr>";
							
			echo "</table>";
			echo "</form>";
		}
	}

	require("footer.php");
?>
	
