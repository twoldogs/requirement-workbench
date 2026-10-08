[CmdletBinding()]
param(
    [string]$CodexHome
)

$ErrorActionPreference = 'Stop'

$sourceCandidates = @(
    (Join-Path $PSScriptRoot 'skills'),
    (Join-Path $PSScriptRoot 'codex\skills')
)
$sourceRoot = $sourceCandidates |
    Where-Object { Test-Path -LiteralPath $_ -PathType Container } |
    Select-Object -First 1

if ([string]::IsNullOrWhiteSpace($sourceRoot)) {
    throw "Package is incomplete: neither .\skills nor .\codex\skills was found."
}
$sourceRoot = [System.IO.Path]::GetFullPath($sourceRoot)

$packageSkills = @(Get-ChildItem -LiteralPath $sourceRoot -Directory)
if ($packageSkills.Count -eq 0) {
    throw "Package is incomplete: no skill directories were found in $sourceRoot."
}

foreach ($skill in $packageSkills) {
    if (-not (Test-Path -LiteralPath (Join-Path $skill.FullName 'SKILL.md') -PathType Leaf)) {
        throw "Package is incomplete: $($skill.FullName)\SKILL.md was not found."
    }
}

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    if (-not [string]::IsNullOrWhiteSpace($env:CODEX_HOME)) {
        $CodexHome = $env:CODEX_HOME
    }
    else {
        $CodexHome = Join-Path $env:USERPROFILE '.codex'
    }
}

$skillsRoot = [System.IO.Path]::GetFullPath((Join-Path $CodexHome 'skills'))
New-Item -ItemType Directory -Path $skillsRoot -Force | Out-Null

$skillsPrefix = $skillsRoot.TrimEnd([System.IO.Path]::DirectorySeparatorChar) + [System.IO.Path]::DirectorySeparatorChar
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$stagingRoot = Join-Path $skillsRoot ('.requirement-workbench-installing-' + $stamp)
$backupRoot = Join-Path $skillsRoot ('.requirement-workbench-backup-' + $stamp)
$failedRoot = Join-Path $skillsRoot ('.requirement-workbench-failed-' + $stamp)

New-Item -ItemType Directory -Path $stagingRoot | Out-Null

foreach ($skill in $packageSkills) {
    $staged = Join-Path $stagingRoot $skill.Name
    Copy-Item -LiteralPath $skill.FullName -Destination $staged -Recurse
    $sourceCount = (Get-ChildItem -LiteralPath $skill.FullName -Recurse -File).Count
    $stagedCount = (Get-ChildItem -LiteralPath $staged -Recurse -File).Count
    if ($sourceCount -ne $stagedCount -or -not (Test-Path -LiteralPath (Join-Path $staged 'SKILL.md') -PathType Leaf)) {
        throw "Staging verification failed. Inspect: $stagingRoot"
    }
}

$movedBackups = @()
$installed = @()

try {
    foreach ($skill in $packageSkills) {
        $target = [System.IO.Path]::GetFullPath((Join-Path $skillsRoot $skill.Name))
        if (-not $target.StartsWith($skillsPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
            throw "Installation refused: target is outside the Codex skills directory: $target"
        }

        if (Test-Path -LiteralPath $target) {
            if (-not (Test-Path -LiteralPath $backupRoot)) {
                New-Item -ItemType Directory -Path $backupRoot | Out-Null
            }
            $backup = Join-Path $backupRoot $skill.Name
            Move-Item -LiteralPath $target -Destination $backup
            $movedBackups += $skill.Name
        }
    }

    foreach ($skill in $packageSkills) {
        $staged = Join-Path $stagingRoot $skill.Name
        $target = Join-Path $skillsRoot $skill.Name
        Move-Item -LiteralPath $staged -Destination $target
        $installed += $skill.Name
    }

    foreach ($skill in $packageSkills) {
        $target = Join-Path $skillsRoot $skill.Name
        $sourceCount = (Get-ChildItem -LiteralPath $skill.FullName -Recurse -File).Count
        $targetCount = (Get-ChildItem -LiteralPath $target -Recurse -File).Count
        if ($sourceCount -ne $targetCount -or -not (Test-Path -LiteralPath (Join-Path $target 'SKILL.md') -PathType Leaf)) {
            throw "Post-install verification failed. Inspect: $target"
        }
    }
}
catch {
    if ($installed.Count -gt 0) {
        New-Item -ItemType Directory -Path $failedRoot -Force | Out-Null
        foreach ($name in $installed) {
            $target = Join-Path $skillsRoot $name
            if (Test-Path -LiteralPath $target) {
                Move-Item -LiteralPath $target -Destination (Join-Path $failedRoot $name)
            }
        }
    }

    foreach ($name in $movedBackups) {
        $backup = Join-Path $backupRoot $name
        $target = Join-Path $skillsRoot $name
        if ((Test-Path -LiteralPath $backup) -and -not (Test-Path -LiteralPath $target)) {
            Move-Item -LiteralPath $backup -Destination $target
        }
    }
    throw
}

$installedRows = foreach ($skill in $packageSkills) {
    $target = Join-Path $skillsRoot $skill.Name
    [pscustomobject]@{
        Skill = $skill.Name
        Files = (Get-ChildItem -LiteralPath $target -Recurse -File).Count
        Path = $target
    }
}

Write-Output 'Installed skill bundle:'
$installedRows | Format-Table -AutoSize | Out-String | Write-Output
if (Test-Path -LiteralPath $backupRoot) {
    Write-Output "Previous versions backup: $backupRoot"
}
Write-Output 'Open a new Codex conversation before using the bundle.'
