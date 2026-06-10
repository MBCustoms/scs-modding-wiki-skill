# Lamp Switcher & UV Tool

Any material using lamp shader has specific configuration of textures and UV mappings (see [Lamp system](Documentation/Tools/SCS_Blender_Tools/Materials/Lamp_system)). That's why Blender Tools include two additional tools to easily map UV mappings to proper texture tiles and preview the desired result.

## Lamp switcher

Lamp switcher is a preview tool for switching ON and OFF different types of lights in all currently created materials.

When switching ON any type of light, you will see brightened surfaces on meshes using lamp material. If you don't see any change in 3D view, there is either a problem in UV mapping of the meshes or the mask texture is not properly created. Lamp switcher can be found in 3D view under SCS Tools panel and consists of three groups:

- **Vehicle** - used for switching vehicle lights
- **Auxiliary** - used for switching vehicle auxiliary lights
- **Traffic Lights** - used for switching traffic lights

## Lamp UV Tool

Lamp UV Tool is a helper tool for positioning UV mappings of selected faces. The tool will reposition mappings on the UV layer used by mask texture in lamp material.

You can use this tool only in "Edit Mode" of mesh objects. By pressing any of the buttons, the tool will automatically reposition selected faces UV mappings to proper texture tile depending on selected vehicle side or auxiliary lamp color or traffic light color:

- **Vehicle** - UV mappings are positioned depending on vehicle side
- **Auxiliary** - UV mappings are positioned depending on the lit color of auxiliary
- **Traffic Lights** - UV mappings are positioned depending on the color of traffic light
