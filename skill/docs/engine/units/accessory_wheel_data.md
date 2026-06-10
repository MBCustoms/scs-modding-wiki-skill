# accessory_wheel_data

The **accessory_wheel_data** unit class defines wheels for vehicles and tires for player vehicles. It specifies the visible model path, appearance settings, paintability, and physical tire characteristics for playable vehicles. These units typically appear in directories like `/def/vehicle/ai_wheel/`, `/def/vehicle/f_tire/`, `/def/vehicle/r_tire/`, and similar locations for different vehicle types and trailers.

## Attributes

Many attributes inherit from **accessory_data**. Required attributes are bolded:

| Name | Type | Default | Description |
|------|------|---------|-------------|
| **model** | string | — | Path to wheel descriptor (.pmd) file with _left_, _right_ variants and _bb_ model locator |
| look | token | default | Selects the appearance look |
| paintable | boolean | false | Enables color picker in garage screens; applies to materials using paint flavor |
| default_color | float3 | (1.0, 1.0, 1.0) | Default wheel accessory color |
| roll_resistance | float | 5.5 | Tire rolling resistance in kg/t (EU Regulation 1222/2009) |
| wet_grip | float | 1.0 | Tire wet grip performance (EU Regulation 1222/2009) |
| noise_volume | float | 73.0 | Tire rolling noise in dB (EU Regulation 1222/2009) |
| wheel_shift | float | 0.0 | Offset of tire centerline from model origin for collision generation |

**Note:** "Unlike other accessories, wheel accessories do not inherit the paint color(s) of the vehicle they belong to."

## EU Tire Label Letter Grades for Truck and Bus (C3) Tires

### Rolling Resistance

| Class | RRC in kg/t |
|-------|-------------|
| A | RRC ≤ 4.0 |
| B | 4.1 ≤ RRC ≤ 5.0 |
| C | 5.1 ≤ RRC ≤ 6.0 |
| D | 6.1 ≤ RRC ≤ 7.0 |
| E | 7.1 ≤ RRC ≤ 8.0 |
| F | RRC ≥ 8.1 |
| G | Empty |

### Wet Grip

| Class | G |
|-------|---|
| A | G ≥ 1.25 |
| B | 1.10 ≤ G ≤ 1.24 |
| C | 0.95 ≤ G ≤ 1.09 |
| D | 0.80 ≤ G ≤ 0.94 |
| E | 0.65 ≤ G ≤ 0.79 |
| F | G ≤ 0.64 |
| G | Empty |

## Calculating Rolling Radius from RPM or RPK

### From RPM

Rolling radius in meters: `r_rolling = 1609.34 ÷ (RPM × 2 × π)`

### From RPK

Rolling radius in meters: `r_rolling = 1000 ÷ (RPK × 2 × π)`

## Related Classes

- accessory_rim_data
