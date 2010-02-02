# Custom POSH prompt for SCMs
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Adopted from Git version of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)

. $scripts\scmutils.ps1

# Add Git executables to the mix.
#[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";" + (Join-Path $tools "\PortableGit-1.6.3.2\bin"), "Process") 
# Setup Home so that Git doesn't freak out.
#[System.Environment]::SetEnvironmentVariable("HOME", (Join-Path $Env:HomeDrive $Env:HomePath), "Process")
# Add our scripts directory in the mix.
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";" + $scripts, "Process")

$Global:CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$UserType = "User"
$CurrentUser.Groups | %{ 
    if ($_.value -eq "S-1-5-32-544") {
        $UserType = "Admin" } 
    }

function prompt {
    # Fun stuff if using the standard PowerShell prompt; not useful for Console2.
    # This, and the variables above, could be commented out.
    Write-Host("")
    if($UserType -eq "admin") {
        $host.ui.rawui.windowtitle = "" + $(get-location) + " : admin"
        $host.ui.rawui.foregroundcolor = "white"
    }
    else {
       $host.ui.rawui.windowtitle = $(get-location)
    }

    if(isCurrentDirectoryGitRepository) {
        Write-ScmPrompt "GIT" (get-GitBranch) (get-GitStatus)
    }
    elseif (isCurrentDirectoryMercurialRepository) {
        Write-ScmPrompt "HG" (get-MercurialBranch) (get-MercurialStatus)
    }
    elseif (isCurrentDirectorySvnRepository) {
        Write-ScmPrompt "SVN" (get-SvnBranch) (get-SvnStatus)
    } 
    #elseif (isCurrentDirectoryBazarRepository) {
    #    Write-ScmPrompt "BZR" (get-BzrBranch) (get-BzrStatus)
    #} 
    else {
        Write-Host $(get-location) -foregroundcolor green
        Write-Host ("PS " + $status_string + ">") `
                    -nonewline -foregroundcolor green
    }
    
    return " "
}