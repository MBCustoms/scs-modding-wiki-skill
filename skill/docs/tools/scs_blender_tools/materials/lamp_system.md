# Lamp system

The lamp system uses the "lamp" material effect to showcase extra lit surfaces through either a second mask texture or the alpha channel of the base texture. This functionality is commonly applied to vehicle lights, auxiliary lights, and traffic lights.

The SCS Blender Tools include a "[Lamp Switcher & UV Tool](/wiki/Documentation/Tools/SCS_Blender_Tools/SCS_Tools_in_Tool_Shelf/Lamp_Switcher_%26_UV_Tool)" to simplify implementation, offering support for UV mapping tiling and real-time viewport previews.

## Vehicle lights

Vehicle lights employ a secondary RGBA mask texture where each channel designates luminance masking for specific light types:

- **R channel**: left and right blinkers
- **G channel**: high beam and brake
- **B channel**: low beam, reverse, and daytime running lights (DRL)
- **A channel**: positional lights

Proper functionality requires a dedicated UV layer for the lamp mask texture with correct tile offset mappings applied along the right side of the texture:

| Tile | Position | Color Channels (R/G/B/A) |
|------|----------|--------------------------|
| 0 | Front Left | Left Blinker / High Beam / Low Beam / Positional* |
| 1 | Front Right | Right Blinker / — / — / — |
| 2 | Rear Left | Left Blinker** / Brake / Reverse / Positional |
| 3 | Rear Right | Right Blinker** / — / — / — |
| 4 | Middle or DRL | DRL / — / — / Positional |

*Front positional lights are white in ETS2 and orange in ATS as of version 1.39.
**Rear blinkers are orange in ETS2 and red in ATS by default.

## Auxiliary lights

Auxiliary vehicle lights can incorporate a separate mask texture utilizing only two channels:

- **R channel**: dimmed beam
- **G channel**: full beam
- **B and A channels**: must remain zero (black)

Two distinct colors for auxiliary lights are achievable through UV mapping offsets for the second mask texture, with tile offset applied on the right side:

- Tile 0: white color
- Tile 1: orange color

## Traffic lights

Traffic lights differ by using the alpha channel of the base texture for illumination rather than requiring a separate mask texture. Tile offset is applied on the upper-right texture area:

- Tile 0: red color
- Tile 1: yellow color
- Tile 2: green color
