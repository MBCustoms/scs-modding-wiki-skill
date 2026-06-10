# Changelog

All notable changes to this project are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
This project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

---

## [1.0.0] — 2026-06-10

### Added

**Skill content**
- Complete mirror of the SCS Software Modding Wiki: 162 pages across 10 categories
- `skill/SKILL.md` — Claude Code skill definition with category routing and quick lookup examples
- `skill/index.json` — Full-text search index with title, URL, category, and keywords for all 162 pages
- `skill/sources.json` — URL-to-file mapping for all wiki pages
- `skill/crawl_report.md` — Crawl status report confirming 162/162 pages fetched
- `skill/docs/` — All 162 wiki pages as clean Markdown files

**Engine documentation (116 pages)**
- 46 unit definition pages: truck accessories, trailers, cargo, engines, transmissions, wheels, paint jobs, interior, sound units
- 23 configuration variable pages: g_* and r_* engine cvars
- 18 engine core pages: console, formats, fonts, game data, mod manager, detours, multi-monitor, random road events
- 12 sound system pages: truck engine audio, cabin filtering, chassis, tires, transmission, mixer
- 2 Telemetry SDK pages
- 1 unspecified unit page

**Tools documentation (46 pages)**
- 33 SCS Blender Tools pages: installation, export, import, materials, shaders, locators, animations, variant system, look system, part system
- 11 SCS Workshop Uploader pages: validation, error codes, mod structure, Steam formatting, FAQ
- 10 Map Editor pages: shortcuts, batch renaming, ATS rescale, sector lock API, note API, new features 1.47–1.49
- 6 tools pages: archive extractor, archive packer, conversion tools, dedicated server, font generator

**Repository infrastructure**
- `README.md` — Full installation guide, usage examples, coverage table, badges
- `LICENSE` — MIT license (skill infrastructure); attribution notice for SCS wiki content
- `CONTRIBUTING.md` — Contribution guide covering wiki sync, bug reports, examples, PRs
- `CODE_OF_CONDUCT.md` — Contributor Covenant 2.1
- `SECURITY.md` — Responsible disclosure policy
- `CHANGELOG.md` — This file
- `.gitignore` — Standard ignores for Claude Code projects
- `PROJECT_STRUCTURE.md` — Annotated repository layout

**GitHub community files**
- `.github/ISSUE_TEMPLATE/bug_report.yml`
- `.github/ISSUE_TEMPLATE/documentation_issue.yml`
- `.github/ISSUE_TEMPLATE/skill_improvement.yml`
- `.github/ISSUE_TEMPLATE/wiki_sync_issue.yml`
- `.github/PULL_REQUEST_TEMPLATE.md`
- `.github/FUNDING.yml`

**Documentation** (`docs/`)
- `installation.md` — Detailed installation guide for Windows, macOS, Linux
- `updating.md` — Step-by-step wiki re-crawl and update process
- `architecture.md` — Skill internals: how SKILL.md, index.json, and docs/ work together
- `data-sources.md` — Data sourcing, attribution, and freshness policy
- `coverage.md` — Full documentation coverage report by category
- `faq.md` — Frequently asked questions
- `troubleshooting.md` — Common issues and solutions

**Examples** (`examples/`)
- `ets2-truck-mod.md` — Truck accessory and engine modding prompts
- `ats-mod.md` — ATS-specific modding prompts
- `sii-unit-files.md` — Unit file generation and structure
- `map-editor.md` — Map Editor workflow prompts
- `blender-tools.md` — SCS Blender Tools export workflow
- `sound-modding.md` — Truck sound system modding
- `workshop-uploader.md` — Workshop upload validation and structure

**Scripts** (`scripts/`)
- `update-wiki.ps1` — PowerShell script to re-crawl the SCS wiki and refresh skill content

---

[Unreleased]: https://github.com/MBCustoms/scs-modding-wiki-skill/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/MBCustoms/scs-modding-wiki-skill/releases/tag/v1.0.0
