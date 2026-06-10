# Documentation/Engine/Units/accessory sound data

## Overview

The **accessory_sound_data** unit class defines sounds for player vehicles. These units are typically found in "/def/vehicle/truck/<brand.model>/sound/<type>/*.sii" and contain pointers to sound_data, sound_engine_data, and sound_noise_data units.

A valid truck configuration requires two sound accessories: one for exterior sounds (ending in `.esound`) and one for interior sounds (ending in `.isound`).

## Attributes

| Name | Type | Default | Common | Description |
|------|------|---------|--------|-------------|
| exterior_sound | bool | false | No | Indicates whether the unit contains exterior (true) or interior (false) sounds |
| start | owner_ptr | — | No | References sound_data for engine starting |
| start_no_fuel | owner_ptr | — | No | References sound_data for start attempts without fuel |
| stop | owner_ptr | — | No | References sound_data for engine stopping |
| engine | array<owner_ptr> | — | No | References sound_engine_data units for no-load engine sounds |
| engine_load | array<owner_ptr> | — | No | References sound_engine_data units for loaded engine sounds |
| engine_nofuel | array<owner_ptr> | — | No | References sound_engine_data units for fuel-cut engine sounds |
| engine_exhaust | array<owner_ptr> | — | No | References sound_engine_data units for exhaust resonance |
| engine_brake | array<owner_ptr> | — | No | References sound_engine_data units for engine brake sounds |
| turbo | owner_ptr | — | No | References sound_data for turbocharger |
| retarder | owner_ptr | — | Yes | References sound_data for retarder |
| air_gear | array<owner_ptr> | — | No | References sound_data for randomly-played gear change sounds |
| air_brake | array<owner_ptr> | — | No | References sound_data for randomly-played air brake release |
| air_cutoff | array<owner_ptr> | — | Yes | References sound_data for air compressor unloading |
| wheel_asphalt | array<owner_ptr> | — | Yes | References sound_noise_data for asphalt driving |
| wheel_rumble | array<owner_ptr> | — | Yes | References sound_noise_data for rumble strip driving |
| wheel_gravel | array<owner_ptr> | — | Yes | References sound_noise_data for gravel driving |
| wheel_grass | array<owner_ptr> | — | Yes | References sound_noise_data for grass driving |
| aero_noise | owner_ptr | — | Yes | References sound_noise_data for aerodynamic sound |
| gear_noise | array<owner_ptr> | — | Yes | References sound_data for damaged gear sounds |
| gear_grind_loop | owner_ptr | — | Yes | References sound_data for gear meshing failure loops |
| seat_noise_threshold | float | — | Yes | Minimum acceleration (m/s²) for seat suspension noise |
| seat_noise | array<owner_ptr> | — | Yes | References sound_data for seat suspension |
| suspension_noise_threshold | float | — | Yes | Minimum acceleration (m/s²) for suspension noise |
| suspension_noise | array<owner_ptr> | — | Yes | References sound_data for suspension |
| lift_axle | owner_ptr | — | Yes | References sound_data for lift axle engagement |
| horn | owner_ptr | — | No | References sound_data for electric/city horn |
| air_horn | owner_ptr | — | No | References sound_data for air horn (overridable by hookup accessories) |
| reverse | owner_ptr | — | No | References sound_data for reverse beeper |
| air_warning | owner_ptr | — | Yes | References sound_data for low air warning |
| crash_metal | array<owner_ptr> | — | Yes | References sound_data for 60-90 km/h collisions |
| crash_hard | array<owner_ptr> | — | Yes | References sound_data for 30-59 km/h collisions |
| crash_soft | array<owner_ptr> | — | Yes | References sound_data for 6-29 km/h collisions |
| crash_scratch | array<owner_ptr> | — | Yes | References sound_data for scraping collision loops |
| blinker_on | owner_ptr | — | No | References sound_data for blinker relay closing |
| blinker_off | owner_ptr | — | No | References sound_data for blinker relay opening |
| wipers_up | owner_ptr | — | No | References sound_data for wiper extension |
| wipers_down | owner_ptr | — | No | References sound_data for wiper retraction |
| lights_stick | owner_ptr | — | Yes | References sound_data for headlight control movement |
| high_beam_stick | owner_ptr | — | Yes | References sound_data for high beam activation |
| light_horn_stick | owner_ptr | — | Yes | References sound_data for horn activation |
| blinker_stick | owner_ptr | — | Yes | References sound_data for blinker activation |
| blinker_stick_off | owner_ptr | — | Yes | References sound_data for blinker deactivation |
| hazard_warning_stick | owner_ptr | — | Yes | References sound_data for hazard light activation |
| wipers_stick | owner_ptr | — | Yes | References sound_data for wiper control activation |
| retarder_stick | owner_ptr | — | Yes | References sound_data for retarder control activation |
| park_brake_stick | owner_ptr | — | Yes | References sound_data for parking brake engagement |
| park_brake_stick_off | owner_ptr | — | Yes | References sound_data for parking brake disengagement |

## Related Units

- sound_data
- sound_engine_data
- sound_noise_data
