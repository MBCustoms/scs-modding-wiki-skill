# Truck Interior Animations and IDs

## Interior Animations

The movement of various things in the truck interior is controlled by program-driven animations (`*_anim`). For each animation, the range is set by the `*_anim_min` and `*_anim_max` values. As most animations expect a range from 0 to 1, these are also the default values. If an animation expects any other value range, it will be stated below.

### Special Animations

| Attribute Name | Function | Behavior | Notes |
|---|---|---|---|
| wheel_anim | Steering wheel | 0 - left full lock, 0.5 - center, 1 - right full lock | _(Obsolete in 1.42)_ For best results, each keyframe should be less than 45°. The steering wheel bone should be named `steering_w` for compatibility with interchangeable steering wheels. |
| wheel_updown_anim | Steering column tilt adjustment | 0 - lowest setting, 1 - highest setting | The default position is set by `wheel_updown_anim_default` |
| wheel_frontback_anim | Steering column telescope adjustment | 0 - fully retracted, 1 - fully extended | The default position is set by `wheel_frontback_anim_default` |
| wiper_anim | Windshield wipers | 0→1 is a full wipe cycle (from park to full travel and back to park) | The keyframes at 0 and 1 should match. |
| gadget_anim | Gadget animation | 0→1 is a full animation cycle (animation will be played as a continuous loop) | This animation is played in a loop while the truck's ignition/electricity is on. |
| left_window_anim | Left window up/down animation | 0 - closed, 1 - open | Controlled with window up/down controls. |
| right_window_anim | Right window up/down animation | 0 - closed, 1 - open | Controlled with window up/down controls. |

### Stick Animations

| Attribute Name | Function | Behavior | Notes |
|---|---|---|---|
| blinker_anim | Turn signal control lever | 0 - left indicator active, 0.5 - rest position, 1 - right indicator active | |
| lights_anim | Headlight control | 0 - lights off, 0.5 - parking/clearance lights on, 1 - headlights on | |
| high_beam_anim | High beam headlight control | 0 - rest position, 1 - high beams on | |
| light_horn_stick_anim | Light/city horn button | 0 - rest position, 1 - light horn being applied | |
| wiper_stick_anim | Windshield wiper control | 0 - off, 1 - maximum speed | This animation is interpolated based on the total number of wiper speeds. For example, if there are two additional wiper speeds (delays), 0.33 would correspond with the first and 0.67 with the second delay definition. |
| parking_stick_anim | Parking brake control | 0 - parking brake released, 1 - parking brake applied | **North America:** Whether 'in' or 'out' is the applied state will depend on the truck – make sure that the animation matches the label on the valve or you will look like a goof. The typical usage is for 'push to release' systems where the 0.0 state is 'in' and the 1.0 state is 'out'. **Europe:** |
| parking_stick_electric_anim | Parking brake control | 0 - parking brake releasing, 0.5 - parking brake mid/neutral/return position, 1 - parking brake application | Electronic version of parking brake. It is clicked to some position and then returns automatically to default position (games handles return procedurally). |
| flasher_4way_anim | Four-way flasher (hazard light) control | 0 - rest position, 1 - hazard lights are active | For a button, the "depressed" state would be 0.5 to make the button press and rebound for both activation and deactivation |
| engine_start_anim | Ignition and starting controls | 0 - off, 0.33 - electricity on, 0.67 - engine on, 1 - engine starting | |
| beacon_anim | Beacon on/off switch | 0 - beacon off, 1 - beacon on | |
| trailer_air_stick_anim | Trailer air supply valve | 0 - trailer disconnected, 1 - trailer connected | This is directly tied to whether a trailer is connected to the truck or not. Typical usage is for a 'push to supply' type, so the valve is 'out' in the 0.0 state and 'in' in the 1.0 state |
| trailer_air_stick_electric_anim | Trailer air supply valve | 0 - trailer disconnecting, 0.5 - trailer air mid/neutral/return position, 1 - trailer connecting | Electronic version of trailer air supply. It is clicked to some position and then returns automatically to default position (games handles return procedurally). |
| trailer_brake_stick_anim | Trailer brake hand valve (sometimes called the 'spike') | 0 - rest position, 1 - trailer brake hand valve fully applied | Do not confuse this with the trailer supply valve - the hand valve is used (rarely) to apply only the trailer brakes in a controlled manner |
| retarder_stick_anim | Retarder control | 0 - off, 1 - maximum setting | |
| engine_brake_stick_anim | Engine brake control | 0 - off, 1 - maximum setting | _Added in 1.38_ |
| auto_transmission_stick_anim | Automatic transmission gear selector | 0 - reverse, 0.5 - neutral, 1 - drive | |
| lift_axle_stick_anim | Lift axle switch/control | | |
| differential_lock_stick_anim | Differential lock switch/control | 0 - disengaged, 1 - engaged | _Added in ETS2 1.27/ATS 1.6_ |
| left_window_stick_anim | Left window switch/control | 0 - closing, 0.5 - rest position, 1 - opening | |
| right_window_stick_anim | Right window switch/control | 0 - closing, 0.5 - rest position, 1 - opening | |

