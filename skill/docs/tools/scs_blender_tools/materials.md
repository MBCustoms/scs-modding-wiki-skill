# SCS Blender Tools Materials

SCS Blender Tools implements custom material settings through the **SCS Material** panel in Blender's Material properties tab. Users must configure materials exclusively within this panel, as changes made to standard Blender material settings will not affect the exported result in the SCS Game Engine.

## Render and 3D View Setup

To achieve results closest to the SCS Game Engine, use the EEVEE render engine and switch the Viewport Shading mode to "Rendered" for proper visualization.

> **Note:** By default, comprehensive reference lighting is applied. For specific in-game time-of-day lighting effects, consult the Scene Lighting documentation.

## Merge Materials

The SCS Material panel includes a "Merge Materials" operator positioned in the panel header. This tool enables merging materials based on user-selected criteria through an interactive dialog.

## Shader Usage

SCS Materials derive from shader presets. Users can select any available shader preset and modify flavors, attributes, and textures. A second shader type—imported shader—appears exclusively during import when the model uses material effects unavailable in existing presets.

### Shader Preset

The Shader Presets list offers materials with predefined values. Each preset includes flavors, which are common extensions that alter shader behavior and effect names. Flavors may add or remove material attributes and textures. Some flavors produce no visual changes, such as the "shadow" flavor, which designates the material as a shadow caster.

### Imported Shader

Imported shaders appear when importing game models containing materials not matching existing presets. Attributes remain read-only but export correctly. Textures and mappings are editable for visual preview. The "Mappings" field specifies which UV layer exports for each texture alias using "tex_coord_X" entries.

## Properties and Usage

Material properties vary by shader type, with each shader offering different attributes and textures.

### Substance

The Substance property references physical materials from the Material Substance Library file (configured in Global Settings). These define physical surface types, such as road surface characteristics.

### Material Attributes

This section contains various visual shader attributes for customization. Most prominent attributes display interactively in the 3D View.

### Material Textures

#### Texture

Texture properties define paths to texture images or TOBJ files (texture object pointers). The map icon opens a file browser for selecting images or TOBJ files. A search button enables quick browsing of available presets for the current shader.

> **Note:** Using textures outside SCS project directories and subdirectories may produce export errors and warnings.

#### Settings

Each texture includes TOBJ file controls. TOBJs are created automatically during export if absent. A create button appears when no TOBJ exists; pressing it generates one with default settings. Existing TOBJs display a reload button for loading saved settings. Red-colored reload buttons indicate outdated settings requiring refresh. Once TOBJ files exist, settings become editable, with changes immediately rewriting the TOBJ file.

- **U Repeat** - texture repetition in the U direction
- **V Repeat** - texture repetition in the V direction
- **TS Normal** - tangent space normal for the texture
- **Color Space Linear** - linear color space texture (recommended for occlusion shaders with grayscale textures)

#### Mapping

This property specifies the UV layer for each texture. Some textures require multiple UV layers depending on the shader preset.

### Material Item Extras Menu

A "More Options" menu button (⚙) appears alongside most material attributes. Some options support write-through functionality, while others permit copying or pasting from linear color space.
