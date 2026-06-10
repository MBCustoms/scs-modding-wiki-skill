# glass_pane_data

The **glass_pane_data** unit class defines glass 'panes' that simulate raindrop accumulation, movement, and clearing in interior views. Each pane requires a separate unit defined as a nameless unit within accessory_interior_data via the _glass_panes_ attribute, typically included via **/def/vehicle/truck/<brand.model>/interior/glass.sui**.

**Note:** Certain trucks in ETS2 use **glass.dat** instead of **glass.sui** for historical reasons. New definitions should use the SUI extension.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| locator | string | — | The name of the locator in the interior model for this glass pane. The locator's Y axis points outward from the glass surface, with its XZ plane forming the surface. |
| size | float2 | — | The size (width, height) of the glass pane in meters. |
| drop_size_minimum | float | 0.006 | Minimum raindrop size in meters. |
| drop_size_maximum | float | 0.024 | Maximum raindrop size in meters. |
| edge_angle | float | 0 | Yaw angle in degrees between locator orientation and orientation of normals at left and right sides of the plane. Used to simulate fake curved surface. |
| wipers | array<owner_ptr> | — | Each member points to a wiper_data unit defining a wiper that affects this glass pane. |
