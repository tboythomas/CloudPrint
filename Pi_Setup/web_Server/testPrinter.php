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
		<p><a href = "index.html">Home</a></p>
		<p><a href="http:\/\/192.168.42.1:631" target="_blank">Step 1: Add Printer/CUPS</a></p>
                <p><a href="testPrinter.html">Step 2: Test Printer Connection</a></p>
                <p><a href="formPage.html">Step 3: Device Setup</a></p>
	</div>
	<div id="section">
		<h2>Printing test page now...</h2>
		<p></p>
		<p>Go to <a href="formPage.html">Step 3: Device Setup</a></p>
			<?php
				$brand = $_POST["printer"];
				$test = shell_exec("sudo /home/pi/Pi_Setup/cloudprint_Setup/print.sh $brand /home/pi/Pi_Setup/cloudprint_Setup/testPrint.txt")
			?>
	</div>

	<div id="footer">
		Designed By EE498 Plugable Team
	</div>

</body>
</html>
