# Documentation/Engine/Units/accessory addon tank data

## Overview

The **accessory_addon_tank_data** unit class is used for adding accessory based tank data container. For player trucks, units of this type are usually defined in `/def/vehicle/truck/<brand.model>/accessory/tank/*.sii` and valid unit names end in `.tank`. This unit type was added in version 1.41.

## Attributes

Many common attributes are inherited from **accessory_addon_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| fuel_tank_size | float | 0.0 | "Fuel tank size in liters. Overrides chassis info about fuel tank size, if positive." |
| adblue_tank_size | float | 0.0 | "AdBlue/DEF tank size in liters. Overrides chassis info about adblue tank size, if positive." |

## Important Notes

"This accessory type is expected at most once on any given truck. While it is technically possible to have more than one tank type accessory (eg under different locator/accessory type name) only the first found is used for value override. Multiple occurence has undefined behavior."

Additionally, this article is noted as a work in progress and has yet to be reviewed by SCS staff, so some information may be incomplete or inaccurate.
