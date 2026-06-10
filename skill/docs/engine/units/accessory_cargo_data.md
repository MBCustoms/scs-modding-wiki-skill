# accessory_cargo_data

The **accessory_cargo_data** unit class configures visible cargo models for trailers. Units of this type are found in **/def/vehicle/cargo/<cargo_name>/** (as of 1.54).

## Attributes

Many common attributes are inherited from **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| detail_model | string | | Path to the detailed mesh model descriptor (.pmd). This is used only for vehicles used by player. Additionally they are used in vehicle previews & browser windows. |
| model | string | | Path to the model descriptor (.pmd). If only a single LOD is used, it should be set up as **model**, and the other attributes (detail_model, lods) should not be defined. |
| lods | array<string> | | Paths to the reduced level-of-detail model descriptors (.pmd), in order of increasing viewing distance (decreasing model complexity). |
| collision | string | | Path to the collision descriptor (.pmc). |
| variant | token | | Name of the variant to be used on all descriptors of this accessory. **Note:** All models defined for this **accessory_cargo_data** must have this variant name. |
| look | token | | Name of the look to be used on all descriptors of this accessory. **Note:** All models defined for this **accessory_cargo_data** must have this look name. |
| dynamic_cargo_data | owner_ptr | | Points to a unit of the type **dynamic_cargo_data** where data related to dynamic cargo (un)loading are stored. |
