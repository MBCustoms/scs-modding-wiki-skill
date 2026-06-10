# Documentation/Engine/Sound/TruckEngine

## Sounds - Truck Engine

The truck engine sound represents a specialized audio category requiring careful balance between sound sources. Engine sounds follow specific implementation rules:

- Each truck engine sound must occupy a separate sound bank
- Only four events should be implemented, all within the same bank
- Combining events from different banks for engine sounds is not recommended

## Engine Sound Events

All events must be located in the "engine" folder within the events browser. The required events are:

- **engine/engine**
- **engine/exhaust**
- **engine/turbo** (from version 1.39)
- **engine/start_bad**

### Event "engine"

This event plays the engine sound. Technical specifications include:

- Must be a 3D event
- Route to "truck_engine" audio bus
- Must be looped with lifecycle controlled by "play" parameter

Required event parameters:

- **engine/play**: Controls the event lifecycle (1 = playing, 0 = stopped)
- **engine/brake**: Range <0-1>, represents motor brake action
- **engine/load**: Range <0-1>, represents motor load (values < 0.05 indicate idle)
- **engine/rpm**: Range <0-3000>, represents engine revolutions per second

### Event "exhaust"

This event produces the exhaust sound. Technical specifications:

- Must be a 3D event
- Route to "truck_exhaust" audio bus
- Must be looped with lifecycle controlled by "play" parameter

Required event parameters:

- **exhaust/load**: Same purpose as engine/load
- **exhaust/play**: Same purpose as engine/play
- **exhaust/rpm**: Same purpose as engine/rpm

### Event "turbo"

This event plays the turbo sound. Technical specifications:

- Must be a 3D event
- Route to "truck_turbo" audio bus
- Must be looped with lifecycle controlled by "play" parameter

Required event parameters:

- **engine/turbo**: Range <0-1>, represents turbo system action

### Event "start_bad"

This event produces unsuccessful engine starting sounds. Technical specifications:

- Must be a 3D event
- Route to "truck_engine" audio bus
- One-shot sound (no loop)
- No additional parameters required
- Supports FMOD Studio asset randomization

## Engine Sound Configuration

Sound configuration for engine sounds is stored in "accessory_engine_data". An array called "sounds" contains specifications for mandatory engine events, allowing different engine types to have assigned sound banks.

Example from Peterbilt 579 configuration at folder "\def\vehicle\truck\peterbilt.579\engine":

```
sounds: 4
sounds[]: "engine|/def/vehicle/truck/peterbilt.579/engine/sound_engine.soundref"
sounds[]: "exhaust|/def/vehicle/truck/peterbilt.579/engine/sound_exhaust.soundref"
sounds[]: "start_bad|/def/vehicle/truck/peterbilt.579/engine/sound_start_bad.soundref"
sounds[]: "turbo|/def/vehicle/truck/peterbilt.579/engine/sound_turbo.soundref"
```

Each .soundref file specifies the bank and FMOD event for the sound.

Example sound_engine.soundref content:

```
source="/sound/truck/peterbilt_579.bank#engine/engine"
```

The sound bank assignment in engine configuration files:

```
sound: "/sound/truck/peterbilt_579.bank"
```

## Engine Sound Position

The default 3D position for engine sound is 1 meter above the first axle of the truck. This position can be modified through the .soundref file.

## Engine Sound Example

Template projects and sound examples are available in the Downloads section.