### Gauge Animations

This set of animations handles analog gauges. The related `*_min` and `*_max` attributes set the values that the start and end of the animation correspond to. Where the simulated value exceeds the min/max attribute, the animation is clamped.

**Note:** All `*_psi_*` attributes have been renamed to `*_pressure_*` as of ETS2 1.27/ATS 1.6. This is to reflect the change to _bar_ (atmospheres) as the working pressure unit instead of _psi_.

| Attribute Name | Function | Behavior | Notes |
|---|---|---|---|
| oil_pressure_anim | Engine oil pressure (bar) | 0 - oil_pressure_anim_min, 1 - oil_pressure_anim_max | 3-6 bars (43.5-87 psi) is typical working value |
| water_temp_anim | Engine water/coolant temperature (°C) | 0 - water_temp_anim_min, 1 - water_temp_anim_max | working value 90°C |
| battery_anim | Battery potential (V) | 0 - battery_anim_min, 1 - battery_anim_max | Nominally 24V. For 12V systems, set the min/max attributes to twice the value the gauge displays and it should appear as if it is indeed a 12V system. |
| oil_temp_anim | Engine oil temperature (°C) | 0 - oil_temp_anim_min, 1 - oil_temp_anim_max | working value 90°C |
| exhaust_temp_anim | Exhaust gas temperature (°C) | 0 - exhaust_temp_anim_min, 1 - exhaust_temp_anim_max | working range cca to 650°C |
| diff_temp_anim | Differential temperature (°C) | 0 - diff_temp_anim_min, 1 - diff_temp_anim_max | working value 90°C |
| tachometer_anim | Tachometer in rpm (revolution per minute) | 0 - tachometer_anim_min, 1 - tachometer_anim_max | |
| speedometer_anim | Speedometer (km/h) | 0 - speedometer_anim_min, 1 - speedometer_anim_max | 1mph = 1.60934km/h |
| air_pressure_anim | Air brake reservoir pressure (bar) | 0 - air_pressure_anim_min, 1 - air_pressure_anim_max | |
| brake_pressure_anim | Air brake application (bar) | 0 - brake_pressure_anim_min, 1 - brake_pressure_anim_max | |
| general_air_press_anim | General air supply (bar) | 0 - general_air_press_anim_min, 1 - general_air_press_anim_max | |
| trailer_air_press_anim | Trailer air supply (bar) | 0 - trailer_air_press_anim_min, 1 - trailer_air_press_anim_max | |
| suspension_load_anim | Suspension load (newtons) | 0 - suspension_load_anim_min, 1 - suspension_load_anim_max | expects range in newtons (22t trailer creates like 70kN on kingpin) |
| fuel_anim | Fuel gauge (relative to full) | 0 - fuel_anim_min, 1 - fuel_anim_max | By default, 0 corresponds to empty state and 1 corresponds to full |
| ad_blue_anim | Ad Blue/DEF gauge (relative to full) | 0 - fuel_anim_min, 1 - fuel_anim_max | By default, 0 corresponds to empty state and 1 corresponds to full |
| turbo_anim | Manifold pressure | | |
| consumption_anim | Instantaneous fuel consumption in l/100km | 0 - consumption_anim_min, 1 - consumption_anim_max | scania gauge has 0 to 120 |
| clock_big_anim | Analog clock, minute hand (0-60) | 0 - clock_big_anim_min (default 0), 1 - clock_big_anim_max (default 60) | |
| clock_small_anim | Analog clock, hour hand (0-12) | 0 - clock_small_anim_min (default 0), 1 - clock_small_anim_max (default 24) | |
| generic_anim | Animation for other gauges. | 0 when truck is turned off, 1 when truck is turned on | |

