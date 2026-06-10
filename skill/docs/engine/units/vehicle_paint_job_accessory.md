# Vehicle Paint Job Accessory

**Note:** WIP — Smarty 04:17, 23 June 2017 (CEST)

The **vehicle_paint_job_accessory** unit class is used to 'attach' a paint job accessory and its data to vehicle and trailer configurations. Units of this type are typically nameless and declared within the same context as the configuration that owns/uses them.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| wear | float | 0.0 | Tracks damage and wear to the accessory. 0 = unworn, 1 = completely worn. |
| **data_path** | string | | Full path to the SII file containing a suitable accessory data unit. |
| mask_r_color | float3 | From accessory data | Color applied to the red channel of the paint job (colormask only). |
| mask_g_color | float3 | From accessory data | Color applied to the green channel of the paint job (colormask only). |
| mask_b_color | float3 | From accessory data | Color applied to the blue channel of the paint job (colormask only). |
| flake_color | float3 | From accessory data | Color used for the flake component of the paint job (flipflake only). |
| flip_color | float3 | From accessory data | Color used for the flip component of the paint job (flipflake only). |
| base_color | float3 | From accessory data | Base color of the paint job (all paint job modes). |

## Related Units

- traffic_trailer
- traffic_vehicle
- trailer
- vehicle
- vehicle_accessory
- vehicle_addon_accessory
- vehicle_sound_accessory
- vehicle_wheel_accessory
