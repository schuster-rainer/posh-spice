# (Distributed) Source Code Management functions
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Parts adopted or copied from blog post of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)
# and Jeremy Skinner (http://www.jeremyskinner.co.uk/2010/03/07/using-git-with-windows-powershell)

. (Join-Path $scripts hgutils.ps1)
. (Join-Path $scripts gitutils.ps1)
. (Join-Path $scripts svnutils.ps1)
. (Join-Path $scripts bzrutils.ps1)

#TODO:TFS
#. (Join-Path $scripts tfsutils.ps1)

# creating a function since set-alias can't pass piped parameters
function aia {
    get-childitem | ?{ $_.extension -eq ".dll" } | %{ ai $_ }
}

function dc {
    git diff | out-colordiff
}

function Write-ScmPrompt([string]$scm, [string]$branch, [hashtable]$status) {
    Write-Host $(get-location) -nonewline -foregroundcolor DarkRed
    Write-Host(' [') -nonewline -foregroundcolor Yellow
    Write-Host($branch) -nonewline -foregroundcolor Yellow
    Write-Host(' +:' + $status["added"]) -nonewline -foregroundcolor Yellow 
    Write-Host(' ~:' + $status["modified"]) -nonewline -foregroundcolor Yellow
    Write-Host(' -:' + $status["deleted"]) -nonewline -foregroundcolor Yellow
    if ($status["missing"] -ne $null) {
        Write-Host(' !:' + $status["missing"]) -nonewline -foregroundcolor Yellow
    }
    if ($status["untracked"] -ne $null) {
        Write-Host(' ?:' + $status["untracked"]) -nonewline -foregroundcolor Yellow        
    }
    Write-Host(']') -foregroundcolor Yellow 
    Write-Host('PS ') -nonewline -foregroundcolor DarkRed
    Write-Host('[' + $scm + ']') -nonewline -foregroundcolor Yellow
    Write-Host('>') -nonewline -foregroundcolor DarkRed
}

function Get-RepositoryType {
    
}

function Test-RepositoryType ([string]$configDirPattern) {
    if ((Test-Path $configDirPattern) -eq $TRUE) {
        return $TRUE
    }
    
    # Test within parent dirs
    $checkIn = (Get-Item .).parent
    while ($checkIn -ne $NULL) {
        $pathToTest = $checkIn.fullname + '/' + $configDirPattern
        if ((Test-Path $pathToTest) -eq $TRUE) {
            return $TRUE
        } else {
            $checkIn = $checkIn.parent
        }
    }
    
    return $FALSE
}

#function Get-RepositoryBranch ([string]$executable) {
#    $currentBranch = ''
#    Write-Host $executable
#    "$executable" branch | foreach {
#        $currentBranch += $_
#    }
#   # Write-Host($currentBranch)
#    return $currentBranch
#}

#function Get-RepositoryStatus ([string]$executable){
#    $status = ($executable status)
#    $untracked = 0
#    $added = 0
 #   $modified = 0
#    $deleted = 0
#    $missing = 0
#        
#    $status | foreach {
#        if ($_ -match "^D") {
#            $deleted += 1
#        }
#        elseif ($_ -match "^M") {
#            $modified += 1
#        }
#        elseif ($_ -match "^A") {
#            $added += 1
#        }
#        elseif ($_ -match "^\!") {
#            $missing += 1
#        }
#        elseif ($_ -match "^\?") {
#            $untracked += 1
#        }        
#    }
# 
#  return @{  "untracked" = $untracked;
#             "added" = $added;
#             "modified" = $modified;
#             "deleted" = $deleted;
 #            "missing" = $missing
 #            }
#}