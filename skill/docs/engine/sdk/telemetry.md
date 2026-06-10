# Documentation/Engine/SDK/Telemetry

Provides real-time access to vehicle telemetry data for third-party applications (dashboards, HUDs, sim-racing software). Starting from SDK 1.14 it also supports creating custom input devices.

**SDK Version:** 1.14  
**API Version:** 1.01 (`SCS_TELEMETRY_VERSION_1_01`)  
**Platforms:** Windows, Linux (OSX support dropped in newer game versions)  
**Latest ETS2 game version constant:** `SCS_TELEMETRY_EUT2_GAME_VERSION_1_18` (game patch 1.45)  
**Latest ATS game version constant:** `SCS_TELEMETRY_ATS_GAME_VERSION_1_05` (game patch 1.45)

---

## Plugin Loading

The game loads telemetry plugins (`.dll` on Windows, `.so` on Linux) from:

1. The `plugins/` subdirectory relative to the game binary (e.g. `bin/win_x86/plugins/`)
2. **Windows only:** Registry key `HKEY_LOCAL_MACHINE\SOFTWARE\SCS Software\<GAME_NAME>\Plugins`  
   - On 64-bit OS with 32-bit game: use `Wow6432Node` path  
   - Each string value in the key is a full path to a DLL; value names are irrelevant  
   - Installers should create keys and values; uninstallers should remove values and empty keys

> **Warning:** Duplicate plugin paths cause undefined behavior.

Console commands for live reloading (only work if at least one plugin was loaded at startup):

| Command | Effect |
|---|---|
| `sdk reinit` | De-init then re-init all APIs |
| `sdk unload` | De-init and unload all plugins |
| `sdk reload` | Full unload, reload, and re-init cycle |

---

## Threading & Lifecycle

- **Not thread safe.** All game-to-plugin calls happen from the main thread.
- All calls back to the game (channel registration, etc.) **must** happen from the same main thread, and only while executing code directly called by the game (inside a registered callback — not from a window message handler).
- The init/shutdown cycle may happen multiple times per process lifetime.
- Shutdown is only called on plugins that returned success from init.

---

## Versioning

API version = `(major << 16) | minor`. Helper macros:

```cpp
SCS_MAKE_VERSION(major, minor)     // ((major << 16) | minor)
SCS_GET_MAJOR_VERSION(version)     // ((version >> 16) & 0xffff)
SCS_GET_MINOR_VERSION(version)     // (version & 0xffff)
```

- **Major change** = breaking (interpret data differently). Strongly discouraged; prefer adding a new channel.
- **Minor change** = additive (new channel, new supported type, or removed channel — plugins see registration failure and use a default value).
- The game negotiates API version by calling `scs_telemetry_init` with decreasing versions until success or non-`unsupported` error.
- Game version (in init params) is separate from API version and identifies which game and data version is running. No negotiation.

---

## Core Types (`scssdk.h`, `scssdk_value.h`)

### Primitive Typedefs

| Type | C equivalent |
|---|---|
| `scs_u8_t` | `uint8_t` |
| `scs_s32_t` | `int32_t` |
| `scs_u32_t` | `uint32_t` |
| `scs_u64_t` | `uint64_t` |
| `scs_s64_t` | `int64_t` |
| `scs_float_t` | `float` |
| `scs_double_t` | `double` |
| `scs_string_t` | `const char*` (UTF-8) |
| `scs_timestamp_t` | `scs_u64_t` (microseconds) |
| `scs_context_t` | `void*` |

**Special constant:** `SCS_U32_NIL = (scs_u32_t)(-1)` — sentinel for "no index" or invalid u32.

### Result Codes (`scs_result_t`)

| Constant | Value | Meaning |
|---|---|---|
| `SCS_RESULT_ok` | `0` | Success |
| `SCS_RESULT_unsupported` | `-1` | Version or parameters not supported |
| `SCS_RESULT_invalid_parameter` | `-2` | Null callback, invalid flag combination |
| `SCS_RESULT_already_registered` | `-3` | Conflicting registration exists |
| `SCS_RESULT_not_found` | `-4` | Channel or item not found |
| `SCS_RESULT_unsupported_type` | `-5` | Channel does not support requested value type |
| `SCS_RESULT_not_now` | `-6` | Action not allowed in current state |
| `SCS_RESULT_generic_error` | `-7` | Catch-all error |

### Value Types (`scs_value_type_t`)

| Constant | Value | Description |
|---|---|---|
| `SCS_VALUE_TYPE_INVALID` | `0` | Invalid/unset |
| `SCS_VALUE_TYPE_bool` | `1` | Boolean (non-zero = true) |
| `SCS_VALUE_TYPE_s32` | `2` | Signed 32-bit integer |
| `SCS_VALUE_TYPE_u32` | `3` | Unsigned 32-bit integer |
| `SCS_VALUE_TYPE_u64` | `4` | Unsigned 64-bit integer |
| `SCS_VALUE_TYPE_float` | `5` | 32-bit float |
| `SCS_VALUE_TYPE_double` | `6` | 64-bit double |
| `SCS_VALUE_TYPE_fvector` | `7` | 3-component float vector |
| `SCS_VALUE_TYPE_dvector` | `8` | 3-component double vector |
| `SCS_VALUE_TYPE_euler` | `9` | Normalized euler orientation (heading/pitch/roll) |
| `SCS_VALUE_TYPE_fplacement` | `10` | Float position + euler orientation |
| `SCS_VALUE_TYPE_dplacement` | `11` | Double position + euler orientation |
| `SCS_VALUE_TYPE_string` | `12` | UTF-8 string pointer |
| `SCS_VALUE_TYPE_s64` | `13` | Signed 64-bit integer |

