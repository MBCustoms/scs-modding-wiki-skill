# Console Commands — Editor

**Source:** https://modding.scssoft.com/wiki/Documentation/Engine/Console/Commands/Editor

The page provides a comprehensive reference for console commands used in the SCS game engine's map editor.

## Overview

"The page lists specific and/or useful commands for map editor users." These commands enable editing, building, saving, and managing map elements.

## Core Editing Commands

Basic map operations include:
- **edit** - Launches the editor, optionally loading a specified map
- **edit_build** - Reconstructs the map and validates all items
- **edit_build_spawns** - Rebuilds spawn point locations
- **edit_save** - Exports the map for gameplay
- **edit_save_text** - Outputs map data in text format for troubleshooting

## Camera & Display Controls

The **edit_free_camera_uplift** command adjusts the maximum height the free camera can rise when using drop-to-ground mode.

For visual debugging, **g_colbox** displays or hides collision boundaries, while **g_cut_plane_ignore** disables cutplane rendering.

## Selection & Deletion

Commands for targeting specific map elements:
- **g_sel_item**, **g_sel_uid**, **g_sel_type** - Select items by index, unique identifier, or category
- **g_delete_idx**, **g_delete_uid** - Remove items from the map

## Prefab & Asset Management

- **g_find_prefab** - Locates prefabs by name suffix
- **g_replace_prefab** - Swaps old prefab tokens for new ones
- **g_item_count** - Reports quantities of specific element types

## Advanced Tools

**g_save_curve_as_text** exports road or building node coordinates and orientations, useful for ferry route UI map adjustments. The **preview** command launches preview mode, optionally loading a profile.
