# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)

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