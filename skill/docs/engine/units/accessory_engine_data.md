# accessory engine data

**Source:** https://modding.scssoft.com/wiki/Documentation/Engine/Units/accessory_engine_data

## Overview

The **accessory_engine_data** unit class defines engine characteristics for player vehicles and automatic transmission behavior. These units are typically located in `/def/vehicle/truck/<brand.model>/engine/*.sii`.

## Attributes

Many attributes are inherited from **accessory_data**.

| Name | Type | Default | Description |
|------|------|---------|-------------|
| info | array<string> | — | Three info members typically display rated power, peak torque, and peak torque speed for UI display and World of Trucks profiles. Uses localization tokens like `@@hp@@` and `@@dg@@`. |
| type | token | diesel | Engine type and behavior. Accepts "diesel" or "electric" _(Added in 1.50)_. |
| torque | float | 0.0 | Maximum torque output in N·m. |
| secondary_torque | float | 0.0 | Secondary maximum torque for multi-torque engines in N·m _(Added in 1.30)_. |
| secondary_torque_gear_ratio | float | 1.0 | Transmission gear ratio below which secondary_torque applies _(Added in 1.30)_. |
| torque_curve | array<float2> | See description | Torque output at various engine speeds, relative to maximum torque. Values are linearly interpolated; output clamped outside data point range. Valid range is 0-1. Default curve provided if unset. |
| secondary_torque_curve | array<float2> | See description | Secondary torque curve for multi-torque engines _(Added in 1.30)_. Uses same syntax as torque_curve. |
| power | float | 0 | Simplified value for electric engines. Generates torque curve from 0 rpm to peak power point _(Added in 1.60)_. |
| secondary_power | float | 0 | Simplified secondary power value for electric engines _(Added in 1.60)_. |
| resistance_torque | float | -1 | Resistive torque in N·m at 2000rpm for engine braking and consumption. Calculated as (volume × 20.0) if unset or negative. |
| rpm_idle | float | 550 | Target engine speed with no throttle input. Valid range: 500-850 rpm. |
| rpm_limit | float | 2500 | Maximum engine speed allowed by controller. |
| rpm_limit_neutral | float | 2500 | Maximum engine speed in neutral gear. |
| rpm_range_low_gear | float2 | (700, 1500) | Downshift and upshift speeds for low-range gears (automatic transmission). |
| rpm_range_high_gear | float2 | (1000, 1350) | Downshift and upshift speeds for high-range gears (automatic transmission, tweaked in 1.38). |
| rpm_range_power | float2 | (1400, 1900) | RPM range for increased power requests in hills or adaptive shifting _(Added in 1.37, tweaked in 1.38)_. |
| rpm_range_power_boost | float2 | (550, 450) | **Obsolete in 1.37**. RPM range change applied to low/high gear ranges. Use carefully to avoid exceeding rpm_limit. |
| rpm_range_engine_brake | float2 | (1500, 2500) | Downshift and upshift speeds during engine brake operation (automatic transmission). |
| engine_brake | float | 1.0 | Engine braking torque relative to typical exhaust brake for same engine volume. |
| engine_brake_downshift | bool | true | When true, automatic transmissions downshift during engine braking to maintain rpm_range_engine_brake. |
| engine_brake_positions | uint | 3 | Number of engine brake strength levels. Each position's torque scales linearly (e.g., with 3 positions: 1/3, 2/3, full strength). |
| auxiliary_brakes | array<float3> | — | Overrides engine brake control. Components: (engine brake strength, forced downshift, retarder strength). Number of entries must match engine_brake_positions _(Added in 1.40)_. |
| volume | float | 0.0 | Engine displacement in liters. Used for fuel consumption, mass/inertia, and resistance_torque calculations. Minimum: 6 liters. |
| consumption_coef | float | 1.0 | Scales fuel consumption relative to game calculations. |
| adblue_consumption | float | 0.05 | Liters of AdBlue (Diesel Exhaust Fluid) consumed per liter of fuel. Set to 0 for older engines without AdBlue. |
| no_adblue_power_limit | float | 1.0 | Power scaling factor when AdBlue tank is empty. |
| sound | string | — | Path to truck engine sound bank (format: "/sound/truck/engine.bank"). Default bank removed in 1.38+; must specify explicitly. |
| sounds | array<string> | — | FMOD events assigned to engine functions using "sound_name\|sound_path" format _(Added in 1.39)_. Expected events: engine, exhaust, start_bad, turbo. |

## Unit Conversions and Formulas

**Cubic Inches to Liters**
- 1 cu·in = 0.0164 L

**Pound-Feet to Newton-Meters**
- 1 lbf·ft = 1.3558 N·m

**Horsepower to Kilowatts**
- 1 hp = 0.7457 kW

**Torque from Power and Speed (Metric Units)**
- T [N·m] = ( P [kW] × 9549 ) ÷ N [RPM]

**Torque from Power and Speed (English Units)**
- T [lbf·ft] = ( P [hp] × 5252 ) ÷ N [RPM]
