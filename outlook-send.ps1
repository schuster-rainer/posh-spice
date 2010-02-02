# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)

param($recipient, $subject, $body, $attachments)

$ol = New-Object -comObject Outlook.Application 
$mail = $ol.CreateItem(0) 
$mail.Recipients.Add($recipient) 
$mail.Subject = $subject 
if ($body)
{
    $mail.Body = $body
}
foreach ($att in $attachments)
{
    $mail.Attachments.Add($att.FullName)
}
$mail.Send() 
$ol.Release()
