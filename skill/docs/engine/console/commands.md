# Documentation/Engine/Console/Commands

> "Be aware that this page is obsolete, it should be updated with all commands in the future."

## Contents

1. List
2. Legend

Additional configuration parameters are available on the cvar page.

## List

### check
- **Parameters:** `<what>`
- **Description:** Validates data correctness. Currently supports "company" parameter to verify connections between companies.

### cs_export
- **Parameters:** `<cutscene_name>`
- **Description:** Exports a cutscene by name.

### dispatch
- **Parameters:** None
- **Description:** Handles entering initial state after game launch.

### echo
- **Parameters:** `<message>`
- **Description:** Prints message to console.

### edit
- **Parameters:** `<map_name>`
- **Description:** Starts editor. Map_name parameter specifies the map to edit; omitting it starts with an empty map.

### edit_build
- **Parameters:** None
- **Description:** Rebuilds editor in map editor.

### edit_build_spawns
- **Parameters:** None
- **Description:** Rebuilds all spawn points in map editor.

### edit_mark
- **Parameters:** See description
- **Description:** Marks or unmarks sectors with multiple syntax options:
  - `edit_mark [set_filtered (base|dlc_foo|any) (dev|rel|any) [hexacolor]]`
  - `edit_mark [set sector_files [hexacolor]]`
  - `edit_mark [set_all hexacolor]`
  - `edit_mark [intersect first_file second_file [hexacolor]]`
  - `edit_mark [clear_all]`
  - `edit_mark [lock [sector_files]]`
  - `edit_mark [unlock [sector_files]]`

### edit_save
- **Parameters:** None
- **Description:** Saves the map in map editor for loading in game.

### edit_save_text
- **Parameters:** None
- **Description:** Saves map in textual form for debugging purposes.

### exec
- **Parameters:** `<script file name>`
- **Description:** Loads and executes command scripts. Example script execution from game console: `exec /home/script_file_name`

### exit
- **Parameters:** `<reason>`
- **Description:** Exits game in case of error and unloads profile.

### g_colbox
- **Parameters:** `<mode>`
- **Description:** Displays collision boxes in editor. 1:on, 0:off

### g_delete_idx
- **Parameters:** `<index>`
- **Description:** Deletes item by index in map editor.

### g_delete_uid
- **Parameters:** `<uid>`
- **Description:** Deletes item by unique index in map editor.

### g_disable_beacons
- **Parameters:** `<mode>`
- **Description:** Changes flashing beacon behavior on AI vehicles/trucks (accessibility feature):
  - 0 - default
  - 1 - disables spot lights of strobes and beacons
  - 2 - disables spot lights and disables flare blinking by keeping them on

### g_dump
- **Parameters:** `[asset extension]`
- **Description:** Dumps map.

### g_dump_signs
- **Parameters:** None
- **Description:** Dumps traffic signs.

### g_find_prefab
- **Parameters:** `<prefab name> [prefab name] [prefab name] ...`
- **Description:** Finds prefabs by unit name suffix and dumps them into bugs file.

### g_info
- **Parameters:** None
- **Description:** Prints application info. Output depends on current context (game or map editor).

### g_item_count
- **Parameters:** `(model, prefab, building, anim, mover)`
- **Description:** Displays count of specified item type. No parameter prints summary of all items.

### g_mode
- **Parameters:** `<width> <height> <refresh_rate> <fullscreen>`
- **Description:** Changes graphics mode. Example for windowed 1080p 60Hz: `g_mode 1920 1080 60 0`

### g_msaa
- **Parameters:** `<sample_count>`
- **Description:** Changes MSAA sample count.

### g_next_border_node
- **Parameters:** None
- **Description:** Finds next border node.

### g_replace_prefab
- **Parameters:** `<old_token> <new_token>`
- **Description:** Replaces old prefab with new prefab. Token is unit name without "prefab." prefix.

### g_save_curve_as_text
- **Parameters:** `<file_name>`
- **Description:** Saves curve to text file.

### g_sel_dist
- **Parameters:** `(short, close, middle, far)`
- **Description:** Adds to selection all items of given distance type.

### g_sel_item
- **Parameters:** `<index>`
- **Description:** Selects item by index.

### g_sel_type
- **Parameters:** `(Terrain, Buildings, Road, Prefab, Model, Company, Services, Cut plane, Mover, No weather area, City, Hinge, Parking, Animated Model, Map Overlay, Ferry, Sound, Garage, Camera point, Walker, Trigger, Services, Sign, bus_stop, Traffic area, Bezier Patch, Compound Model)`
- **Description:** Selects item by type.

### g_sel_uid
- **Parameters:** `<uid>`
- **Description:** Selects item by unique index.

### g_set_skybox
- **Parameters:** `<skybox_idx>`
- **Description:** Sets current skybox by index.

