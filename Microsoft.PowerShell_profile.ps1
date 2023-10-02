oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression

Set-Alias -name "c" -value "cls"
Set-Alias -name "g" -value "git"
Set-Alias -name "v" -value "nvim"
Set-Alias -name "n" -value "npm"
Set-Alias -name "y" -value "yarn"
Set-Alias -name "p" -value "python"
Set-Alias -name "pn" -value "pnpm"
Set-Alias -name "re" -value "refreshenv"

# Open neovim
function v.() {
  nvim .
}
function vrepos([string]$repo) {
  Set-Location C:\repos\$repo
  nvim .
}

# Change directory
function ch(){
  Set-Location $HOME
}
function cwh () {
  Set-Location $HOME
}
function cdoc() {
  Set-Location $HOME\Documents
}
function cdocs() {
  Set-Location $HOME\Documents
}
function crepos([string]$repo) {
  Set-Location C:\repos\$repo
}
function cvim() {
  Set-Location $HOME\AppData\Local\nvim
}
function cnvim() {
  Set-Location $HOME\AppData\Local\nvim
}

# Open directory/project
function vnotes() {
  Set-Location $HOME\Documents
  nvim notes.md
}
function vdocs() {
  Set-Location $HOME\Documents
  nvim .
}
function vrepos([string]$repo) {
  Set-Location C:\repos\$repo
  nvim .
}

# Edit config files
function nconf() {
  Set-Location $HOME\AppData\Local\nvim
  nvim .
}
function vconf() {
  Set-Location $HOME\AppData\Local\nvim
  nvim .
}
function gconf() {
  nvim $HOME\.gitconfig
}
function pconf() {
  Set-Location $HOME\OneDrive\Documents\WindowsPowerShell
  nvim .\Microsoft.PowerShell_profile.ps1
}

# Directory utils
function gcip([string]$item) {
  Get-ChildItem -path *$item*
}
function gcipr([string]$item) {
  Get-ChildItem -path *$item* -recurse
}
function rmf([string]$item) {
  Remove-Item -path $item -recurse -force
}

# Terminal tabs/windows
function nt([int]$n = 1) {
  $cwd = Get-Location
  for ($i = 0; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $cwd
  }
}
function nw([int]$n) {
  $cwd = Get-Location
  wt nw -d $cwd -n $n
}
function e() {
  exit
}
