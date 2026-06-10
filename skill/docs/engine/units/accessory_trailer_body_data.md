# accessory_trailer_body_data

The **accessory_trailer_body_data** unit class defines ownable trailer body accessories, including specifications for body dimensions, volume, mass, and visual representation. These units are typically found in **/def/vehicle/trailer_owned/<brand.model>/body/\*.sii**.

## Attributes

Many standard attributes are inherited from **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| size | float3 | | Interior cargo area dimensions in meters (width, height, length) |
| total_size | float3 | | Overall exterior trailer dimensions in meters (width, height, length) |
| volume | float | | Cargo volume in cubic meters (m³) |
| body_type | token | | Trailer body classification (e.g., flatbed, dryvan) |
| mass | float | | Empty body accessory mass in kilograms, excluding cargo |
| detail_model | string | | Path to detailed mesh model descriptor (.pmd) for player vehicles, previews, and browser windows |
| model | string | | Path to model descriptor (.pmd); use alone if single LOD is employed |
| lods | array<string> | | Paths to reduced level-of-detail model descriptors (.pmd), ordered by increasing viewing distance |
| collision | string | | Path to collision descriptor (.pmc) |
| variant | token | | Variant selection from detail_model, model, and lods |
| look | token | | Look selection from detail_model, model, and lods |
| empty_cargo_model | string | | Path to accessory_cargo_data definition applied when trailer is empty _(Added in 1.39)_ |