**Type conversion rules:**
- `float`-based channels (`float`, `fvector`, `fplacement`) can also provide `double`-based types, and vice versa.
- `u32` channels can also provide `u64`.
- Placement-based types also support `euler` (rotation only) and `dvector`/`fvector` (position only).

### Coordinate Systems

**Local space:** X = right, Y = up, Z = backward  
**World space:** X = east, Y = up, Z = south

### Euler Orientation (`scs_value_euler_t`)

Values are normalized (not degrees):

| Field | Range | Zero = |
|---|---|---|
| `heading` | [0, 1) = [0°, 360°) | Forward/north. 0.25 = left/west, 0.5 = back/south, 0.75 = right/east. Counterclockwise from above. |
| `pitch` | [-0.25, 0.25] = [-90°, 90°] | Horizontal. Positive = up. |
| `roll` | [-0.5, 0.5] = [-180°, 180°] | Counterclockwise looking along roll axis. |

To convert to degrees: multiply by 360. To convert to radians: multiply by `2π`.

### Named Value (`scs_named_value_t`)

Used in configuration and gameplay event attribute arrays. Arrays are NULL-terminated (entry with `name == NULL`).

| Field | Type | Notes |
|---|---|---|
| `name` | `scs_string_t` | Attribute name (ASCII subset) |
| `index` | `scs_u32_t` | Zero-based index; `SCS_U32_NIL` for non-array |
| `value` | `scs_value_t` | The value (tagged union) |

---

## Plugin Structure

Every telemetry plugin must export exactly two functions:

```cpp
SCSAPI_RESULT scs_telemetry_init(
    const scs_u32_t version,
    const scs_telemetry_init_params_t *const params
);
SCSAPI_VOID scs_telemetry_shutdown(void);
```

**`scs_telemetry_init`:**
- Return `SCS_RESULT_unsupported` for unknown versions (game will try lower versions).
- Return `SCS_RESULT_ok` on success.
- Cast `params` based on version: `SCS_TELEMETRY_VERSION_1_00`/`1_01` → `scs_telemetry_init_params_v100_t*` (same layout for both).
- Register event and channel callbacks here.
- Called in paused state.

**`scs_telemetry_init_params_v100_t` fields:**

| Field | Type | Notes |
|---|---|---|
| `common.game_name` | `scs_string_t` | Display name, never NULL, not for parsing |
| `common.game_id` | `scs_string_t` | Machine-readable ID (`"eut2"` or `"ats"`) |
| `common.game_version` | `scs_u32_t` | Game-specific data version |
| `common.log` | `scs_log_t` | Write to game log function |
| `register_for_event` | function pointer | Register event callbacks |
| `unregister_from_event` | function pointer | Unregister event callbacks |
| `register_for_channel` | function pointer | Register channel callbacks |
| `unregister_from_channel` | function pointer | Unregister channel callbacks |

**`scs_telemetry_shutdown`:**
- Called when plugin is unloaded.
- All remaining event/channel registrations are automatically removed after this returns.
- Only release resources the plugin owns (files, shared memory, etc.).

### Game Version Check Pattern

```cpp
if (strcmp(params->common.game_id, SCS_GAME_ID_EUT2) == 0) {
    if (params->common.game_version < MINIMAL_VERSION) {
        params->common.log(SCS_LOG_TYPE_error, "Too old game version");
        return SCS_RESULT_unsupported;
    }
    if (SCS_GET_MAJOR_VERSION(params->common.game_version) >
        SCS_GET_MAJOR_VERSION(IMPLEMENTED_VERSION)) {
        params->common.log(SCS_LOG_TYPE_warning, "Untested major version");
    }
}
```

---

## Events System

### Event Types (`scs_event_t`)

| Constant | Value | Payload | Description |
|---|---|---|---|
| `SCS_TELEMETRY_EVENT_frame_start` | `1` | `scs_telemetry_frame_start_t*` | Before any telemetry data for the frame |
| `SCS_TELEMETRY_EVENT_frame_end` | `2` | NULL | After all telemetry data for the frame |
| `SCS_TELEMETRY_EVENT_paused` | `3` | NULL | Game entered paused state (menu, loading) |
| `SCS_TELEMETRY_EVENT_started` | `4` | NULL | Player is now actively driving |
| `SCS_TELEMETRY_EVENT_configuration` | `5` | `scs_telemetry_configuration_t*` | Semi-static attributes changed (truck swap, trailer hitch) |
| `SCS_TELEMETRY_EVENT_gameplay` | `6` | `scs_telemetry_gameplay_event_t*` | Gameplay event (job delivered, fine, ferry, etc.) Added in API v1.01. |

### Event Sequence Within a Frame

1. Zero or more `CONFIGURATION` events (if config changed)
2. Optionally `PAUSED` or `STARTED` (if state changed)
3. `FRAME_START`
4. Zero or more `GAMEPLAY` events
5. All channel callbacks
6. `FRAME_END`

> **Important:** Register for `CONFIGURATION` during init to avoid missing the initial config delivery (sent immediately after successful init, before any other callback).

### Frame Start Struct (`scs_telemetry_frame_start_t`)

| Field | Type | Notes |
|---|---|---|
| `flags` | `scs_u32_t` | `SCS_TELEMETRY_FRAME_START_FLAG_timer_restart` (0x1) = timers restarted |
| `render_time` | `scs_timestamp_t` (µs) | Controls visualization. Variable step (FPS-driven). |
| `simulation_time` | `scs_timestamp_t` (µs) | Controls physics. Fixed step. Advances even when physics is paused. |
| `paused_simulation_time` | `scs_timestamp_t` (µs) | Like simulation_time but stops when physics simulation is paused. |

### Configuration Struct (`scs_telemetry_configuration_t`)