### Indicator Animations

These animations are not interpolated from 0 to 1. Instead they have only 2 states: switched off (0) and switched on (1), so these animations should have only 2 key frames. All indicator animations are triggered during the start-up electrical check, as well as for their particular functions.

| Attribute Name | Function | Behavior | Notes |
|---|---|---|---|
| button_left_blinker | Left turn signal indicator | Flashes on and off with left/right turn signal | The related attribute `blinker_delay` is describing length of the half blinking loop (in seconds) |
| button_right_blinker | Right turn signal indicator | | |
| button_water_temp | Water temperature warning light | On when engine temperature is excessive | |
| indicator_oil_temp | Engine oil temperature warning light | On when engine oil temperature is excessive | |
| indicator_position_lights | Position light indicator | On when positional/marker/parking lights are on | |
| button_lights | Headlight indicator | On when headlights are on | |
| button_high_beam_lights | Highbeam indicator | On when highbeam headlights are on | |
| indicator_aux_lights_front | Front auxiliary lights indicator | On when _front_ auxiliary lights are on | |
| indicator_aux_lights_roof | Roof auxiliary lights indicator | On when _roof_ auxiliary lights are on | |
| indicator_aux_lights_any | Auxiliary lights indicator | On when any auxiliary lights are on | |
| indicator_low_air_pressure | Low air pressure warning light | On when air pressure drops below cca 5 bars | |
| indicator_low_oil_pressure | Low oil pressure warning light | On when engine oil pressure is low | This will also illuminate when the electrical is on and the engine is off |
| button_battery_warning | Low battery voltage warning light | On when battery voltage is low | |
| button_low_fuel | Low fuel warning light | On when fuel level is low | |
| indicator_low_adblue | Low AdBlue/DEF warning light | On when AdBlue/DEF level is low | |
| button_jakebrake | Engine brake indicator light | On when engine brake (jake brake) is armed or active | |
| button_parking_brake | Parking brake indicator light | On when parking brake is applied | |
| button_4way | Four-way flasher status light | On when four-way flasher is on | Indicator should be placed on hazard warning button for blinking |
| indicator_retarder | Retarder status light | On when the retarder is active | |
| indicator_warning | Damage warning indicator | On when damage is 15% or more | |
| indicator_stop | Critical damage indicator | On when damage is 50% or more | |
| indicator_axle_lift | Lift axle indicator | On when lift axle is up | |
| indicator_cruise_control | Cruise control status light | On when cruise control is engaged | |
| indicator_generic | Animation for other indicators | 0 most of the time, 1 when truck is making electricity check (after turned on). | |
| indicator_differential_lock | Differential lock status light | On when differential lock is engaged | _Added in ETS2 1.27/ATS 1.6_ |
| indicator_trailer_axle_lift | Trailer lift axle status light | On when trailer axle(s) are raised. | _Added in ETS2 1.27/ATS 1.6_ |
| indicator_weigh_green | (ATS) Weigh pass transponder green (bypass) light | On when the player may bypass an upcoming weigh station | _Added in ETS2 1.27/ATS 1.6_ |
| indicator_weigh_red | (ATS) Weigh pass transponder red (no bypass) light | On when the player must enter an upcoming weigh station | _Added in ETS2 1.27/ATS 1.6_ |
| indicator_blind_spot_left | Left blind spot indicator | On when some vehicle is near left blind spot of player vehicle | _Added in ETS2 1.47/ATS 1.45_ |
| indicator_blind_spot_right | Right blind spot indicator | On when some vehicle is near right blind spot of player vehicle | _Added in ETS2 1.47/ATS 1.45_ |

