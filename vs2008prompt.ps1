function Get-Batchfile ($file) {
    $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VsVars32()
{
    $vs90comntools = (Get-ChildItem env:VS90COMNTOOLS).Value
    $batchFile = [System.IO.Path]::Combine($vs90comntools, "vsvars32.bat")
    Get-Batchfile $BatchFile
    
    [System.Console]::Title = "Visual Studio 2008 Windows PowerShell"
}

"Visual Studio 2008 Windows PowerShell"
""
""

VsVars32