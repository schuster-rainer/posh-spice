# <span class="searchword">PowerShell</span> ISE version of the VIM blackboard <span class="searchword">Theme</span>s/blackboard.ps1
# http://www.vim.org/scripts/script.php?script_id=2280
# fonts
$psISE.Options.FontName = 'Consolas'
$psISE.Options.FontSize = 16

# output pane
$psISE.Options.OutputPaneBackgroundColor = '#FF151515'
$psISE.Options.OutputPaneTextBackgroundColor = '#FF151515'
$psISE.Options.OutputPaneForegroundColor = '#FFFFFFFF'

# command pane
$psISE.Options.CommandPaneBackgroundColor = '#FF151515'

# script pane
$psISE.Options.ScriptPaneBackgroundColor = '#FF151515'

# tokens
$psISE.Options.TokenColors['Command'] = '#FFFFFF60'
$psISE.Options.TokenColors['Unknown'] = '#FFFFFFFF'
$psISE.Options.TokenColors['Member'] = '#FFFFFFFF'
$psISE.Options.TokenColors['Position'] = '#FFFFFFFF'
$psISE.Options.TokenColors['GroupEnd'] = '#FFFFFFFF'
$psISE.Options.TokenColors['GroupStart'] = '#FFFFFFFF'
$psISE.Options.TokenColors['LineContinuation'] = '#FFFFFFFF'
$psISE.Options.TokenColors['NewLine'] = '#FFFFFFFF'
$psISE.Options.TokenColors['StatementSeparator'] = '#FFFFFFFF'
$psISE.Options.TokenColors['Comment'] = '#FFAEAEAE'
$psISE.Options.TokenColors['String'] = '#FF00D42D'
$psISE.Options.TokenColors['Keyword'] = '#FFFFDE00'
$psISE.Options.TokenColors['Attribute'] = '#FF84A7C1'
$psISE.Options.TokenColors['Type'] = '#FF84A7C1'
$psISE.Options.TokenColors['Variable'] = '#FF00D42D'
$psISE.Options.TokenColors['CommandParameter'] = '#FFFFDE00'
$psISE.Options.TokenColors['CommandArgument'] = '#FFFFFFFF'
$psISE.Options.TokenColors['Number'] = '#FF98FE1E'
