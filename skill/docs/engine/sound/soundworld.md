# Sound World Documentation

There are several types of sounds and sound effects in the sound system of the world:

- 3d sound (in the world)
- ambient sound
- reverb effect
- 3d sound on the object (prefab)
- animation (mover)

## Sound layer in the Editor

A special layer for sounds on the map is available up to version 1.40. The sound layer editor activates through the command line:

```
eurotrucks.exe -nosingle -edit -sound
```

Only one object type can be placed: "sound item," which operates in three modes:

- **3d sound** - Displays a circular area whose size is determined by the audibility limit.
- **Ambient area** - Represents a user-defined area sourcing specified ambient sound.
- **Reverb area** - Represents a user-defined area sourcing reverb effect.

## Sound configuration for the sound layer

Three configuration files exist in the `/base/def/world` folder:

### sound_item_data.sii

Contains 3d sound definitions:

```
sound_item_data : sound.<id token of the sound item>
{
	name: "user friendly name (editor only) in format 'sound group name/sound name' "
	sound_path: "path to the sound event"
	max_dist: maximum sound distance (should be equal to or greater than the maximum audibility of the FMOD event)
	item_color: editor item color in RGBA format (0xAABBGGRR)
}
```

The sound triggers when the actor camera is within range. Audibility depends on the 3D event settings in FMOD.

### sound_item_ambient.sii

Contains ambient area definitions:

```
sound_item_data : ambient.<id token of the ambient sound>
{
	name: "user friendly name (editor only) in format 'sound group name/sound name' "
	sound_path: "path to the sound event"
	max_dist: maximum ambient sound distance
	item_color: editor item color in RGBA format (0xAABBGGRR)
	reverb: reverb.<id token of the reverb effect - Default reverb effect for the area.>
}
```

The sound triggers when the actor camera approaches the area. The map area represents the full audibility zone, with automatic fade in/out beyond edges based on max distance. The default reverb applies only when no other reverb exists in the area.

### sound_item_reverb.sii

Contains reverb area definitions:

```
sound_item_reverb : reverb.<id token of the reverb effect>
{
	name: "user friendly name (editor only)"
	max_dist: maximum effect distance
	item_color: editor item color in RGBA format (0xAABBGGRR)
	ceiling: true/false If true the effect is activate only if camera is under the 'sound item' object (eg under a bridge, tunnel).
	decay_time: Decay Time: Reverberation decay time at low-frequencies in milliseconds.  Ranges from 100.0 to 20000.0. Default is 1500.
	early_delay: Early Delay: Delay time of first reflection in milliseconds.  Ranges from 0.0 to 300.0.  Default is 20.
	late_delay: Reverb Delay: Late reverberation delay time relative to first reflection in milliseconds.  Ranges from 0.0 to 100.0.  Default is 40.
	hf_reference: HF Reference: Reference frequency for high-frequency decay in Hz.  Ranges from 20.0 to 20000.0. Default is 5000.
	hf_decay_ratio: Decay HF Ratio: High-frequency decay time relative to decay time in percent.  Ranges from 10.0 to 100.0. Default is 50.
	diffusion: Diffusion: Reverberation diffusion (echo density) in percent.  Ranges from 0.0 to 100.0.  Default is 100.
	density: Density: Reverberation density (modal density) in percent.  Ranges from 0.0 to 100.0.  Default is 100.
	low_shelf_frequency: Low Shelf Frequency: Transition frequency of low-shelf filter in Hz.  Ranges from 20.0 to 1000.0. Default is 250.
	low_shelf_gain: Low Shelf Gain: Gain of low-shelf filter in dB.  Ranges from -36.0 to 12.0.  Default is 0.
	high_cut: High Cut: Cutoff frequency of low-pass filter in Hz.  Ranges from 20.0 to 20000.0. Default is 20000.
	early_late_mix: Early/Late Mix: Blend ratio of late reverb to early reflections in percent.  Ranges from 0.0 to 100.0.  Default is 50.
	wet_level: Wet Level: Reverb signal level in dB.  Ranges from -80.0 to 20.0.  Default is -6.
	dry_level: Dry Level: Dry signal level in dB.  Ranges from -80.0 to 20.0.  Default is 0.
}
```

The effect activates when the actor's camera enters the defined area, independent of max distance. Reverb parameters adjust gradually over time.

**Remark:** Do not modify base files to add entries. Create a new file `<base_name>.<idofyourmod>.sii` in the same directory, where `<base_name>` is the base filename without extension (e.g., "city" for "/def/city.sii").

## Sound events

### 3d sounds

- Represents a 3d sound from a specific statically located source on the map.
- Events are typically infinite audio loops within a standard FMOD 3d event.
- Audio hearing is controlled by FMOD spatializer, corresponding to the max distance setting.
- Global parameters can modify loop sounds.
- Mono (preferred) or stereo samples work best.

*Note: Example uses a restaurant sound controlled by daytime parameter, demonstrating sound variants at different times.*

### Ambient sounds

- Event used for ambient areas in the world.
- Events are typically infinite audio loops within a standard FMOD 2d event (not including 3d spatializer).
- Audio hearing is controlled by the game, with full audibility volume set in FMOD.
- Global parameters can modify loop sounds.
- **Preferred format is 5.1.**
- Random events can be included in the loop.
- Route the event to the 'outside/unprocessed/ambient' bus.

*Note: Example (forest_warm_con_2) simulates day/night forest sound including random events.*

## Other sounds in the world

Other game world sounds are standard 3d FMOD events created like 3d sound events:

- Sounds assigned to specific game objects/prefabs (defined in base\unit\hookup\sound_prefab.sii)
- Sounds assigned to animation/mover (defined in base\def\world\mover.sii)
