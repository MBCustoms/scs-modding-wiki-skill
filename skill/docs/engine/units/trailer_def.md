# trailer_def

The **trailer_def** unit class functions as an intermediary between cargo_data and trailer units. These are typically defined in **/def/cargo/<cargo_name>/<trailer_name>.sii** files. They specify which trailer configuration to enable for cargo, the cargo's mass in that configuration, how mass distributes across the trailer and its slave units, and where the configuration is permitted.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| trailer | string | | The unit name of the trailer unit to be enabled for the cargo. Can refer to units that aren't present (legacy usage only). |
| gross_trailer_weight_limit | float | | The maximum technical or logical combined weight of the trailer and its cargo. |
| chassis_mass | float | | The mass of the trailer chassis in kg. |
| body_mass | float | | The mass of the trailer body in kg. |
| length | float | 0 | The length of the trailer combination in meters. Compared against allowed_trailer_length when generating jobs. |
| axles | uint | | The number of axles in the trailer combination, checked against country_data→mass_limit_per_axle_count. |
| volume | float | | The interior volume of the trailer body in m³. |
| body_type | token | | Sets the body type of the trailer configuration, determining which cargoes are allowed. |
| chain_type | token | | Sets the trailer chain type of the trailer configuration. |
| country_validity | array<token> | | Each member is a country (or state in ATS) where this trailer_def is suitable for generated jobs. If unset, the trailer_def is suitable in all countries. |
| mass_ratio | array<float> | | Each member defines how much cargo mass and forces are borne by each trailer, starting with the master trailer and iterating through slave trailers. Must sum to 1. |

## World of Trucks Compatibility

World of Trucks jobs will use mod trailers if these conditions are met:

- The mass equals or exceeds the job's cargo mass
- The length is compatible with source and destination prefabs
- The configuration is valid for source and destination countries
- The trailer count matches the job's trailer count

## Related Units

- cargo_data
- trailer
