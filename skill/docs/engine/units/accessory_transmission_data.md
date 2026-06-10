# Documentation/Engine/Units/accessory transmission data

The **accessory_transmission_data** unit class defines transmission characteristics for the player's vehicle, including the differential ratio. These units are typically found in **/def/vehicle/truck/<brand.model>/transmission/\*.sii** with valid names ending in `.transmission`.

## Attributes

Many common attributes are inherited from **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| stall_torque_ratio | float | -1.0 | Torque ratio multiplier for torque converter/multiplier. Positive values multiply lower RPM torque. |
| differential_ratio | float | 1.0 | Differential/final drive ratio between transmission output shaft and wheels. |
| retarder | uint | 0 | Number of output levels for retarder. Zero disables retarder behavior. |
| auxiliary_brakes | array<float3> | — | Overrides retarder control to manage retarder, engine brake, and forced downshift. Components are (retarder strength, engine brake strength, forced downshift). Must match retarder member count. _(Added in 1.28)_ |
| ratios_reverse | array<float> | — | Reverse gear ratios in order of decreasing gear reduction. Values should be negative. |
| ratios_forward | array<float> | — | Forward gear ratios in order of decreasing gear reduction. Values should be positive. |
| transmission_names | owner_ptr | — | Points to a transmission_names unit, typically nameless and within the same file or included from a .sui file. Assigns custom gear names for automatic and sequential modes. |
| auto_mode_name | string | A | Prefix for gear number display during automatic transmission mode. _(Added in 1.35)_ |
| manual_mode_name | string | M | Prefix for gear number display during manual transmission mode. _(Added in 1.35)_ |
| crawls | uint | 0 | Number of ratios_forward to handle as crawler gears for UI display. _(Added in ETS2 1.27.2)_ |
| shift_time | float | 1.0 | Time in seconds for gear shift in automatic shifting. _(Added in 1.31)_ |
| sounds | array<string> | — | FMOD events assigned to functions using "_sound_name\|sound_path_" format. Expected names: air_gear_noise, retarder, gear_grind, gear_wrong. _(Added in 1.39)_ |
