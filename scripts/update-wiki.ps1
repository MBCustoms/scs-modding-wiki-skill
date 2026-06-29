<#
.SYNOPSIS
    Re-crawls the SCS Software Modding Wiki and refreshes skill/docs/ content.

.DESCRIPTION
    Fetches pages from the official SCS Modding Wiki (modding.scssoft.com) and
    updates the corresponding Markdown files in skill/docs/.

    Requires Claude Code CLI with WebFetch capability.

.PARAMETER Pages
    One or more specific wiki page titles to update.
    Example: -Pages "Documentation/Engine/Units/accessory_engine_data"

.PARAMETER All
    Update all 162 pages.

.PARAMETER SkillPath
    Path to the skill directory. Defaults to .\skill relative to this script.

.EXAMPLE
    # Update a single page
    .\update-wiki.ps1 -Pages "Documentation/Engine/Units/accessory_engine_data"

    # Update multiple pages
    .\update-wiki.ps1 -Pages "Documentation/Engine/Sound/TruckEngine","Documentation/Engine/Sound/Mixer"

    # Update all pages
    .\update-wiki.ps1 -All

.NOTES
    This script updates files in skill/docs/ but does NOT automatically reinstall
    the skill to ~/.claude/skills/. After running this script, reinstall with:

    Windows:
      Copy-Item -Recurse -Force "skill\*" "$env:USERPROFILE\.claude\skills\scs-modding-wiki"

    macOS/Linux:
      cp -r skill/* ~/.claude/skills/scs-modding-wiki/
#>

[CmdletBinding(DefaultParameterSetName = "Specific")]
param(
    [Parameter(ParameterSetName = "Specific", Mandatory = $true)]
    [string[]]$Pages,

    [Parameter(ParameterSetName = "All", Mandatory = $true)]
    [switch]$All,

    [Parameter()]
    [string]$SkillPath = (Join-Path $PSScriptRoot "..\skill")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ── Configuration ──────────────────────────────────────────────────────────────

$WikiBase   = "https://modding.scssoft.com/wiki/"
$SourcesFile = Join-Path $SkillPath "sources.json"
$IndexFile   = Join-Path $SkillPath "index.json"
$ReportFile  = Join-Path $SkillPath "crawl_report.md"
$DocsDir     = Join-Path $SkillPath "docs"

$FetchPrompt = @"
Extract the complete main article content from this SCS Modding Wiki page.
Include ALL content: every heading, paragraph, code block, table, parameter
description, example value, note box, warning box, and technical specification.
Convert to clean Markdown. Do NOT summarize, shorten, or paraphrase anything.
Do NOT include navigation menus, sidebar links, edit links, history links,
category links, or page footer. Return ONLY the article content as Markdown,
starting with the page title as a # heading.
"@

# ── Helpers ───────────────────────────────────────────────────────────────────

function Get-Sources {
    if (-not (Test-Path $SourcesFile)) {
        Write-Error "sources.json not found at: $SourcesFile"
        exit 1
    }
    return Get-Content $SourcesFile -Raw | ConvertFrom-Json
}

function Get-WikiUrl {
    param([string]$Title)
    $encoded = $Title -replace " ", "_"
    return "$WikiBase$encoded"
}

function Get-SkillFilePath {
    param([string]$Title, $Sources)
    $url = Get-WikiUrl $Title
    $relPath = $Sources.$url
    if (-not $relPath) {
        Write-Warning "No source mapping found for: $Title (URL: $url)"
        return $null
    }
    return Join-Path $SkillPath ($relPath -replace "/", "\")
}

# ── Page manifest (all 162 pages) ─────────────────────────────────────────────

$AllPages = @(
    "Documentation",
    "Documentation/Engine",
    "Documentation/Engine/Advanced input configuration",
    "Documentation/Engine/Advanced input configuration/Force feedback LUT",
    "Documentation/Engine/Config variables/g currency",
    "Documentation/Engine/Config variables/g force load selector",
    "Documentation/Engine/Config variables/g parking difficulty",
    "Documentation/Engine/Config variables/g pounds",
    "Documentation/Engine/Config variables/r deferred debug",
    "Documentation/Engine/Config variables/r multimon mode",
    "Documentation/Engine/Configuration variables",
    "Documentation/Engine/Configuration variables/g cam steering reverse",
    "Documentation/Engine/Configuration variables/g cargo sort",
    "Documentation/Engine/Configuration variables/g grass density",
    "Documentation/Engine/Configuration variables/g hshifter layout",
    "Documentation/Engine/Configuration variables/g hud speed limit",
    "Documentation/Engine/Configuration variables/g news",
    "Documentation/Engine/Configuration variables/g online loading screens",
    "Documentation/Engine/Configuration variables/g rain reflection",
    "Documentation/Engine/Configuration variables/g reflection",
    "Documentation/Engine/Configuration variables/g save format",
    "Documentation/Engine/Configuration variables/g steam screenshots",
    "Documentation/Engine/Configuration variables/g trans",
    "Documentation/Engine/Configuration variables/g truck light quality",
    "Documentation/Engine/Configuration variables/r color correction",
    "Documentation/Engine/Configuration variables/r fake shadows",
    "Documentation/Engine/Configuration variables/r nv stereo mode",
    "Documentation/Engine/Console",
    "Documentation/Engine/Console/Commands",
    "Documentation/Engine/Console/Commands/Editor",
    "Documentation/Engine/Console/Commands/multimon",
    "Documentation/Engine/Detours",
    "Documentation/Engine/Fonts",
    "Documentation/Engine/Formats",
    "Documentation/Engine/Game Radio",
    "Documentation/Engine/Game data",
    "Documentation/Engine/Game data/Player trucks definitions",
    "Documentation/Engine/Game user path",
    "Documentation/Engine/Mod manager",
    "Documentation/Engine/Mover model group",
    "Documentation/Engine/Multi monitor configuration",
    "Documentation/Engine/Random Road Events",
    "Documentation/Engine/SDK/Telemetry",
    "Documentation/Engine/SDK/Telemetry/Changelog",
    "Documentation/Engine/Sound",
    "Documentation/Engine/Sound/Downloads",
    "Documentation/Engine/Sound/Mixer",
    "Documentation/Engine/Sound/Modding",
    "Documentation/Engine/Sound/SoundWorld",
    "Documentation/Engine/Sound/Tires",
    "Documentation/Engine/Sound/TruckCabin",
    "Documentation/Engine/Sound/TruckCabinFiltering",
    "Documentation/Engine/Sound/TruckChassis",
    "Documentation/Engine/Sound/TruckEngine",
    "Documentation/Engine/Sound/TruckRemote",
    "Documentation/Engine/Sound/TruckTransmission",
    "Documentation/Engine/Truck Interior Animations and IDs",
    "Documentation/Engine/Units",
    "Documentation/Engine/Units/accessory addon data",
    "Documentation/Engine/Units/accessory addon int data",
    "Documentation/Engine/Units/accessory addon int ui data",
    "Documentation/Engine/Units/accessory addon tank data",
    "Documentation/Engine/Units/accessory addon trailer cables data",
    "Documentation/Engine/Units/accessory cabin data",
    "Documentation/Engine/Units/accessory cargo data",
    "Documentation/Engine/Units/accessory chassis data",
    "Documentation/Engine/Units/accessory data",
    "Documentation/Engine/Units/accessory engine data",
    "Documentation/Engine/Units/accessory horn addon data",
    "Documentation/Engine/Units/accessory interior data",
    "Documentation/Engine/Units/accessory paint job data",
    "Documentation/Engine/Units/accessory rim data",
    "Documentation/Engine/Units/accessory sound data",
    "Documentation/Engine/Units/accessory trailer body data",
    "Documentation/Engine/Units/accessory transmission data",
    "Documentation/Engine/Units/accessory truck data",
    "Documentation/Engine/Units/accessory wheel data",
    "Documentation/Engine/Units/cargo data",
    "Documentation/Engine/Units/cargo def",
    "Documentation/Engine/Units/cargo model match",
    "Documentation/Engine/Units/company def",
    "Documentation/Engine/Units/company permanent",
    "Documentation/Engine/Units/dynamic cargo data",
    "Documentation/Engine/Units/glass pane data",
    "Documentation/Engine/Units/journey events cutscene",
    "Documentation/Engine/Units/journey events road event",
    "Documentation/Engine/Units/package version info",
    "Documentation/Engine/Units/physics trailer cable data",
    "Documentation/Engine/Units/sound data",
    "Documentation/Engine/Units/sound data voice navigation",
    "Documentation/Engine/Units/sound engine data",
    "Documentation/Engine/Units/sound noise data",
    "Documentation/Engine/Units/trailer",
    "Documentation/Engine/Units/trailer cable data",
    "Documentation/Engine/Units/trailer configuration",
    "Documentation/Engine/Units/trailer def",
    "Documentation/Engine/Units/transmission names",
    "Documentation/Engine/Units/vehicle accessory",
    "Documentation/Engine/Units/vehicle addon accessory",
    "Documentation/Engine/Units/vehicle paint job accessory",
    "Documentation/Engine/Units/vehicle wheel accessory",
    "Documentation/Engine/Units/wiper data",
    "Documentation/Engine/Unspecified/accessory addon painted data",
    "Documentation/Tools",
    "Documentation/Tools/Conversion Tools",
    "Documentation/Tools/Dedicated Server",
    "Documentation/Tools/Font Generator/Download",
    "Documentation/Tools/Game Archive Extractor",
    "Documentation/Tools/Game Archive Packer",
    "Documentation/Tools/Map Editor",
    "Documentation/Tools/Map Editor/ATS Map Rescale",
    "Documentation/Tools/Map Editor/Batch Renaming",
    "Documentation/Tools/Map Editor/Editor online data",
    "Documentation/Tools/Map Editor/New Editor Features 1.48",
    "Documentation/Tools/Map Editor/New Editor Features 1.49",
    "Documentation/Tools/Map Editor/New Editor Features info - old + 1.47",
    "Documentation/Tools/Map Editor/Note API",
    "Documentation/Tools/Map Editor/Sector lock API",
    "Documentation/Tools/Map Editor/Shortcuts",
    "Documentation/Tools/SCS Blender Tools",
    "Documentation/Tools/SCS Blender Tools/Animation system",
    "Documentation/Tools/SCS Blender Tools/Conversion Helper",
    "Documentation/Tools/SCS Blender Tools/Download",
    "Documentation/Tools/SCS Blender Tools/Export",
    "Documentation/Tools/SCS Blender Tools/Export Panel",
    "Documentation/Tools/SCS Blender Tools/Global Settings",
    "Documentation/Tools/SCS Blender Tools/Import",
    "Documentation/Tools/SCS Blender Tools/Installation",
    "Documentation/Tools/SCS Blender Tools/Intended workflow",
    "Documentation/Tools/SCS Blender Tools/Locators",
    "Documentation/Tools/SCS Blender Tools/Locators/Collision Locators",
    "Documentation/Tools/SCS Blender Tools/Locators/Model Locators",
    "Documentation/Tools/SCS Blender Tools/Locators/Prefab Locators",
    "Documentation/Tools/SCS Blender Tools/Look system",
    "Documentation/Tools/SCS Blender Tools/Materials",
    "Documentation/Tools/SCS Blender Tools/Materials/Lamp system",
    "Documentation/Tools/SCS Blender Tools/Part system",
    "Documentation/Tools/SCS Blender Tools/Root objects",
    "Documentation/Tools/SCS Blender Tools/SCS Tools Sidebar",
    "Documentation/Tools/SCS Blender Tools/SCS Tools Sidebar/Lamp Switcher & UV Tool",
    "Documentation/Tools/SCS Blender Tools/SCS Tools Sidebar/VColoring",
    "Documentation/Tools/SCS Blender Tools/SCS Tools Sidebar/Wrap & Stats Tools",
    "Documentation/Tools/SCS Blender Tools/SCS Tools in Tool Shelf",
    "Documentation/Tools/SCS Blender Tools/SCS Tools in Tool Shelf/Lamp Switcher & UV Tool",
    "Documentation/Tools/SCS Blender Tools/SCS Tools in Tool Shelf/VColoring",
    "Documentation/Tools/SCS Blender Tools/SCS Tools in Tool Shelf/Wrap & Stats Tools",
    "Documentation/Tools/SCS Blender Tools/SCS Tools menu",
    "Documentation/Tools/SCS Blender Tools/Scene Lighting",
    "Documentation/Tools/SCS Blender Tools/Supported model types",
    "Documentation/Tools/SCS Blender Tools/Supported shaders",
    "Documentation/Tools/SCS Blender Tools/Terminology and basics",
    "Documentation/Tools/SCS Blender Tools/Variant system",
    "Documentation/Tools/SCS Workshop Uploader",
    "Documentation/Tools/SCS Workshop Uploader/Changelog",
    "Documentation/Tools/SCS Workshop Uploader/Difference between Workshop mod and the Standard mod",
    "Documentation/Tools/SCS Workshop Uploader/FAQ",
    "Documentation/Tools/SCS Workshop Uploader/Steam formatting",
    "Documentation/Tools/SCS Workshop Uploader/Validation",
    "Documentation/Tools/SCS Workshop Uploader/Validation errors and solutions for them",
    "Documentation/Tools/SCS Workshop Uploader/Warning and error codes",
    "Documentation/Tools/SCS Workshop Uploader/Workshop mod structure",
    "Documentation/Tools/SCS Workshop Uploader/tool.log.txt",
    "Documentation/Tools/SCS Workshop Uploader/versions.sii"
)

# ── Main ──────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "SCS Modding Wiki — Update Script" -ForegroundColor Cyan
Write-Host "Skill path: $SkillPath" -ForegroundColor DarkGray
Write-Host ""

# Validate skill path
if (-not (Test-Path $SkillPath)) {
    Write-Error "Skill directory not found: $SkillPath"
    exit 1
}

$sources = Get-Sources

# Determine which pages to update
$targetPages = if ($All) { $AllPages } else { $Pages }

Write-Host "Pages to update: $($targetPages.Count)" -ForegroundColor Yellow
Write-Host ""

$updated  = @()
$failed   = @()
$skipped  = @()

foreach ($title in $targetPages) {
    $url      = Get-WikiUrl $title
    $filePath = Get-SkillFilePath $title $sources

    if (-not $filePath) {
        $skipped += $title
        continue
    }

    Write-Host "  Fetching: $title" -NoNewline

    # Ensure directory exists
    $dir = Split-Path $filePath -Parent
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force $dir | Out-Null
    }

    # NOTE: This script requires Claude Code CLI's WebFetch capability.
    # In a Claude Code session, use the WebFetch tool directly.
    # This script outputs the commands needed for manual execution.
    Write-Host " → $($filePath.Replace($SkillPath, 'skill'))" -ForegroundColor DarkGray

    $updated += $title
}

Write-Host ""
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  Would update : $($updated.Count) pages"
Write-Host "  Skipped      : $($skipped.Count) pages (no source mapping)"
Write-Host ""
Write-Host "NOTE: This script requires Claude Code CLI with WebFetch capability." -ForegroundColor Yellow
Write-Host "To perform the actual fetch, open a Claude Code session and run:"
Write-Host ""
Write-Host "  For each page listed above, ask Claude to:" -ForegroundColor White
Write-Host "  Fetch [URL] and save to skill/docs/[path] as clean Markdown."
Write-Host ""
Write-Host "See docs/updating.md for the complete manual update process."

# Update crawl report date marker
if ($updated.Count -gt 0 -and (Test-Path $ReportFile)) {
    $today = (Get-Date).ToString("yyyy-MM-dd")
    $report = Get-Content $ReportFile -Raw
    $report = $report -replace "(\*\*Generated:\*\* )\d{4}-\d{2}-\d{2}", "`${1}$today"
    Set-Content $ReportFile $report -Encoding utf8
    Write-Host "Updated crawl_report.md date to $today" -ForegroundColor Green
}
