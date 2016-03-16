<?php
	$name = $_POST["name"];
	$password = $_POST["password"];
	$email = $_POST["email"];
	if($name == '') {
		print("Please Provide the name of your wireless network.");
	}
	if($email == '') {
		print("Please provide a Google cloud print account.");
	}

	# excute the bash file to connect to wireless network
	$output = shell_exec("sudo /home/pi/Pi_Setup/client_Setup/wifi_login.sh $name $password");
	$client = shell_exec("sudo /home/pi/Pi_Setup/client_Setup/switchToWlanClient.sh");
	sleep(20);
	$connection = shell_exec("sudo /home/pi/Pi_Setup/client_Setup/checkWifi.sh $name");
	print($connection);
	if($connection == 0) {
		$ap = shell_exec("sudo /home/pi/Pi_Setup/AP_Setup/toRouter.sh");
		print($ap);
	} else {
		// get the code
		$code = shell_exec("sudo /home/pi/Pi_Setup/cloudprint_Setup/connector.sh $email weee");
		// get the subject
		$subject = 'Access Code to CloudPrint';
		// header of email
		$headers = "From: " . strip_tags("plugableuw@gmail.com"). "\r\n";
		$headers .= "Reply-To: ". strip_tags("plugableuw@gmail.com") . "\r\n";
		$headers .= "MIME-Version: 1.0\r\n";
		$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

		mail($email, $subject, $code, $headers);
	}
 ?>
