<?php
	$name = $_POST["name"];
	$password = $_POST["password"];
	$email = $_POST["email"];
	$printer = $_POST["printer"];	
	if($name == '') {
		print("Please Provide the name of your wireless 
network.");
	}
	if($email == '') {
		print("Please provide a Google cloud print account.");
	}
	if($printer == '') {
		print("Please provide a name for your printer.");
	}
?> <html>
	<body>
		<p>
		Joining wireless network <?= $name ?><br>
		Your password is <?= $password ?><br>
		Your Google cloud print account is <?= $email?><br>
		The name of your printer is <?= $printer?><br>
		Processing your request...<br>
		<?php
			# excute the bash file to connect to wireless 
			# network
			$output = shell_exec("sudo ./wifi_login.sh $name $password");
			print($output);
			$client = shell_exec("sudo ./switchToWlanClient 2>&1");
			print($client);

			$temp = shell_exec("sudo ./connector.sh $email $printer");
			print("hi this is code $temp");
			$code = $temp;
			$subject = 'Access Code to CloudPrint';
			mail($email, $subject, $temp);

			#$AP = shell_exec("sudo bash /home/pi/Pi_Setup/AP_Setup/toRouter.sh");
			#$output = shell_exec("sudo python ./config.py
			#$name $password $email $printer");
			#print($output);
		?>
		</p>
	</body> </html>
