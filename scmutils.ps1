# (Distributed) Source Code Management functions
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Some parts adopted from blog post of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)

. $scripts\hgutils.ps1
. $scripts\gitutils.ps1
. $scripts\svnutils.ps1
. $scripts\bzrutils.ps1
#TODO:TFS
#. $scripts\tfsutils.ps1

# creating a function since set-alias can't pass piped parameters
function aia {
    get-childitem | ?{ $_.extension -eq ".dll" } | %{ ai $_ }
}

function dc {
    git diff | out-colordiff
}

# Use VS to either open the passed solution or the first (only) solution in the
# current directory.
function vsh {
    param ($param)
    
    if ($param -eq $NULL) {
        "A solution was not specified, opening the first one found."
        $solutions = get-childitem | ?{ $_.extension -eq ".sln" }
    }
    else {
        "Opening {0} ..." -f $param
        vs $param
        break
    }
    if ($solutions.count -gt 1) {
        "Opening {0} ..." -f $solutions[0].Name
        vs $solutions[0].Name
    }
    else {
        "Opening {0} ..." -f $solutions.Name
        vs $solutions.Name
    }
}

function Write-ScmPrompt([string]$scm, [string]$branch, [hashtable]$status) {
    Write-Host $(get-location) -nonewline -foregroundcolor Green
    Write-Host(' [') -nonewline -foregroundcolor Magenta
    Write-Host($branch) -nonewline -foregroundcolor Magenta
    Write-Host(' A:' + $status["added"]) -nonewline -foregroundcolor Magenta 
    Write-Host(' M:' + $status["modified"]) -nonewline -foregroundcolor Magenta
    Write-Host(' D:' + $status["deleted"]) -nonewline -foregroundcolor Magenta
    if ($status["missing"] -eq $TRUE) {
        Write-Host(' !:' + $status["missing"]) -nonewline -foregroundcolor Magenta
    }
    if ($status["untracked"] -eq $TRUE) {
        Write-Host(' ?:' + $status["untracked"]) -nonewline -foregroundcolor Magenta        
    }
    Write-Host(']') -foregroundcolor Magenta 
    Write-Host('PS ') -nonewline -foregroundcolor Green
    Write-Host('[' + $scm + ']') -nonewline -foregroundcolor Magenta
    Write-Host('>') -nonewline -foregroundcolor Green
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