# Locators

Locators are used for placing special items in an SCS Game Object.

## Creating a Locator

To create a Locator you can use standard Blender Add menu and select desired locator: (⇧ Shift+A **→ SCS Object → <choose locator type>**).

When creating **Prefab** or **Collision** locator you will get additional dialog asking you to select desired sub-type.

## Preview Models on Locators

When you use Locators which represent some other models, it is often handy to see those models directly at the Locator's position, so you can see how the unit will look as a whole. This can be done via the Preview Models functionality. It is available for Model and Prefab Locators.

### Show Preview Model

Checkbox on the left side of preview model sub-panel header serves as a switch to enabling preview model.

### Path

Here you can navigate to the PIM file. Its geometries are then loaded to the locator's position to preview the target model's shape.

### Draw Type

This drop-down menu enables changing the drawing mode for the Preview Model. The choices are "Wire", "Solid" and "Bounds". Please note that the "Textured" drawing mode would make little sense here, since the materials for Preview Models are not loaded at this time.

> **Note:** You can also disable/enable displaying of all Preview Models in the scene using the global option "Show Preview Models" in the Display Settings sub-panel.

## See also

* Model Locators
* Collision Locators
* Prefab Locators
