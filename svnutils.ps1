# GIT functions
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Adopted from blog post of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)


function isCurrentDirectorySvnRepository {
    if ((Test-Path ".svn") -eq $TRUE) {
        return $TRUE
    }
    
    # Test within parent dirs
    $checkIn = (Get-Item .).parent
    while ($checkIn -ne $NULL) {
        $pathToTest = $checkIn.fullname + '/.svn'
        if ((Test-Path $pathToTest) -eq $TRUE) {
            return $TRUE
        } else {
            $checkIn = $checkIn.parent
        }
    }
    
    return $FALSE
}

function Get-SvnRevision {
    $dir_info = ([xml](svn info --xml))
    $dir_info.info.entry.revision
}

function Get-SvnBranch {
    $dir_info = ([xml](svn info --xml))
    $url = $dir_info.info.entry.url
    $root = $dir_info.info.entry.repository.root
    
    return $url -replace $root, ""
}

function Get-SvnStatus {
    $status = (svn status)
    $untracked = 0
    $added = 0
    $modified = 0
    $deleted = 0
    $missing = 0
        
    $status | foreach {
        if ($_ -match "^D") {
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
  
  
  return @{  "untracked" = $untracked;
             "added" = $added;
             "modified" = $modified;
             "deleted" = $deleted;
             "missing" = $missing
             }
}