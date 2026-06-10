# Documentation/Engine/Units/wiper data

The **wiper_data** unit class defines wipers that remove raindrops from simulated glass panes in the interior view. Each wiper requires a separate unit, defined as nameless units belonging to glass_pane_data through the wipers attribute. These are typically included via **/def/vehicle/truck/<brand.model>/interior/glass.sui**.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| center_bone | string | | The name of the bone in the animated interior model's skeleton serving as the wiper's centroid. The bone's Z axis should point 'into' the glass pane (roughly opposite the glass locator's Y axis). |
| length | float | 0.0 | The length of the wiper 'blade' in meters, along the center_bone's X axis. |