| Field | Type | Notes |
|---|---|---|
| `id` | `scs_string_t` | Group ID (e.g. `"truck"`, `"trailer"`, `"trailer.0"`) |
| `attributes` | `const scs_named_value_t*` | NULL-terminated array of named values |

Empty attribute array = no truck/trailer configured (e.g. after quick job completion).

### Gameplay Event Struct (`scs_telemetry_gameplay_event_t`)

| Field | Type | Notes |
|---|---|---|
| `id` | `scs_string_t` | Event name (see Gameplay Events section) |
| `attributes` | `const scs_named_value_t*` | NULL-terminated array of named values |

### Event Registration

```cpp
// Register — at most ONE callback per event
params->register_for_event(event, callback, context);
// Can be called from: scs_telemetry_init, or any event callback
// EXCEPT the callback for the event being registered.

// Unregister
params->unregister_from_event(event);
// Can be called from: scs_telemetry_shutdown, scs_telemetry_init,
// OR the callback of the event being unregistered.
```

### Event Callback Signature

```cpp
SCSAPI_VOID my_callback(
    const scs_event_t event,
    const void *const event_info,  // Cast based on event type
    const scs_context_t context
);
```

---

## Channels System

### Channel Registration

```cpp
// Register — at most ONE callback per (name, index, type) combination
params->register_for_channel(
    name,      // Channel name string constant
    index,     // SCS_U32_NIL for non-indexed, 0..N for indexed (e.g. wheels)
    type,      // Desired scs_value_type_t
    flags,     // SCS_TELEMETRY_CHANNEL_FLAG_*
    callback,  // Callback function
    context    // Opaque pointer passed back to callback (e.g. &myStruct.field)
);
// Can only be called from scs_telemetry_init OR from within an event callback
// (NOT from a channel callback).
```

### Channel Flags

| Constant | Value | Meaning |
|---|---|---|
| `SCS_TELEMETRY_CHANNEL_FLAG_none` | `0x0` | Call only when value is available and changed |
| `SCS_TELEMETRY_CHANNEL_FLAG_each_frame` | `0x1` | Call each frame even if value unchanged; does NOT guarantee calls when unavailable |
| `SCS_TELEMETRY_CHANNEL_FLAG_no_value` | `0x2` | Call even when value unavailable; `value` param will be NULL in that case |

### Channel Callback Signature

```cpp
SCSAPI_VOID my_channel_callback(
    const scs_string_t name,         // Channel name (debugging only)
    const scs_u32_t index,           // Index for indexed channels
    const scs_value_t *const value,  // NULL if unavailable and FLAG_no_value is set
    const scs_context_t context      // Pointer passed at registration
);
```

Always check `value != NULL` before dereferencing when using `FLAG_no_value`.

### Dynamic Channel Registration (wheels pattern)

Save `register_for_channel` and `unregister_from_channel` during init. In the configuration event, compare current wheel count with new wheel count and call unregister/register in loops:

```cpp
// In configuration event handler, after reading new wheel_count:
while (registered_wheel_count > new_wheel_count) {
    unregister_from_channel(WHEEL_CHANNEL, --registered_wheel_count, SCS_VALUE_TYPE_float);
}
while (registered_wheel_count < new_wheel_count) {
    register_for_channel(WHEEL_CHANNEL, registered_wheel_count++, SCS_VALUE_TYPE_float,
                         SCS_TELEMETRY_CHANNEL_FLAG_no_value, callback, context);
}
```

---

## Common Channels

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_CHANNEL_local_scale` | `"local.scale"` | float | Scale factor: 1 real second = local_scale simulated seconds. Not provided if map is 1:1. |
| `SCS_TELEMETRY_CHANNEL_game_time` | `"game.time"` | u32 | In-game minutes since 00:00 of first in-game day. |
| `SCS_TELEMETRY_CHANNEL_multiplayer_time_offset` | `"multiplayer.time.offset"` | s32 | In-game minute offset from local game_time to Convoy server time. 0 when not in multiplayer. Changes frequently (local time pauses while player is on desktop). |
| `SCS_TELEMETRY_CHANNEL_next_rest_stop` | `"rest.stop"` | s32 | In-game minutes until next mandatory rest stop. Behavior implementation-dependent when fatigue simulation is disabled. |

---

## Truck Channels

All truck channels use prefix `"truck."`. Channels with float types also support double types and vice versa. Channels with u32 also support u64.

### Movement

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_world_placement` | `"truck.world.placement"` | dplacement | World-space position and orientation. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_local_linear_velocity` | `"truck.local.velocity.linear"` | fvector | Vehicle-space linear velocity in m/s. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_local_angular_velocity` | `"truck.local.velocity.angular"` | fvector | Vehicle-space angular velocity in rot/s. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_local_linear_acceleration` | `"truck.local.acceleration.linear"` | fvector | Vehicle-space linear acceleration in m/s². |
| `SCS_TELEMETRY_TRUCK_CHANNEL_local_angular_acceleration` | `"truck.local.acceleration.angular"` | fvector | Vehicle-space angular acceleration in rot/s². |
| `SCS_TELEMETRY_TRUCK_CHANNEL_cabin_offset` | `"truck.cabin.offset"` | fplacement | Vehicle-space position and orientation delta of cabin from default position. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_cabin_angular_velocity` | `"truck.cabin.velocity.angular"` | fvector | Cabin-space angular velocity in rot/s. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_cabin_angular_acceleration` | `"truck.cabin.acceleration.angular"` | fvector | Cabin-space angular acceleration in rot/s². |
| `SCS_TELEMETRY_TRUCK_CHANNEL_head_offset` | `"truck.head.offset"` | fplacement | Cabin-space position and orientation delta of driver head from default. May change rapidly on camera switch. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_speed` | `"truck.speed"` | float | Speedometer speed in m/s. Negative = reversing. |

