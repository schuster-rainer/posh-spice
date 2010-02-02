# GIT functions
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Adopted from blog post of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)

function isCurrentDirectoryGitRepository {
    # check to see if this is a directory containing a symbolic reference, 
    # fails (gracefully) on non-git repos.
    
    $symbolicref = git symbolic-ref HEAD
    return $symbolicref -ne $NULL
}
 
function Get-GitBranch {
    $symbolicref = git symbolic-ref HEAD
    $branch = $symbolicref.substring($symbolicref.LastIndexOf("/") +1)
    return $branch
}
 
function Get-GitStatus {
    $status = (git diff-index --name-status HEAD)
    $untracked = 0
    $added = 0
    $modified = 0
    $deleted = 0
    $missing = 0

    $status | foreach {
        if ($_ -match "D`t") {
            $deleted += 1
        }
        elseif ($_ -match "M`t") {
            $modified += 1
        }
        elseif ($_ -match "A`t") {
            $added += 1
        }
        elseif ($_ -match "\!`t") {
            $missing += 1
        }
        elseif ($_ -match "\?`t") {
            $untracked += 1
        }        
    }
    return @{#"untracked" = $untracked;
             "added" = $added;
             "modified" = $modified;
             "deleted" = $deleted
             #"missing" = $missing
             }
}