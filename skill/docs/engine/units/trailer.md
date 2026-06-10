# trailer

**Note:** WIP — Smarty (talk) 19:32, 21 June 2017 (CEST)

The **trailer** unit class is used to define playable trailers. Units of this type are usually defined in **/def/vehicle/trailer/<trailer_name>.sii** along with their accessory units and any "slave" trailer units. They are included via **/def/vehicle/trailer_storage.<mod_name>.sii** and therefore **must not** use the SiiNunit magic mark.

This unit class is also used to store trailers in memory and the save-game (eg. player's active trailer, job market, etc). Therefore, there are numerous attributes that are not used when manually defining a trailer.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---|---|
| accessories | array<owner_ptr> | | Each member points to an accessory unit belonging to the trailer. Valid unit classes are vehicle_accessory, vehicle_addon_accessory, vehicle_wheel_accessory, and vehicle_paint_job_accessory. |
| odometer | uint | | Counts the integer part of the vehicle's odometer. This should not be set in the definition. |
| odometer_float_part | float | | Counts the decimal part of the vehicle's odometer. This should not be set in the definition. |
| trip_fuel | float | | This should not be set in the definition. |
| trip_distance | float | | This should not be set in the definition. |
| license_plate | string | | This stores the license plate number and any formatting applied by the license plate template when the trailer was initialized. This should not be set in the definition. |
| cargo_mass | float | | This is inherited from the cargo mass and mass ratio from the trailer_def unit associated with the job for which the trailer has been generated. This should not be set in the definition. |
| virtual_rear_wheels_offset | float | | This attribute is used to offset the physical (but not visual) position of the trailer's wheels in order to adjust its turning radius. It should generally not be used for playable trailers. |
| slave_trailer | owner_ptr | | Points to a **trailer** unit which forms the next vehicle in a multipivot configuration. The slave trailer will have its _hook_ locator hooked up to the master trailer's _s_hook_ locator. |

## Required Accessories

A valid trailer unit must have a chassis accessory (accessory_chassis_data via vehicle_accessory) and a wheel accessory for each axle (accessory_wheel_data via vehicle_wheel_accessory).

## Related Units

- trailer_def
- vehicle_accessory
- vehicle_addon_accessory
- vehicle_paint_job_accessory
- vehicle_wheel_accessory
