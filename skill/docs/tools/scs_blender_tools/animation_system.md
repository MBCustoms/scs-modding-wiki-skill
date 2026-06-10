# Animation system

Animations in SCS games are driven by skeletons and keyframe animations that manipulate bones. There are two primary types:

## Animation Types

**Program driven animations** primarily expect an animation range from 0 to 1. The first frame represents state 0 and the last frame represents state 1, with intermediate states interpolated across the entire keyframe range. Examples include truck interior animations in Euro Truck Simulator 2, defined in paths like `def/vehicle/truck/man.tgx/interior/animations.sui`.

**Static loop animations** are used by "mover" objects placed throughout the game world using the map editor. Examples include windmills, pedestrians, and animals. Create custom movers by establishing a `def/world/mover.<id_of_your_mod>.sii` file following the template in the original `def/world/mover.sii` file.

> Special mover types called "walkers" can include forward movement animated as skeleton object movement along the Y axis.

## Creation Pipeline

Regardless of animation type, the Blender creation process is identical. You must follow standard Blender procedures: armature creation, vertices skinning, bones posing, and keyframe setting.

> Only location, rotation, and scale manipulation of bones will be exported; all other animations are ignored.

After animating bones with a Blender action, configure the animation in the SCS Animations panel. Export your SCS Game Object as usual.

> Remember to enable "Animated Model" in SCS Root Object properties within the locators panel.

## SCS Animations Panel

Access this panel in Blender's Object properties under the SCS Object section. It appears only when an armature is selected.

> If you see "No 'SCS Root Object'!" instead of the animations list, parent the armature to the SCS Root Object.

### Custom Export Path

This feature stores animation files separately from other exported files, particularly useful for walker animation sequences sharing the same skeleton and animations exported to different directories.

If disabled, all animations export alongside other files.

### SCS Animations List

The list contains all animations for the current SCS Game Object. Use **+** and **−** buttons to create or delete animations. Import animations with the **⤓** button.

Each animation entry includes:

- Export inclusion property (excludes animation if unchecked during export)
- Animation name (used as the exported PIA filename)
- Export operator button for direct animation export

### Active Animation Settings

This section links Blender actions to SCS Animations and configures properties:

- **Start** - frame marking animation beginning
- **End** - frame marking animation conclusion
- **Length** - SCS Animation duration in seconds
- **Increase Animation Step (+)** - stretches action by factor 2 and increases Export Step by 1, providing better control over sub keyframes and transformation distribution
- **Decrease Animation Step (−)** - shrinks action by factor 2 and decreases Export Step by 1, removing every second keyframe
- **Export Step** - number of Blender action frames to step per export iteration

### Animation Player

Preview selected SCS Animations using this wrapped Blender editor interface.

The first row displays **Start**, **End**, and **Current** playback frames. The second row provides playback controls and FPS settings.

> Manually changing FPS invalidates the animation preview, as FPS calculation depends on Start, End, and Length settings.

## SCS Skeleton Panel

An additional panel configures custom skeleton file paths within the SCS Project Base Path and skeleton filename (PIS) for animated SCS Game Objects.

This customization benefits walker animation sequences where multiple walkers share identical skeletons exported to different directories.

If paths remain empty, the skeleton file saves alongside exported files using the SCS Root Object name.
