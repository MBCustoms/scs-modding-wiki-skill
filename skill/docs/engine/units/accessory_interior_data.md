# Documentation/Engine/Units/accessory interior data

The **accessory_interior_data** unit class defines vehicle interior visuals and animations for player vehicles. These units typically reside in `/def/vehicle/truck/<brand.model>/interior/*.sii` and incorporate several included files for animations, dashboard colors, and seat adjustments.

## Attributes

Many attributes inherit from **accessory_data**. Key attributes include:

| Name | Type | Default | Description |
|------|------|---------|-------------|
| model | string | — | Path to rigid interior model descriptor (.pmd) |
| animated_model | string | — | Path to animated interior model descriptor (.pmd) |
| collision | string | — | Path to collision descriptor (.pmc) for toy physics |
| variant | token | — | Variant name for interior models and collision |
| look | token | — | Look name for interior models |
| ext_model | string | — | Path to exterior model descriptor (.pmd) visible from outside cameras |
| ext_variant | token | — | Variant name for exterior model |
| ext_look | token | — | Look name for exterior model |
| wiper_duration_and_delay | array<float2> | (2.0, 0.0) | Wipe cycle duration and delay between cycles in seconds. Added in version 1.35 |
| blinker_delay | float | 0.5 | Half blinker cycle length in seconds |
| show_chassis_rear | bool | false | Renders chassis and accessories in interior when true. Added in version 1.44 |
| dashboard_path | string | — | UI definition path for dashboard display |
| gps_path | string | — | UI definition path for GPS display |
| use_mile_units | bool | false | Uses mile units instead of kilometers when true |
| left_hand_traffic | bool | false | Enables right-hand drive conventions when true |
| backlight_with_lights | bool | true | Dashboard backlight activates with headlights when true |
| air_brake_safeguard | bool | false | Parking brake applies automatically when supply air drops when true |
| panel_intensity_min | float | 0.01 | Minimum backlight intensity |
| panel_intensity_max | float | 0.3 | Maximum backlight intensity |
| glass_panes | array<owner_ptr> | — | References to **glass_pane_data** units |
| dashboard_color | array<float3> | — | 16-color array defining dashboard illumination by UV tile |
| seat_left_limit | float | -0.15 | Maximum leftward interior camera movement distance |
| seat_right_limit | float | 0.15 | Maximum rightward interior camera movement distance |
| seat_up_limit | float | 0.15 | Maximum upward interior camera movement distance |
| seat_down_limit | float | -0.15 | Maximum downward interior camera movement distance |
| seat_front_limit | float | -0.1 | Maximum forward interior camera movement distance |
| seat_back_limit | float | 0.2 | Maximum backward interior camera movement distance |
| sounds | array<string> | — | FMOD event assignments using "sound_name\|sound_path" format. Added in version 1.39 |

Nearly 70 animation attributes exist, plus `_min` and `_max` variants for adjustable ranges.

Expected sound event names include: air_warning, blinker_off, blinker_on, noise, stick_blinker, stick_blinker_off, stick_engine_brake, stick_hazard_warning, stick_high_beam, stick_light_horn, stick_lights, stick_park_brake, stick_park_brake_off, stick_retarder, stick_wipers, weigh_green, weigh_red, window_click, window_move, wipers_down, and wipers_up.

## Glass Panes and Wipers

Related units **glass_pane_data** and **wiper_data** are defined within the same `SiiNunit` scope, typically included via `/def/vehicle/truck/<brand.model>/interior/glass.sui`:

- **glass_pane_data**: Defines surfaces for raindrop accumulation and wiper simulation
- **wiper_data**: Defines wipers that remove drops from glass panes

### Example Structure

```
SiiNunit
{	// start of SiiNunit global scope

accessory_interior_data : something.brand.truck.interior
{	// start of accessory_interior_data unit

	// various attributes belonging to accessory_interior_data

	// each member refers to a unit included via glass.sui
	glass_panes[]: .brand.truck.pane.front
	glass_panes[]: .brand.truck.pane.close
	glass_panes[]: .brand.truck.pane.far
	// etc...

}	// end of accessory_interior_data scope

@include "glass.sui"	// file containing glass_pane_data and wiper_data units

}	// end of SiiNunit global scope
```
