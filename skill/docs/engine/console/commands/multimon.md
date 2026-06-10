# multimon

The **multimon** command enables dynamic adjustments to monitor view sizes during gameplay. However, increasing view size cannot exceed the maximum rendering resolution established at startup. In such cases, the resized view may appear blurry—restart the game or temporarily adjust vsync settings in display options (after saving configuration via **multimon save**) to resolve this.

The multi-monitor support requires graphics drivers to provide a virtual screen spanning all physical monitors.

## Supported Commands

### init

**Syntax:** `multimon init <setup_name>`

**Example:** `multimon init three`

Initializes runtime configuration using predefined setups:

- **empty** - No views, UI spans entire screen; convenient starting point for custom setups
- **one** - Creates single wide view with UI over entire screen; similar to predefined mode 0 with ability to disable interior rendering
- **three** - Corresponds to predefined mode 2
- **three_with_dash** - Corresponds to predefined mode 3

When using **three** or **three_with_dash**, the current state of tweaking cvars applies to runtime configuration.

### reload

**Syntax:** `multimon reload`

**Example:** `multimon reload`

Replaces runtime configuration with content from **multimon_config.sii**

### save

**Syntax:** `multimon save`

**Example:** `multimon save`

Saves current runtime configuration to **multimon_config.sii**. This MUST be used for changes to persist through game restart or display setting changes.

### add

**Syntax:** `multimon add <name> <x> <y> <width> <height>`

**Example:** `multimon add left 0.25 0 0.5 1`

Defines monitor in specified output resolution area and associates it with a name. Note: "ui" is reserved.

### remove

**Syntax:** `multimon remove <name>`

**Example:** `multimon remove left`

Removes the specified monitor.

### make primary

**Syntax:** `multimon make_primary <name>`

**Example:** `multimon make_primary center`

Marks specified monitor as primary. The primary monitor serves as the source of base values for relative attributes, and HDR eye adaptation calculates from this monitor.

### list

**Syntax:** `multimon list`

**Example:** `multimon list`

Lists names of all defined monitors.

### set

**Syntax:** `multimon set <name> <attribute> <value>`

**Example:** `multimon set left horizontal_fov_override 60`

Sets specified attribute for specified monitor. Special monitor name "ui" allows UI position changes.

### get

**Syntax:** `multimon get <name> [<attribute_prefix>]`

**Example:** `multimon get left normalized_`

Prints all attribute values for specified monitor whose names begin with the specified prefix. "ui" provides access to UI itself.

## Supported Attributes for get and set

| Name | Example | Description |
|------|---------|-------------|
| `normalized_ui_x` | `normalized_ui_x: 0.333333` | Decimal between 0 and 1. Horizontal position in virtual screen for UI drawing start. Second monitor in 3-monitor setup: **0.333333**. Third: **0.666666**. Two-monitor setup with UI on right: **0.5** |
| `normalized_ui_width` | `normalized_ui_width: 0.333333` | Decimal between 0 and 1. UI width in virtual screen. One monitor in 3-monitor setup: **0.333333**. Two-monitor: **0.5**. All monitors: **1.0** with `normalized_ui_x` at **0.0** |
| `name` | `name: middle` | String. Monitor handle for `multimon get` and `multimon set`. "ui" is reserved |
| `normalized_x` | `normalized_x: 0.333333` | Decimal between 0 and 1. X-axis horizontal position of monitor's left edge in virtual screen. 3-monitor: 1st **0.0**, 2nd **0.333333**, 3rd **0.666666**. 2-monitor: **0.0** and **0.5** |
| `normalized_y` | `normalized_y: 0.5` | Decimal between 0 and 1. Y-axis vertical position corresponding to bottom edge. 2-row setup: 1st monitor **0.0**, 2nd **0.5**. Single-row: **0.0** |
| `normalized_width` | `normalized_width: 0.333333` | Decimal between 0 and 1. X-axis horizontal length in virtual screen. 3-monitor setup: all **0.333333**. 2-monitor: **0.5** |
| `normalized_height` | `normalized_height: 0.5` | Decimal between 0 and 1. Y-axis vertical length. 2-row setup: all **0.5**. Single-row: **1.0** |
| `heading_offset` | `heading_offset: -2.0` | Decimal between -180.0 and 180.0. Heading angle in degrees added to camera when rendering this monitor |
| `pitch_offset` | `pitch_offset: -15.0` | Decimal between -90.0 and 90.0. Pitch angle in degrees added to camera for monitor tilt/angle compensation |
| `roll_offset` | `roll_offset: -15.0` | Decimal between -180.0 and 180.0. Roll angle in degrees added to camera for angle/rotation compensation |
| `horizontal_fov_relative_offset` | `horizontal_fov_relative_offset: 1.0` | Decimal value. Additional heading angle as multiplies of primary monitor's horizontal FOV. Set to **0.0** for primary monitor |
| `vertical_fov_relative_offset` | `vertical_fov_relative_offset: 0.0` | Decimal value. Additional pitch angle as multiplies of primary monitor's vertical FOV. Set to **0.0** for primary monitor |
| `camera_space_offset` | `camera_space_offset: (0.000000, 0.000000, 0.000000)` | Triple with decimal values for x (horizontal), y (vertical), z (depth) coordinates. Config file syntax: **(x, y, z)**. Console: **x y z** |
| `horizontal_fov_override` | `horizontal_fov_override: 85.0` | Decimal between 0.0 and 178.0. Overrides horizontal FOV. **0.0** means not overridden. If both FOVs unoverridden, FOV taken from default camera adjustable via seat adjuster. If only one overridden, non-overridden FOV calculated to preserve aspect ratio |
| `vertical_fov_override` | `vertical_fov_override: 72.3` | Decimal between 0.0 and 178.0. Overrides vertical FOV. See `horizontal_fov_override` |
| `frustum_subrect_x` | `frustum_subrect_x: 0.3` | Decimal between 0 and 1. Sets left edge of visible frustum part. Resulting content stretches to fit normalized settings. Creates asymmetrical FOV |
| `frustum_subrect_y` | `frustum_subrect_y: 0.3` | Decimal between 0 and 1. Sets bottom edge of visible frustum part. See `frustum_subrect_x` |
| `frustum_subrect_width` | `frustum_subrect_width: 0.3` | Decimal between 0 and 1. Sets visible frustum width. See `frustum_subrect_x` |
| `frustum_subrect_height` | `frustum_subrect_height: 0.3` | Decimal between 0 and 1. Sets visible frustum height. See `frustum_subrect_x` |
| `render_interior` | `render_interior: true` | Boolean true/false (1/0). Whether to render interior (dashboard). Config file: **true**/**false**. Console: **1**/**0** |
| `render_exterior` | `render_exterior: true` | Boolean true/false (1/0). Whether to render exterior (all except dashboard). Config file: **true**/**false**. Console: **1**/**0** |
