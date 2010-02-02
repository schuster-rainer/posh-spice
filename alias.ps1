new-alias sign $scripts\add-signature.ps1
new-alias linqpad $tools\LINQPad_NET40\LINQPad.exe
new-alias wing $env:ProgramFiles\"Wing IDE 3.2"\bin\wing.exe
new-alias outlook-send $scripts\outlook-send.ps1
new-alias reflector $tools\Reflector\reflector.exe
#remove-item alias:ls
set-alias lsc Get-ChildItemColor

# set common aliases
#find-to-set-alias 'c:\program files*\Microsoft Visual Studio 9.0\Common7\IDE' devenv.exe vs
#find-to-set-alias 'c:\windows\system32\WindowsPowerShell\v1.0\' PowerShell_ISE.exe psise 
set-alias ai assembly-info
 
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