### Powertrain

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_engine_rpm` | `"truck.engine.rpm"` | float | Engine RPM. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_engine_gear` | `"truck.engine.gear"` | s32 | Engine gear. >0 = forward, 0 = neutral, <0 = reverse. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_displayed_gear` | `"truck.displayed.gear"` | s32 | Dashboard displayed gear. Same sign convention. |

### Driving Input

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_input_steering` | `"truck.input.steering"` | float | Raw input <-1;1>. Counterclockwise. Digital = immediate ±1. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_input_throttle` | `"truck.input.throttle"` | float | Raw input <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_input_brake` | `"truck.input.brake"` | float | Raw input <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_input_clutch` | `"truck.input.clutch"` | float | Raw input <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_effective_steering` | `"truck.effective.steering"` | float | Simulation-used steering <-1;1> after interpolation and counterforces. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_effective_throttle` | `"truck.effective.throttle"` | float | Simulation-used throttle <0;1> including cruise control. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_effective_brake` | `"truck.effective.brake"` | float | Simulation-used brake <0;1>. Does NOT include retarder, parking brake, or engine brake. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_effective_clutch` | `"truck.effective.clutch"` | float | Simulation-used clutch <0;1> including auto-shifting. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_cruise_control` | `"truck.cruise_control"` | float | Cruise control target speed in m/s. 0 if disabled. |

### Gearbox / H-Shifter

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_hshifter_slot` | `"truck.hshifter.slot"` | u32 | H-shifter handle slot. 0 = no slot selected. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_hshifter_selector` | `"truck.hshifter.select"` | bool (indexed) | State of range/splitter selector toggles. Index maps to selectors per HSHIFTER config. |

### Brakes

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_parking_brake` | `"truck.brake.parking"` | bool | Parking brake enabled. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_motor_brake` | `"truck.brake.motor"` | bool | Engine brake enabled. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_retarder_level` | `"truck.brake.retarder"` | u32 | Retarder level 0..max (0 = disabled). Max from TRUCK config. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_brake_air_pressure` | `"truck.brake.air.pressure"` | float | Air tank pressure in psi. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_brake_air_pressure_warning` | `"truck.brake.air.pressure.warning"` | bool | Air pressure warning active. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_brake_air_pressure_emergency` | `"truck.brake.air.pressure.emergency"` | bool | Emergency brakes active due to low air pressure. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_brake_temperature` | `"truck.brake.temperature"` | float | Brake temperature in °C. Approximated for whole truck, not per wheel. |

### Consumables

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_fuel` | `"truck.fuel.amount"` | float | Fuel in litres. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_fuel_warning` | `"truck.fuel.warning"` | bool | Low fuel warning active. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_fuel_average_consumption` | `"truck.fuel.consumption.average"` | float | Average fuel consumption in l/km. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_fuel_range` | `"truck.fuel.range"` | float | Estimated remaining range in km. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_adblue` | `"truck.adblue"` | float | AdBlue in litres. (Not supported in ATS.) |
| `SCS_TELEMETRY_TRUCK_CHANNEL_adblue_warning` | `"truck.adblue.warning"` | bool | Low AdBlue warning active. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_adblue_average_consumption` | `"truck.adblue.consumption.average"` | float | Average AdBlue consumption in l/km. |

### Engine / Fluids

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_oil_pressure` | `"truck.oil.pressure"` | float | Oil pressure in psi. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_oil_pressure_warning` | `"truck.oil.pressure.warning"` | bool | Oil pressure warning active. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_oil_temperature` | `"truck.oil.temperature"` | float | Oil temperature in °C. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_water_temperature` | `"truck.water.temperature"` | float | Coolant temperature in °C. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_water_temperature_warning` | `"truck.water.temperature.warning"` | bool | Coolant temperature warning active. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_battery_voltage` | `"truck.battery.voltage"` | float | Battery voltage in volts. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_battery_voltage_warning` | `"truck.battery.voltage.warning"` | bool | Battery voltage / not charging warning active. |

### Enabled States

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_electric_enabled` | `"truck.electric.enabled"` | bool | Electrical system active. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_engine_enabled` | `"truck.engine.enabled"` | bool | Engine running. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_lblinker` | `"truck.lblinker"` | bool | Left blinker **enabled** (logical, steady — does not blink, ignores electrical state). |
| `SCS_TELEMETRY_TRUCK_CHANNEL_rblinker` | `"truck.rblinker"` | bool | Right blinker **enabled** (logical, steady). |
| `SCS_TELEMETRY_TRUCK_CHANNEL_hazard_warning` | `"truck.hazard.warning"` | bool | Hazard warning **enabled** (logical, steady). |

### Lights (Physical State)

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_lblinker` | `"truck.light.lblinker"` | bool | Left blinker light currently on (toggles while blinking). |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_rblinker` | `"truck.light.rblinker"` | bool | Right blinker light currently on. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_parking` | `"truck.light.parking"` | bool | Parking lights on. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_low_beam` | `"truck.light.beam.low"` | bool | Low beam headlights on. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_high_beam` | `"truck.light.beam.high"` | bool | High beam headlights on. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_aux_front` | `"truck.light.aux.front"` | u32 | Auxiliary front lights. 0 = off, 1 = dimmed, 2 = full. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_aux_roof` | `"truck.light.aux.roof"` | u32 | Auxiliary roof lights. 0 = off, 1 = dimmed, 2 = full. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_beacon` | `"truck.light.beacon"` | bool | Beacon lights on. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_brake` | `"truck.light.brake"` | bool | Brake lights on. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_light_reverse` | `"truck.light.reverse"` | bool | Reverse lights on. |

### Misc Controls

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_wipers` | `"truck.wipers"` | bool | Wipers active. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_dashboard_backlight` | `"truck.dashboard.backlight"` | float | Dashboard backlight intensity <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_differential_lock` | `"truck.differential_lock"` | bool | Differential lock engaged. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_lift_axle` | `"truck.lift_axle"` | bool | Lift axle control set to lifted. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_lift_axle_indicator` | `"truck.lift_axle.indicator"` | bool | Lift axle indicator lit. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_trailer_lift_axle` | `"truck.trailer.lift_axle"` | bool | Trailer lift axle control set to lifted. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_trailer_lift_axle_indicator` | `"truck.trailer.lift_axle.indicator"` | bool | Trailer lift axle indicator lit. |

