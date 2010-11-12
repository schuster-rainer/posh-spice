function restart-network ([string]$name) {
    $adaptor = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object {$_.Name -like $name}
    $adaptor.Disable()
    $adaptor.Enable()
}

function restart-wifi {
    Invoke-Expression ("restart-network '*Ultimate-N*'")
}
