# python on windows is by convetion installed into the systemroot e.g. C:

set-alias python (Join-Path $env:SystemDrive "Python26/python.exe")
set-alias pip (Join-Path $env:SystemDrive "Python26/Scripts/pip-2.6.exe")
set-alias virtualenv (Join-Path $env:SystemDrive "Python26/Scripts/virtualenv.exe")