### Wear

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_wear_engine` | `"truck.wear.engine"` | float | Engine wear <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wear_transmission` | `"truck.wear.transmission"` | float | Transmission wear <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wear_cabin` | `"truck.wear.cabin"` | float | Cabin wear <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wear_chassis` | `"truck.wear.chassis"` | float | Chassis wear <0;1>. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wear_wheels` | `"truck.wear.wheels"` | float | Average wheel wear <0;1>. |

### Odometer & Navigation

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_odometer` | `"truck.odometer"` | float | Odometer in km. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_navigation_distance` | `"truck.navigation.distance"` | float | Route advisor navigation distance in meters. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_navigation_time` | `"truck.navigation.time"` | float | Route advisor ETA in seconds. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_navigation_speed_limit` | `"truck.navigation.speed.limit"` | float | Route advisor speed limit in m/s. Respects player's "Route Advisor speed limit" setting. |

### Wheels (Indexed, zero-based)

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_susp_deflection` | `"truck.wheel.suspension.deflection"` | float | Vertical displacement from axle in meters. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_on_ground` | `"truck.wheel.on_ground"` | bool | Wheel in contact with ground. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_substance` | `"truck.wheel.substance"` | u32 | Substance index below wheel (from SUBSTANCE config). |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_velocity` | `"truck.wheel.angular_velocity"` | float | Angular velocity in rot/s. Positive = forward. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_steering` | `"truck.wheel.steering"` | float | Steering rotation <-0.25, 0.25> counterclockwise. 0 for non-steerable wheels. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_rotation` | `"truck.wheel.rotation"` | float | Rolling rotation <0.0, 1.0). Increases with forward movement. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_lift` | `"truck.wheel.lift"` | float | Lift ratio <0;1>. 0 = grounded, 1 = fully lifted. 0 or absent for non-liftable axles. |
| `SCS_TELEMETRY_TRUCK_CHANNEL_wheel_lift_offset` | `"truck.wheel.lift.offset"` | float | Vertical displacement of axle from normal position in meters due to lifting. Non-linear relative to lift ratio. |

---

## Trailer Channels

Trailer channels use prefix `"trailer."` for the first trailer. For additional trailers (doubles/triples): `"trailer.0."`, `"trailer.1."`, ..., `"trailer.5."` up to `SCS_TELEMETRY_trailers_count` (10).

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_TRAILER_CHANNEL_connected` | `"trailer.connected"` | bool | Trailer connected to truck. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_cargo_damage` | `"trailer.cargo.damage"` | float | Cargo damage on this trailer <0;1>. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_world_placement` | `"trailer.world.placement"` | dplacement | World-space position and orientation. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_local_linear_velocity` | `"trailer.velocity.linear"` | fvector | Vehicle-space linear velocity in m/s. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_local_angular_velocity` | `"trailer.velocity.angular"` | fvector | Vehicle-space angular velocity in rot/s. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_local_linear_acceleration` | `"trailer.acceleration.linear"` | fvector | Vehicle-space linear acceleration in m/s². |
| `SCS_TELEMETRY_TRAILER_CHANNEL_local_angular_acceleration` | `"trailer.acceleration.angular"` | fvector | Vehicle-space angular acceleration in rot/s². |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wear_body` | `"trailer.wear.body"` | float | Body wear <0;1>. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wear_chassis` | `"trailer.wear.chassis"` | float | Chassis wear <0;1>. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wear_wheels` | `"trailer.wear.wheels"` | float | Wheel wear <0;1>. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_susp_deflection` | `"trailer.wheel.suspension.deflection"` | float (indexed) | See truck equivalent. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_on_ground` | `"trailer.wheel.on_ground"` | bool (indexed) | See truck equivalent. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_substance` | `"trailer.wheel.substance"` | u32 (indexed) | See truck equivalent. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_velocity` | `"trailer.wheel.angular_velocity"` | float (indexed) | See truck equivalent. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_steering` | `"trailer.wheel.steering"` | float (indexed) | See truck equivalent. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_rotation` | `"trailer.wheel.rotation"` | float (indexed) | See truck equivalent. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_lift` | `"trailer.wheel.lift"` | float (indexed) | See truck equivalent. |
| `SCS_TELEMETRY_TRAILER_CHANNEL_wheel_lift_offset` | `"trailer.wheel.lift.offset"` | float (indexed) | See truck equivalent. |

---

## Job Channel

| Constant | String Value | Type | Notes |
|---|---|---|---|
| `SCS_TELEMETRY_JOB_CHANNEL_cargo_damage` | `"job.cargo.damage"` | float | Total job cargo damage <0;1>. Aggregate across all trailers. |

---

## Configuration Attributes

**Maximum trailers:** `SCS_TELEMETRY_trailers_count = 10`

### Truck Config (`SCS_TELEMETRY_CONFIG_truck = "truck"`)

Empty attribute set = no truck configured.

