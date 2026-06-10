# Documentation/Engine/Units/accessory addon data

## Overview

The **accessory_addon_data** unit class is utilized for vehicle accessories that contribute a visible component to a vehicle. This functionality primarily supports customization of the player's vehicle. It specifies the paths to visible models and their setup parameters (variant, look, excluded views), along with the collision mesh path when needed. These units are typically found in **/def/vehicle/truck/<brand.model>/accessory/<type>/\*.sii**.

**Note:** Some legacy accessories that don't interact directly with players (such as badges) may exist in **def/vehicle/truck/<brand.model>/<type>/\*.sii** due to historical reasons. When developing new types, always place them within the **accessory** subfolder.

## Attributes

Many standard attributes are inherited from **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| exterior_model | string | | Path to the model descriptor (.pmd) for the model displayed in exterior view (if applicable). |
| exterior_model_uk | string | | Path to the model descriptor (.pmd) for the model displayed in exterior view for right-hand drive vehicles (if applicable). Defaults to **exterior_model** if unset. |
| interior_model | string | | Path to the model descriptor (.pmd) for the model displayed in interior view (if applicable). |
| interior_model_uk | string | | Path to the model descriptor (.pmd) for the model displayed in interior view for right-hand drive vehicles (if applicable). Defaults to **interior_model** if unset. |
| coll | string | | Path to the collision descriptor (.pmc) for the accessory (if applicable). |
| look | token | default | Name of the look used on all descriptors of this accessory. **Note:** All models for an accessory must have identical look sets. |
| variant | token | default | Name of the variant used on all descriptors of this accessory. **Note:** All models for an accessory must have identical variant sets. |
| hide_in | u32 | 0 | Flag for concealing the accessory from specific views. Valid values can be calculated at the provided reference. **Note:** Accessories with models referencing mirror-reflection textures **MUST** be marked as not visible in mirrors. |
