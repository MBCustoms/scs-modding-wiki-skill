# Advanced Input Configuration

## Basics

The H-shifter support is intended for use with Logitech G27 and compatible wheels, not standard buttons. Commercial racing wheel shifters mimic manual car shifters with up to six forward gears, but trucks require additional controls to select active gear sets. A single gear from the selected set is chosen using standard H-shifter patterns. More information about transmission types is available on Wikipedia's Manual transmission page.

The game simulates twelve forward gears and one reverse gear. The default configuration uses "Range transmission" where "Shifter Toggle 1" switches between gear sets 1-6 and 7-12. This button is mapped to the leftmost red button on the G27 H-shifter by default.

### Gear Shifting Example

To shift from gear 6 to gear 7: press "Shifter Toggle 1" to switch to the 7-12 gear set, then move the H-shifter stick to position 1. To shift down from gear 7 to gear 6: press "Shifter Toggle 1" to switch back to the 1-6 gear set and move the stick to position 6.

## Prepared Layouts

The game provides three selectable layouts via the Controllers in-game option screen using the "Shifter layout" option.

### Range Transmission

This is the default configuration. "Shifter Toggle: 1" selects between gear sets 1-6 and 7-12.

### Splitter Transmission

"Shifter Toggle: 1" selects between odd-numbered gears (1,3,5,7,9,11) and even-numbered gears (2,4,6,8,10,12).

### Range-Splitter Transmission

This configuration emulates a real Scania H-shifter layout. The game does not simulate a second reverse gear or two crawling gears, so corresponding positions remain unused. "Shifter Toggle: 1" switches between gear ranges while "Shifter Toggle: 2" switches between split gears.

## Advanced Configuration

The default H-shifter layout can be customized by editing the gearbox configuration file. Gearbox configuration files for predefined layouts are located in:

```
My Documents\Euro Truck Simulator 2\profile\PROFILE_ID\gearbox\*.sii
```

Files contain entries mapping condition triplets (h shifter position, selector 1 state, selector 2 state) to concrete gears.

### Entry Structure

```
direct_gearbox_gear : _nameless.0F5B.B220 {
    gear_impulse_index: 0
    selector_1: -1
    selector_2: -1
    gear: 0
}
```

| Name | Description |
|------|-------------|
| gear_impulse_index | Defines H-shifter position: 0 = neutral, 1 = Reverse, 2 = Position 1, 3 = Position 2, etc. Take care when editing; the game does not verify hardware compatibility. |
| selector_1 | First selector state: -1 = ignore, 0 = off, 1 = on |
| selector_2 | Second selector state: -1 = ignore, 0 = off, 1 = on |
| gear | Gear to shift when conditions are met |

## Custom Hardware

Custom H-shifter hardware is supported if it reports position as continuous button presses. More complex configurations using axis values (e.g., aircraft throttle) are possible with advanced input configuration.

If hardware differentiates both toggle positions, additional inputs _gearsel1on_ / _gearsel2on_ and _gearsel1off_ / _gearsel2off_ (not accessible through UI) can be configured instead of toggling inputs.

### Advanced Input Configuration

The game UI supports up to five controllers. The game itself supports simultaneous use of more than five controllers, but manual configuration file editing is required for setups exceeding the UI limit.

Manual configuration enables features unsupported by the game UI:
- Use flight yoke throttle instead of H-shifter
- Shift buttons selecting between two functional sets for limited-button controllers
- Single button toggling various adviser pages
- Independent sensitivity for vertical and horizontal look control
- TrackIR compatible head tracker for truck movement control (accessibility)

## Configuration File

Controller configuration is stored in the profile directory:

```
My Documents\Euro Truck Simulator 2\profile\PROFILE_ID\controls.sii
```

The file is created when the controller or keyboard option screen is first opened and contains configuration lines describing various components.

## Example

This example demonstrates using accelerator and brake pedals from a secondary controller and a horn button from a third controller without using the in-game UI. The same mechanism supports more than three controllers.

1. Determine the accelerator input identification on the secondary controller. Example: `di8.'{C0002222-0000-0000-0000-000000000000}|{00000000-0000-0000-0000-000000000000}'.y`

2. Determine the brake pedal input identification on the secondary controller. Example: `di8.'{C0002222-0000-0000-0000-000000000000}|{00000000-0000-0000-0000-000000000000}'.rz`

