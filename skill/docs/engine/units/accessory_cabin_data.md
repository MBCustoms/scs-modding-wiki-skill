# accessory_cabin_data

The **accessory_cabin_data** unit class configures the models for the cabin of the player's vehicle. Units of this type are found in **/def/vehicle/truck/<brand.model>/cabin/**.

## Attributes

Many common attributes are inherited from **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| detail_model | string | | Path to the detailed mesh model descriptor (.pmd). Used only for vehicles operated by the player, and in vehicle previews & browser windows. |
| model | string | | Path to the model descriptor (.pmd). For single LOD usage, set as **model** without defining detail_model or lods. |
| lods | array<string> | | Paths to reduced level-of-detail model descriptors (.pmd), ordered by increasing viewing distance. |
| collision | string | | Path to the collision descriptor (.pmc). |
| variant | token | _default_ | Selects the variant for all models/collisions. Required when cabin and chassis share a model. All models must have this variant name. |
| variant_uk | token | Same as variant | Selects the variant for right-hand-drive (RHD) vehicles. Defaults to **variant** if unset. All models must have this variant name. |
| look | token | _default_ | Selects the look for all models defined. All models must have this look name. |
| wiper_model | string | | Path to the animated wiper model (.pmg) |
| wiper_anim | resource_tie | | Path to the wiper animation (.pma) |
| wiper_model_uk | string | | Path to the animated wiper model (.pmg) for RHD vehicles. Defaults to **wiper_model** if unset. |
| wiper_anim_uk | resource_tie | | Path to the wiper animation (.pma) for RHD vehicles. Defaults to **wiper_anim** if unset. |
| drl_with_headlights | float | 0.0 | Sets the relative strength of daytime running lights when headlights are on. Value of 0 turns DRL off; 1 keeps them on; intermediate values dim the DRL; values greater than 1 intensify them. Typical ETS2 value is 0.4. |
| suspension | bool | true | Enables physical simulation of cabin air suspension when true. |
| suspension_type | token | 4air | Defines cabin suspension type if suspension is enabled. Possible values: _4air_ (EU type) and _hinge2air_ (US type). Added in 1.47. |
| sounds | array<string> | | Assigns FMOD events to functions using "_sound_name\|sound_path_" format. Expected sound event names: horn, aero_noise, and rain_noise. Added in 1.39. |
