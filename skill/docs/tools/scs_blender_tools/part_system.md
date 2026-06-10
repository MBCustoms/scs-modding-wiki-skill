# Documentation/Tools/SCS Blender Tools/Part system

## Overview

Parts are grouping systems for Model and Locator objects found in the SCS Parts sub-panel within the SCS Object panel. They serve two primary purposes: defining Variants and, in special cases, designating geometry that receives different in-game treatment than the rest of a model.

Every scene object belongs to a Part. The default name is "defaultpart," though this is customizable. Objects must be parented to an SCS Root Object to have assignable Part names; otherwise, the panel remains inaccessible.

## Part List

Each SCS Root Object contains a Part List with names used within its respective Game Object.

### Add, Remove, Order and Rename Parts

The Part list interface provides:

- **+** button to add new Part names
- **−** button to remove Part names
- **🗘** button to automatically remove unused Part names
- **⯅ & ⯆** buttons to reorder selected parts
- **Double-click** on list items to rename existing Parts

### Additional List Tools

Each Part list item includes selection and visibility controls:

- **Arrow icon** toggles selection of all objects in that Part
- **Eye icon** toggles visibility of all objects in that Part

These function as switches. Pressing repeatedly alternates between selected/deselected and hidden/shown states. Holding **Shift** adds to existing selections or shows items; **Ctrl** subtracts from selections or hides items.

### Item-Selection Tools

When the active object is a Model, Model Locator, or Collision Locator, additional buttons appear:

- **Assign** - Assigns the selected Part name to chosen object(s). Multiple selections must belong to the same SCS Root Object.
- **Select** - Selects all Models, Model Locators, and Collision Locators using the same Part name within the active Game Object.
- **Deselect** - Deselects all Models, Model Locators, and Collision Locators using the same Part name within the active Game Object.

## Predefined Part Names

Certain Part names trigger special in-game behaviors based on object type.

### Trailers

| Name | Behavior | Notes |
|------|----------|-------|
| brace_on | Lowered landing gear (static). Visible when trailer is detached and before landing gear raises when attached. | The brace_on part should be active for all trailer variants; brace_off should be inactive. For animated landing gear, both parts remain invisible during animation and should visually match animation keyframes. |
| brace_off | Raised landing gear (static). Visible when trailer is attached after landing gear raises. | |
| cables_off | Visible when dynamic trailer cables are not connected (version 1.31+) | The cables_off part should be active for all variants; cables_on should be inactive. |
| cables_on | Visible when dynamic trailer cables are connected (version 1.31+) | |

### Map Objects

- **vis** - Used for the visible portion of the model
- **coll** - Used for collision geometry
