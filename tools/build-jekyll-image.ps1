<#
.SYNOPSIS
  Build a local Docker image for Jekyll development.

.DESCRIPTION
  Builds an image named `agent-habits-jekyll:local` from the repository Dockerfile.

.USAGE
  .\tools\build-jekyll-image.ps1 [-Tag 'agent-habits-jekyll:local']
#>

param(
    [string]$Tag = 'agent-habits-jekyll:local'
)

function Fail($msg) { Write-Error $msg; exit 1 }

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Fail "Docker is not installed or not in PATH. Install Docker Desktop and try again."  
}

$pwdPath = (Get-Location).Path
Write-Output "Building Docker image '$Tag' from: $pwdPath"

$buildCmd = "docker build -t $Tag -f Dockerfile ."
Write-Output "Running: $buildCmd"

try {
    iex $buildCmd
}
catch {
    Fail "Docker build failed. $_"
}

Write-Output "Image built: $Tag"