| Attribute | String | Type | Notes |
|---|---|---|---|
| `brand_id` | `"brand_id"` | string | Internal brand ID (C-identifier chars only). |
| `brand` | `"brand"` | string | Brand display name. Localized. |
| `id` | `"id"` | string | Truck internal name (C-identifier chars and dots). |
| `name` | `"name"` | string | Truck display name. Localized. |
| `fuel_capacity` | `"fuel.capacity"` | float | Fuel tank capacity in litres. |
| `fuel_warning_factor` | `"fuel.warning.factor"` | float | Warning triggers below this fraction of tank capacity. |
| `adblue_capacity` | `"adblue.capacity"` | float | AdBlue tank capacity in litres. |
| `adblue_warning_factor` | `"adblue.warning.factor"` | float | Warning triggers below this fraction of capacity. |
| `air_pressure_warning` | `"brake.air.pressure.warning"` | float | Air pressure (psi) below which warning activates. |
| `air_pressure_emergency` | `"brake.air.pressure.emergency"` | float | Air pressure (psi) below which emergency brakes activate. |
| `oil_pressure_warning` | `"oil.pressure.warning"` | float | Oil pressure (psi) below which warning activates. |
| `water_temperature_warning` | `"water.temperature.warning"` | float | Coolant temp (°C) above which warning activates. |
| `battery_voltage_warning` | `"battery.voltage.warning"` | float | Battery voltage (V) below which warning activates. |
| `rpm_limit` | `"rpm.limit"` | float | Maximum engine RPM. |
| `forward_gear_count` | `"gears.forward"` | u32 | Number of forward gears (undamaged). |
| `reverse_gear_count` | `"gears.reverse"` | u32 | Number of reverse gears (undamaged). |
| `differential_ratio` | `"differential.ratio"` | float | Differential ratio. |
| `retarder_step_count` | `"retarder.steps"` | u32 | Retarder step count. 0 if no retarder. |
| `forward_ratio` | `"forward.ratio"` | float (indexed) | Forward gear ratios. |
| `reverse_ratio` | `"reverse.ratio"` | float (indexed) | Reverse gear ratios. |
| `cabin_position` | `"cabin.position"` | fvector | Cabin joint position in vehicle space. Absent if no separate cabin. |
| `head_position` | `"head.position"` | fvector | Default head position in cabin space. |
| `hook_position` | `"hook.position"` | fvector | Trailer connection hook in vehicle space. |
| `wheel_count` | `"wheels.count"` | u32 | Number of wheels. |
| `wheel_position` | `"wheel.position"` | fvector (indexed) | Wheel position in vehicle space. |
| `wheel_steerable` | `"wheel.steerable"` | bool (indexed) | Is wheel steerable? |
| `wheel_simulated` | `"wheel.simulated"` | bool (indexed) | Is wheel physically simulated? |
| `wheel_radius` | `"wheel.radius"` | float (indexed) | Wheel radius. |
| `wheel_powered` | `"wheel.powered"` | bool (indexed) | Is wheel powered? |
| `wheel_liftable` | `"wheel.liftable"` | bool (indexed) | Is wheel liftable? |
| `license_plate` | `"license.plate"` | string | License plate text. |
| `license_plate_country_id` | `"license.plate.country.id"` | string | Country ID of the plate. |
| `license_plate_country` | `"license.plate.country"` | string | Country display name. Localized. |

### Trailer Config (`SCS_TELEMETRY_CONFIG_trailer = "trailer"`)

Indexed as `"trailer.0"` through `"trailer.9"`. Legacy `"trailer"` = `"trailer.0"`. Empty attribute set = no trailer at that index.

| Attribute | String | Type | Notes |
|---|---|---|---|
| `cargo_accessory_id` | `"cargo.accessory.id"` | string | Cargo accessory internal name. |
| `chain_type` | `"chain.type"` | string | Trailer chain type. First trailer only. |
| `body_type` | `"body.type"` | string | Trailer body type. First trailer only. |

Trailer wheel config attributes mirror truck wheel attributes (same names, same types).

### Job Config (`SCS_TELEMETRY_CONFIG_job = "job"`)

Empty attribute set = no active job.

| Attribute | String | Type | Notes |
|---|---|---|---|
| `cargo_id` | `"cargo.id"` | string | Internal cargo ID. |
| `cargo` | `"cargo"` | string | Cargo display name. Localized. |
| `cargo_mass` | `"cargo.mass"` | float | Total cargo mass in kg. |
| `cargo_unit_mass` | `"cargo.unit.mass"` | float | Mass of a single cargo unit in kg. |
| `cargo_unit_count` | `"cargo.unit.count"` | u32 | Number of cargo units. |
| `destination_city_id` | `"destination.city.id"` | string | Internal destination city ID. |
| `destination_city` | `"destination.city"` | string | Destination city display name. Localized. |
| `destination_company_id` | `"destination.company.id"` | string | Internal destination company ID. **Not available for special transport jobs.** |
| `destination_company` | `"destination.company"` | string | Destination company display name. **Not available for special transport jobs.** |
| `source_city_id` | `"source.city.id"` | string | Internal source city ID. |
| `source_city` | `"source.city"` | string | Source city display name. Localized. |
| `source_company_id` | `"source.company.id"` | string | Internal source company ID. **Not available for special transport jobs.** |
| `source_company` | `"source.company"` | string | Source company display name. **Not available for special transport jobs.** |
| `income` | `"income"` | u64 | Expected income without penalties. In game-specific currency (EUR for ETS2, USD for ATS). |
| `delivery_time` | `"delivery.time"` | u32 | Absolute in-game minutes of end of delivery window. Remaining = `delivery_time - game_time`. |
| `planned_distance_km` | `"planned_distance.km"` | u32 | Planned distance in simulated km. Excludes ferry distances. |
| `is_cargo_loaded` | `"cargo.loaded"` | bool | Cargo loaded on trailer. Always true for non-cargo-market jobs. |
| `job_market` | `"job.market"` | string | Market type: `cargo_market`, `quick_job`, `freight_market`, `external_contracts`, `external_market`. |
| `special_job` | `"is.special.job"` | bool | Special transport job flag. |

