# vehicle wheel accessory

The **vehicle_wheel_accessory** unit class is used to 'attach' wheel/rim accessories and their data to vehicle and trailer configurations. Units of this type are typically nameless and declared within the same context as the configuration that owns/uses them.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| wear | float | 0.0 | This attribute is used to track damage and wear to the accessory. 0 corresponds to an unworn state and 1 corresponds to a completely worn state. |
| **data_path** | string | | Full path to the SII file containing a suitable accessory data unit. |
| offset | uint | 0 | The axle index to which this accessory applies. "Front" (steering) axles are enumerated from the front of the vehicle to its rear and "rear" axles are enumerated from the rear of the vehicle to its front. Front and rear axles are enumerated independently. |
| paint_color | float3 | **default_color** from data unit | The color to be used for .paint materials on the accessory model. |

## Suitable Accessory Data Types

These accessory data types can be used by **vehicle_wheel_accessory**:

- accessory_rim_data
- accessory_wheel_data

## Related Units

- traffic_trailer
- traffic_vehicle
- trailer
- vehicle
- vehicle_accessory
- vehicle_addon_accessory
- vehicle_paint_job_accessory
- vehicle_sound_accessory
