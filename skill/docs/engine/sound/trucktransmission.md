# Truck Transmission

## Sounds - The Truck Transmission and the Retarder

The transmission and retarder comprise the next group of truck sounds.

### Retarder

The "retarder" event produces retarder sound effects and must be a 3D event routed to the "truck_effects" audio bus.

Requirements:
- Must be looped
- Requires two event parameters:
  - `retarder`: range <0 - 1>, represents retarder activity level
  - `trans_rpm`: range <0 - 3000>, represents transmission RPM

### Air Gear (Noise)

Air discharge sound from the gearbox played during shifting operations. European electro-pneumatic ATM transmissions produce characteristic sounds at this moment. Must be a 3D event routed to the "truck_effects" audio bus. FMOD Studio asset randomization is supported.

This is a one-shot event.

### Gear Grind

Transmission gear grinding sound, primarily indicating incorrect RPM during fully manual shifting. Must be a 3D event routed to the "truck_effects" audio bus.

Requirements:
- Must be looped
- No parameters required

### Gear Wrong

Sound effect indicating incorrect gearbox engagement, signaling damaged gearbox even with automatic shifting. Must be a 3D event routed to the "truck_effects" audio bus.

This is a one-shot event.

## Sound Configuration

Sound configuration is stored in the "accessory_transmission_data" data structure. No mandatory or default events exist; only defined sounds play. The "sounds" array specifies events:

- retarder
- air_gear
- gear_grind
- gear_wrong

### Example

Peterbilt 579 transmission configuration files exist in "/def/vehicle/truck/peterbilt.579/transmission". Each accessory includes a "sound.sui" file with indirect event definitions:

```
sounds[]: "retarder|/sound/truck/default/retarder.soundref"
sounds[]: "air_gear|/sound/truck/default/effects_air_gear.soundref"
sounds[]: "gear_grind|/sound/truck/default/effects_gear_grind.soundref"
sounds[]: "gear_wrong|/sound/truck/default/effects_gear_wrong.soundref"
```

### Sound Position

By default, 3D sound position matches the engine position. The .soundref file can modify this positioning.
