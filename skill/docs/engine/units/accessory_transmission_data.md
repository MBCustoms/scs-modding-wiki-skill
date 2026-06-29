# accessory transmission data

**Source:** https://modding.scssoft.com/wiki/Documentation/Engine/Units/accessory_transmission_data

The **accessory_transmission_data** unit class defines transmission characteristics for player vehicles and differential ratios. These units are typically found in `/def/vehicle/truck/<brand.model>/transmission/*.sii` files with names ending in `.transmission`.

## Attributes

This class inherits common attributes from **accessory_data**.

| Name | Type | Default | Description |
|------|------|---------|-------------|
| stall_torque_ratio | float | -1.0 | "Torque ratio multiplier if torque converter/multiplier is present" |
| differential_ratio | float | 1.0 | "defines the differential/final drive ratio between the transmission output shaft and the wheels" |
| retarder | uint | 0 | "number of output levels for the retarder if applicable" |
| auxiliary_brakes | array<float3> | — | "overrides the retarder control so that it controls both the retarder and engine brake" with components (retarder strength, engine brake strength, forced downshift) _(Added in 1.28)_ |
| ratios_reverse | array<float> | — | "defines the reverse gear ratios in order of decreasing gear reduction" using negative values |
| ratios_forward | array<float> | — | "defines the forward gear ratios in order of decreasing gear reduction" using positive values |
| transmission_names | owner_ptr | — | Points to transmission_names unit for custom gear naming in automatic and sequential modes |
| auto_mode_name | string | A | "Prefix for gear number in dashboard display" during automatic mode _(Added in 1.35)_ |
| manual_mode_name | string | M | "Prefix for gear number in dashboard display" during manual mode _(Added in 1.35)_ |
| crawls | uint | 0 | "number of ratios_forward to handle as crawler gears for UI display" _(Added in 1.27.2)_ |
| reverse_crawls | uint | 0 | "number of ratios_reverse to handle as crawler gears for UI display" _(Added in 1.60)_ |
| shift_time | float | 1.0 | "time, in seconds, it takes to shift gears in automatic shifting" _(Added in 1.31)_ |
| sounds | array<string> | — | Assigns FMOD events using "_sound_name\|sound_path_" format _(Added in 1.39)_ |

Expected sound event names include: air_gear_noise, retarder, gear_grind, and gear_wrong.
