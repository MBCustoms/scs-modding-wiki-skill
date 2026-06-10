# Skill Architecture

This document explains how the SCS Modding Wiki skill works internally.

---

## Overview

The skill is a Claude Code skill — a directory of files that Claude reads when activated. When you ask a modding question, Claude:

1. Reads `SKILL.md` to understand what the skill covers and how to use it
2. Reads `index.json` to find relevant pages by keyword or category
3. Reads the matching files from `docs/` to get the actual content
4. Formulates an answer citing the source URL

---

## File Roles

### `SKILL.md`

The entry point. Claude reads this file whenever the skill is invoked. It contains:

- **Frontmatter** — the skill's `name` and `description` (used by Claude Code to decide when to activate the skill)
- **Routing instructions** — which categories map to which file paths
- **Quick lookup examples** — concrete examples that teach Claude the search pattern
- **Answer quality rules** — always cite URLs, always flag deprecated patterns

Claude follows these instructions as if they were system-level guidance for the session.

### `index.json`

A structured search index. Each entry contains:

```json
{
  "title": "Documentation/Engine/Units/accessory_engine_data",
  "file": "docs/engine/units/accessory_engine_data.md",
  "url": "https://modding.scssoft.com/wiki/Documentation/Engine/Units/accessory_engine_data",
  "category": "engine_units",
  "keywords": ["engine", "units", "accessory", "data"]
}
```

Claude searches this index to find which files are relevant to a query before reading any content files. This avoids loading all 162 pages into context for every question.

### `sources.json`

A flat URL-to-file mapping used for reverse lookup — given a wiki URL, find the local file. Useful for update scripts and cross-referencing.

### `docs/`

162 Markdown files mirroring the SCS Modding Wiki. Each file:

- Starts with the page title as an `#` heading
- Contains the complete article content (no navigation, no sidebar)
- Preserves all tables, code blocks, parameter descriptions, and examples
- Is stored at a path matching the wiki URL structure

---

## Skill Activation

Claude Code activates skills based on the `description` field in `SKILL.md`:

```yaml
---
name: scs-modding-wiki
description: Use when working on ETS2 or ATS mods, asking about SCS unit file
  formats (.sii, .sui), Blender Tools export/import, Map Editor, Workshop
  Uploader, sound modding, truck accessories, trailers, cargo, game
  configuration variables, console commands, or any question about official SCS
  Software modding documentation.
---
```

When a user's message matches this description, Claude loads the skill and follows its instructions.

---

## Search Flow

```
User prompt
    ↓
Claude reads SKILL.md
    ↓
Claude reads index.json
    ↓
Claude identifies matching entries by title keywords or category
    ↓
Claude reads matching docs/ files (lazy — only what's needed)
    ↓
Claude formulates answer with source URL citations
```

The key efficiency is lazy loading: Claude never reads all 162 files. It reads the index first, then fetches only the 1–5 files relevant to the question.

---

## Category Structure

Categories map topics to directory paths:

| Category | Directory | Pages |
|---|---|---|
| `engine` | `docs/engine/` | 18 |
| `engine_config` | `docs/engine/config_variables/`, `docs/engine/configuration_variables/` | 23 |
| `engine_sound` | `docs/engine/sound/` | 12 |
| `engine_units` | `docs/engine/units/` | 46 |
| `engine_sdk` | `docs/engine/sdk/` | 2 |
| `tools` | `docs/tools/` | 6 |
| `tools_blender` | `docs/tools/scs_blender_tools/` | 33 |
| `tools_map_editor` | `docs/tools/map_editor/` | 10 |
| `tools_workshop` | `docs/tools/scs_workshop_uploader/` | 11 |
| `root` | `docs/` | 1 |

---

## Extending the Skill

To add new wiki pages to the skill:

1. Fetch the new page content and save it to the correct path in `skill/docs/`
2. Add the page entry to `skill/index.json`
3. Add the URL-to-file mapping to `skill/sources.json`
4. Update `skill/crawl_report.md` with the new page count

See [updating.md](updating.md) for the automated update process.
