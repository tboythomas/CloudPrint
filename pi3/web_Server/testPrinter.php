<!--
	This page tests the local connection with the printer
	and prints the result from printer
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
		<h2>Adding your local printer and printing test page...</h2>
		<p></p>
		<p>Go to <a href="formPage.html">Step 2: Device Setup</a></p>
			<?php
				$test = shell_exec("sudo /home/pi/Pi_Setup/cloudprint_Setup/addPrinter.sh")
			?>
	</div>

	<div id="footer">
		Designed By EE498 Plugable Team
	</div>

</body>
</html>
