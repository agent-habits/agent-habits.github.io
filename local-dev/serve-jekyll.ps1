<#
.SYNOPSIS
  Serve the Jekyll site using Docker (recommended for Windows without Ruby setup).

.DESCRIPTION
  This script runs a Docker container using the official `jekyll/jekyll` image, installs
  gems via `bundle install` and runs `bundle exec jekyll serve --livereload`.

.USAGE
  .\local-dev\serve-jekyll.ps1 [-Port 4000]

Params:
  -Port: Port to publish locally (default 4000)

Notes:
  - Requires Docker Desktop to be installed and running.
  - The script mounts the current repository folder into the container.
#>

param(
  [int]$Port = 4000,
  [string]$Image = 'jekyll/jekyll:latest'
)

function Fail($msg) { Write-Error $msg; exit 1 }

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
  Fail "Docker is not installed or not in PATH. Install Docker Desktop and try again."  
}

$pwdPath = (Get-Location).Path
$sitePath = "$pwdPath/docs"
Write-Output "Serving site from: $pwdPath"
Write-Output "Using port: $Port"

# If no explicit image was provided, prefer a local dev image if available
if (-not $PSBoundParameters.ContainsKey('Image')) {
  $localTag = 'agent-habits-jekyll:local'
  $localImageId = (& docker images -q $localTag) 2>$null
  if (-not [string]::IsNullOrEmpty($localImageId)) {
    $Image = $localTag
    Write-Output "Found local image '$localTag' -> using it for serve."
  }
}

Write-Output "Using Docker image: $Image"
# Try to pull the requested image first; fall back if it doesn't exist
Write-Output "Pulling Docker image: $Image (this may take a moment)"
& docker pull $Image
if ($LASTEXITCODE -ne 0) {
  Write-Warning "Failed to pull image '$Image'. Falling back to 'jekyll/jekyll' (no tag)."
  $Image = 'jekyll/jekyll'
  Write-Output "Pulling fallback image: $Image"
  & docker pull $Image
  if ($LASTEXITCODE -ne 0) {
    Fail "Unable to pull fallback image 'jekyll/jekyll'. Ensure Docker can access the registry or specify a different image via -Image." 
  }
}

# Build docker args robustly to avoid quoting/escaping issues
$dockerArgs = @(
  'run', '--rm', '-it',
  '-v', "${sitePath}:/srv/jekyll",
  '-p', "${Port}:4000",
  $Image,
  'bash', '-lc',
  'bundle install && bundle exec jekyll serve --livereload --host 0.0.0.0 --port 4000 --trace'
)

$cmdPreview = 'docker ' + ($dockerArgs -join ' ')
Write-Output "Running: $cmdPreview"

try {
  & docker @dockerArgs
}
catch {
  Fail "Failed to run Docker. $_"
}
