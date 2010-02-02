function Get-Batchfile ($file) {
    $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VsVars32()
{
    $vs90comntools = (Get-ChildItem env:VS90COMNTOOLS).Value
    $batchFile = [System.IO.Path]::Combine($vs90comntools, "vsvars32.bat")
    Get-Batchfile $BatchFile
    
    [System.Console]::Title = "Visual Studio 2008 Windows PowerShell"
}

"Visual Studio 2008 Windows PowerShell"
""
""

VsVars32
# SIG # Begin signature block
# MIIEMwYJKoZIhvcNAQcCoIIEJDCCBCACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUyEsWE5fmEDjmJWn3bwxvQuJb
# cjWgggI9MIICOTCCAaagAwIBAgIQhsqWVEW7OplCxq/ZioKFwTAJBgUrDgMCHQUA
# MCwxKjAoBgNVBAMTIVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdDAe
# Fw0wOTA5MTExMjQ5MTVaFw0zOTEyMzEyMzU5NTlaMBoxGDAWBgNVBAMTD1Bvd2Vy
# U2hlbGwgVXNlcjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArPf/AS80HKar
# 5ASBW1nfVrAi7GFt4E6jkhzF0GwI0v30WEzel4UnuMTms1CCE6VfOFW/5FON5iap
# 7PkNkomenv9B7fL568+AHviR4Jl3NMd1MTjvnLu0LXXasUbwxYZd5jLA/+jzcIC9
# ehTQRlk8o2m9ObBZTdWNUKxCSQrt7MkCAwEAAaN2MHQwEwYDVR0lBAwwCgYIKwYB
# BQUHAwMwXQYDVR0BBFYwVIAQopOZDgnOeAgpZDBKkNSOe6EuMCwxKjAoBgNVBAMT
# IVBvd2VyU2hlbGwgTG9jYWwgQ2VydGlmaWNhdGUgUm9vdIIQNERedXqmXbxK8JDw
# ffc0TjAJBgUrDgMCHQUAA4GBAFyYLYreuooiQP5O9me3NI5tealkbF++KZTNeezd
# oD3lh+Qef+IlVhriCRhu7If0LUrHjvW+0lAc0k/7n2w/xmXyIcxOxO7S3wTFDKIZ
# sc2n6Ys0BgTZ7flDJ7TZhYe9CupNAujOB3t/aqEznM+bJqmrTeNLAZsV5gOM2y5K
# G2VhMYIBYDCCAVwCAQEwQDAsMSowKAYDVQQDEyFQb3dlclNoZWxsIExvY2FsIENl
# cnRpZmljYXRlIFJvb3QCEIbKllRFuzqZQsav2YqChcEwCQYFKw4DAhoFAKB4MBgG
# CisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcC
# AQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYE
# FOqP2jsE1rLsTwIdg0QfGCOiM1mLMA0GCSqGSIb3DQEBAQUABIGAHnGUaD6poXeL
# 6N8Xom1qfCzphHYOFCq1uvlrrxUEFEDo5w1NBQgZ5yvTrVLj6xSzIWgWdlk2SjPJ
# tidzQvzs19PXA+YIbGXsENQ4bwuNvXabHFLFSTMqK5t7FznFsOXZbfCzfGizIYnw
# +bEkdvqw7b7p8YUyyNECbHiw2COtweo=
# SIG # End signature block
