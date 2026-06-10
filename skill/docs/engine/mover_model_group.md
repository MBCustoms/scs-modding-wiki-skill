# Mover model group

The mover model group system combines compatible models and animations, primarily for character creation without needing separate definitions for every combination. It consists of four interconnected units.

## Mover desc

The `mover_desc` unit represents a model and its associated data, located in `/base/def/world/mover_desc.sii`.

**Example structure:**
```
mover_desc : mover_desc.worker_3 {
    model_desc: "/model/mover/characters/new_generation/new/models/man/worker_vest/worker_vest_nemiro_lod0.pmd"
    
    lods[0]: "/model/mover/characters/new_generation/new/models/man/worker_vest/worker_vest_nemiro_lod1.pmd"
    lods[1]: "/model/mover/characters/new_generation/new/models/man/worker_vest/worker_vest_nemiro_lod2.pmd"
    lods[2]: "/model/mover/characters/new_generation/new/models/man/worker_vest/worker_vest_lod3.pmd"
    
    lod_distances[0]: 10
    lod_distances[1]: 30
    lod_distances[2]: 90
    
    group_tags[]: human
    group_tags[]: man
    group_tags[]: cauca
    group_tags[]: worker
}
```

**Properties:**
- `model_desc` - Model descriptor
- `model_coll` - Model collision
- `lods` - Model LOD descriptors
- `lod_distances` - LOD distances
- `group_tags` - Group tags (detailed in mover_model_group section)

## Mover anim

The `mover_anim` unit represents animation and its data, located in `/base/def/world/mover_anim.sii`.

**Example structure:**
```
mover_anim : mover_anim.sweeper {
    model_anim: "/model/mover/characters/new_generation/animations/universal/sweeping_anim.pma"
    
    group_tags[]: human
    group_tags[]: man
    group_tags[]: sweeper
    
    props[]: mover_props.sweeper.broom
}
```

**Properties:**
- `model_anim` - Animation descriptor
- `group_tags` - Group tags (detailed in mover_model_group section)
- `props` - Array of link pointers to animation props

## Mover anim props

The `mover_anim_props` unit represents animation props and settings, located in `/base/def/world/mover_anim_props.sii`.

**Example structure:**
```
mover_anim_props : mover_props.sweeper.broom {
    model: "/model/mover/characters/new_generation/models/props/independent/broom.pmd"
    bone_a: lefthand
    bone_b: righthand
    bone_offset_a: (0.03, 0.08, 0)
    bone_offset_b: (-0.2, 0.16, -0.15)
    model_offset: (0.0, 0.0, -0.67)
    model_rotation: (0.0, 0.0, 0.0)
}
```

**Properties:**
- `bone_a` - First bone to "skin" prefix
- `bone_b` - Second bone to "skin" prefix
- `bone_offset_a` - Skin offset for the first bone
- `bone_offset_b` - Skin offset for the second bone
- `model` - Props model descriptor
- `model_animation` - Props model animation
- `sync_animation` - Force time synchronization between props and mover animation
- `model_offset` - Props placement offset
- `model_rotation` - Props placement rotation

### Props Placement Mechanics

Props render as separate models and attach to the skeleton using bones A and B. Three setup configurations exist:

**1) No bones set:** Props place at mover origin plus `model_offset` with zero rotation plus `model_rotation` (e.g., bucket on ground).

**2) Bone A only:** Props place at bone A location plus `bone_offset_a` plus `model_offset` with bone A rotation plus `model_rotation` (e.g., sponge in one hand).

**3) Bones A and B:** Props place at bone A location plus `bone_offset_a` plus `model_offset`, with rotation derived from the direction vector from bone B (plus `bone_offset_b`) to bone A (plus `bone_offset_a`), plus `model_rotation` (e.g., broom in both hands).

## Mover model group

The `mover_model_group` unit represents valid combinations between mover descriptors and animations, located in `/base/def/world/mover.group.sii` or any mover definition file.

**Example structure:**
```
mover_model_group: mover.work_sw_all {
    mover_name: "worker sweeper all"
    
    desc_tags[]: man
    desc_tags[]: worker
    anim_tags[]: man
    anim_tags[]: sweeper
}
```

**Properties:**
- `desc_tags` - Mover descriptor tags
- `anim_tags` - Mover animation tags
- `country_specific` - If true, only generates mover descriptors containing country tags from mover placement

### Operation

When loaded, the system collects all descriptors containing every `desc_tags` entry and all animations containing every `anim_tags` entry. During mover generation, the engine randomly selects a descriptor, then chooses an animation with the matching skeleton.

This approach accommodates groups with different skeletons (e.g., walking men and women) while ensuring only compatible model-animation pairs generate.

### Optimization Guidance

Animation tags should include both activity descriptors and compatible descriptor tags to limit combination pools during generation. For instance, "human" and "man" tags in `mover_anim` help identify compatible models, and these same tags appear in `anim_tags` within related mover groups.
