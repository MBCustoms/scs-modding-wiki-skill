# Model Locators

Model Locators enable placement of existing game models within other game models by reference only, rather than including their data physically in the host file. This referencing approach allows definition of specific locations—such as where mirrors or upgrades appear on a truck model—without duplicating model data.

## Name

The name property corresponds to the Blender Object's name and is used by the game engine. For example, in ETS2 tire/wheel models, "bb" represents the locator name defining wheel size.

## Hookup

The hookup property can be configured according to records in the "Hookup Library" (see "Path Settings" in Global Settings). The hookup property binds other game objects to the current locator. Examples include flares for lights, pedestrian spawning on prefabs, and company logos on prefabs.

Two buttons accompany this property:

- **🗘** button: Reloads the hookup library without navigating to the global settings panel
- **⌕** button: Selects Model Locators sharing the same hookup value as the current one

> **Note:** Model Locators support the "Preview Model" feature (see Preview Models on Locators).