3. Determine the button input identification on the third device. Example: `di8.'{C0003333-0000-0000-0000-000000000000}|{00000000-0000-0000-0000-000000000000}'.b4`

4. Restore default configuration on both keyboard and controller option pages (optional for this example) and configure the primary device normally through UI.

5. Connect the secondary controller's accelerator to in-game throttle: Find "input j_throttle `joy.y`" and change it to "input j_throttle `di8.'{C0002222-0000-0000-0000-000000000000}|{00000000-0000-0000-0000-000000000000}'.y`"

6. Connect the secondary controller's brake pedal to in-game brake: Find "input j_brake `joy.y`" and change it to "input j_brake `di8.'{C0002222-0000-0000-0000-000000000000}|{00000000-0000-0000-0000-000000000000}'.rz`"

7. If pedals are reported as separate axes, disable combined axis by changing "constant c_jcombined 1.000000" to "constant c_jcombined 0.000000"

8. Configure deadzone values by adjusting "constant c_throt_dz 0.000000" and "constant c_brake_dz 0.000000" based on device requirements.

9. Connect the third controller's button to in-game horn: Find "mix horn `keyboard.h?0`" and change it to "mix horn `di8.'{C0003333-0000-0000-0000-000000000000}|{00000000-0000-0000-0000-000000000000}'.b4`"

## Input Identification

The game identifies controller inputs using the format:

```
SYSTEM_ID.'DEVICE_ID'.INPUT_ID
```

On Windows, SYSTEM_ID is typically `di8` (DirectInput8). DEVICE_ID identifies the specific controller device. Two methods determine device identification:

1. Select the device as active in UI and check the "joy" device alias in the configuration file (search for "device joy")
2. Check the game.log file for lines with format: `[di8] Initializing device 'DEVICE_NAME' as 'DEVICE_ID'`

Use the format `di8.'DEVICE_ID'` in the configuration file.

INPUT_ID identifies concrete inputs on the device. Determine it using the game UI to create a binding and check the configuration file. For controllers, typical values are:

- **b1 - b128**: buttons
- **x, y, z, rx, ry, rz**: axes
- **sl1, sl2**: sliders
- **pov_(1|2|3|4)_(up|down|left|right)**: POVs

Input identification may include component specification (e.g., "di8.rel_position.x" for mouse X position delta) or use defined aliases to shorten names.

## Component Types

### Device Alias

**Example format:** `device joy 'di8.'{A76B60D0-A8FD-11E1-8002-444553540000}|{C29B046D-0000-0000-0000-504944564944}''`

**User-creatable:** Yes

Device aliases define new names ("joy") as shortcuts to specific input devices without requiring full identification strings. Aliases enable simple device switching by changing the alias target without updating the rest of the configuration. The game creates default aliases for keyboard, mouse, and joy1-6. Five joysticks are directly selectable in the UI; a sixth is supported through binding UI if manually set in the config file.

### Input Alias

**Example format:** `input j_steer 'joy.x'`

**User-creatable:** Yes

Input aliases define new names ("j_steer") as shortcuts to specific inputs (axis, button) without requiring longer names. Like device aliases, input aliases enable easy configuration changes. The game axis configuration UI changes input aliases to point to selected axes.

### Constant

**Example format:** `constant c_steer_dz 0.000000`

**User-creatable:** Yes

Constants define named numeric values ("c_steer_dz") used in calculations in other configuration parts or directly by the game itself (e.g., force feedback strength).

### Mix

**Example format:** `mix dsteerleft 'keyboard.larrow?0 | keyboard.a?0'`

**User-creatable:** No

Mix defines expressions calculating a single game input value. The game interprets this as analog input (e.g., steering wheel fraction) or logical value (e.g., wipers toggle). Individual mix configuration interpretation is hardcoded in the game; additional mixes cannot be created in the configuration file.

Simple forms return single input values. Complex forms use mathematical and logical functions combining multiple inputs. The UI input configuration supports only limited expression subsets, displaying "Complex" if it cannot handle the expression.

Two mix evaluation types exist:

- **Event-based**: Evaluates when any dependent input or mix changes. Mixes reading individual presses (e.g., gear change, any_cmd) typically use this. As of 1.3.1, these mixes receive duplicate evaluations when reacting to character-generating buttons (e.g., keyboard character keys). This usually isn't problematic but matters with loopback mode (self-referencing).

