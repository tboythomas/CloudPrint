<!--
	This page attempts to removed the printer that failed to
	be added according to user input. Then it displays the result
	on the page
-->
<!DOCTYPE html>
<html>
<head>
	<title>Plugable Cloud Print</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
	<div id="header">
		<h1>Plugable Cloud Print Device</h1>
	</div>

	<div id="nav">
		<p><a href = "verified.html">Home</a></p>
                <p><a href="testPrinter.html">Step 1: Add and Test Printer</a></p>
                <p><a href="formPage.html">Step 2: Device Setup</a></p>
	</div>
	<div id="section">
		<p></p>
			<?php
		                $brand = $_POST["brand"];
				$remove = shell_exec("sudo /home/pi/Pi_Setup/cloudprint_Setup/removeOnePrinter.sh $brand");
				if ($remove == 1) {
					print("No matching printer is found, please try again with the correct brand name.\n");
					print("Or use the following link to manage printers:");
				} else {
     	          			print("$remove was removed\n");
					print("Please use the following link to manually re-add the printer:");
				}
			?>
		<p><a href="https://192.168.42.1:631/admin">Manual printer setup</a></p>
	</div>

	<div id="footer">
		Designed By EE498 Plugable Team
	</div>
</body>
</html>
