# Rainer Schuster (http://github.com/schuster-rainerpi/posh-spice)


function alias-editor {
    find-set-alias (Join-Path $env:SystemDrive "Dev/Vim/Vim*") gvim.exe gvim -scope global
    find-set-alias (Join-Path $env:SystemDrive "Dev/Vim/Vim*") vim.exe vim -scope global
    new-alias edit (Join-Path $tools "Notepad++Portable/Notepad++Portable.exe") -scope global
}

function alias-office {
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Office/Office*") EXCEL.exe excel
    new-alias writemonkey (Join-Path $tools "WriteMonkey/WriteMonkey.exe") -scope global
    new-alias wm writemonkey -scope global
}

function alias-shells {
    new-alias linqpad20 (Join-Path $tools "LINQPad/LINQPad.exe") -scope global
    new-alias linqpad40 (Join-Path $tools "LINQPad_NET40/LINQPad.exe") -scope global
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/Reinteract/bin") Reinteract.exe reinteract
}

function alias-ide {
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/SharpDevelop/3.0/bin") SharpDevelop.exe sd3
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/SharpDevelop/4.0/bin") SharpDevelop.exe sd4
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/Wing IDE*/bin") wing.exe wing
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Visual Studio 9.0/Common7/IDE") devenv.exe vs2008
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Visual Studio 10.0/Common7/IDE") VCSExpress.exe vcs2010express
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/Microsoft Visual Studio 10.0/Common7/IDE") devenv.exe vs2010
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/JetBrains/PyCharm*/bin") pycharm.exe pycharm
    new-alias sd4dbg (Join-Path $projects "OSS/SharpDevelop/bin/SharpDevelop.exe") -scope global
    new-alias eclipse (Join-Path $tools "eclipse-helios/eclipse.exe") -scope global
    new-alias eclipse-php (Join-Path $tools "eclipse-helios-php/eclipse.exe") -scope global
}

function alias-browser {
    find-set-alias (Join-Path $tools "Portable_Firefox_4.0*") FirefoxLoader.exe ff4
    find-set-alias (Join-Path $tools "operausb*") opera.exe opera
}

function alias-messaging {
    find-set-alias (Join-Path $tools "Skype*") portable-skype*.bat skype
    new-alias miranda (Join-Path $tools "miranda-im-v0.9.4-unicode/miranda32.exe") -scope global
    new-alias pidgin (Join-Path $tools "PidginPortable/PidginPortable.exe") -scope global
}

function alias-devtools {
    find-set-alias (Join-Path $tools "Graphviz*/bin") dot.exe graphviz
    find-set-alias (Join-Path $env:SystemDrive "Program Files*/Gallio/bin") Gallio.Icarus.exe icarus
    new-alias kaxaml (Join-Path $tools "Kaxaml/kaxaml.exe") -scope global
    new-alias dependency-walker (Join-Path $tools "depends*/depends.exe") -scope global
    new-alias dpw dependency-walker -scope global
    new-alias reflector (Join-Path $tools  "Reflector/reflector.exe") -scope global
    new-alias keyjedi (Join-Path $tools "keyjedi/KeyJedi.exe") -scope global
}

function alias-tools {
    new-alias zip (Join-Path $tools "7-ZipPortable/7-ZipPortable.exe") -scope global
    new-alias imgburn (Join-Path $tools "ImgBurn/ImgBurn.exe") -scope global
    new-alias infrarec (Join-Path $tools "InfraRecorderPortable/InfraRecorderPortable.exe") -scope global
    new-alias zoomit (Join-Path $tools "ZoomIt/ZoomIt.exe") -scope global
    new-alias wlw (Join-Path $tools "WindowsLiveWriter/WindowsLiveWriterPortable.exe") -scope global
    new-alias tagscan (Join-Path $tools "tagscan5.1.593/Tagscan.exe") -scope global
    new-alias foxit (Join-Path $tools "FoxitReaderPortable/FoxitReaderPortable.exe") -scope global
    new-alias todo (Join-Path $tools "ToDoList/ToDoList.exe") -scope global
    find-set-alias (Join-Path $tools "vlc-*") vlc.exe vlc
}


set-alias ai assembly-info
new-alias gcl Get-Clipboard
new-alias scl Set-Clipboard
new-alias sign $(Join-Path $scripts "add-signature.ps1")
new-alias outlook-send (Join-Path $scripts outlook-send.ps1)
remove-item alias:ls
set-alias ls Get-ChildItemColor

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
