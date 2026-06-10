# vehicle_accessory

The **vehicle_accessory** unit class functions to "attach certain types of accessories and their data to vehicle and trailer configurations." These units are typically unnamed and declared within the same context as their owning configuration.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| wear | float | 0.0 | Tracks damage and wear to the accessory, where 0 is unworn and 1 is completely worn |
| **data_path** | string | | Full path to the SII file containing a suitable accessory data unit |

## Suitable Accessory Data Types

The following accessory data types can be used by **vehicle_accessory**:

- accessory_cabin_data
- accessory_cargo_data
- accessory_chassis_data
- accessory_engine_data
- accessory_headlight_data
- accessory_interior_data
- accessory_trailer_data
- accessory_trailer_body_data
- accessory_transmission_data
- accessory_truck_data

## Related Units

- traffic_trailer
- traffic_vehicle
- trailer
- vehicle
- vehicle_addon_accessory
- vehicle_paint_job_accessory
- vehicle_wheel_accessory
