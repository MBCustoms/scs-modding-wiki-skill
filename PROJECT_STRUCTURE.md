# Project Structure

This document describes every directory and file in the repository.

```
scs-modding-wiki-skill/
│
├── .github/                         GitHub-specific files
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.yml           Template for bug reports
│   │   ├── documentation_issue.yml  Template for doc errors/gaps
│   │   ├── skill_improvement.yml    Template for skill behavior improvements
│   │   └── wiki_sync_issue.yml      Template for reporting outdated wiki pages
│   ├── PULL_REQUEST_TEMPLATE.md     Default PR description template
│   └── FUNDING.yml                  GitHub Sponsors / funding links
│
├── docs/                            Project documentation (not wiki content)
│   ├── installation.md              Detailed multi-platform installation guide
│   ├── updating.md                  How to re-crawl and refresh wiki content
│   ├── architecture.md              How the skill works internally
│   ├── data-sources.md              Data sourcing, attribution, freshness policy
│   ├── coverage.md                  Full documentation coverage report
│   ├── faq.md                       Frequently asked questions
│   └── troubleshooting.md           Common problems and solutions
│
├── examples/                        Worked modding examples using the skill
│   ├── ets2-truck-mod.md            ETS2 truck accessory and engine modding
│   ├── ats-mod.md                   ATS-specific modding workflows
│   ├── sii-unit-files.md            Unit file generation and structure
│   ├── map-editor.md                Map Editor workflow prompts
│   ├── blender-tools.md             SCS Blender Tools export workflow
│   ├── sound-modding.md             Truck sound system modding
│   └── workshop-uploader.md         Workshop upload validation and structure
│
├── scripts/
│   └── update-wiki.ps1              Re-crawl script to refresh skill/docs/ content
│
├── skill/                           ← INSTALL THIS DIRECTORY
│   ├── SKILL.md                     Skill definition: name, description, routing rules
│   ├── index.json                   Search index: 162 entries with title, URL, category, keywords
│   ├── sources.json                 URL → file path mapping for all 162 wiki pages
│   ├── crawl_report.md              Crawl status: 162/162 pages fetched, by category
│   └── docs/                        All 162 SCS wiki pages as Markdown
│       ├── index.md                 Documentation root
│       ├── engine.md                Engine documentation overview
│       ├── engine/
│       │   ├── units/               46 unit definition files (.sii unit types)
│       │   ├── sound/               12 sound system files
│       │   ├── configuration_variables/  16 config variable files (g_*, r_*)
│       │   ├── config_variables/    6 older config variable files
│       │   ├── console/             Console and command reference
│       │   ├── sdk/                 Telemetry SDK
│       │   ├── game_data/           Player truck definitions
│       │   ├── advanced_input_configuration/
│       │   └── unspecified/         Uncategorized unit pages
│       └── tools/
│           ├── scs_blender_tools/   33 Blender Tools pages
│           ├── scs_workshop_uploader/  11 Workshop Uploader pages
│           ├── map_editor/          10 Map Editor pages
│           └── font_generator/      Font generator download
│
├── README.md                        Main project documentation
├── LICENSE                          MIT license (infrastructure); SCS attribution notice
├── CONTRIBUTING.md                  How to contribute
├── CODE_OF_CONDUCT.md               Contributor Covenant 2.1
├── SECURITY.md                      Responsible disclosure policy
├── CHANGELOG.md                     Version history
├── .gitignore                       Git ignore rules
└── PROJECT_STRUCTURE.md             This file
```

## Key Distinction: `docs/` vs `skill/docs/`

| Directory | Purpose |
|---|---|
| `docs/` | Project documentation — installation guides, architecture, FAQ |
| `skill/docs/` | Wiki content — the actual SCS modding documentation used by Claude |

Only `skill/` needs to be installed. The rest of the repository is for contributors and maintainers.

## Installation Target

When installing the skill, copy the contents of `skill/` to:

| Platform | Target path |
|---|---|
| Windows | `%USERPROFILE%\.claude\skills\scs-modding-wiki\` |
| macOS / Linux | `~/.claude/skills/scs-modding-wiki/` |

Claude Code discovers skills by scanning `~/.claude/skills/` for directories containing a `SKILL.md` file.
