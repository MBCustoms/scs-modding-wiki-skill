# Release Notes — v1.0.0

**Release date:** 2026-06-10
**Repository:** https://github.com/MBCustoms/scs-modding-wiki-skill

---

## Overview

This is the initial public release of the **SCS Modding Wiki — Claude Code Skill**.

The skill packages the complete [SCS Software Modding Wiki](https://modding.scssoft.com/wiki/Documentation) into a Claude Code skill, giving AI assistants instant, offline access to all 162 pages of official ETS2 and ATS modding documentation.

This release establishes the project as a professional open-source repository, with full documentation, community files, usage examples, and maintenance scripts.

---

## What's Included

### Skill Content (162 Pages)

Complete mirror of the SCS Software Modding Wiki, crawled on 2026-06-10:

| Category | Pages |
|---|---|
| Engine Units | 46 |
| SCS Blender Tools | 33 |
| Engine Config Variables | 23 |
| Engine Core | 18 |
| Engine Sound | 12 |
| SCS Workshop Uploader | 11 |
| Map Editor | 10 |
| Tools | 6 |
| Engine SDK | 2 |
| Root | 1 |
| **Total** | **162** |

### Repository Infrastructure

- `README.md` with badges, full installation guide, coverage table, example prompts
- MIT License (infrastructure) with SCS Software attribution notice
- `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`, `CHANGELOG.md`
- `.gitignore` and `PROJECT_STRUCTURE.md`
- 4 GitHub issue templates (Bug Report, Documentation Issue, Skill Improvement, Wiki Sync)
- Pull request template and `FUNDING.yml`
- 7 documentation files in `docs/`
- 7 usage example files in `examples/`
- `scripts/update-wiki.ps1` for wiki re-crawl

---

## Installation

```bash
git clone https://github.com/MBCustoms/scs-modding-wiki-skill.git
```

**Windows:**
```powershell
Copy-Item -Recurse -Force "scs-modding-wiki-skill\skill\*" "$env:USERPROFILE\.claude\skills\scs-modding-wiki"
```

**macOS / Linux:**
```bash
cp -r scs-modding-wiki-skill/skill/* ~/.claude/skills/scs-modding-wiki/
```

See [docs/installation.md](docs/installation.md) for detailed instructions.

---

## Known Limitations

1. **Content freshness** — Wiki content reflects the state of modding.scssoft.com on 2026-06-10. Pages updated by SCS Software after that date are not reflected. Use `scripts/update-wiki.ps1` or open a [Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=wiki_sync_issue.yml) to report outdated pages.

2. **No auto-update** — The skill does not automatically sync with the wiki. Updates require a manual re-crawl. Automated sync is a v1.1 roadmap item.

3. **English only** — The SCS Modding Wiki is English-only. The skill content mirrors this and does not include any translations.

4. **Claude Code only** — This skill uses the Claude Code skill format. It is not compatible with other AI assistants or IDE plugins out of the box.

5. **Update script requires Claude Code CLI** — The `scripts/update-wiki.ps1` script currently outputs instructions rather than performing automatic fetches directly. Full automation is planned for a future release.

---

## Future Roadmap

**v1.1**
- Automated wiki sync via GitHub Actions workflow
- Diff-based update detection (only fetch changed pages)
- Update notification when SCS releases a new game version

**v1.2**
- Cross-reference links between related unit types within skill responses
- Category-level summary pages for faster context loading

**v2.0**
- Support for community-contributed modding documentation (beyond the official wiki)
- Multi-language support if SCS publishes translated wiki content

---

## Credits

**Maintained by:** [MBCustoms](https://github.com/MBCustoms)

**Data source:** [SCS Software Modding Wiki](https://modding.scssoft.com/wiki/Documentation) — © SCS Software s.r.o.

**Platform:** [Claude Code](https://claude.ai/code) — Anthropic