### Controls Config (`SCS_TELEMETRY_CONFIG_controls = "controls"`)

| Attribute | String | Type | Notes |
|---|---|---|---|
| `shifter_type` | `"shifter.type"` | string | One of: `"arcade"`, `"automatic"`, `"manual"`, `"hshifter"`. |

### H-Shifter Config (`SCS_TELEMETRY_CONFIG_hshifter = "hshifter"`)

To find selected gear: find the slot where handle position matches and the bitmask of selector states matches; that slot's gear is engaged. If no slot matches, neutral is assumed.

| Attribute | String | Type | Notes |
|---|---|---|---|
| `selector_count` | `"selector.count"` | u32 | Number of selectors (range/splitter toggles). |
| `slot_gear` | `"slot.gear"` | s32 (indexed) | Gear engaged when this slot's conditions are met. |
| `slot_handle_position` | `"slot.handle.position"` | u32 (indexed) | H-shifter handle position for this slot. 0 = neutral. |
| `slot_selectors` | `"slot.selectors"` | u32 (indexed) | Bitmask of required selector on/off states. Only first `selector_count` bits matter. |

### Substances Config (`SCS_TELEMETRY_CONFIG_substances = "substances"`)

Attribute index = substance index (matches `wheel_substance` channel). Supported attribute: `"id"` (string).

---

## Gameplay Events

Received via `SCS_TELEMETRY_EVENT_gameplay`. Added in API v1.01 (ETS2 patch 1.35 / ATS patch 1.01).

### Event Names

| Constant | String Value |
|---|---|
| `SCS_TELEMETRY_GAMEPLAY_EVENT_job_cancelled` | `"job.cancelled"` |
| `SCS_TELEMETRY_GAMEPLAY_EVENT_job_delivered` | `"job.delivered"` |
| `SCS_TELEMETRY_GAMEPLAY_EVENT_player_fined` | `"player.fined"` |
| `SCS_TELEMETRY_GAMEPLAY_EVENT_player_tollgate_paid` | `"player.tollgate.paid"` |
| `SCS_TELEMETRY_GAMEPLAY_EVENT_player_use_ferry` | `"player.use.ferry"` |
| `SCS_TELEMETRY_GAMEPLAY_EVENT_player_use_train` | `"player.use.train"` |

### Gameplay Event Attributes

| Constant | String | Type | Used In | Notes |
|---|---|---|---|---|
| `cancel_penalty` | `"cancel.penalty"` | s64 | job_cancelled | Penalty in game currency. Can be 0. |
| `revenue` | `"revenue"` | s64 | job_delivered | Job revenue in game currency. |
| `earned_xp` | `"earned.xp"` | s32 | job_delivered | XP received. |
| `cargo_damage` | `"cargo.damage"` | float | job_delivered | Total cargo damage <0;1>. |
| `distance_km` | `"distance.km"` | float | job_delivered | Real distance driven in km. |
| `delivery_time` | `"delivery.time"` | u32 | job_delivered | Total time on job in in-game minutes. |
| `auto_park_used` | `"auto.park.used"` | bool | job_delivered | Auto-parking was used. |
| `auto_load_used` | `"auto.load.used"` | bool | job_delivered | Auto-loading was used. Always true for non-cargo-market jobs. |
| `fine_offence` | `"fine.offence"` | string | player_fined | Offence type (see list below). |
| `fine_amount` | `"fine.amount"` | s64 | player_fined | Fine amount in game currency. |
| `pay_amount` | `"pay.amount"` | s64 | tollgate / ferry / train | Amount charged in game currency. |
| `source_name` | `"source.name"` | string | ferry / train | Display name of source location. |
| `target_name` | `"target.name"` | string | ferry / train | Display name of target location. |
| `source_id` | `"source.id"` | string | ferry / train | Internal ID of source location. |
| `target_id` | `"target.id"` | string | ferry / train | Internal ID of target location. |

**Fine offence values:** `crash`, `avoid_sleeping`, `wrong_way`, `speeding_camera`, `no_lights`, `red_signal`, `speeding`, `avoid_weighing`, `illegal_trailer`, `avoid_inspection`, `illegal_border_crossing`, `hard_shoulder_violation`, `damaged_vehicle_usage`, `generic`.

> **Note:** `"delivery.time"` has two distinct semantic meanings: in job config it is the absolute end-of-window time (in-game minutes); in the job_delivered event it is the total elapsed time on the job (in-game minutes).

---

## ETS2-Specific Notes

**Game ID:** `"eut2"` (`SCS_GAME_ID_EUT2`)  
**Currency:** Euro (internal unit)

### ETS2 Game Version History

