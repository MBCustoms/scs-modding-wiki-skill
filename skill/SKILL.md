---
name: scs-modding-wiki
description: Use when working on ETS2 or ATS mods, asking about SCS unit file formats (.sii, .sui), Blender Tools export/import, Map Editor, Workshop Uploader, sound modding, truck accessories, trailers, cargo, game configuration variables, console commands, or any question about official SCS Software modding documentation.
---

# SCS Modding Wiki Expert

## Overview

Complete official documentation from the SCS Modding Wiki (modding.scssoft.com), covering all ETS2 and ATS modding systems. 162 pages across two branches: Engine (config, console, formats, sound, units, SDK) and Tools (Blender Tools, Map Editor, Workshop Uploader, archive tools).

## How to Answer Modding Questions

1. Search `index.json` — find relevant pages by title keywords or category
2. Read matching files from `docs/` — load only what the query needs
3. Cite source URL for every answer — use the `url` field from `index.json`
4. Cross-reference — if `index.json` shows related pages, mention them
5. Flag deprecated patterns — call out outdated approaches explicitly

## Categories

| Category | Path | Description |
|---|---|---|
| `engine` | `docs/engine/` | Config, console, formats, game data, mod manager |
| `engine_config` | `docs/engine/config_variables/`, `docs/engine/configuration_variables/` | All engine cvars |
| `engine_sound` | `docs/engine/sound/` | Sound system, mixer, truck audio modding |
| `engine_units` | `docs/engine/units/` | Unit definition formats for all accessories/cargo/trailers |
| `engine_sdk` | `docs/engine/sdk/` | Telemetry SDK |
| `tools` | `docs/tools/` | Archive tools, dedicated server, font generator |
| `tools_blender` | `docs/tools/scs_blender_tools/` | SCS Blender Tools — export, materials, animations, locators |
| `tools_map_editor` | `docs/tools/map_editor/` | Map Editor features and shortcuts |
| `tools_workshop` | `docs/tools/scs_workshop_uploader/` | Workshop Uploader validation, structure, errors |

## Quick Lookup Examples

- "How do I define a truck engine?" → search index for `accessory_engine_data`, read `docs/engine/units/accessory_engine_data.md`
- "What shaders does Blender Tools support?" → `docs/tools/scs_blender_tools/supported_shaders.md`
- "Workshop upload validation error" → `docs/tools/scs_workshop_uploader/validation_errors_and_solutions_for_them.md`
- "Truck sound modding" → `docs/engine/sound/modding.md`, `docs/engine/sound/truckengine.md`
- "Trailer unit format" → `docs/engine/units/trailer_def.md`, `docs/engine/units/trailer.md`
- "Map Editor shortcuts" → `docs/tools/map_editor/shortcuts.md`
- "Game archive extraction" → `docs/tools/game_archive_extractor.md`
- "Config variable g_trans" → `docs/engine/configuration_variables/g_trans.md`
