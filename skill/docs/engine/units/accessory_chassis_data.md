# Documentation/Engine/Units/accessory chassis data

The **accessory_chassis_data** unit class defines chassis characteristics for player vehicles, trailers, and AI vehicles. These units typically appear in "/def/vehicle/truck/<brand.model>/chassis/*.sii", "/def/vehicle/trailer/<trailer_name>/*.sii", and "/def/vehicle/ai/<vehicle_name>/chassis.sii" files.

## Attributes

Many common attributes inherit from **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| detail_model | string | | Path to detailed mesh model descriptor (.pmd), used for player vehicles, previews, and browser windows |
| model | string | | Path to model descriptor (.pmd) |
| lods | array<string> | | Paths to reduced level-of-detail model descriptors (.pmd) in order of increasing viewing distance |
| collision | string | | Path to collision descriptor (.pmc) |
| trailer_brace_model | string | | For trailers only. Path to animated landing gear model |
| trailer_brace_anim | string | | For trailers only. Path to landing gear animation |
| trailer_brace_up_sound | string | | For trailers only. Path to sound played when retracting landing gear. Default changed to blank in 1.35 |
| trailer_brace_down_sound | string | | For trailers only. Path to sound played when extending landing gear. Default changed to blank in 1.35 |
| variant | token | | Variant used from detail_model, model, and lods |
| variant_uk | token | | Variant for left-hand driving countries; defaults to variant if unspecified |
| look | token | | Look used from detail_model, model, and lods |
| shadow_texture | string | | Texture for basic shadow |
| shadow_intensity | float | 1.0 | Relative intensity of basic shadow |
| extended_shadow_texture | string | | Texture for extended (volumetric) shadow |
| extended_shadow_intensity | float | 1.0 | Relative intensity of extended shadow |
| extended_shadow_fadeout_start | float | 0.0 | Distance in meters from fakeshadow surface to begin fading extended shadow |
| extended_shadow_fadeout_length | float | 1.0 | Length in meters over which to fade out extended shadow |
| extended_shadow_shared_model_variant | token | | Variant of model used to draw shared shadows |
| ui_shadow | string | | Path to model descriptor (.pmd) for UI shadow in truck/trailer browser and thumbnail generation |
| tank_size | float | 0.0 | Fuel tank size in liters |
| adblue_tank_size | float | 80.0 | AdBlue/DEF tank size in liters |
| air_tank_pressure | float | 10.0 | Nominal air brake reservoir pressure in bar. Added in ETS2 1.27/ATS 1.6 |
| nominal_voltage | float | 24.0 | Nominal battery voltage. Added in 1.36 |
| residual_travel | array<float> | | For trucks and trailers. Limit of upwards and downwards travel in meters for each axle, from front to back |
| trailer_mass | float | 7000.0 | For trailers only. Sets unladen mass of trailer |
| powered_axle | array<bool> | | For trucks only. When true, motive torque applied on axle, from front to back |
| kerb_weight | array<float> | false | For trucks only. Assigns static weight on each axle, from front to back |
| liftable_axle | array<bool> | false | For trucks and trailers. When true, axle can be lifted. Trailer functionality added in ETS2 1.27/ATS 1.6 |
| steerable_axle | array<token> | see description | For trucks and trailers. By default, first axles on trucks are true, others false. Possible values: false (non-steerable), true (steerable wheels), axle (whole axle rotates for trailers). Added in 1.31; "axle" value added in 1.50 |
| steerable_lifted_axle | bool | false | For trucks and trailers. When true, lifted steerable axles react to steering. Added in 1.44 |
| weight_distribution | enum | semitrailer | For trailers only. Determines force transfer. Values: semitrailer (fifth wheel), trailer (hook), spreader (lowboy configuration). Added in ATS 1.6.2 |
| axle_model | array<string> | | For trailers only. Path to axle model descriptors (.pmd). Added in 1.50 |
| axle_model_collision | array<string> | | For trailers only. Path to axle model collision descriptors (.pmc). Added in 1.50 |
| axle_model_extended_shadow_texture | array<string> | | For trailers only. Texture for extended shadow underneath each axle. Added in 1.50 |
| axle_model_steer_angle | unsigned int | | For trailers only. Overwrites maximum steering angle of last steerable axle model. Added in 1.50 |
| cog_cargo_mass_min | float | 0 | Lowest cargo mass at which to offset center of gravity. Added in 1.35 |
| cog_cargo_mass_max | float | 20000 | Highest cargo mass at which to offset center of gravity. Added in 1.35 |
| cog_cargo_offset_min | float3 | (0,0,0) | Distance to offset center of gravity at cog_cargo_mass_min. Added in 1.35 |
| cog_cargo_offset_max | float3 | (0,1,0) | Distance to offset center of gravity at cog_cargo_mass_max. Added in 1.35 |
| sounds | array<string> | | Each item assigns FMOD event to chassis function using "_sound_name\|sound_path_" format. Expected names: air_brake, air_cutoff, reverse, lift_axle, hook_attach, hook_detach, trailer_cables. Added in 1.39 |
| lamp_setup | string | | Paths to special headlight setup if default insufficient. Added in 1.40 |

**Note:** "Content of vehicle_lamp_setup unit is an experimental feature and will most probably change in the future!"
