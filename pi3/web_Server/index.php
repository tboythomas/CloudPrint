<?php
'''
FILE_DETAILS
    Description: This page tests if this device is a valid Plugable product
	and directs to verified.html if it is. Otherwise, to errorPage.html
FILE_DETAILS
'''
    $verified = shell_exec("sudo /home/pi/Pi_Setup/cloudprint_Setup/verify.sh");
    if($verified == 0) {
    	header('Location: errorPage.php'); 
    }else{
    	header('Location: verified.html');
    }
?>
