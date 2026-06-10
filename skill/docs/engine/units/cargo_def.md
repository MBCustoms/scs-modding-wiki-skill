# Documentation/Engine/Units/cargo def

The **cargo_def** unit class assigns cargo to be produced or accepted by a company. These units are typically defined in:
- **/def/company/<company_name>/in/<cargo_name>.sii** for cargo a company accepts
- **/def/company/<company_name>/out/<cargo_name>.sii** for cargo a company produces

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| **cargo** | string | | The unit name of the cargo, corresponding to a cargo_data unit. Example: `cargo: "cargo.stolen_ducks"` |

## Related Units

- cargo_data
- company_permanent