| Constant | Value | Game Patch |
|---|---|---|
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_00` | `(1,0)` | — |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_01` | `(1,1)` | — |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_02` | `(1,2)` | — |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_03` | `(1,3)` | — |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_04` | `(1,4)` | — |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_05` | `(1,5)` | Patch 1.4 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_06` | `(1,6)` | — |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_07` | `(1,7)` | Patch 1.6 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_08` | `(1,8)` | Patch 1.9 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_09` | `(1,9)` | Patch 1.14 beta |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_10` | `(1,10)` | Patch 1.14 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_11` | `(1,11)` | — |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_12` | `(1,12)` | Patch 1.17 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_13` | `(1,13)` | Patch 1.27 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_14` | `(1,14)` | Patch 1.35 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_15` | `(1,15)` | Patch 1.36 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_16` | `(1,16)` | Patch 1.36 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_17` | `(1,17)` | Patch 1.41 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_1_18` | `(1,18)` | Patch 1.45 |
| `SCS_TELEMETRY_EUT2_GAME_VERSION_CURRENT` | alias for 1_18 | — |

### ETS2 Known Limitations (as of v1.00)

- Trailer wheel rolling rotation is derived from linear movement, not actual physics simulation.
- Pressures, temperatures, and voltages are not physically simulated — loosely approximated.
- Localized strings are not updated when the in-game language changes during a session.

---

## ATS-Specific Notes

**Game ID:** `"ats"` (`SCS_GAME_ID_ATS`)  
**Currency:** US Dollar (internal unit)  
**AdBlue:** Not supported.

### ATS Game Version History

| Constant | Value | Game Patch |
|---|---|---|
| `SCS_TELEMETRY_ATS_GAME_VERSION_1_00` | `(1,0)` | — (≈ ETS2 1.12 feature set) |
| `SCS_TELEMETRY_ATS_GAME_VERSION_1_01` | `(1,1)` | — |
| `SCS_TELEMETRY_ATS_GAME_VERSION_1_02` | `(1,2)` | Patch 1.36 |
| `SCS_TELEMETRY_ATS_GAME_VERSION_1_03` | `(1,3)` | Patch 1.36 |
| `SCS_TELEMETRY_ATS_GAME_VERSION_1_04` | `(1,4)` | Patch 1.41 |
| `SCS_TELEMETRY_ATS_GAME_VERSION_1_05` | `(1,5)` | Patch 1.45 |
| `SCS_TELEMETRY_ATS_GAME_VERSION_CURRENT` | alias for 1_05 | — |

### ATS Changelog

- **1.00** — Initial ATS version. Feature parity with ETS2 SDK 1.12.
- **1.01** — Multiple trailers (doubles/triples); gameplay events.
- **1.02** — Added `planned_distance_km` to job info.
- **1.03** — Added `avoid_inspection`, `illegal_border_crossing`, `hard_shoulder_violation` offence types.
- **1.04** — Added differential lock, lift axle, and hazard warning channels.
- **1.05** — Added multiplayer time offset and trailer body wear; fixed trailer chassis wear.

### ATS Known Limitations

- AdBlue channels are not supported.
- `fuel_average_consumption` is mostly static (depends on trailer presence and driver skills, not engine load).
- Same physics approximations as ETS2 (wheel rotation, pressures, temperatures, voltages).
- Localized strings not updated on language change.

---

## Code Patterns

### Minimal Plugin Skeleton (C++)

```cpp
#include "scssdk_telemetry.h"
#include "eurotrucks2/scssdk_telemetry_eut2.h"
#include "amtrucks/scssdk_telemetry_ats.h"

namespace {
    scs_log_t game_log = nullptr;
    float speed = 0.0f;
}

SCSAPI_VOID on_speed(const scs_string_t name, const scs_u32_t index,
                     const scs_value_t *const value, const scs_context_t context)
{
    if (value) speed = value->value_float.value;
}

SCSAPI_VOID on_paused(const scs_event_t event, const void *const info,
                      const scs_context_t context) {}

SCSAPI_VOID on_started(const scs_event_t event, const void *const info,
                       const scs_context_t context) {}

SCSAPI_RESULT scs_telemetry_init(const scs_u32_t version,
                                  const scs_telemetry_init_params_t *const params)
{
    if (version != SCS_TELEMETRY_VERSION_1_01) return SCS_RESULT_unsupported;

    const auto *const vp = static_cast<const scs_telemetry_init_params_v101_t *>(params);
    game_log = vp->common.log;

    if (vp->register_for_event(SCS_TELEMETRY_EVENT_paused, on_paused, nullptr) != SCS_RESULT_ok ||
        vp->register_for_event(SCS_TELEMETRY_EVENT_started, on_started, nullptr) != SCS_RESULT_ok) {
        return SCS_RESULT_generic_error;
    }

    vp->register_for_channel(SCS_TELEMETRY_TRUCK_CHANNEL_speed, SCS_U32_NIL,
                              SCS_VALUE_TYPE_float, SCS_TELEMETRY_CHANNEL_FLAG_none,
                              on_speed, nullptr);
    return SCS_RESULT_ok;
}

SCSAPI_VOID scs_telemetry_shutdown(void) { game_log = nullptr; }
```

### Reading Config Attributes

```cpp
SCSAPI_VOID on_config(const scs_event_t event, const void *const info,
                      const scs_context_t context)
{
    const auto *const cfg = static_cast<const scs_telemetry_configuration_t *>(info);
    if (strcmp(cfg->id, SCS_TELEMETRY_CONFIG_truck) != 0) return;

    for (const scs_named_value_t *attr = cfg->attributes; attr->name; ++attr) {
        if (strcmp(attr->name, SCS_TELEMETRY_CONFIG_ATTRIBUTE_wheel_count) == 0) {
            uint32_t wheel_count = attr->value.value_u32.value;
        }
    }
}
```

### Computing World-Space Head Position

To get the driver's head position in world space (see `telemetry_position.cpp` example):

1. `head_in_cabin = head_position + head_offset.position`
2. `head_in_vehicle = (cabin_position + cabin_offset.position) + rotate(cabin_offset.orientation, head_in_cabin)`
3. `head_in_world = truck_placement.position + rotate(truck_placement.orientation, head_in_vehicle)`

The euler rotation applies: roll (Z) → pitch (X) → heading (Y). Convert SDK euler to radians by multiplying by `2π`.

### Shared Memory Export (Windows)

Use `CreateFileMapping` / `MapViewOfFile` with name `"SCSTelemetryExample"` (or your own name). Use `#pragma pack(1)` on the shared struct to avoid padding surprises. See `telemetry_mem.cpp` for a complete implementation.

> **Note:** Shared memory reduces precision and increases latency compared to in-process callbacks.
