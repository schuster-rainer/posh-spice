
( (Join-Path $tools "ironruby-1.0_NET20\bin"),
  (Join-Path $tools "IronPython 2.6")
) | foreach { $env:path += ";$_" }

new-alias nant (Join-Path $tools "nant-0.90/bin/NAnt.exe")
new-alias nant-beta (Join-Path $tools "nant-0.91-alpha2/bin/NAnt.exe")
new-alias cljclr (Join-Path $projects "oss/clojure-clr/Bin/4.0/Release/Clojure.Main.exe")
#new-alias cljclr (Join-Path $tools "clojure-clr-1.2.0/Clojure.Main.exe")
