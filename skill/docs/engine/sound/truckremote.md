# Documentation/Engine/Sound/TruckRemote

## Sounds - Remote Truck

The sound of a remote truck is in principle very similar to the sound of a player's truck engine. (Please see the Sounds - Truck Engine for a better understanding.)

However, there are a few key differences to keep in mind:

- The engine sound is integrated into one event (usually remote / engine), including exhaust and turbo sounds.
- Due to performance considerations, the sound for the remote truck needs to be significantly simplified.

## Event "(remote/)engine"

Event "engine" plays sound of the engine of remote truck. It has to be a 3D event. The event should be routed to the "traffic" audio bus.

The event must be looped and its living cycle is controlled by "play" parameter (see below).

These event parameters must exist:

- **play**: The parameter "play" controls the living cycle of the event:
  - value play = 1 means - sound is playing
  - value play = 0 means - sound should be stopped
- **brake**: the value is in the range <0 - 1> and represents the action of the motor brake
- **load**: the value is in the range <0 - 1>. Value represents the motor load. Value < 0.05 means idle engine sound
- **rpm**: the value is in the range <0 - 3000>. The value represents the number of engine revs per second
- **turbo**: the value is in the range <0 - 1> and represents the action of the turbo system

## Remote Engine Sound Configuration

The sound configuration of the engine sounds is stored in the "accessory_engine_data" data. There is array "sounds" which contains the specification for the mandatory events of the engine. That means that each type of engine can be assigned its own sound bank. The item "remote" has been added for the remote engine sound (since version 1.42).

Example: There are configuration files of engines for the "Peterbilt 579" at the folder "\def\vehicle\truck\peterbilt.579\engine". Each engine includes `_@include "sound.sui"_` file which contains the definition of the events:

```
sounds: 5
sounds[]: "engine|/def/vehicle/truck/peterbilt.579/engine/sound_engine.soundref"
...
sounds[]: "remote|/def/vehicle/truck/peterbilt.579/engine/sound_engine_rm.soundref"
```

There are .soundref file (for each event) to specify the bank and the FMOD event of the sound.

Content of the sound_engine_rm.soundref is:

```
source="/sound/truck/peterbilt_579_rm.bank#remote/engine"
```

## Engine Sound Example

Visit the Downloads section to get template project or sound examples.
