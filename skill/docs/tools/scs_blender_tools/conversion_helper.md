# Conversion Helper

The Conversion Helper panel offers automated tools for file conversion and mod packaging. Located beneath the Export Panel in Blender's Output tab, it requires downloading the latest Conversion Tools and configuring the Conversion Tools Path before use. Review the Intended workflow documentation for comprehensive understanding of the mod system.

## Clean Converted Data

A razor icon in the panel header represents the "Clean Converted Data" operator, which removes previously converted content or leftover resources. This prevents unused textures and old materials from remaining in your mod. The same function is available through Mod Packing with the Clean option enabled.

## Custom Paths

The panel supports switchable Custom Paths, extending functionality for merging resources from multiple mods simultaneously. This feature proves useful when combining a standard mod with dependency mods.

### Managing Custom Paths

The list includes operators for path management:

- **+** opens file selection for adding new custom paths
- **−** deletes the selected custom path
- **⯅** moves the selected path up in the list
- **⯆** moves the selected path down in the list

Note: list ordering does not affect conversion results.

## Manual Conversion

Three conversion variations exist:

- **CONVERT CURRENT SCS PROJECT** converts only resources in your set SCS Project Base Path
- **CONVERT CUSTOM MAPS** converts resources from defined custom paths only (requires enabled custom paths)
- **CONVERT ALL** converts custom paths and SCS Project Base Path resources (requires enabled custom paths)

Manual conversion is recommended when planning subsequent hand-packing.

## Mod Packing

### Configuration Properties

**Destination and naming:**
- **Mod Folder Path** designates where the mod will be placed; includes a search operator for auto-retrieving mod paths for Euro Truck Simulator 2 or American Truck Simulator
- **Mod Name** specifies the ZIP file name

**Compression type:**
- **Folder** creates a folder at the destination containing conversion results instead of a ZIP package
- **ZIP (Uncompressed)** creates an uncompressed ZIP file
- **ZIP (Moderate)** creates a compressed ZIP using deflated compression

**Automated actions:**
- **Clean** performs conversion without leftovers from previous operations
- **Export** runs automated Blender Tools export based on Export Scope settings
- **Convert** converts resources from SCS Project Base Path and custom paths

### PACK MOD

The "PACK MOD" operator executes enabled automated actions, then packages conversion tool results into a ZIP file at the specified destination.

For straightforward usage:

1. Set mod folder path to "[Game User Path]/mod"
2. Enter mod name
3. Enable all options
4. Press PACK MOD
5. Run the game to test your mod
