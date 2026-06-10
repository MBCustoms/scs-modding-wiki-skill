# Truck Cabin Filtering

## The truck cabin filtering

Per-truck sound filtering capabilities exist for the truck cabin, introduced in version 1.43. Hard-coded equalizer automation settings in the master bank were removed starting with version 1.43.

## Sound processing

Key features for cabin sound processing include:

**Listener position (inside / outside)**

The global parameter `cabin_out` controls this state: 0 means inside, 1 means outside.

**Window opening status (closed / open)**

Global parameters `wnd_left` and `wnd_right` control this: 0 means closed, 1 means opened.

**Sound processing**

1. Sound is processed as external relative to listener position, with results routed to the `[Grp outside]` audio bus.
2. This channel is divided into three audio buses:
   - `[Rtn window_out]` - Central sound overhang in the cab
   - `[Rtn window_left]` - Sound passing through the left window
   - `[Rtn window_right]` - Sound passing through the right window
3. All three buses are mixed into the resulting sound.

## Adjust the volume

Volume settings are hard-coded to the FMOD master bank and vary based on listener position:

| Audio bus | Listener inside | Listener outside |
|-----------|-----------------|------------------|
| `[Rtn window_out]` | -6 dB | +4 dB |
| `[Rtn window_left]` | -7 dB | muted |
| `[Rtn window_right]` | -7 dB | muted |

## Sound attenuation when the window is open/closed

A 3-EQ equalizer on each window sound bus handles attenuation. Settings are per-truck (version 1.43+) within interior sound settings:

| Window | Audio bus | Opened | Closed |
|--------|-----------|--------|--------|
| Left | `[Rtn window_left]` | `.effect.add.window_eq.opened` | `.effect.add.window_eq.closed` |
| Right | `[Rtn window_right]` | `.effect.add.window_eq.opened` | `.effect.add.window_eq.closed` |

The application uses linear interpolation between equalizer parameters. Exercise caution with large differences between `low_crossover` and `high_crossover` boundaries on the same equalizer, as this can generate unwanted sound patterns.

## Sound attenuation depending on the position of the listener

A 3-EQ equalizer on the `[Rtn window_out]` audio bus controls attenuation. Settings are per-truck (version 1.43+) within interior sound settings:

| Listener | Audio bus | Inside | Outside |
|----------|-----------|--------|---------|
| Listener | `[Rtn window_out]` | `.effect.equalizer.cabin.inside` | `.effect.equalizer.cabin.outside` |

The application uses linear interpolation between parameters. Avoid setting large differences between `low_crossover` and `high_crossover` boundaries, as this creates unwanted sound artifacts.

## Reverb in the cabin

Cabin reverb depends on listener position and window state. Processing occurs on the final mix of all three audio buses via the Reverb effect on the `[Grp cabin]` audio bus. Settings are per-truck (version 1.43+) within interior sound settings:

| Reverb | Audio bus | Inside | Outside |
|--------|-----------|--------|---------|
| reverb effect | `[Grp cabin]` | `.effect.reverb.window.closed` | `.effect.reverb.window.opened` |

Linear interpolation transitions between reverb parameters. External reverb should approximate the open environment; use settings that avoid excessive echo changes.
