# Documentation/Engine/Units/accessory engine data

## Overview

The **accessory_engine_data** unit class defines engine characteristics for player vehicles and automatic transmission behavior. These units are typically located in **/def/vehicle/truck/<brand.model>/engine/\*.sii**

## Attributes

Many attributes are inherited from **accessory_data**.

| Name | Type | Default | Description |
|------|------|---------|-------------|
| info | array<string> | — | Three info members typically display rated power, peak torque, and peak torque speed for UI and World of Trucks uploads. Localization tokens like `@@hp@@`, `@@kw@@`, `@@lb_ft@@`, `@@nm@@`, and `@@dg@@` are used. |
| type | token | diesel | Engine type and behavior. Accepts "diesel" or "electric" (added in 1.50). |
| torque | float | 0.0 | Maximum torque output in N·m. |
| secondary_torque | float | 0.0 | Secondary maximum torque in N·m for multi-torque engines (added in 1.30). |
| secondary_torque_gear_ratio | float | 1.0 | Transmission gear ratio below which secondary_torque applies (added in 1.30). |
| torque_curve | array<float2> | See description | Torque output at various RPM relative to maximum torque. Default: `(300, 0)`, `(440, 0.5)`, `(1000, 1)`, `(1300, 1)`, `(1900, 0.77)`, `(2400, 0.4)`, `(2600, 0)`. Values are linearly interpolated; output clamped outside domain. |
| secondary_torque_curve | array<float2> | See description | Secondary torque curve for multi-torque engines. Uses same syntax as torque_curve (added in 1.30). |
| power | float | 0 | Simplified definition for electric engines. Generates torque_curve from 0 RPM to nominal power, then gradually decreases (added in 1.60). |
| secondary_power | float | 0 | Simplified secondary power for electric engines; generates secondary_torque_curve (added in 1.60). |
| resistance_torque | float | -1 | Resistive torque in N·m at 2000 RPM for engine braking and consumption. Calculated as (volume × 20.0) when unset or negative (ETS 1.27/ATS 1.6+). |
| rpm_idle | float | 550 | Engine speed maintained with no throttle. Valid range: 500-850 RPM. |
| rpm_limit | float | 2500 | Maximum engine speed allowed (except when driven by wheels). |
| rpm_limit_neutral | float | 2500 | Maximum engine speed in neutral, clamped to rpm_limit if lower. |
| rpm_range_low_gear | float2 | (700, 1500) | Downshift and upshift RPM in low-range gears (automatic transmission). |
| rpm_range_high_gear | float2 | (1000, 1350) | Downshift and upshift RPM in high-range gears at peak torque (automatic transmission; tweaked in 1.38). |
| rpm_range_power | float2 | (1400, 1900) | RPM range for increased power requests in hills or adaptive shifting (added 1.37, tweaked 1.38). |
| _rpm_range_power_boost_ | float2 | (550, 450) | **Obsolete in 1.37.** RPM range change to low/high gear when more power requested. |
| rpm_range_engine_brake | float2 | (1500, 2500) | Downshift and upshift RPM during engine brake operation (automatic transmission). |
| engine_brake | float | 1.0 | Engine braking torque relative to typical exhaust brake on same-volume engine. |
| engine_brake_downshift | bool | true | Automatic transmission downshift when engine brake engaged to maintain rpm_range_engine_brake. |
| engine_brake_positions | uint | 3 | Number of engine brake strength levels. Braking torque scales linearly (e.g., 3 positions = 1/3, 2/3, full strength). |
| auxiliary_brakes | array<float3> | — | Overrides engine brake control with (engine brake strength, forced downshift, retarder strength) tuples. Count must match engine_brake_positions (added in 1.40). |
| volume | float | 0.0 | Volumetric displacement in liters. Used for fuel consumption, engine mass, inertia, and default resistance_torque. Minimum: 6 liters. |
| consumption_coef | float | 1.0 | Scales fuel consumption relative to game-calculated value. |
| adblue_consumption | float | 0.05 | Liters of AdBlue (Diesel Exhaust Fluid) consumed per liter of fuel. Set to 0 for older engines without AdBlue. |
| no_adblue_power_limit | float | 1.0 | Power scaling factor when AdBlue tank is empty. |
| sound | string | — | Path to truck engine sound bank (format: "/sound/truck/engine.bank"). Default bank removed in 1.38+; must specify explicitly. |
| sounds | array<string> | — | FMOD events assigned to engine functions using "sound_name\|sound_path" format. Expected names: engine, exhaust, start_bad, turbo (added in 1.39). |

## Relevant Unit Conversions and Formulas

### Cubic Inches to Liters

1 cu·in = 0.0164 L

### Pound-Feet to Newton-Meters

1 lbf·ft = 1.3558 N·m

### Horsepower to Kilowatts

1 hp = 0.7457 kW

### Torque from Power and Speed (Metric Units)

T [N·m] = ( P [kW] × 9549 ) ÷ N [RPM]

### Torque from Power and Speed (English Units)

T [lbf·ft] = ( P [hp] × 5252 ) ÷ N [RPM]
