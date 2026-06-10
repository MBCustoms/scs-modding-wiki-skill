# Documentation/Engine/Units/sound noise data

## Overview

The **sound_noise_data** unit class defines speed-dependent sounds. This unit typically appears in arrays, with overlapping `min_speed` and `max_speed` ranges to allow crossfading between members.

## Uses

- [accessory_sound_data](/wiki/Documentation/Engine/Units/accessory_sound_data) (wheel_*, aero_noise, gear_noise)

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| name | string | — | Path to the sound clip (e.g. `name: "/sound/truck/noises/wind_inside_int_1.ogg"`) |
| looped | bool | false | When true, the sound clip loops while active. When false, it plays once when triggered. Should always be true for noise sounds. |
| is_2d | bool | false | — |
| volume | float | 1.0 | Playback volume relative to recorded level (0.0 is full attenuation, 1.0 is straight through, 2.0 is twice as loud) |
| pitch_reference | float | 0.0 | The reference vehicle speed of the recording. |
| min_rpm | float | 0.0 | The lowest vehicle speed the clip will be played at. |
| max_rpm | float | 0.0 | The highest vehicle speed the clip will be played at. |