- **Frame-based**: Evaluates at frame end. Mixes reacting to hold (e.g., horn) or providing analog values (e.g., steering) typically use this.

## User-Created Components

Some component types allow creating additional components by adding configuration file lines. Component names must meet requirements:

- Unique within the configuration file
- Maximum 12 characters
- Only alphanumeric characters and underscores allowed

## Expressions

Expressions combine device inputs and apply deadzones or non-linear functions. Expression values include:

- Constant values (e.g., `2.0`)
- Named constants (e.g., `c_steer_dz`)
- Controller inputs using full form (e.g., `di8.keyboard.space`) or aliased form (e.g., `keyboard.space`). Special inputs may require component selectors (.x, .y, .z, .yaw, .pitch, .roll). Alternative syntax `keyboard.space?0` indicates if input is not found, the sub-expression returns constant 0 instead of failing.
- Other mix references (e.g., `dforward`). Circular references are not allowed, but mixes can reference themselves and return the previous value. No frequency or time guarantees exist between calls, but this enables simple counters or toggles with event-based mixes.
- Special name `unbound` resolving to constant zero, preserving information if no key is assigned to the primary binding slot.

Values combine using operators:

- **Arithmetic:** +, -, *, /
- **Logical:** &, |, !

Operator precedence is simple; brackets are highly recommended. In logical context, values >= 0.5 evaluate to true; others evaluate to false. Logical operators return 1.0 for true and 0.0 for false with short-circuit evaluation.

Since 1.35, full evaluation logical operators exist: &&, ||. Short-circuit variants are preferred for most uses, but full evaluation variants should be used with memory-based functions. Memory-based functions preserve state between evaluations as long as the mix expression (not the result) doesn't change. Changing expressions (e.g., config load) resets memory to default state.

### Functions

| Function | Version | Description |
|----------|---------|-------------|
| max(1..) | | Returns biggest parameter. |
| min(1..) | | Returns smallest parameter. |
| pow(2..) | | (p0^p1)^p2)... |
| abs(1) | | Absolute value of parameter. |
| abs_max(1..) | 1.43+ | Returns parameter value with biggest absolute value (e.g., abs_max(2, -5, -1, 4) returns -5). Multiple values with same absolute value and different signs return the lower index parameter. |
| sign(1) | | Returns -1 if negative, 1 if positive, 0 for zero. |
| gt(2) | | Returns 1.0 if first parameter > second. |
| gte(2) | | Returns 1.0 if first parameter >= second. |
| lt(2) | | Returns 1.0 if first parameter < second. |
| lte(2) | | Returns 1.0 if first parameter <= second. |
| sel(3) | | Returns second parameter if first evaluates true; returns third for false. |
| bool(1) | | Returns 1.0 if first parameter evaluates true; otherwise zero. |
| normalize(2-3) | | Returns normalized position of first parameter in range <second, third>. Clamps to range if outside. Uses 1.0 if third parameter omitted. Returns zero if second and third don't form valid non-empty range. |
| deadzone(2-3) | | Applies zero-symmetrical deadzone. Similar to normalize but applies symmetrically to negative values. Sets second parameter to zero if negative. |
| memory(2) | 1.35+ | Simple single-value memory starting at zero. If first parameter evaluates true, second parameter evaluates and stores in memory; otherwise second parameter doesn't evaluate and memory is unchanged. Returns current memory value after processing. |
| modifier(2) | 1.35+ | Implements modifier-like keys. First parameter represents "modifier" expression; second represents "button" expression. Starts returning 0.0. Detects false to true transition on "button" while "modifier" is true, then returns 1.0 until "button" reverts to false. Detects changes only during evaluation; short-circuit operators can cause missed changes. Evaluates "modifier" only during button leading edge (false => true). Avoid memory-based elements within "modifier" parameter to prevent unexpected behavior. |
| short_press(1-2) | 1.41+ | Detects short press. If first input is temporarily >= 0.5 for interval shorter than threshold, returns 1.0 until frame end. Second parameter configures threshold in milliseconds; defaults to 200ms as of 1.46. Detection only occurs during evaluation; avoid with short-circuit logical operators. |
| long_press(1-2) | 1.41+ | Detects long press. If first input is >= 0.5 for interval longer than threshold, returns 1.0 until input goes below 0.5. Second parameter configures threshold in milliseconds; defaults to 200ms as of 1.46. Detection only occurs during evaluation; avoid with short-circuit logical operators. |
