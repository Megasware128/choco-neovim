﻿$ErrorActionPreference = 'Stop'; # stop on all errors
$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName
$url        = 'https://github.com/neovim/neovim/releases/download/v0.2.2/nvim-win32.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/neovim/neovim/releases/download/v0.2.2/nvim-win64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $destDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'neovim*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = ''
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = ''
  checksumType64= 'sha256' #default is checksumType

  validExitCodes= @(0) #please insert other valid exit codes here
}

Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Write-Output "Please Consider donating https://salt.bountysource.com/teams/neovim"
Write-Output "Issues? Please visit https://github.com/neovim/neovim/wiki/Installing-Neovim"
