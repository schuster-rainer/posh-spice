# Rainer Schuster (http://github.com/schuster-rainer/posh-spice)

filter highlight{
    param(
        [string]$pattern=$(throw "regular expression required"),
        [string]$property,
        [string]$foreground="red",
        [string]$background        
    )
    $default_foreground = [console]::ForegroundColor;
    #$default_backgroundcolor = [console]::BackgroundColor;
    
    if( $background -eq $FALSE) {
        $background = $default_backgroundcolor
    }

    $matched = $FALSE
    if( $prop -eq $TRUE) {    
        if($_.$property -match $regex) {
            $matched = $TRUE
        }
    } else {
        if($_ -match $pattern) {
            $matched = $TRUE
        }
    }
    
    if( $matched -eq $TRUE) {
        [console]::ForegroundColor = $foreground; 
        #[console]::BackgroundColor = $background;
        $_
    } else {
        [console]::ForegroundColor = $default_foreground; 
        #[console]::BackgroundColor = $default_background;
         $_
    }

    [console]::ForegroundColor = $default_foreground; 
    #[console]::BackgroundColor = $default_background;
}
