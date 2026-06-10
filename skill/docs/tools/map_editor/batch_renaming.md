# Batch Renaming

The editor supports batch renaming of object types using a configuration file. To use this feature, prepare a configuration file describing the changes, load the map in the editor, press **F3** to open the replacement dialog, click **Batch replace**, and confirm. Save and reload the map afterward.

## Requirements

The operation requires that units for both old and new names exist during the process. Complete the operation in separate steps:

1. Add units under the new names to the definitions
2. Perform the rename operation
3. Remove units with the old names from the definitions

## Configuration File

Store the configuration file as:
- `Documents\Euro Truck Simulator 2\replace.sii`, or
- `Documents\American Truck Simulator\replace.sii`

The file must contain a single unit of type `editor_search_replace`. This unit includes:

- A string array attribute **sectors** listing all sectors where changes apply (sector names correspond to base file names, e.g., `sec+0001-0001`)
- Additional string array attributes defining replacements in the format: `old_name|new_name`

## Supported Arrays

**Note:** New arrays may be added before approval; instances of `road_template` and `prefab_model` have been observed in ATS replace files.

- **ter_material** - terrain materials
- **road_material** - road materials
- **sidewalk_material** - sidewalk materials
- **bld_scheme** - building schemes
- **model** - models
- **mover** - movers
- **walker** - walkers/pedestrians
- **vegetation** - vegetations
- **road_look** - road looks
- **ter_profile** - terrain profiles
- **railing** - railings on roads
- **sign** - lamps/bollards along the road

## Example Configuration

```
SiiNunit
{
editor_search_replace : .edit_replace 
{
# List of sectors where the search replace should be performed
# If you want to search everywhere in the map use the wildcard character "*"

sectors[]: "sec-0002-0007"
sectors[]: "sec-0002-0008"

# Terrain material replacement old terrain material unit suffix | new terrain material unit suffix

ter_material[]: "24|121"
ter_material[]: "103|129"

# Building scheme replacement old scheme unit suffix | new scheme unit suffix

bld_scheme[]: "22|2sc"

# Model replacement old model unit suffix | new model unit suffix

model[]: "122|1sc"
model[]: "757|2sc"
model[]: "56a|3sc"
}
}
```
