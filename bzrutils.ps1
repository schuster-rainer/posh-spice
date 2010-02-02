# Mercurial (hg) functions
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Adopted from Git version of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)


function isCurrentDirectoryBzrRepository {
    if ((Test-Path ".bzr") -eq $TRUE) {
        return $TRUE
    }
    
    # Test within parent dirs
    $checkIn = (Get-Item .).parent
    while ($checkIn -ne $NULL) {
        $pathToTest = $checkIn.fullname + '/.bzr'
        if ((Test-Path $pathToTest) -eq $TRUE) {
            return $TRUE
        } else {
            $checkIn = $checkIn.parent
        }
    }
    
    return $FALSE
}

# Get the current branch
function Get-BazarBranch {
    $currentBranch = ''
    hg branch | foreach {
        $currentBranch += $_
    }
   # Write-Host($currentBranch)
    return $currentBranch
}

# Extracts status details about the repo
function Get-BazarStatus {
    $untracked = 0
    $added = 0
    $modified = 0
    $deleted = 0
    $missing = 0
    
    $output = bzr status
    
    #$branchbits = $output[0].Split(' ')
    #$branch = $branchbits[$branchbits.length - 1]
    
   # Write-Host($output)    
    $output | foreach {
        if ($_ -match "^R") {
            $deleted += 1
        }
        elseif ($_ -match "^M") {
            $modified += 1
        }
        elseif ($_ -match "^A") {
            $added += 1
        }
        elseif ($_ -match "^\!") {
            $missing += 1
        }
        elseif ($_ -match "^\?") {
            $untracked += 1
        }        
    }
    
    return @{"untracked" = $untracked;
             "added" = $added;
             "modified" = $modified;
             "deleted" = $deleted;
             "missing" = $missing}
}