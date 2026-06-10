# Documentation/Engine/Units/accessory data

The **accessory_data** unit class serves as the superclass for all _accessory_*_data_ classes. It defines "basic UI attributes and compatibility/interactions between accessories." This class is typically not used directly since it lacks visual or physical effects on vehicles. Instead, specialized subclasses derived from it handle specific accessory types.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| name | string | | Full name of the accessory for UI display. |
| short_name | string | | Condensed name for UI display in space-limited contexts. |
| icon | string | | Path relative to `/material/ui/accessory/` to the accessory icon, omitting file extension. Example: `icon: "truck_name/fancy_doodad"` points to `/material/ui/accessory/truck_name/fancy_doodad.mat`. |
| info | array<string> | | Additional information about the accessory. Few accessory types still use this for UI display (e.g. engine). |
| price | s64 | 0 | Price of the accessory in the store in base currency (ETS2 → EUR, ATS → USD). If zero, the accessory is hidden from the player. |
| unlock | uint | 0 | Minimum level the player must achieve before the accessory becomes available in the store. |
| part_type | token | `unknown` | Defines icon and tooltip shown on accessory. Available values: `factory`, `aftermarket`, `licensed`, or `unknown`. _Added in 1.44._ |
| suitable_for | array<string> | | Each member specifies a unit name or wildcard pattern that must exist on the vehicle for this accessory to become visible and applicable. |
| conflict_with | array<string> | | Each member specifies a unit name or wildcard pattern with which this accessory is incompatible. Conflicting accessories are removed if this accessory is applied. |
| defaults | array<string> | | Each member specifies a path to an accessory definition file applied to the vehicle if no other suitable accessory of the same type exists. |
| overrides | array<string> | | Each member specifies a path to an accessory definition file applied to the vehicle, overriding other accessories of the same type if one already exists. This eliminates the need for suitable_for/defaults relationships in most cases (e.g. engine badges and sounds). _Added in ETS 1.27/ATS 1.6._ |
| require | array<token> | | Each member specifies an accessory type that must exist on the vehicle while this accessory is installed. The token is the final segment of each unit name. **Note:** Every _require_d accessory type should **always** have a corresponding accessory of that type in _defaults_! |
