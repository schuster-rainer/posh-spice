# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)

param (
    [string]$sharedDrive, 
    [string]$userName, 
    [string]$computerName,
    [string]$projectRoot
    ) 
            
set-variable tools "$sharedDrive\tools" -Scope global -Option constant
set-variable scripts "$sharedDrive\posh-spice" -Scope global -Option constant
set-variable projects $projectRoot -Scope global -Option constant
set-variable desktop "C:\Users\$userName\DESKTOP" -Scope global -Option constant
set-variable prj106rd ($projects + "106.ArrayMate\ArrayMate_R_D\") -Scope global -Option constant
set-variable prj110rd ($projects + "110.Produktion_Auto\VM2009\") -Scope global -Option constant

$tool_paths = @( (Join-Path $tools "\Java\bin"),
                 (Join-Path $tools "\PortableGit-1.6.5.1-preview20091022\cmd"),
                 (Join-Path $tools "\putty\")
               )
$tool_paths | foreach { $env:path += ";$_" }


. $scripts\filter.ps1
. $scripts\alias.ps1
. $scripts\prompt.ps1

if ($profile -match "ISE") {
    . $scripts\darktheme.ps1
}
    
Write-Host "Environment for $computerName set" -ForegroundColor cyan