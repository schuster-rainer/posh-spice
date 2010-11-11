# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)

param (
    [string]$sharedDrive, 
    [string]$userName, 
    [string]$computerName,
    [string]$projectRoot,
    [string]$proxyUrl,
    [string]$proxyPort
    ) 

            
set-variable tools (Join-Path $sharedDrive "tools") -Scope global -Option constant
set-variable scripts (Join-Path $sharedDrive "posh-spice") -Scope global -Option constant
set-variable projects $projectRoot -Scope global -Option constant
set-variable desktop "C:\Users\$userName\DESKTOP" -Scope global -Option constant
set-variable prj106rd (Join-Path $projects "106.ArrayMate\ArrayMate_R_D\") -Scope global -Option constant
set-variable prj110rd (Join-Path $projects "110.Produktion_Auto\VM2009\") -Scope global -Option constant
set-variable assays(Join-Path $projects "106.ArrayMate\ArrayMate_R_D\SRC\CORE\parameter\assays\") -Scope global -Option constant

set-item -path Env:JAVA_HOME -value "C:\Dev\Java\jdk1.6.0_21"
# set-item -path Env:CLASSPATH -value {(Join-Path $tools "clojure-1.2.0") + ":" + (Join-Path $tools "clojure-contrib-1.2.0")}
set-item -path Env:CLASSPATH -value ""
set-item -path Env:ANT_HOME -value (Join-Path $tools "apache-ant-1.8.1")

( #(Join-Path $tools "Java\bin"),
  #(Join-Path $tools "PortableGit-1.7.0.2-preview20100309\cmd"),
  #(Join-Path $tools "PortableGit-1.7.1-preview20100612\cmd"),
  (Join-Path $tools "PortableGit-1.7.2.3-preview20100911\cmd"),
  (Join-Path $tools "putty"),
  (Join-Path $tools "WinDump"),
  (Join-Path $tools "ironruby-1.0_NET20\bin"),
  (Join-Path $tools "IronPython 2.6"),
  (Join-Path $tools "protocol-buffers"),
  (Join-Path $tools "clojure-1.2.0"),
  (Join-Path $tools "nailgun"),
  (Join-Path $tools "nirsoft_x64"),
  (Join-Path $env:JAVA_HOME "bin"),
  (Join-Path $env:ANT_HOME "bin"),
  (Join-Path $tools "gradle-0.9-rc-1/bin"),
  (Join-Path $tools "SysinternalsSuite"),
  (Join-Path $tools "ffmpeg/bin"),
  # ("c:\python25"),
  # ("c:\python25\scripts"),
  ("C:\Program Files (x86)\Bazaar"),
  ("C:\Program Files (x86)\Mono-2.8\bin"),
  ("C:\Program Files (x86)\Haskell\bin"),
  ("C:\Program Files (x86)\Haskell Platform\2010.2.0.0\lib\extralibs\bin"),
  ("C:\Program Files (x86)\Haskell Platform\2010.2.0.0\bin")
 # (Join-Path $tools "GTK+2.16/bin")
) | foreach { $env:path += ";$_" }

. $scripts\filter.ps1
. $scripts\alias.ps1
. $scripts\prompt.ps1

if ($profile -match "ISE") {
    . $scripts\darktheme.ps1
}

function Set-Proxy ($Url,$Port) {   

    try {
        $hostEnrty = [System.Net.Dns]::Resolve($Url)
        $address = $Url + ":" + $Port
        git config --global http.proxy $address 
        $env:HTTP_PROXY = $address
        Write-Host ("using proxy " + $address) 
    }
    catch [System.Net.Sockets.SocketException] {        
        Write-Host ("proxy " + $Url + " not available. Using direct access")
        git config --global --unset http.proxy
        continue
    }

}

Set-Proxy -Url $proxyUrl -Port $proxyPort
Write-Host "Environment for $computerName set" -ForegroundColor Yellow
