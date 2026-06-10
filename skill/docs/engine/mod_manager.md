# Documentation/Engine/Mod manager

With the new mod manager, packages can be:

- zip archives (using .scs or .zip extension)
- normal directories (each directory represents a separate mod)

Development should use directories; releases should use zip archives for smaller file sizes. Packages can include a manifest file with metadata displayed by the mod manager.

## DLC-Specific Content

Since ETS2 & ATS version 1.48, mods can contain subdirectories or files mounted only if corresponding DLCs are owned. The mod root can include a "base" directory (always mounted) and "dlc_" prefixed directories/archives (mounted conditionally). Manifest and metadata remain in the mod root.

## Using the manifest

Create a "manifest.sii" file containing a "mod_package" unit definition:

```
SiiNunit
{
mod_package : .package_name
{
        package_version: "1.0 Release 3"
        display_name: "My mod"
        author: "My Nick"
        category[]: "ui"
        category[]: "truck"
        icon: "mod_icon.jpg"
        description_file: "mod_description.txt"
        # compatible_versions[]: "1.19.*"
        # dlc_dependencies[]: "dlc_north"
}
}
```

**Metadata attributes:**

- **package_version** (string): Version of the mod package
- **display_name** (string): Display name; if unspecified, package name without extension is used
- **author** (string): Author name
- **category** (array of strings): Up to 2 categories per mod; if unspecified, "Others" is assigned
- **icon** (string): .jpg file (276x162px) in mod root
- **description_file** (string): UTF-8 text file in mod root
- **compatible_versions** (array, not for Steam Workshop): Specifies compatible game versions using wildcard formatting

**Version compatibility examples for "1.19.*":**

| Version | Compatible? |
|---------|------------|
| 1.18.1  | no         |
| 1.19.1  | yes        |
| 1.19.1.3 | yes       |
| 1.19.4  | yes        |
| 1.20.4  | no         |

Multiple version strings are supported:

```
compatible_versions[]: "1.19.*"
compatible_versions[]: "1.20.*"
```

**Map mods:** Use `compatible_versions[]: "X.X.*"` to check major version matching.

**Other mod types:** Avoid this parameter due to low compatibility breakage risk.

- **dlc_dependencies** (array, optional, ETS2 1.26+, ATS 1.5+): Specifies required DLCs; blocks mod activation if missing. Use DLC package names without extension (e.g., "dlc_north")

- **mp_mod_optional** (bool, optional): When true, allows joining multiplayer games where other players lack the mod, provided the mod doesn't affect gameplay requirements

## Categories to use

Valid categories (select up to 2):

- truck
- trailer
- interior
- tuning_parts
- ai_traffic
- sound
- paint_job
- cargo_pack
- map
- ui
- weather_setup
- physics
- graphics
- models
- movers
- walkers
- prefabs
- other

## Description of your mod

Description text length is unlimited. Color tags can colorize descriptions:

| Tag | Result color |
|-----|--------------|
| [red] | #FF2626 |
| [green] | #75FF00 |
| [blue] | #12ABE5 |
| [normal] | Default UI font color |
| [white] | #FFFFFF |
| [orange] | #FFAE00 |

Example: `[red]Hello [green]Wor[orange]ld`

### Localized description

Since version 1.23, create language-specific description files using format: `description_file_name.[locale].txt`

Examples (if description_file is "description.txt"):

- description.en_gb.txt
- description.cz_cz.txt
- description.ru_ru.txt
- description.pl_pl.txt

The game uses description.txt as fallback if the specific language file is unavailable.

## Sample mod

A sample mod with manifest is available for download.

## Other problems not described here

For mod adjustment issues, visit the [SCS Software forum mods section](http://forum.scssoft.com/viewforum.php?f=24).
