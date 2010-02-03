# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)

new-alias sign $(Join-Path $scripts "add-signature.ps1")
new-alias linqpad (Join-Path $tools "LINQPad_NET40\LINQPad.exe")
new-alias outlook-send $scripts\outlook-send.ps1
new-alias reflector (Join-Path $tools  "Reflector\reflector.exe")
new-alias git-bash (Resolve-Path "$tools\*Portable*GIT*\git-bash.bat")
new-alias gb git-bash
new-alias edit (Join-Path $tools "Notepad++Portable\Notepad++Portable.exe")
new-alias gvim (Join-Path $tools "gVimPortable\gVimPortable.exe")
new-alias zip (Join-Path $tools "7-ZipPortable\7-ZipPortable.exe")
new-alias imgburn (Join-Path $tools "ImgBurn\ImgBurn.exe")
new-alias infrarec (Join-Path $tools "InfraRecorderPortable\InfraRecorderPortable.exe")
new-alias keyjedi (Join-Path $tools "keyjedi\KeyJedi.exe")
new-alias dependency-walker (Join-Path $tools "depends*\depends.exe")
new-alias dpw dependency-walker
new-alias zoomit (Join-Path $tools "ZoomIt\ZoomIt.exe")
new-alias wing $env:ProgramFiles\"Wing IDE 3.2"\bin\wing.exe
new-alias graphviz (Join-Path $tools "Graphviz2.24\bin\dot.exe")

new-alias yEd call-yEditor

#remove-item alias:ls
set-alias lsc Get-ChildItemColor

# set common aliases
#find-to-set-alias 'c:\program files*\Microsoft Visual Studio 9.0\Common7\IDE' devenv.exe vs
#find-to-set-alias 'c:\windows\system32\WindowsPowerShell\v1.0\' PowerShell_ISE.exe psise 
set-alias ai assembly-info

function call-yEditor {
    java.exe -jar (Resolve-Path (Join-Path $tools "yEd*\yed.jar"))
}
function Get-ChildItemColor {
    $fore = $Host.UI.RawUI.ForegroundColor
 
    Invoke-Expression ("Get-ChildItem $args") |
    %{
      if ($_.GetType().Name -eq 'DirectoryInfo') {
        $Host.UI.RawUI.ForegroundColor = 'DarkGray'
        echo $_
        $Host.UI.RawUI.ForegroundColor = $fore
      } elseif ($_.Name -match '\.(zip|tar|gz|rar|bz2|7z)$') {
        $Host.UI.RawUI.ForegroundColor = 'Gray'
        echo $_
        $Host.UI.RawUI.ForegroundColor = $fore
      } elseif ($_.Name -match '\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg)$') {
        $Host.UI.RawUI.ForegroundColor = 'Green'
        echo $_
        $Host.UI.RawUI.ForegroundColor = $fore
      } elseif ($_.Name -match '\.(txt|cfg|conf|ini|csv|sql|xml|config)$') {
        $Host.UI.RawUI.ForegroundColor = 'Cyan'
        echo $_
        $Host.UI.RawUI.ForegroundColor = $fore
      } elseif ($_.Name -match '\.(cs|asax|aspx|vb|boo|c|cpp|h|hpp)$') {
        $Host.UI.RawUI.ForegroundColor = 'Yellow'
        echo $_
        $Host.UI.RawUI.ForegroundColor = $fore
      } elseif ($_.Name -match '\.(sln|csproj|vbproj|booproj)$') {
        $Host.UI.RawUI.ForegroundColor = 'Magenta'
        echo $_
        $Host.UI.RawUI.ForegroundColor = $fore
      } else {
        $Host.UI.RawUI.ForegroundColor = $fore
        echo $_
      }
    }
}
