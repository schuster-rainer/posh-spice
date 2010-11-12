
(
  ( Join-Path ${env:ProgramFiles(x86)} "/Mono-2.8/bin")
) | foreach { $env:path += ";$_" }

