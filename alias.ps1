# Rainer Schuster (http://github.com/schuster-rainerpi/posh-spice)

new-alias find-set-alias $(Join-Path $scripts "find-to-set-alias.ps1")
find-set-alias (Join-Path $env:SystemDrive "Dev/Vim/Vim*") gvim.exe gvim

find-set-alias (Join-Path $env:SystemDrive "Program Files*/SharpDevelop/3.0/bin") SharpDevelop.exe sd3
find-set-alias (Join-Path $env:SystemDrive "Program Files*/SharpDevelop/4.0/bin") SharpDevelop.exe sd4
find-set-alias (Join-Path $tools "*Git-1.7.2.3-*") git-bash.bat git-bash
find-set-alias (Join-Path $env:SystemDrive "Program Files*/Wing IDE*/bin") wing.exe wing
find-set-alias (Join-Path $tools "Graphviz*/bin") dot.exe graphviz
find-set-alias (Join-Path $tools "Skype*") portable-skype*.bat skype
find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Visual Studio 9.0/Common7/IDE") devenv.exe vs2008
find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Visual Studio 10.0/Common7/IDE") VCSExpress.exe vcs2010express
find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Visual Studio 10.0/Common7/IDE") devenv.exe vs2010
find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Office/Office*") EXCEL.exe excel
find-set-alias (Join-Path $env:SystemDrive "Dev/Vim/Vim*") vim.exe vim
find-set-alias (Join-Path $tools "vlc-*") vlc.exe vlc
find-set-alias (Join-Path $tools "Portable_Firefox_4.0*") FirefoxLoader.exe ff4
find-set-alias (Join-Path $tools "operausb*") opera.exe opera
find-set-alias (Join-Path $env:SystemDrive "Program Files*/JetBrains/PyCharm*/bin") pycharm.exe pycharm
find-set-alias (Join-Path $env:SystemDrive "Program Files*/Gallio/bin") Gallio.Icarus.exe icarus
find-set-alias (Join-Path $env:SystemDrive "Program Files*/Reinteract/bin") Reinteract.exe reinteract



new-alias sd4dbg (Join-Path $projects "OSS/SharpDevelop/bin/SharpDevelop.exe")
new-alias eclipse (Join-Path $tools "eclipse-helios/eclipse.exe")
new-alias eclipse-php (Join-Path $tools "eclipse-helios-php/eclipse.exe")
new-alias linqpad20 (Join-Path $tools "LINQPad/LINQPad.exe")
new-alias linqpad40 (Join-Path $tools "LINQPad_NET40/LINQPad.exe")
new-alias sign $(Join-Path $scripts "add-signature.ps1")
new-alias outlook-send (Join-Path $scripts outlook-send.ps1)
new-alias reflector (Join-Path $tools  "Reflector/reflector.exe")
new-alias edit (Join-Path $tools "Notepad++Portable/Notepad++Portable.exe")
#new-alias gvim (Join-Path $tools "gVimPortable/gVimPortable.exe")
new-alias zip (Join-Path $tools "7-ZipPortable/7-ZipPortable.exe")
new-alias imgburn (Join-Path $tools "ImgBurn/ImgBurn.exe")
new-alias infrarec (Join-Path $tools "InfraRecorderPortable/InfraRecorderPortable.exe")
new-alias keyjedi (Join-Path $tools "keyjedi/KeyJedi.exe")
new-alias dependency-walker (Join-Path $tools "depends*/depends.exe")
new-alias dpw dependency-walker
new-alias zoomit (Join-Path $tools "ZoomIt/ZoomIt.exe")
new-alias pidgin (Join-Path $tools "PidginPortable/PidginPortable.exe")
new-alias nant (Join-Path $tools "nant-0.90/bin/NAnt.exe")
new-alias nant-beta (Join-Path $tools "nant-0.91-alpha2/bin/NAnt.exe")
new-alias todo (Join-Path $tools "ToDoList/ToDoList.exe")
new-alias writemonkey (Join-Path $tools "WriteMonkey/WriteMonkey.exe")
new-alias perl6 c:\Rakudo\bin\perl6.exe
new-alias yEd call-yEditor
new-alias gcl Get-Clipboard
new-alias scl Set-Clipboard
new-alias gb git-bash
set-alias ai assembly-info
new-alias wm writemonkey
new-alias clj call-clojure
new-alias cljclr (Join-Path $projects "oss/clojure-clr/Bin/4.0/Release/Clojure.Main.exe")
#new-alias cljclr (Join-Path $tools "clojure-clr-1.2.0/Clojure.Main.exe")
new-alias miranda (Join-Path $tools "miranda-im-v0.9.4-unicode/miranda32.exe")
new-alias kaxaml (Join-Path $tools "Kaxaml/kaxaml.exe")
new-alias python26 (Join-Path $env:SystemDrive "Python26/python.exe")
new-alias pip26 (Join-Path $env:SystemDrive "Python26/Scripts/pip-2.6.exe")
new-alias virtualenv26 (Join-Path $env:SystemDrive "Python26/Scripts/virtualenv.exe")
new-alias wlw (Join-Path $tools "WindowsLiveWriter/WindowsLiveWriterPortable.exe")
new-alias tagscan (Join-Path $tools "tagscan5.1.593/Tagscan.exe")
new-alias foxit (Join-Path $tools "FoxitReaderPortable/FoxitReaderPortable.exe")


remove-item alias:ls
set-alias ls Get-ChildItemColor

function restart-network ([string]$name) {
    $adaptor = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object {$_.Name -like $name}
    $adaptor.Disable()
    $adaptor.Enable()
}

function restart-wifi {
    Invoke-Expression ("restart-network '*Ultimate-N*'")
}

function call-yEditor {
    java.exe -jar (Join-Path (Join-Path $tools "yEd*" -resolve) yed.jar)
}
function call-gantProject {
    java.exe -jar (Join-Path (Join-Path $tools "gantproject*" -resolve) eclipsito.jar)
}

function call-clojure {
    
    ( (Join-Path $tools "clojure-1.2.0/clojure.jar"),
      (Join-Path $tools "clojure-contrib-1.2.0/target/clojure-contrib-1.2.0.jar")
    ) | foreach { $cp += ";$_" }

    java -cp $cp clojure.main 
}


function nailgun {
    
#    ( (Join-Path $tools "clojure-1.2.0/clojure.jar"),
#      (Join-Path $tools "clojure-contrib-1.2.0/target/clojure-contrib-1.2.0.jar"),
#      (Join-Path $tools "vimclojure-2.1.2/build/vimclojure.jar")
#    ) | foreach { $cp += ";$_" }

     start-process gradle -ArgumentList "runNailgun --build-file $projectRoot\oss\vimclojure\build.gradle"
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
