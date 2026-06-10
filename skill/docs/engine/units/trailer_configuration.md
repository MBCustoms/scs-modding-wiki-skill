# trailer_configuration

The **trailer_configuration** unit class collects chassis for ownable trailer configurations, defines valid body sets, and establishes equivalent configurations. These units typically reside in **/def/vehicle/trailer_owned/<brand.model>/configurations/**

## Attributes

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **name** | string | | Full name displayed in UI |
| icon | string | | Path relative to `/material/ui/accessory/` (omit extension) |
| **chain_type** | token | | Specifies chain type (single, double, rmdouble, etc.) |
| equivalency | token | | Enables switching between configurations with matching tokens via in-game menu |
| **chassis** | array<string> | | Paths to chassis definitions (type: accessory_chassis_data) |
| **body_sets** | array<owner_ptr> | | Compatible trailer_body_sets; auto-gathered from same-named subfolder or defined explicitly |

## Key Details

Body sets are usually automatically gathered from a sub-folder with the same name as the base configuration file. For example, "single3.sii" configuration expects body sets in "/def/vehicle/trailer_owned/<brand.model>/configurations/single3" folder.

Each configuration requires at least one valid body set. The equivalency attribute must be explicitly set—blank equivalency values prevent matching between configurations.

## Related Units

- trailer_body_set
- accessory_chassis_data
