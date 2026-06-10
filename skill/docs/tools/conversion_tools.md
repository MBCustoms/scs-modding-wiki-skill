# Conversion Tools

Conversion tools are a set of binaries used to convert mid-format files to binary format files which are used by the game.

In general you should convert your whole mod file system structure for in game usage using this tools including: any 3D assets exported with SCS Blender Tools, any definition files, sound files, map files etc.

## Download & Installation

### Download

- **v2.21** - ETS2 (1.58+) & ATS (1.58+) - 64bit binaries, conversion fixes (intersection merging), updated effects
- **v2.20** - ETS2 (1.55+) & ATS (1.55+) - 64bit binaries
- **v2.18** - ETS2 (1.50+) & ATS (1.50+) - with prefab v24
- **v2.17** - BETA - ETS2 (1.50+) & ATS (1.50+)
- **v2.15** - ETS2 (1.49+) & ATS (1.49+)
- **v2.14** - ETS2 (1.47+) & ATS (1.47+)
- **v2.13** - ETS2 (1.44+) & ATS (1.44+)
- **v2.12** - ETS2 (1.37 - 1.43) & ATS (1.37 - 1.43)
- **v2.10** - ETS2 (1.36) & ATS (1.36)
- **v2.9** - ETS2 (1.36) & ATS (1.36)
- **v2.8** - ETS2 (1.35) & ATS (1.35)
- **v2.7** - ETS2 (1.32) & ATS (1.32)
- **v2.6** - ETS2 (1.31) & ATS (1.31)
- **v2.5** - ETS2 (1.30) & ATS (1.29)
- **v2.4** - ETS2 (1.27 - 1.28) & ATS (1.6 - 1.28)
- **v1.8** - ETS2 (1.27 and below) & ATS (1.5 and below)

**Note:** Old conversion tools compatible with ETS2 (up to v1.26), ATS (up to v1.5) also require older SCS Blender Tools versions up to v1.6.

### Install

To install conversion tools binaries simply extract the ZIP package into a folder somewhere on the PC where it can be found and read-write access is granted.

## Usage

There are two options of usage for conversion tools:

1. **Use conversion tools from Blender**
   - First make sure you installed SCS Blender Tools. See: Documentation/Tools/SCS Blender Tools/Installation
   - Navigate to Conversion Helper panel in Output properties tab.
   - Set Conversion Tools Path to point to the extracted conversion tools folder.
   - Now conversion tools will be used when you will use operators of conversion helper (for more info see: Documentation/Tools/SCS Blender Tools/Conversion Helper).

2. **Use binaries directly (for advanced users)**

   Direct usage of conversion tools is done from command line with execution of "conversion_tools/convert.cmd" script. Running this script will take any mid-format resources founded in "conversion_tools/base" folder, correctly convert them into binary format files and place them into "conversion_tools/rsrc" folder.

   After completed conversion all the content will be in inside "conversion_tools/rsrc/base/@cache". To create a mod you can ZIP "conversion_tools/rsrc/base/@cache" folder and place it into the mod folder of the game as usual. In case of "conversion_tools/extra_mount.txt" usage each entry from extra mount will have its own converted folder entry inside "conversion_tools/rsrc" So to pack a mod you will have to take the result from each respective converted folder and put it together in the same ZIP file (e.g. extra mount entry "my_mod" will have conversion result in "conversion_tools/rsrc/my_mod/@cache").

> **Note:** Usage of "conversion_tools/extra_mount.txt" file with specified additional sibling folder paths of "base" in each line of the file may also be used. This will cause conversion tools to mount all of the paths the same as "conversion_tools/base" folder.

> **Note:** If something goes wrong during the conversion, you can find additional information in the conversion tools log file ("bin/win_x86/mass_convert.log" 2.18 and older, "conversion_tools/mass_convert.log" 2.19+).
