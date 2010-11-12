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

( 
  (Join-Path $tools "putty")
) | foreach { $env:path += ";$_" }


new-alias find-set-alias $(Join-Path $scripts "find-to-set-alias.ps1")


. $scripts\env-proxy.ps1
. $scripts\filter.ps1
. $scripts\alias.ps1
. $scripts\prompt.ps1

if ($profile -match "ISE") {
    . $scripts\darktheme.ps1
}

Write-Host "Environment for $computerName set" -ForegroundColor Green 
