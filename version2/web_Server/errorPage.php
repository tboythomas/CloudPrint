<?php
'''
FILE_DETAILS
    Description: If the verification page fails, display this page. It displays
    	the error message for unoffical device.
FILE_DETAILS
'''
	print("<h1> Warning: </h1>");
	print("<p>We have detected that you are not using an official Plugable Google Cloud Print Server.
			If this incorrect please visit http://plugable.com/support as we'd be more than happy to assist you.</p>");
	die();
?>

