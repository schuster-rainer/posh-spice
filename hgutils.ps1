# Mercurial (hg) functions
# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)
# Adopted from HG version of:
# Kornelije Sajler (http://learnaholic.me) 
# Adopted from Git version of:
# Mark Embling (http://www.markembling.info/view/my-ideal-powershell-prompt-with-git-integration)


function isCurrentDirectoryMercurialRepository {
    if ((Test-Path ".hg") -eq $TRUE) {
        return $TRUE
    }
    
    # Test within parent dirs
    $checkIn = (Get-Item .).parent
    while ($checkIn -ne $NULL) {
        $pathToTest = $checkIn.fullname + '/.hg'
        if ((Test-Path $pathToTest) -eq $TRUE) {
            return $TRUE
        } else {
            $checkIn = $checkIn.parent
        }
    }
    
    return $FALSE
}

# Get the current branch
function Get-MercurialBranch {
    $currentBranch = ''
    hg branch | foreach {
        $currentBranch += $_
    }
   # Write-Host($currentBranch)
    return $currentBranch
}

# Extracts status details about the repo
function Get-MercurialStatus {
    $untracked = 0
    $added = 0
    $modified = 0
    $deleted = 0
    $missing = 0
    
    $output = hg status
    
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

function generic-scm {
    $scm = $null
    @("HG","SVN") | foreach { 
        Write-Host $_
        if(Test-RepositoryType $_ ) {
            Write-ScmPrompt $_ (get-RepositoryBranch) (get-RepositoryStatus)
            #Write-ScmPrompt "GIT" (get-GitBranch) (get-GitStatus)
            $scm = $_
            break
        }
    }
    
    if( $scm -eq $null) {
        Write-Host $(get-location) -foregroundcolor green
        Write-Host ("PS " + $status_string + ">") `
                    -nonewline -foregroundcolor green
    }

}