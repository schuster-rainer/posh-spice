param([string] $file=$(throw "Geben Sie einen Dateinamen an.")) 
$cert = @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0] 
Set-AuthenticodeSignature $file $cert