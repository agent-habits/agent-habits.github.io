<#
.SYNOPSIS
  Build (optional) and run a local Docker image for Jekyll development.

.DESCRIPTION
  Builds `agent-habits-jekyll:local` (or uses an existing image), then runs the container
  mounting the current repository so you can iterate locally.

.USAGE
  .\tools\run-jekyll-dev.ps1 [-Port 4000] [-Tag 'agent-habits-jekyll:local'] [-Rebuild]
  .\tools\run-jekyll-dev.ps1 -Image 'agent-habits-jekyll:local'  # run only

PARAMETERS
  -Port   Port to publish locally (default: 4000)
  -Tag    Local image tag to build/use (default: agent-habits-jekyll:local)
  -Rebuild Rebuild the local image before running
  -Image  If set, use this image instead of the local tag (skip build)
#>

param(
    [int]$Port = 4000,
    [string]$Tag = 'agent-habits-jekyll:local',
    [switch]$Rebuild,
    [string]$Image
)

function Fail($msg) { Write-Error $msg; exit 1 }

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Fail "Docker is not installed or not in PATH. Install Docker Desktop and try again."  
}

$pwdPath = (Get-Location).Path
Write-Output "Repository: $pwdPath"
Write-Output "Port: $Port"

# Decide which image to use
if ($Image) {
    $imageToUse = $Image
    Write-Output "Using image (override): $imageToUse"
}
else {
    $imageToUse = $Tag
    Write-Output "Using local image tag: $imageToUse"
}

# Build local image if requested or if not present
if (-not $Image) {
    $imageExists = & docker images -q $Tag 2>$null
    if ($Rebuild -or [string]::IsNullOrEmpty($imageExists)) {
        Write-Output "Building image '$Tag'..."
        if (Test-Path "tools/build-jekyll-image.ps1") {
            try { & .\tools\build-jekyll-image.ps1 -Tag $Tag }
            catch { Fail "Local build script failed: $_" }
        }
        else {
            $buildCmd = "docker build -t $Tag -f Dockerfile ."
            Write-Output "Running: $buildCmd"
            try { iex $buildCmd }
            catch { Fail "Docker build failed. $_" }
        }
    }
}

Write-Output "Running container from image: $imageToUse"

# Run container with mounted repo
$dockerArgs = @(
    'run', '--rm', '-it',
    '-v', "${pwdPath}:/srv/jekyll",
    '-p', "${Port}:4000",
    $imageToUse,
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
