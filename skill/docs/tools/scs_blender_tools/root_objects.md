# Root objects

SCS Root Objects are special items that function as master objects for individual SCS Game Objects. Any object parented to an SCS Root Object automatically becomes part of its content, forming what is called an SCS Game Object. The Root Object carries various settings for the entire unit, including Parts, Variants, and Looks, which can be edited in the SCS Object sub-panels.

## Creating a Root Object

You can create a Root Object by navigating to the _Add_ menu in Blender and selecting "SCS Object → Root Object" (⇧ Shift+A). Once created, access its options through the _SCS Object_ panel under the _Object_ tab in Blender's properties window.

## Export Inclusion

This option enables or disables batch export functionality for the specific SCS Game Object.

## Animated Model | Rigid Model

This setting controls how the model is exported regarding animation:

- If an animated Game Object is exported with "Rigid Model" selected, the animation will be excluded
- If a non-animated Game Object is exported with "Animated Model" selected, it remains rigid

## Allow Custom Export File Path

A checkbox that enables or disables the use of a custom export file path for this particular SCS Game Object.

## Custom Export File Path

This setting allows you to specify a custom file path for exporting the SCS Game Object, which overrides the default export path. The path must be relative to the "SCS Project Base Path."

### Path Resolution Logic

1. If the custom export path is empty, files export beside the saved Blender file
2. If a custom export path is set, Blender Tools combines "SCS Project Base Path" with the given path
3. If neither solution works, files export directly into "SCS Project Base Path"

> **Note:** If the input field appears red, the path is invalid and an additional information button will display.
