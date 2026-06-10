# Documentation/Engine/Sound/Tires

## Sounds - Tires

This section covers tire sound effects across different road surfaces.

## Tire Sound Events

"Tire sounds are kept separate for the truck tires and trailer tires, but both have the same events and parameters." Four road substance types are currently supported:

- asphalt
- rumble
- gravel
- grass

## Tire Sound Parameters

The system uses these controllable parameters:

- **speed** (km/h): "The parameter 'speed' controls the pitch and volume of the substance sound."
- **skid_speed** (m/s): "represents the speed of wheel slip in either direction"
- **note**: "present only for the 'rumble' substance" and functions as a frequency multiplier for the root note G to create melodic effects

## Engine Sound Configuration

Truck tire sounds reference these soundref files:

```
sound/tires/rumble.soundref
sound/tires/grass.soundref
sound/tires/gravel.soundref
sound/tires/asphalt.soundref
```

Trailer tire sounds reference:

```
sound/trailer/tires/rumble.soundref
sound/trailer/tires/grass.soundref
sound/trailer/tires/gravel.soundref
sound/trailer/tires/asphalt.soundref
```

Example soundref content for rumble:

```
source="/sound/tires/tires.bank#rumble"
```

Sound banks are located at "/sound/tires/tires.bank" for trucks and "/sound/trailer/tires/tires.bank" for trailers.
