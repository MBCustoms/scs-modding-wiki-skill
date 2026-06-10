# company_permanent

The **company_permanent** unit class defines non-instance-specific data for company depots, typically located in **/def/company/<company_name>.sii**.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| name | string | | "The name of the company for UI display." |
| sort_name | string | | "A simplified version of the company name for sorting in lists." |
| trailer_look | token | | Attempts to match paint job accessories with company-specific configurations in **/def/vehicle/trailer/<trailer_name>/company_paint_job/<trailer_look>.sii**. Filename must be ≤12 characters. |
| out_cargo | array<link_ptr> | | "Do not use this attribute in definitions. It is generated 'on the fly' from any cargo_def units in **/def/company/<company_name>/out/**." |
| in_cargo | array<link_ptr> | | "Do not use this attribute in definitions. It is generated 'on the fly' from any cargo_def units in **/def/company/<company_name>/in/**." |
| city_names | array<token> | | "Do not use this attribute in definitions. It is generated 'on the fly' from any company_def units in **/def/company/<company_name>/editor/**." |
| prefab_names | array<token> | | "Do not use this attribute in definitions. It is generated 'on the fly' from any company_def units in **/def/company/<company_name>/editor/**." |

## Related Units

- cargo_def
- company_def
