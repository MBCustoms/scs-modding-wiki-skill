# accessory_addon_int_ui_data

## Overview

The **accessory_addon_int_ui_data** unit class enables vehicle accessories that add visible components with dynamic UI screen elements. This functionality primarily customizes player vehicles with additional GPS screens, phones, clocks, and similar interactive displays.

## UI Script Access

The UI script for this accessory can access the same ID elements available to dashboard and GPS interior scripts. For detailed information, refer to the Dashboards IDs documentation.

## Attributes

This unit class inherits many common attributes from **accessory_addon_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| ui_path | string | (empty) | Path directing to the UI script that renders into the drawable component |
| ui_drawable_texture_path | string | (empty) | Path to the texture TOBJ file where the UI renders and integrates into the model as a display |
| ui_drawable_size | int2 | (0, 0) | Dimensions of the drawable texture; must be a power of two between [4, 4096] |

## Note

This article remains a work in progress pending SCS staff review, so some information may be incomplete or require updates.
