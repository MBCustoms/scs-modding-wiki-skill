# accessory_addon_trailer_cables_data

## Overview

The **accessory_addon_trailer_cables_data** unit class enables the addition of dynamic trailer cables between a vehicle and its trailer. For player trucks, these units are typically defined in **/def/vehicle/truck/<brand.model>/accessory/trlr_cables/\*.sii** with names ending in `.trlr_cables`. For player trailers, they are usually located in **/def/vehicle/trailer/<trailer_name>/accessory/trlr_cables/\*.sii**. This unit type was introduced in version 1.31.

**Note:** This article is a work in progress and has yet to be reviewed by SCS staff. Some information may be incomplete or inaccurate.

## Attributes

Many common attributes are inherited from **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| exterior_model | string | | Path to the model descriptor (.pmd) for the model displayed in exterior view (if applicable) |
| exterior_model_uk | string | | Path to the model descriptor (.pmd) for the model displayed in exterior view for right-hand drive vehicles (if applicable). Defaults to **exterior_model** if unset |
| coll | string | | Path to the collision descriptor (.pmc) for the accessory (if applicable) |
| look | token | default | Name of the look to be used on all descriptors of this accessory. All models for an accessory must have the same set of looks |
| variant | token | default | Name of the variant to be used on all descriptors of this accessory. All models for an accessory must have the same set of variants |
| cables | array<owner_ptr> | | Each member points to a **trailer_cable_data** unit |

## Model

A valid trailer cables accessory model must include:

- Some visible geometry (models cannot contain only locators)
- Attachment locators for each member defined in the _cables_ array, where the truck plug model will be placed. Locator names are defined by each **trailer_cable_data** unit's _locator_prefix_ attribute

Optional features include:

- Rest locators for each defined cable where the trailer plug model will be placed when no trailer is connected
- Special part names for particular states:
  - `cables_off` displays only when no trailer is attached
  - `cables_on` displays only when a trailer is attached
