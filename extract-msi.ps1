param
(
    [string] $packet=$(throw "Please enter a MSI installer file."),
    [string] $outfolder=$("extracted")
)

msiexec /a "$msi" /qb TARGETDIR=$output