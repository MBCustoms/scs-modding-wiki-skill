# Documentation/Engine/Units/trailer cable data

The **trailer_cable_data** unit class is used for defining a dynamic trailer cable connection between a vehicle and its trailer.

Units of this type are typically unnamed and defined inline with an **accessory_addon_trailer_cables_data** unit. This unit type was added in version 1.31 and was previously named **physics_trailer_cable_data** until version 1.32.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| locator_prefix | token | | Names of locators on vehicle and trailer for cable connection |
| rest_locator_prefix | token | | Locator on vehicle for resting position when no trailer attached |
| vehicle_plug_model | string | | Path to model descriptor (.pmd) at vehicle cable end |
| vehicle_plug_model_variant | token | default | Variant of vehicle plug model |
| vehicle_plug_model_look | token | default | Look of vehicle plug model |
| vehicle_plug_model_offset | float3 | (0.0, 0.0, 0.0) | Local space offset for vehicle cable attachment |
| trailer_plug_model | string | | Path to model descriptor (.pmd) at trailer cable end |
| trailer_plug_model_variant | token | default | Variant of trailer plug model |
| trailer_plug_model_look | token | default | Look of trailer plug model |
| trailer_plug_model_offset | float3 | (0.0, 0.0, 0.0) | Local space offset for trailer cable attachment |
| ring_count | int | | Number of spiral rings (minimum 2) |
| ring_resolution | int | | Sides per ring (minimum 3) |
| diameter | float | | Spiral diameter (minimum 0.02) |
| width | float | | Cable width (minimum 0.001, cannot exceed diameter) |
| straight_cable_length | float | 0 | Length in meters; spiral if zero |
| back_faces | boolean | false | Renders inner faces of straight cables when true |
| material | string | "/material/ropes/cable_white.mat" | Cable rendering material |
| color | float3 | (0.5, 0.5, 0.5) | Vertex color in linear colorspace |
| resolution | int | | Lengthwise simulation segments (minimum 2) |

> Note: This article is a work in progress and has yet to be reviewed by SCS staff. Some information may be incomplete or inaccurate.
