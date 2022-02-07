# Aliases
Set-Alias vim nvim
Set-Alias ll ls

# Imports
Import-Module PSFzf
Import-Module PSReadLine
Import-Module Terminal-icons
Import-Module oh-my-posh
Import-Module z

# run oh-my-posh
$PROMPT_CONFIG = [IO.Path]::Combine($PSScriptRoot, "themes", "stelbent.minimal.omp.json")
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
# Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key "Ctrl+j" -Function NextHistory
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function PreviousHistory

# Fzf
Set-PsFzfOption -PSReadlineChordProvider "Ctrl+f" -PSReadlineChordReverseHistory "Ctrl+r"

# Utilities
function which ($exec) {
    Get-Command -Name $exec -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
