# Documentation/Engine/Detours

## Overview

Detours (DE) are dynamically generated situations causing closure of a whole road. They are procedurally generated and do not require specific data definitions for individual detours. Only cutscenes for road closure, road blocks, and detour cause events need to be provided.

## How Does It Work?

Several conditions must be met to generate a detour:

- Player must take an offline job
- Enough time must have passed since the last detour
- Job GPS route must contain suitable road for closure

When a player takes an offline job, the game analyzes the GPS route. If valid detours are found, the game selects one randomly from the available options.

The analysis algorithm does not consider provided cutscenes during this initial phase. Cutscenes are generated only when the player approaches the closure, at which point the game searches for the correct cutscene.

## Data Units

Detours use one master unit describing general behavior and units describing closure and event visualization for different lanes and roads.

### Master Data Unit

Only one unit of this type exists, located in **/def/world/journey_detour_master.sii**

```
SiiNunit
{
journey_events_detour_data : .master
{
    min_game_time_delay:	2400		// 4 (hours) * 60 (hour2min) * 20 (map scale) / 2 (some time spend in city)
    max_game_time_delay:	4800		// 8 (hours) * 60 (hour2min) * 20 (map scale) / 2 (some time spend in city)
    minimal_level:              2
}
}
```

**Properties:**

- **min_game_time_delay** — Minimal game time from the last detour. If time since last detour is lower than this value, detour will not be generated.
- **max_game_time_delay** — Maximal game time from the last detour. If time since last detour exceeds this value, detour will always be generated (if other conditions are met).
- **minimal_level** — Minimal level required for detour generation.

When time from the last detour falls between min_game_time_delay and max_game_time_delay, the detour generates with probability based on uniform distribution of one detour across these times.

### Detour Data Unit

These units define which cutscene is used for each part of detour visualization.

Example from **/def/world/journey_detours.sii**:

```
journey_events_detour : j_dt.1_cl_ri1
{
	cutscene:		j_cut.1_cl_ri1
	lane_idx:		1
	lane_count:		1
	type:			road_block_right
}
```

**Properties:**

- **cutscene** — Used cutscene (see below)
- **type** — Type of visualization:
  - **closed_road** — Source of the detour. Generated at detour origin location.
  - **border_prefab_node** — Generated between each closing prefab and closed road.
  - **road_block_right** — Generated on closed road lanes before closing prefab. Traffic diverts left.
  - **road_block_left** — Generated on closed road lanes before closing prefab. Traffic diverts right.
- **lane_count** — Cutscenes generate only on roads with this number of lanes.
- **lane_idx** — Valid only for road_block_ type. Cutscene generates if distance to closest free lane matches this number.

### Cutscenes Data Unit

Detours use the same cutscene units as random road events, documented in the Random Road Events section.
