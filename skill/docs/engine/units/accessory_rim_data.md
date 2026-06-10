# accessory_rim_data

The **accessory_rim_data** unit class defines wheels (rims), hubs, nuts and covers for player vehicles. It specifies the model path, appearance settings, paintability, and tire positioning.

## File Locations

Units of this type are found in:

- **/def/vehicle/f_cover/\*.sii** (front hub covers) → Valid unit names: `*.fcover`
- **/def/vehicle/f_disc/\*.sii** (front wheels) → Valid unit names: `*.fdisc`
- **/def/vehicle/f_hub/\*.sii** (front hubs) → Valid unit names: `*.fhub`
- **/def/vehicle/f_nuts/\*.sii** (front nuts) → Valid unit names: `*.fnuts`
- **/def/vehicle/r_cover/\*.sii** (rear hub covers) → Valid unit names: `*.rcover`
- **/def/vehicle/r_disc/\*.sii** (rear wheels) → Valid unit names: `*.rdisc`
- **/def/vehicle/r_hub/\*.sii** (rear hubs) → Valid unit names: `*.rhub`
- **/def/vehicle/r_nuts/\*.sii** (rear nuts) → Valid unit names: `*.rnuts`

## Attributes

Many attributes inherit from **accessory_data**. Required attributes are bolded.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| **model** | string | | Path to model descriptor (.pmd) of valid rim model with _left_ and _right_ variants |
| look | token | default | Name of the look to use |
| tire_shift | float | 0.0 | Distance in meters tire model shifts toward vehicle centerline (fdisc/rdisc only) |
| paintable | boolean | false | Enables color picker in garage/browser screens; applies paint to materials using paint flavor |
| default_color | float3 | (1.0, 1.0, 1.0) | Sets default color for rim accessory |

**Note:** Unlike other accessories, rim accessories do not inherit vehicle paint colors. Each instance has its own paint color.

## Related Classes

- accessory_wheel_data
