# Documentation/Engine/Units/accessory_truck_data

The **accessory_truck_data** unit class defines basic information, cameras, fallback rules, and required accessories for the player's truck. Units of this type are defined in **/def/vehicle/truck/<brand.model>/data.sii**.

## Attributes

Many common attributes are inherited from **accessory_data**. Required attributes are bolded.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| **info** | array<string> | | Two info members are typically defined: `info[]: "@@brand_peterbilt@@"` (truck brand) and `info[]: "@@series_peterbilt_579@@"` (truck model) |
| require | array<token> | | Accessory types which should be required regardless of vehicle configuration |
| **behind_camera** | link_ptr | | Unit name of camera for orbit (2) view; typically `camera.behind.basic` |
| **interior_camera** | link_ptr | | Unit name of camera for interior (1) view; typically `camera.interior.<brand>.<model>` |
| **interior_camera_oculus** | link_ptr | | Unit name of camera for interior (1) view with head-mounted display; typically `camera.interior.<brand>.<model>.oculus` |
| **window_camera** | link_ptr | | Unit name of camera for lean-out (5) view; typically `camera.window.basic` |
| **bumper_camera** | link_ptr | | Unit name of camera for bumper (6) view; typically `camera.bumper.basic` |
| **cabin_camera** | link_ptr | | Unit name of camera for cabin-top (4) view; typically `camera.cabin.basic` |
| **wheel_camera** | link_ptr | | Unit name of camera for wheel (7) view; typically `camera.wheel.basic` |
| **top_camera** | link_ptr | | Unit name of camera for overhead (3) view; typically `camera.top.basic` |
| top_fixed_camera | link_ptr | | Typically unused |
| **tv_camera** | link_ptr | | Unit name of camera for TV (8) view; typically `camera.tv.basic` |
| predefined_tv_camera | link_ptr | | Typically unused |
| side_camera | link_ptr | | Typically unused |
| wander_camera | link_ptr | | Unit name of camera for wander mode; typically `camera.wander` |
| **debug_camera** | link_ptr | | Unit name of camera for developer/fly camera (0); typically `camera.debug` |
| **fallback** | array<string> | | Each member contains a specially-formatted string defining an accessory type and relative path to SII file with fallback accessory |

### Fallback Rules

Each fallback rule contains a token and relative path to an SII file. Example: `fallback[]: "chassis|4x2.sii"` calls on **/def/vehicle/truck/<make.model>/chassis/4x2.sii**. For accessories folder: `fallback[]: "accessory|steering_w/shape1.sii"`.

**Note:** There are 15 required fallback rules: chassis, cabin, engine, transmission, f_tire, f_disc, f_hub, f_nuts, r_tire, r_disc, r_hub, r_nuts, head_light, paint_job, interior. It is generally advisable to include a rule for steering_w if the truck has interchangeable steering wheels.

## Pin Overrides _(Added in 1.40)_

The following array attributes override the location, appearance, and orientation of accessory pins in the truck configuration scene:

| Name | Type | Description |
|------|------|-------------|
| pin_group | array<token> | The name of the accessory group for each pin override |
| pin_look | array<token> | The appearance of the accessory pin; typically `custom_acc` |
| pin_offset | array<float3> | Vector to offset the accessory pin from the locator |
| pin_dir | array<float3> | Vector to set the direction of the pin (independent of locator orientation) |
| pin_dir_uk | array<float3> | Vector to set the direction of the pin for right-hand drive (typically omitted in ATS) |
| double_sided | array<bool> | When true, pin is duplicated and mirrored across truck's X-axis |

### Example 1: Sideskirt Pin

```
pin_group[]:     sideskirt
pin_look[]:      custom_acc
pin_offset[]:    (-1, 0, 0)
pin_dir[]:       (-1, 0, 0)
pin_dir_uk[]:    (-1, 0, 0)
double_sided[]:  true
```

The pin for the sideskirt accessory is offset 1 m to the left of the locator (-X) and pointed left. It will also be drawn 1 m to the right, pointed right.

### Example 2: Exhaust Pin

```
pin_group[]:     exhaust
pin_look[]:      custom_acc
pin_offset[]:    (0, 0, 0)
pin_dir[]:       (-1, 0, 1)
pin_dir_uk[]:    (-1, 0, 1)
double_sided[]:  true
```

The pin for the exhaust accessory is drawn at the locator with no offset and pointed 45° to the rear left. It will also be drawn 45° to the rear right, making the pin visible from both sides and rear.
