# Documentation/Engine/Sound

## FMOD®

The FMOD® system has been integrated as the core sound engine since version 1.37. The appropriate FMOD® Studio version depends on your game version and can be found in the downloads section.

For comprehensive understanding, consult the official FMOD documentation at www.fmod.com.

## Sound and Sound Bank(s)

Each sound is represented as a sound **Event** within FMOD Studio—an instanceable sound unit. All sounds and events come from sound banks, which are compiled by FMOD Studio into "[bank name].bank" files containing collections of Events and Parameters for in-game audio playback.

## Master Bank

The Master Bank serves as the primary sound bank and contains no Events itself.

**The Master Bank defines:**

- **Sound buses**: Events route their output through the project mixer to buses registered in the Master Bank. Users can adjust volume and mute states per bus in application settings.
- **Mixer and Routing**: The project mixer consists of interconnected buses that describe audio flow through the sound system.
- **Global Parameters**: Parameters defined here are global and can automate and modulate events across all banks.

**Critical note**: Never modify the Master Bank unless absolutely certain and rewriting all game sounds.

## Sound definition

Common in-game sounds are **Events** in the FMOD Studio project. Each object (bank, bus, event, parameter) has a Globally Unique Identifier—**GUID** (format: {1315eda7-1829-4dd8-9d1a-176f65637ab2}).

The system uses GUIDs internally for processing. Deleting and recreating an object with the same name creates a different object due to different GUIDs.

**Exporting GUIDs:**

1. Use FMOD Studio: File / Export GUIDs...
2. A GUIDS.txt file appears in the project's "build" subfolder
3. Rename to "[bank filename].guids" and place it alongside the corresponding bank file

**Sound usage definitions:**

1. **Direct 'sound id'**: String format "[bank filename]#[event name]"
   - Example: "/sound/ui/ui.bank#click"

2. **Sound reference file**: Links to sound specifications via simple file paths
   - Example: "/sound/ui/ui_click.soundref"

## Sound reference file

Sound reference files are preferred and recommended for configuration flexibility and easier individual sound modification.

**Structure**: Text file with UTF-8 encoding containing:
- Sound ID: `source="[bank filename]#[event name]"`
- Optional 3D positioning: `position_offset=-left/+right;-down/+up;-front/+back` (meters)

**Example** (ui_click.soundref):
```
source="/sound/ui/ui.bank#click"
```

## Sound documentation

- Audio buses, routing and mixer
- Global parameters (WIP)
- Sounds - Truck Engine
- Sounds - Truck Transmission and Retarder
- Sounds - Truck Chassis
- Sounds - Truck Cabin (horns and noises)
- Sounds - Truck Cabin Filtering (in/out, windows)
- Sounds - Remote Truck (multiplayer)
- Sounds - Truck Interior (WIP)
- Sounds - Tires
- Sounds - Collisions (WIP)
- Sounds - Traffic (WIP)
- Sounds - World
- Sounds - Game UI and Music (WIP)
- Modding sounds
- Downloads (templates, samples)

**Note**: "The sound system and current pages are in a 'work in progress' state" with continuous updates planned.
