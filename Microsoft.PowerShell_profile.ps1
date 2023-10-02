oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression

Set-Alias -name "c" -value "cls"
Set-Alias -name "g" -value "git"
Set-Alias -name "v" -value "nvim"
Set-Alias -name "n" -value "npm"
Set-Alias -name "y" -value "yarn"
Set-Alias -name "p" -value "python"
Set-Alias -name "pn" -value "pnpm"
Set-Alias -name "re" -value "refreshenv"

# TODO: find out how to fd absolute paths

# Open neovim
function v.() {
  nvim .
}
function v.d([int]$n) {
  $dir = "$(fd --type d --max-depth 1 | fzf)"
  Set-Location $dir
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $dir
  }
  nvim .
}
function v.dr([int]$n) {
  $dir = "$(fd --type d | fzf)"
  Set-Location $dir
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $dir
  }
  nvim .
}
function v.f([int]$n) {
  $file = "$(fd --type f --max-depth 1 | fzf)"
  nvim $file
}
function v.fr([int]$n) {
  $file = "$(fd --type f | fzf)"
  nvim $file
}
function vp([int]$n) {
  Set-Location C:\repos
  $project = "$(fd --type d --max-depth 1 | fzf)"
  Set-Location $project
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $project
  }
  nvim .
}
function vp.([int]$n) {
  Set-Location C:\repos
  $project = "$(fd --type d --max-depth 1 | fzf)"
  Set-Location $project
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $project
  }
  v.fr
}

# Edit config files
function nconf() {
  Set-Location $HOME\AppData\Local\nvim
  nvim .
}
function nconf.() {
  Set-Location $HOME\AppData\Local\nvim
  v.fr
}
function vconf() {
  Set-Location $HOME\AppData\Local\nvim
  nvim .
}
function vconf.() {
  Set-Location $HOME\AppData\Local\nvim
  v.fr
}
function gconf() {
  nvim $HOME\.gitconfig
}
function pconf() {
  Set-Location "$HOME\OneDrive\Documents\WindowsPowerShell"
  nvim .\Microsoft.PowerShell_profile.ps1
}

# Change directory
function c.([int]$n) {
  $dir = "$(Get-Childitem -Directory . | ForEach-Object{($_ -split "\s+")} | fzf)"
  Set-Location $dir
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $dir
  }
}
function c.r([int]$n) {
  $dir = "$(fd --type d | fzf)"
  Set-Location $dir
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $dir
  }
}
function c..([int]$n) {
  $dir = "..\$(Get-Childitem -Directory .. | ForEach-Object{($_ -split "\s+")} | fzf)"
  Set-Location $dir
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d $dir
  }
}
function ch(){
  Set-Location $HOME
}
function ch.(){
  Set-Location $HOME
  c.
}
function ch.r(){
  Set-Location $HOME
  c.r
}
function cwh () {
  Set-Location $HOME
}
function cwh.(){
  Set-Location $HOME
  c.
}
function cwh.r(){
  Set-Location $HOME
  c.r
}
function cdocs() {
  Set-Location $HOME\Documents
}
function cdocs.() {
  Set-Location $HOME\Documents
  c.r
}
function crepos([string]$repo) {
  Set-Location C:\repos\$repo
}
function crepos.([int]$n) {
  Set-Location C:\repos
  $dir = "$(fd --type d --max-depth 1 | fzf)"
  Set-Location $dir
  for ($i = 1; $i -lt $n; $i++) {
    wt.exe -w 0 nt -d C:\repos\$dir
  }
}
function cvim() {
  Set-Location $HOME\AppData\Local\nvim
}
function cvim.() {
  Set-Location $HOME\AppData\Local\nvim
  c.r
}
function cnvim() {
  Set-Location $HOME\AppData\Local\nvim
}
function cnvim.() {
  Set-Location $HOME\AppData\Local\nvim
  c.r
}

# Open directory/project in neovim
function vnotes() {
  Set-Location $HOME\Documents
  nvim notes.md
}
function vdocs() {
  Set-Location $HOME\Documents
  nvim .
}
function vdocs.() {
  Set-Location $HOME\Documents
  $file = "$(fd --type f | fzf)"
  nvim $file
  nvim .
}
function vrepos([string]$repo) {
  Set-Location C:\repos\$repo
  nvim .
}

# Working with directories
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
