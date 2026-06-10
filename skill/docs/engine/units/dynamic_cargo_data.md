# Documentation/Engine/Units/dynamic cargo data

The **dynamic cargo data** unit class contains all information needed for the dynamic cargo loading feature. These units are located in `/def/vehicle/cargo/<cargo_name>/`, typically alongside [accessory cargo data](/wiki/Documentation/Engine/Units/accessory_cargo_data "Documentation/Engine/Units/accessory cargo data") units, which reference the dynamic cargo data.

For debugging, assign descriptive names following the convention: `dyn.cargo.data.<cargo_name>`. For instance, `dyn.cargo.data.potatoes_b` represents potatoes cargo.

## Attributes

Many attributes are optional. Since version 1.56, three dynamic cargo (un)loading types exist:

- **Particles** - grain hopper loading (added in 1.51). Required attributes: `trailer_particle`, `world_particle`, `material_path`
- **Mover** - logger trailer loading (added in 1.52). Uses cargo model from accessory cargo data when supporting `loading_method: cylinder`
- **Mover_bulk** - scrap metal loading (added in 1.56). Uses a mover for loading with an interior mesh that grows incrementally

### Entry Requirements Legend

- **p** - required for particles-based bulk (un)loading
- **m** - required for mover-based cylinder (un)loading
- **b** - required for mover-based bulk loading
- No marking indicates optional attribute

### Attribute Table

| Name | Type | Required | Description |
|------|------|----------|-------------|
| type | enum | pmb | Dynamic cargo data type: `particles`, `mover`, or `mover_bulk` |
| trailer_particle | string | p | Unit name of particle effect emitted from trailer during UNLOADING |
| trailer_particle_night | string | | Night variant of trailer particle effect |
| impact_particle | string | | Particle effect at impact point where loading effect touches trailer |
| impact_particle_night | string | | Night variant of impact particle |
| world_particle | string | p | Unit name of particle effect from cargo hookup during LOADING |
| world_particle_night | string | | Night variant of world particle |
| material_path | string | pb | Path to material for cargo pile mesh inside trailer |
| cargo_slope_angle | float | | [Angle of repose](https://en.wikipedia.org/wiki/Angle_of_repose) controlling pile steepness. Default: 25.0 |
| loading_sound | string | | Sound path emitted where cargo stream impacts pile during loading |
| unloading_sound_default | string | | Sound path emitted where cargo exits trailer during unloading |
| pile_model | string | b | Path to static model serving as pile inside grab handle |
| grab_types | array<token> | mb | Array of grab handle names that can (un)load cargo; supports repeats for variants |
| variants | array<token> | b | Array of pile_model variant names matching grab_types count |
| variant_radius | array<float> | b | Array of fake radii controlling grab handle closure; matching grab_types count |

### Note on Optional Attributes

If night variants of particles are not defined, the normal (day) variant is used.

Sounds behave differently by loading type: particles-based loading plays sound continuously during trailer operations, while mover-based loading plays sound once when cargo transfers between grab handle and trailer.
