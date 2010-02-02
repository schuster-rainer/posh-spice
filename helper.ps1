function Get-Color {
    $colorDialog = new-object System.Windows.Forms.ColorDialog
    $colorDialog.AllowFullOpen = $true
    [void]$colorDialog.ShowDialog()
    $colorDialog.Color.Name
}

function Get-Font {
    $fontDialog = new-object System.Windows.Forms.FontDialog
    [void]$fontDialog.ShowDialog()
    $fontDialog.FontName
}

function Set-CommandBackPaneColor {
param
(
    [parameter(Mandatory=$true,ValueFromPipeline=$true)]
    $color
)
    $psise.Options.CommandPaneBackgroundColor = $color
}

function Set-OutputPaneColor {
param
(
    [parameter(Mandatory=$true,ValueFromPipeline=$true)]
    $color
)
    $psise.Options.OutputPaneBackgroundColor = $color
    $psise.Options.OutputPaneTextBackgroundColor = $color
}

function Set-ScriptPaneColor {
param
(
    [parameter(Mandatory=$true,ValueFromPipeline=$true)]
    $color
)
    $psise.Options.ScriptPaneBackgroundColor = $color
}

Get-Font
# SIG # Begin signature block
# MIIEMwYJKoZIhvcNAQcCoIIEJDCCBCACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU0ki2aS9ldaPyNT9TjvbOHnQ8
# npCgggI9MIICOTCCAaagAwIBAgIQhsqWVEW7OplCxq/ZioKFwTAJBgUrDgMCHQUA
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
# FPgqc+CseoeogHxl7MCLMuObnmRtMA0GCSqGSIb3DQEBAQUABIGARYXSFj6+4t4e
# rrBxLajzkLBwzNCWP6rnppWWZ2BoHyvsw/ykxdhpEuZKI/wcZ4CUi1z7uhIfzCXN
# V1nFKQB8jGNZxwzSLOckIcPAJIABDqy6G7/qoZBc3U55ZAT0PGFJK/x6+b+8tjE5
# GvcrdoXyV1orC1R0dMI7BFh9lhASMHw=
# SIG # End signature block
