(#(Join-Path $tools "PortableGit-1.7.0.2-preview20100309\cmd"),
  #(Join-Path $tools "PortableGit-1.7.1-preview20100612\cmd"),
  (Join-Path $tools "PortableGit-1.7.2.3-preview20100911\cmd"),
  ("C:\Program Files (x86)\Bazaar")
) | foreach { $env:path += ";$_" }

find-set-alias (Join-Path $tools "*Git-1.7.2.3-*") git-bash.bat git-bash
new-alias gb git-bash

if ($env:HTTP_PROXY) {
    git config --global http.proxy $env:HTTP_PROXY 
}
else {
    git config --global --unset http.proxy
}
