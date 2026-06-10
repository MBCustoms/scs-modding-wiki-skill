# Contributing to SCS Modding Wiki Skill

Thank you for taking the time to contribute. This guide explains how to help improve the skill.

---

## Table of Contents

- [Ways to Contribute](#ways-to-contribute)
- [Reporting Issues](#reporting-issues)
- [Submitting Pull Requests](#submitting-pull-requests)
- [Wiki Sync Contributions](#wiki-sync-contributions)
- [Adding Examples](#adding-examples)
- [Improving Documentation](#improving-documentation)
- [Code of Conduct](#code-of-conduct)

---

## Ways to Contribute

| Contribution Type | Description | How |
|---|---|---|
| Wiki Sync Report | A wiki page has changed | [Open a Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=wiki_sync_issue.yml) |
| Bug Report | Skill behaves incorrectly | [Open a Bug Report](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=bug_report.yml) |
| Documentation Issue | Docs are wrong or missing | [Open a Documentation Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=documentation_issue.yml) |
| Skill Improvement | Better prompts, index, routing | [Open a Skill Improvement Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=skill_improvement.yml) |
| Usage Example | Real-world modding workflow | Open a PR adding a file to `examples/` |
| Script Fix | `scripts/update-wiki.ps1` issue | Open a PR with the fix |

---

## Reporting Issues

Before opening an issue:

1. Search [existing issues](https://github.com/MBCustoms/scs-modding-wiki-skill/issues) to avoid duplicates.
2. Check if the issue exists on the [official SCS wiki](https://modding.scssoft.com/wiki/Documentation) as well.
3. Use the appropriate issue template.

**For wiki content issues:** The canonical source is the [SCS Software Modding Wiki](https://modding.scssoft.com/wiki/Documentation). If the official wiki has the correct information but the skill file is wrong or outdated, that is a valid issue here. If the official wiki itself is wrong, please report it to SCS Software directly.

---

## Submitting Pull Requests

### For wiki content updates

1. Fork the repository.
2. Run the update script to fetch the latest content for the affected pages:
   ```powershell
   .\scripts\update-wiki.ps1 -Pages "Documentation/Engine/Units/accessory_engine_data"
   ```
3. Verify the fetched content matches the current official wiki page.
4. Open a PR referencing the relevant issue.

### For infrastructure changes (scripts, docs, examples)

1. Fork the repository.
2. Create a branch: `git checkout -b feat/your-description`
3. Make your changes.
4. Ensure markdown files render correctly.
5. Open a PR with a clear description of what changed and why.

### PR checklist

- [ ] Title is clear and describes the change
- [ ] Description explains the motivation
- [ ] New files follow the existing naming conventions
- [ ] No unrelated changes are included

---

## Wiki Sync Contributions

The wiki content in `skill/docs/` was crawled on 2026-06-10. SCS Software updates the wiki when game patches are released.

If you notice a page is out of date:

1. Open a [Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=wiki_sync_issue.yml).
2. Include the page title, the wiki URL, and a brief description of what changed.

To update a page yourself and submit a PR:

1. Locate the file in `skill/docs/` (the path matches the wiki URL structure).
2. Fetch the current content from the official wiki.
3. Replace the file content with the updated version.
4. Include the update date in your PR description.

---

## Adding Examples

Examples live in `examples/`. Each file demonstrates a real modding workflow using the skill.

**File naming:** `examples/topic-name.md`

**Example format:**
```markdown
# [Topic] — Example Prompts & Answers

## Overview
Brief description of what modding task this covers.

## Example 1: [Specific Task]

**Prompt:**
> Your question to Claude here

**What the skill looks up:**
- `docs/engine/units/accessory_engine_data.md`
- Source: https://modding.scssoft.com/wiki/...

**Key information returned:**
Summary of the relevant content.

---

## Example 2: ...
```

---

## Improving Documentation

Project documentation lives in `docs/`. These files explain the skill, installation, and architecture — they do not duplicate the wiki content.

When editing documentation:

- Keep explanations factual and concise
- Link to the official SCS wiki when referencing game-specific behavior
- Update the table of contents if you add new sections

---

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold it.
