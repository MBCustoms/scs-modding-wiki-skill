# Look system

Looks in SCS games are used to define the same model with different textures or material attributes. This system allows you to extend your model to have several looks without exporting the same geometry repeatedly. Typical examples of look usage in SCS games include gas stations, trailers, and depot companies.

Each SCS Game Object inside a Blender file has its own look definitions. You can create, delete, and edit look names in the **SCS Looks** sub-panel under the _SCS Object_ panel when an SCS Root Object is active, or in the **SCS Looks** panel in the _Material_ tab of Blender's properties window when a mesh object is active.

To change material attributes or textures for a specific look, select it from the list and modify the material attributes. When you change the active look, all materials in the current SCS Game Object will update with values from that look, and changes will be visible in the 3D view.

> **Note:** Using the same material in multiple SCS Game Objects will adopt materials to values in the currently selected SCS Game Object. With that in mind, any meshes with this material in other SCS Game Objects won't display properly, but they will still export correctly.

## Write Through

Most SCS material settings can be "written through," meaning the current value is written to all looks. This allows you to easily change a texture for use in all looks without selecting each look individually.

Write through is accessed via the _More Options_ menu button ( **𐩒** ) on the right side of attributes.

### WT menu

The Write through menu has three options:

- **WT** - writes value to all looks inside the current SCS Root Object
- **WT - Same Look on All SCS Roots** - writes value to the same look on any other SCS Root Objects
- **WT - All Looks on All SCS Roots** - writes value to all looks on all SCS Root Objects in the current blend file

> **Note:** Write through has no effect when you define no looks in the model or only one look.
