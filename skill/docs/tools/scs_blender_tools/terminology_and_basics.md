# Documentation/Tools/SCS Blender Tools/Terminology and basics

## Terminology

### SCS Root Object

An "**EMPTY**" object in Blender with appropriate SCS Tools settings that functions as a root container. Anything parented to it becomes its content, and it carries settings for the entire entity that exports as an "SCS Game Object."

### SCS Game Object

A general term for a unit consisting of a properly configured "SCS Root Object" and its valid content. During export, invalid components trigger console warnings and are automatically skipped. If all components are invalid, the entire "SCS Game Object" is skipped.

### Model

Any Blender object of **MESH** type.

### Locator

Any Blender object of **EMPTY** type configured as a Locator in SCS Blender Tools. There are three types:

1. **Model Locator** — places or references existing game models
2. **Prefab Locator** — creates special items for prefab models
3. **Collision Locator** — creates collision envelopes for physical body interaction

## Basic Principles

### Parts

Every object in the scene receives a Part name assignment, enabling definition of object sets that form larger units.

### Variants

Parts are grouped into Variants, allowing creation of different SCS Game Object variations. Each Variant exports separately and becomes available in-game.

### Multi Model Work-flow

Multiple "SCS Game Objects" can exist in a single scene. Each may contain many individual model objects with its own Part List, Variant List, and settings. All components must be parented to the "SCS Root Object" directly or indirectly. These objects export individually or in batch.

### Materials

Use only the "SCS Materials" special palette for proper in-game material appearance. Standard Blender material properties affect only 3D View appearance, not SCS Material settings.
