# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)

param (
    [string]$sharedDrive, 
    [string]$userName, 
    [string]$computerName,
    [string]$projectRoot
    ) 
            
set-variable tools (Join-Path $sharedDrive "tools") -Scope global -Option constant
set-variable scripts (Join-Path $sharedDrive "posh-spice") -Scope global -Option constant
set-variable projects $projectRoot -Scope global -Option constant
set-variable desktop "C:\Users\$userName\DESKTOP" -Scope global -Option constant
set-variable prj106rd (Join-Path $projects "106.ArrayMate\ArrayMate_R_D\") -Scope global -Option constant
set-variable prj110rd (Join-Path $projects "110.Produktion_Auto\VM2009\") -Scope global -Option constant
set-variable assays(Join-Path $projects "106.ArrayMate\ArrayMate_R_D\SRC\CORE\parameter\assays\") -Scope global -Option constant


( (Join-Path $tools "Java\bin"),
  #(Join-Path $tools "PortableGit-1.7.0.2-preview20100309\cmd"),
  (Join-Path $tools "PortableGit-1.7.1-preview20100612\cmd"),
  (Join-Path $tools "putty"),
  (Join-Path $tools "WinDump"),
  (Join-Path $tools "ironruby-1.0_NET20\bin"),
  (Join-Path $tools "IronPython 2.6"),
  (Join-Path $tools "protocol-buffers"),
  # ("c:\python25"),
  # ("c:\python25\scripts"),
  ("C:\Program Files (x86)\Bazaar"),
  ("C:\Program Files (x86)\Mono-2.6.7\bin"),
  ("C:\Program Files (x86)\Haskell\bin"),
  ("C:\Program Files (x86)\Haskell Platform\2010.2.0.0\lib\extralibs\bin"),
  ("C:\Program Files (x86)\Haskell Platform\2010.2.0.0\bin")
) | foreach { $env:path += ";$_" }


. $scripts\filter.ps1
. $scripts\alias.ps1
. $scripts\prompt.ps1

if ($profile -match "ISE") {
    . $scripts\darktheme.ps1
}
#cls
Write-Host "Environment for $computerName set" -ForegroundColor Yellow
