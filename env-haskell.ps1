( ("C:\Program Files (x86)\Haskell\bin"),
  ("C:\Program Files (x86)\Haskell Platform\2010.2.0.0\lib\extralibs\bin"),
  ("C:\Program Files (x86)\Haskell Platform\2010.2.0.0\bin")
 # (Join-Path $tools "GTK+2.16/bin")
) | foreach { $env:path += ";$_" }

