# vehicle_addon_accessory

The **vehicle_addon_accessory** unit class attaches addon accessories, their data, and slotted hookups to vehicle and trailer configurations. These units are typically unnamed and declared within the same context as their owning configuration.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| wear | float | 0.0 | Tracks damage and wear to the accessory. 0 represents unworn state; 1 represents completely worn state. |
| **data_path** | string | | Full path to the SII file containing a suitable accessory data unit. |
| slot_name | array<token> | | Name of the model locator in the accessory model for the hookup accessory. Valid names begin with `slot_`. |
| slot_hookup | array<string> | | Unit name of the addon hookup to be hooked up in the corresponding **slot_name**. |

**Note:** The **slot_name** and **slot_hookup** arrays are usually defined as ordered arrays to ensure their indices correspond. They must always be the same length.

## Slot Usage Example

Here is an example of how marker lights are hooked up to slots on a _cabflares_ accessory in a truck configuration:

```
vehicle: .tdealer.peterbilt_4
{
    // ...
    accessories[]: .peterbilt_4.lights
    // ...
}
// ...
vehicle_addon_accessory : .peterbilt_4.lights {
    slot_name: 5
    slot_name[0]: slot_0
    slot_name[1]: slot_2
    slot_name[2]: slot_3
    slot_name[3]: slot_4
    slot_name[4]: slot_6
    slot_hookup: 5
    slot_hookup[0]: "light2.addon_hookup"
    slot_hookup[1]: "light2.addon_hookup"
    slot_hookup[2]: "light2.addon_hookup"
    slot_hookup[3]: "light2.addon_hookup"
    slot_hookup[4]: "light2.addon_hookup"

    wear: 0
    data_path: "/def/vehicle/truck/peterbilt.579/accessory/cabflares/shape01.sii"
}
// ...
```

## Suitable Accessory Data Types

These accessory data types can be used by **vehicle_addon_accessory** in the **data_path** attribute:

- accessory_addon_data
- accessory_addon_int_data
- accessory_addon_patch_data

These accessory data types can be hooked up to the accessory's slots:

- accessory_hookup_data
- accessory_hookup_int_data
- accessory_horn_hookup_data

## Related Units

- traffic_trailer
- traffic_vehicle
- trailer
- vehicle
- vehicle_accessory
- vehicle_paint_job_accessory
- vehicle_sound_accessory
- vehicle_wheel_accessory
