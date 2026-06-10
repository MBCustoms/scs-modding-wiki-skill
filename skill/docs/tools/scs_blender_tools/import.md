# SCS Blender Tools Import

Through import functionality, users can load models and other elements previously exported to SCS intermediate-format data.

All files use PIX extensions: **PIM** files serve as main files containing model geometries, while **PIT** (trait data), **PIC** (colliders data), **PIP** (prefab data), **PIS** (skeleton data), and **PIA** (animation data) are supporting formats.

The import feature appears in Blender's import menu as "SCS Game Object (.pim)", which opens a file browser dialog. Users can configure import options on the right side of the dialog.

## Import Options

- **SCS Project Base Path** - Allows setting the proper project path prior to import using the "Set Current Dir as Project Base" operator, which designates the currently selected file browser path as the SCS Project Base Path.

- **Scale** - Controls the scale of imported meshes and other elements.

- **Preserve Path for Export** - Automatically sets a custom export path for imported objects, enabling export to their original location.

- **Import Model (PIM)** - Toggles model file loading on or off.

- **Use Normals** - When enabled, imports mesh normals from the file; otherwise Blender recalculates them.

- **Use Welding** - Performs automatic vertex welding on imported meshes. Vertices in PIX files are often doubled at hard edges and discontinuous UV/color boundaries, making automatic welding necessary for geometry optimization.

- **Welding Precision** - Sets the decimal threshold for matching values during welding. Default value 4 means values must match to four decimal places (approximately 0.1 mm).

- **Import Trait (PIT)** - Toggles trait file loading on or off.

- **Load Textures** - When enabled, loads all image textures.

- **Import Collision (PIC)** - Toggles collision file loading on or off.

- **Import Prefab (PIP)** - Toggles prefab file loading on or off.

- **Import Skeleton (PIS)** - Toggles skeleton file loading on or off.

- **Bone Scale** - Specifies the size of imported bones, which is difficult to modify afterward.

- **Import Animations (PIA)** - Toggles animation file loading on or off.

- **Search Subdirectories** - When enabled, searches all available subdirectories for animation files.

- **Log Level** - Sets the logging level prior to import.

> **Note:** Only animation files belonging to the actual skeleton load automatically. If animations aren't located beside PIX files or in subdirectories, they can be imported later through the Animation system's SCS Animations panel.