## Dashboards IDs

Screen of dashboard computers uses the UI library and shows UI elements. Each element has unique ID and can be used only once (due to caching). Most of fields can be used as two parameter template - value and unit, both are used accordingly to current game options. As in different languages can be units and other texts translated ensure that there are enough space for all of them.

### Screen IDs (`ui::group` type)

- 100 to 800 - basic screens, up to 8 screens
- 900 - warning screen, used when truck is damage and should be repaired, shown alone (without shared screen)
- 950 - shared screen (used together with all basic screens)

### Element IDs (mostly `ui::text_common` type)

- 1000 - ambient temperature
- 1010 - oil temperature
- 1020 - current speed
- 1030 - odometer, needs space for at least six digits
- 1040 - current gear, uses N, A[number], R or R[number] for automatic and N, [number], R or R[number] for manual or sequential
- 1050 - current clock time in proper format, eg. "12:34" (am/pm is omitted)
- 1060 - remaining fuel in tank
- 1070 - ui_text_bar for fuel bar, the text is cut according to current fuel tank state
- 1075 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of fuel bar (typical data "H~~0~~1", horizontal range 0 to 1)
- 1080 - guessed operating range of vehicle
- 1090 - water temperature
- 1100 - cruise control speed value
- 1110 - ui_text_bar for oil pressure bar, the text is cut according to current oil pressure
- 1115 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of oil pressure bar (typical data "H~~0~~8", horizontal range 0bar to 8bar (116psi))
- 1120 - ui_text_bar for air pressure bar, the text is cut according to current air pressure
- 1125 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of air pressure bar (typical data "H~~0~~12", horizontal range 0bar to 12bar (174psi))
- 1130 - ui_text_bar for turbo pressure bar, the text is cut according to current oil pressure
- 1135 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of turbo pressure bar (typical data "H~~0~~1", horizontal range 0 to 1)
- 1140 - ui_text_bar for adblue bar, the text is cut according to current adblue tank state
- 1145 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of adblue bar (typical data "H~~0~~1", horizontal range 0 to 1)
- 1150 - ui_text_bar for water temperature bar, the text is cut according to current water temperature
- 1155 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of water temperature bar (typical data "H~~0~~130", horizontal range 0°C to 130°C (32°F to 266°F))
- 1160 - instant consumption
- 1170 - average (trip) consumption
- 1180 - ui_text_bar for brake pedal pressure bar, the text is cut according to current pressure
- 1185 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of brake pedal pressure bar (typical data "H~~0~~1", horizontal range 0 to 1)
- 1190 - damage warning icon, can be ui::group or ui::text or any other element that could show/hide
- 1200 - low fuel warning icon, can be ui::group or ui::text or any other element that could show/hide
- 1210 - trip distance
- 1220 - compass, displays strings like "N", "E", "SW".
- 1230 - engine brake icon
- 1240 - cruise control icon, can be ui::group or ui::text or any other element that could show/hide. Cruise control speed (id 1100) explicitly CAN be child of this group.
- 1250 - cruise control memory icon, can be ui::group or ui::text or any other element that could show/hide.
- 1260 - low air pressure warning icon
- 1270 - parking brake indicator icon
- 1280 - engine running time
- 1290 - retarder icon
- 1300 - transmission gear (raw, without mode info)
- 1310 - transmission mode (without gear info, A/M)
- 1320 - battery voltage
- 1330 - battery voltage gauge, expected to be ui_gauge element type
- 1340 - oil temperature gauge, expected to be ui_gauge element type
- 1350 - ui_text_bar for instant fuel economy bar, the text is cut according to current value
- 1355 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of instant fuel economy bar (typical data "H~~0~~5", horizontal range 0 to 5 km/l (11.8mpg))
- 1360 - ui_text_bar for average fuel economy bar, the text is cut according to current value
- 1365 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of average fuel economy bar (typical data "H~~0~~5", horizontal range 0 to 5 km/l (11.8mpg))
- 1370 - air pressure value (psi only)
- 1380 - transmission mode, detailed (D/N/R/M)
- 1390 - trip time
- 1400 - trip average speed (trip distance / trip time)
- 1410 - smart cruise control tolerance if CC is engaged, otherwise hides the element
- 1420 - damage stop icon, can be ui::group or ui::text or any other element that could show/hide
- 1430 - speed gauge, expected to be ui_gauge element type
- 1440 - revolutions per minute (rpm) gauge, expected to be ui_gauge element type
- 1450 - cruise control speed gauge, expected to be ui_gauge element type
- 1460 - water temperature gauge, expected to be ui_gauge element type
- 1470 - parking lights icon, can be ui::group or ui::text or any other element that could show/hide
- 1480 - low beam lights icon, can be ui::group or ui::text or any other element that could show/hide
- 1490 - differential lock icon, can be ui::group or ui::text or any other element that could show/hide
- 1500 - fuel consumed since last trip computer reset
- 1510 - remaining fuel in tank percent (range 0-100)
- 1520 - remaining adblue in tank percent (range 0-100)
- 1530 - ETA (estimated time to arrival), hidden when time is not available (no delivery, no navigation etc.)
- 1540 - time until rest is needed, hidden when g_fatigue is 0 (fatigue option is disabled)
- 1550 - ui_text_bar for differential temperature bar, the text is cut according to current value
- 1555 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of differential temperature bar (typical data "H~~0~~130", horizontal range 0°C to 130°C (32°F to 266°F))
- 1560 - ui_text_bar for suspension load bar, the text is cut according to current value
- 1565 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of suspension load bar (typical data "H~~0~~100000", horizontal range 0 to 100kN)
- 1570 - left blinker icon
- 1580 - right blinker icon
- 1590 - high beam icon
- 1600 - ui_text_bar for oil temperature bar, the text is cut according to current value
- 1605 - _(obsolete in 1.49)_ ui::text that defines size, orientation and range of oil temperature bar (typical data "H~~0~~130", horizontal range 0°C to 130°C (32°F to 266°F))
- 1610 - speed limit
- 1620 - digital main mirrors, can be any element that can show/hide (shown when digital main mirrors are detected by the main mirrors using camera unit prefix)
- 1630 - digital side mirror, can be any element that can show/hide (shown when digital side mirror is detected by the side mirror using camera unit prefix)
- 1640 - digital front mirror, can be any element that can show/hide (shown when digital front mirror is detected by the front mirror using camera unit prefix)
- 1650 - digital hood mirrors, can be any element that can show/hide (shown when digital hood mirror is detected by the hood mirror using camera unit prefix)
- 1660 - close blind spot indicator (side depends on `left_hand_traffic` interior data attribute), can be any element that can show/hide (shown when obstacle is detected on left side of the vehicle)
- 1670 - far blind spot indicator (side depends on `left_hand_traffic` interior data attribute), can be any element that can show/hide (shown when obstacle is detected on right side of the vehicle)
- 1680 - trip recuperation (energy returned)
- 1690 - ui_text_bar for power consumption, the text is cut according to current value (specific behavior based on Renaut E-Tech)
- 1700 - ui_text_bar for rpm, the text is cut according to current value

**Note:** In 1.49 text bars were changed to ui_text_bar element. No additional data is needed now, all is kept in regular members (vertical, min_size, max_size, min_value, max_value).

Old system (pre 1.49) used secondary text fields. Data for bars were entered in format "H~~0~~130", H means the bar is horizontal (or V for vertical), leftmost position represents value 0, rightmost position represents value 130. Empty text defaults to "H~~0~~1".
