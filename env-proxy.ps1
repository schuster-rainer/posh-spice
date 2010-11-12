function Set-Proxy ($Url,$Port) {   

    try {
        $hostEnrty = [System.Net.Dns]::Resolve($Url)
        $address = $Url + ":" + $Port 
        $env:HTTP_PROXY = $address
        Write-Host ("using proxy " + $address) -ForegroundColor Green
    }
    catch [System.Net.Sockets.SocketException] {        
        Write-Host ("proxy " + $Url + " not available. Using direct access") -ForegroundColor Green 
        continue
    }

}

Set-Proxy -Url $proxyUrl -Port $proxyPort

