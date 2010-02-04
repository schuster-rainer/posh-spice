# Mercurial (hg) functions
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Adopted from Git version of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)


function isCurrentDirectoryBazarRepository {
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
    bzr info | foreach {
        if ($_ -match "?:(parent branch: )(?:<server>.*/)(?:<parent>~.*/)(?<branch>.*/)") {
            $currentBranch = $matches["branch"].TrimEnd("/")
        }        
   }
   return $currentBranch
    #return bzr nick
}

# Extracts status details about the repo
function Get-BazarStatus {
    $untracked = 0
    $added = 0
    $modified = 0
    $deleted = 0
    $missing = 0
    
    $output = bzr status -S
    #we'll receive a 3 column layout with the status information.
    #for detailed information about the flags use command "bzr help status-flags"
  
    # Write-Host($output)    
    $output | foreach {
        if ($_.Length -ge 3) {

        $version_change = $_.Chars(0)
        $content_change = $_.Chars(1)
        $execution_change = $_.Chars(2)
        
        if ($content_change -eq "D") {
            $deleted += 1
        }
        elseif ($content_change -eq "M") {
            $modified += 1
        }
        elseif ($content_change -eq "N") {
            $added += 1
        }
        elseif ($version_change -eq "X") {
            $missing += 1
        }
        elseif ($version_change -eq "?") {
            $untracked += 1
        }
    }
    }
    
    return @{"untracked" = $untracked;
             "added" = $added;
             "modified" = $modified;
             "deleted" = $deleted;
             "missing" = $missing}
}