# Sound data - voice navigation pack

Each voice navigation voice pack is defined in a separate configuration file. The configuration file is located in this game data folder:

```
/base/sound/navigation
```

The file can be named arbitrarily but good convention is "language_actor".sii

## File Structure

File is very simple unit with these attributes:

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| pack_name | string | | Name of the pack (shown in the game). Format: "`Language` - `Actor name` (`Optional Variant`)" (e.g. `"English - Skye (UK)"`) |
| pack_dir | string | | Name of the folder with sound files. (e.g. `pack_dir: "/sound/navigation/english_skye_uk"`) |

Good practice is to use the same name for the configuration unit file and for the folder with sound data.

## Sound data folder

Files in the folder are in the ogg format (with .ogg extension). Content of the file is determined by file name prefix (see next table).

Files with the same prefix are used for the same command and their usage is randomized.

**Note:** The wiki strongly recommends using only one file for each traffic command, as randomization of multiple files is very unintuitive.

## File Prefixes and Commands

| File prefix | Command (English language) | Remark |
|-------------|---------------------------|--------|
| turn_left | "Turn left." | |
| turn_right | "Turn right." | |
| keep_left | "Keep left." | |
| keep_right | "Keep right." | |
| exit_left | "Exit left." | |
| exit_right | "Exit right." | |
| go_straight | "Go straight on." | |
| roundabout_1 | "At the roundabout take the first exit." | |
| roundabout_2 | "At the roundabout take the second exit." | |
| roundabout_3 | "At the roundabout take the third exit." | |
| roundabout_4 | "At the roundabout take the fourth exit." | |
| roundabout_5 | "At the roundabout take the fifth exit." | |
| roundabout_6 | "At the roundabout take the sixth exit." | |
| exit_now | "Exit now." | Used on roundabout. |
| prepare_turn_left | "Get ready to turn left." | |
| prepare_turn_right | "Get ready to turn right." | |
| prepare_exit_left | "Get ready to exit left." | |
| prepare_exit_right | "Get ready to exit right." | |
| compound_turn_left | "Turn left ..." | The first part of the compound command. |
| compound_turn_right | "Turn right ..." | The first part of the compound command. |
| compound_keep_left | "Keep left ..." | The first part of the compound command. |
| compound_keep_right | "Keep right ..." | The first part of the compound command. |
| compound_exit_left | "Exit left ..." | The first part of the compound command. |
| compound_exit_right | "Exit right ..." | The first part of the compound command. |
| compound_go_straight | "Go straight on ..." | The first part of the compound command. |
| and_then_turn_left | "... and then turn left." | The second part of the compound command. |
| and_then_turn_right | "... and then turn right." | The second part of the compound command. |
| and_then_keep_left | "... and then keep left." | The second part of the compound command. |
| and_then_keep_right | "... and then keep right." | The second part of the compound command. |
| and_then_exit_left | "... and then exit left." | The second part of the compound command. |
| and_then_exit_right | "... and then exit right." | The second part of the compound command. |
| and_then_go_straight | "... and then continue straight on." | The second part of the compound command. |
| start | e.g. "OK, here we go!" | Start of new route. Good for randomization. |
| finish | e.g. "Here we are..." | End of the route. Good for randomization. |
| recomputing | e.g. "Recomputing..." | Used when the player leaves the selected path. Good for randomization. |
| u_turn | "Make a u-turn." | Good for randomization. |
| speed_signal | | Only acoustic signal, no voice command. |
| speed_warning | "Caution, please mind the speed limit." | Warning when speed is exceeded. |
