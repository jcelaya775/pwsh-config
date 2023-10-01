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
