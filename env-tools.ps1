( 
  (Join-Path $tools "WinDump"),
  (Join-Path $tools "nirsoft_x64"),
  (Join-Path $tools "SysinternalsSuite"),
  (Join-Path $tools "ffmpeg/bin")
) | foreach { $env:path += ";$_" }


