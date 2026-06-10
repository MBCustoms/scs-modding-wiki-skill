# Documentation/Engine/Fonts

## Intro

The SCS engine introduced significant improvements to font rendering in version 1.43 by transitioning from raster-based fonts to signed distance field (SDF) technology. As stated in the documentation, "the glyph becomes in theory infinitely scalable, while also allowing us to apply consistent anti-aliasing regardless of size on-screen."

This approach offers several advantages over traditional raster fonts:

- Glyphs scale infinitely without quality degradation
- Consistent anti-aliasing at any size
- Runtime effects like outlines and glow
- Single atlas covers all font sizes (eliminating the need for separate normal, title, big, and small variants)
- Multiple effect variations possible with minimal overhead

## Sii Definitions

The new font definition format maintains backward compatibility with earlier versions while introducing new parameters for enhanced control.

### Key Changes

**Size Parameters:** The previous `width` and `height` parameters have been replaced with a single `size` parameter representing EM size. The `scale_width` and `scale_height` parameters remain for per-atlas scaling during rendering.

**Texture Size Control:** An optional `texture_size` parameter allows manual specification of generated texture dimensions. The generator automatically determines optimal sizing, but manual override enables quality or storage optimization. The documentation recommends: "To reach the best size/quality ratio, you should start with a small texture size and increase it until the font reaches the desired quality."

**SDF Range:** The `sdf_range` parameter defines distance field size, automatically calculated by the generator. Manual specification becomes necessary when sharing atlases across fonts with incompatible effects.

**Format Support:** The generator now supports OTF fonts in addition to TTF files.

**Removed Parameters:** The `antialias` and `gradient` parameters are no longer used.

### Example Font Definition

```
SiiNunit
{
configuration : .cfg
{
	base: "../../base"
	output: "/font/normal"
	char_config[]: .cfg0
    line_spacing: 2
    vertical_span_bias: 1
    include_escaped_charset: false
}

char_set_config : .cfg0
{
    # Base atlas parameters based on the old format
  	font_file:"papyrus_regular.ttf"
  	character_set_file: "charset.txt"
  	size: 38              # EM size
	scale_width: 1.0        # X-scaling factor (applied when rendering)
	scale_height: 1.0       # Y-scaling factor (applied when rendering)
	
	# Optional: base color
    base_color: (1.0, 0.0, 0.0, 1.0)    # default is (1, 1, 1, 1)
	
	# Optional: kerning bias
	kerning_bias: 2         # glyph kerning bias (px) at full scale
	
	# Optional: thickness bias
	thickness_bias: 1       # glyph thickness_bias (px) at full scale
	
	# Optional: outline parameters
    outline_width: 1        # outline width (px) at full scale
    outline_color: (0.0, 0.5, 0.0, 1.0) # default is (0, 0, 0, 1)

    # Optional: drop shadow parameters
    shadow_angle: -45       # shadow angle in degrees
	shadow_distance: 2.0    # shadow distance (px) at full scale
	shadow_alpha: 0.4       # shadow alpha (0-1)
	shadow_size: 2          # shadow size (px) at full scale (0 - hard shadow, >0 - softer, spread out shadow)
	
    # Optional: glow parameters
    glow_color: (0.0, 1.0, 0.0)
    glow_size: 5            # glow size (px) at full scale
    
    # Optional: bevel parameters
    bevel_angle: -45        # bevel angle in degrees (should be same as shadow for consistent lighting)
    bevel_alpha: 0.5        # bevel alpha (0-1)
    bevel_size: 1.5         # bevel size (px) at full scale
    
    # Optional: additional MSDFGen parameters
    # Expert-only, see \etc\font\msdf-atlas-gen.exe -help for more info.
    additional_msdfgen_parameters: "-errorcorrection full-auto"
}

}
```

### Cutting Corners

By default, the engine uses three color channels (MSDF method) to preserve sharp corners. For fonts that don't require sharp corners or to reduce file size, use:

```
sharp_corners: false
```

This configuration reduces memory requirements by 66% but results in slightly rounded appearance. The technique works particularly well for CJK fonts where sharp corners are less critical.

### Atlas Sharing

Atlases can be shared between multiple font definitions, allowing child fonts to inherit base texture data while applying different effects.

**Parent Font (normal.sii):**

```
SiiNunit
{
configuration : normal.cfg # parent font configuration can't be nameless!
{
	base: "../../base"
	output: "/font/normal"
	char_config[]: .cfg0
	char_config[]: .cfg1
	char_config[]: .cfg2
	char_config[]: .cfg3
	char_config[]: .cfg4
	char_config[]: .cfg5
	line_spacing: 0
	default_scale: 0.83
	include_escaped_charset: true
}

char_set_config : .cfg0
{
  	font_file:"arialbd.ttf"
  	character_set_file: "charset.txt"
  	
	scale_width: 0.96
	size: 17
	scale_height: 0.96
    texture_size: (1024, 512)
    sdf_range: 8
}

...
```

**Child Font (normal_o.sii):**

```
SiiNunit
{
configuration : .cfg
{
	base: "../../base"
	output: "/font/normal_o"
	char_config[]: .cfg0
	char_config[]: .cfg1
	char_config[]: .cfg2
	char_config[]: .cfg3
	char_config[]: .cfg4
    char_config[]: .cfg5 # number of atlases needs to match! 
	line_spacing: 0
    atlas_source: "./normal.sii"
}

char_set_config : .cfg0
{
    # source ttf and charset data automatically pulled from normal.sii
	size: 14
	scale_width: 1.0
	scale_height: 1.0
	outline_width: 2
}

...
```

In this configuration, the child font automatically inherits TTF and character set data from the parent, requiring only specification of size and effect parameters. The number of atlases must match between parent and child definitions.
