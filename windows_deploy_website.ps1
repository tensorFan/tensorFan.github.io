$ErrorActionPreference = "Stop"

$WebsiteDir = $PSScriptRoot
$PagesDir = Join-Path (Split-Path $WebsiteDir -Parent) "gh-pages"
$SiteDir = Join-Path $WebsiteDir "_site"

if (-not (Test-Path (Join-Path $PagesDir ".git"))) {
    throw "The gh-pages worktree was not found at: $PagesDir"
}

Push-Location $WebsiteDir

try {
    Write-Host "Building website..."
    & bundle exec jekyll build

    if ($LASTEXITCODE -ne 0) {
        throw "Jekyll build failed."
    }

    if (-not (Test-Path (Join-Path $SiteDir "index.html"))) {
        throw "Jekyll did not generate _site\index.html."
    }

    Write-Host "Updating gh-pages..."
    & git -C $PagesDir pull --ff-only origin gh-pages

    if ($LASTEXITCODE -ne 0) {
        throw "Could not update the gh-pages branch."
    }

    # Copy all generated content, including hidden files.
    Get-ChildItem -Path $SiteDir -Force |
        Copy-Item -Destination $PagesDir -Recurse -Force

    & git -C $PagesDir add -A
    & git -C $PagesDir diff --cached --quiet

    $DiffStatus = $LASTEXITCODE

    if ($DiffStatus -eq 0) {
        Write-Host "No website changes to publish."
        return
    }

    if ($DiffStatus -ne 1) {
        throw "Could not inspect the generated changes."
    }

    & git -C $PagesDir commit -m "Update GitHub Pages"

    if ($LASTEXITCODE -ne 0) {
        throw "Could not commit the generated website."
    }

    & git -C $PagesDir push origin gh-pages

    if ($LASTEXITCODE -ne 0) {
        throw "Could not push the gh-pages branch."
    }

    Write-Host "Website published successfully."
}
finally {
    Pop-Location
}