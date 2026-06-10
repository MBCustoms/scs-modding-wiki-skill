# cargo_data

The **cargo_data** unit class defines logistical, semantic, and economic properties of cargo. These units are typically found in **/def/cargo/<cargo_name>.sii** and included in **/def/cargo.<mod_name>.sii**, so they "must not use the SiiNunit magic mark."

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| name | string | | Display name for UI; supports localization |
| body_types | array<token> | | List of compatible body types for cargo loading |
| volume | float | | Volume in cubic meters per cargo unit |
| mass | float | | Mass in kilograms per cargo unit |
| unit_reward_per_km | float | | Base currency reward for transporting one unit per kilometer |
| unit_load_time | float | | Loading time in seconds per cargo unit |
| fragility | float | | Sensitivity level to damage |
| valuable | bool | false | When true, requires Valuable Cargo skill and grants related bonuses |
| overweight | bool | false | |
| adr_class | uint | | ADR/Hazardous Materials classification; player needs corresponding skill |
| minimum_distance | float | 0 | Minimum job distance in kilometers |
| maximum_distance | float | ∞ | Maximum job distance in kilometers |
| prob_coef | float | 1.0 | Relative probability of job spawning |
| group | array<token> | | Cargo group membership: machinery, adr, containers, refrigerated, liquid, fragile, construction, bulk, oversize |

The fragile category is "typically reserved for cargoes with a fragility of 0.7 or higher."

## Related Units

- cargo_def (marks cargo as produced or accepted by companies)
- trailer_def (assigns trailer configuration and mass properties)
