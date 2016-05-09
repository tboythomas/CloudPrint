<?php
    $verified = shell_exec("sudo /home/pi/Pi_Setup/verify.sh");
    print($verified);
    if($verified == 0) {
    	header('Location: errorPage.php'); 
    }else{
    	header('Location: verified.html');
    }
?>