### g_set_climate
- **Parameters:** `<climate name> [i|f]`
- **Description:** Sets climate. Parameters:
  - i - interpolated change
  - f - forced change

### g_set_weather
- **Parameters:** `<weather_index> [i|f]`
- **Description:** Sets weather. Parameters:
  - weather_index: 0 - nice, 1 - bad
  - i - interpolated change
  - f - forced change

### g_set_time
- **Parameters:** `<hours> [minutes] [remove_traffic]`
- **Description:** Sets game time. Parameters:
  - remove_traffic: 0 - no, 1 - yes

### g_ui_recache
- **Parameters:** None
- **Description:** Recaches UI draw buffers.

### g_wander_output
- **Parameters:** `[fps/vm/sb/dc [error limit][warning limit][far plane]]`
- **Description:** Sets which wander output will be shown.

### game
- **Parameters:** `<save_slot>`
- **Description:** Starts game.

### goto
- **Parameters:** `<x;y;z> or <cityname>`
- **Description:** Teleports debug camera to map location. Press CTRL+F9 to place truck at camera location.

### mark_country
- **Parameters:** `<country_id>`
- **Description:** Marks roads and prefabs belonging to specified country.

### mm_check
- **Parameters:** None
- **Description:** Checks integrity of resource manager system.

### mm_defrag
- **Parameters:** None
- **Description:** Runs memory manager defragmentation.

### mm_dump
- **Parameters:** `[?bim] (help, blocks, items, mlru) [c] (children)`
- **Description:** Dumps memory manager content.

### mm_flush
- **Parameters:** None
- **Description:** Runs memory manager garbage collector.

### mm_flush_repeatedly
- **Parameters:** None
- **Description:** Runs memory manager garbage collector repeatedly.

### multimon
- **Parameters:** `<operation> <mixed>`
- **Description:** Allows configuration of multi-monitor support.

### pause
- **Parameters:** None
- **Description:** Toggles game pause state.

### phys_info
- **Parameters:** None
- **Description:** Displays information about physical subsystem.

### preview
- **Parameters:** `<map_name> <preview_editor> <profile_to_load>`
- **Description:** Starts game in preview mode. Parameters:
  - map_name - Name of map to preview
  - preview_editor - "editor" starts editor, "game" starts game
  - profile_to_load - Name of profile to be loaded

### quit
- **Parameters:** None
- **Description:** Closes the game.

### route
- **Parameters:** `<start company name> <end company name>`
- **Description:** Runs navigation between two given points and marks examined road network for visual preview.

### s_info
- **Parameters:** None
- **Description:** Reports information about sound subsystem.

### save
- **Parameters:** None
- **Description:** Forces game save.

### screenshot
- **Parameters:** `<custom_name>`
- **Description:** Makes a screenshot. The custom_name parameter is optional and sets custom screenshot filename.

### sdk
- **Parameters:** `<operation>`
- **Description:** Performs SDK operation. Operation parameter can be:
  - reinit - reinitializes the SDK
  - unload - unload all plugins
  - reload - reloads all plugins

### spawn
- **Parameters:** `<object_type>`
- **Description:** Spawns traffic object. Allowed types:
  - vehicle - standard AI vehicle
  - vehicle_forced - forced AI vehicle (ignoring traffic origin and density)

### test
- **Parameters:** None
- **Description:** Not available in final builds.

### uset
- **Parameters:** `<cvar> <value>`
- **Description:** Sets value of cvar by name. Creates new cvar if not found.

### validate
- **Parameters:** None
- **Description:** Starts validation.

### warp
- **Parameters:** `<speed>`
- **Description:** Sets gameplay speed. Speed parameter is a floating point number between 0.0001 and 60.0

### ui
- **Parameters:** `<command[[flags] name[:class] ["parameters"]]>`
- **Description:** Internal UI operations command.
  - **Commands:**
    - 's'(how) - shows a window. Parameters: [ui_script [left=0 bottom=0]]
    - 'h'(ide) - hides a window
    - 't'(oggle) - toggles window. Parameters: see 's'
    - 'i'(nsert) - inserts a window. Parameters: see 's'
    - 'r'(emove) - removes a window
    - 'c'(ommand) - commands UI component. Parameters: [component_name parameters]
  - **Flags:**
    - 'v'(iew) - hides pointer atop this window
    - 'l'(ock 0) - doesn't lock input when showing this window
    - 'm'(odular) - makes a window modular
    - 'f'(ocus 0) - doesn't grab focus when showing this window
    - 'e'(vfiltr) - creates as eventfilter
    - 't'(opmost) - creates as topmost
    - 'b'(ottomm) - creates as bottommost

## Legend

**Command parameters:**

- Parameters surrounded by `<>` are required.
- Parameters surrounded by `[]` are optional.
- Parameters surrounded by `()` are values that can be used as this parameter—other values' effects depend on the command.
