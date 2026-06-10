# Documentation/Engine/Game data/Player trucks definitions

Player truck definitions consist of two components:

- **Vehicle parts definitions** describe the characteristics of the truck and its many accessories. These serve as building blocks that must be assembled.

- **Vehicle configurations** assemble the parts definitions into a vehicle that may be driven or purchased. They provide instructions for assembling the building blocks into a playable vehicle.

## Vehicle Parts Definitions

Each truck is configured in its own folder (e.g. `<brand.truck>`) containing:

1. **SII file: data.sii** — defines truck info, cameras, fallback rules for truck parts and required accessories. Eight mandatory fallback rules are: chassis, cabin, interior, engine, transmission, f_wheel (or f_tire), r_wheel (or r_tire), paint_job and head_light.

2. **Subfolders** — (chassis, cabin, interior, engine, transmission, paint_job, head_light, sound) define different parts and accessories. The first 7 folders are required due to mandatory fallback rules; the sound folder is needed for truck mandatory sounds definitions.

3. **Optional accessory folder** — defines all possible accessories users can install in the Upgrade Shop. Sub-folders separate different accessory types and correspond to model locator names in the truck's 3D model.

### Directory Structure

```
Root game folder
├ def
  ├ vehicle
    ├ truck
      ├ <brand.truck>
      │ ├ accessory
      │ │ ├ beacon
      │ │ │ ├ shape1.sii
      │ │ │ └ ...
      │ │ └ ...
      │ ├ cabin
      │ ├ chassis
      │ ├ engine
      │ ├ head_light
      │ ├ interior
      │ ├ paint_job
      │ ├ transmission
      │ └ data.sii
      ├ <2nd_brand.truck>
      ├ ...
      └ fallback.sii
```

## Vehicle Configurations

Three types of player truck configurations exist:

1. **Dealers** — located in `/def/vehicle/truck_dealer/` (with `/def/vehicle/truck_dealer_uk/` for RHD variants).

2. **Desktop preview** — located in `/def/vehicle/truck_desktop/` (with `/def/vehicle/truck_desktop_uk/` for RHD variants).

3. **Quick Jobs trucks** (optional) — located in `/def/vehicle/truck_company/` (with `/def/vehicle/truck_company_uk/` for RHD variants).

### Directory Structure

```
Root game folder
├ def
  ├ vehicle
    ├ truck_company
    │ ├ double
    │ ├ heavy
    │ ├ oversize
    │ ├ <brand>_truck_a.sii
    │ └ ...
    ├ truck_company_uk
    ├ truck_dealer
    │ ├ <brand>
    │ │ ├ some_truck.sii
    │ │ └ ...
    ├ truck_dealer_uk
    ├ truck_desktop
    │ ├ some_truck.sii
    │ └ ...
    ├ truck_desktop_uk
    ├ truck_used
    │ ├ <brand>
    │ │ ├ some_truck.sii
    │ │ └ ...
    ├ truck_used_uk
    └ ...
```
