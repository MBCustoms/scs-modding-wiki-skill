# Force feedback LUT

## Overview

With game update 1.42 (ETS2 & ATS), the engine gained support for custom force feedback **L**ook **U**p **T**able, which can alter the linearity of steering wheel output force. This enables users to overcome hardware limitations and calibrate output according to their preferences.

## Usage

To implement a custom FFB LUT, create a unit file in your profile folder:

- Local profile: `<game_user_path>/profiles/<profile_hash>/ffb_lut.sii`
- Steam Cloud profile: `<game_user_path>/steam_profiles/<profile_hash>/ffb_lut.sii`

When a profile with a defined `ffb_lut.sii` loads, an exclamation mark appears beside the **Overall gain** option in controller settings. Once properly loaded, the custom FFB LUT applies universally across all steering wheels, ensuring consistent behavior when switching between devices.

## File Contents

The custom force feedback LUT is a text file containing a single unit:

```
SiiNunit
{
input_force_feedback_lut : ffb.lut {
	# This ffb LUT presents simple scaling by factor 0.5

	output_values[]: 0.0   # input value: 0.0; output value: 0.0
	output_values[]: 0.25  # input value: 0.5; output value: 0.25
	output_values[]: 0.5   # input value: 1.0; output value: 0.5
}
}
```

The `input_force_feedback_lut` unit contains an array variable named `output_values`, which defines the lookup value for each corresponding input value. Input values are calculated as: `<entry_index> / (<number_of_entries> - 1)`. Values between entries are linearly interpolated.

All output values are clamped to the range [0,1] to prevent unpredictable behavior from scaling above 1.0.
