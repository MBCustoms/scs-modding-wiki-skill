# cargo model match

The **cargo_model_match** unit class, introduced in version 1.54 for ETS2/ATS games, defines how the cargo system locates accessory definitions and manages loading/lashing attributes. These files reside in `/def/vehicle/cargo/` with subdirectories named after cargo tokens (e.g., `/def/vehicle/cargo/bricks/`).

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| data_path | array<string> | — | Paths to cargo accessory definitions with matching model attributes. Enables pseudo-random selection during job generation. Must reference **accessory_cargo_data** unit type files, typically in the same cargo folder. |
| dimensions | float3 | (0.01, 0.01, 0.01) | Cargo model dimensions in meters (W x H x L format), e.g., (2.30, 2.63, 3.22) |
| unit_volume_factor | float | 1.0 | Multiplier representing cargo unit volume ratio, distinguishing different model matches with varying visual proportions. |
| loading_method | token | none | Cargo loading method. Valid tokens: area, area_cont_20ft, area_cont_40ft, area_cont_45ft, area_cont_53ft, cont_2x20ft, area_cylinder, area_logger, auxiliary_only, bulk, custom, none |
| lashing_method | token | none | Cargo securing method. Valid tokens: direct, top_over, none |
| lashing_gear_type | token | none | Lashing device algorithm type. Valid tokens: chain, strap |
| lashing_hook_angle_constraints | float3 | (90.0, 90.0, 90.0) | Angular constraints per axis (0–90°) for cargo hooks. Applies only to hooks on cargo models, not applicable with top_over lashing. |

## Example SII File

Located at `/def/vehicle/cargo/bricks/model_area.sii`:

```
SiiNunit
{
cargo_model_match : .area
{
	data_path[]: "/def/vehicle/cargo/bricks/accessory_bricks.sii"

	dimensions: (1.19, 0.97, 0.80)

	loading_method: area
	lashing_method: top_over
	lashing_gear_type: strap
}
}
```
