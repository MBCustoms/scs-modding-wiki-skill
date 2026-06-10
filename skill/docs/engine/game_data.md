# Documentation/Engine/Game data

**TIP:** Be aware that this page is obsolete, due to big changes in game structure with each update! For more information on structure changes check modding updates pages.

All of SCS games are using partially prescribed folder structure. This means that some resources must have the proper name and be placed into the proper folder otherwise game may malfunction or even crash. That's why this topic is giving insight to game base folder structure, its crucial resources and their place in folders.

In general, this topic is showing and describing the structure of the folders and files as you get them by using the Game Archive Extractor for two basic files with .scs extension found in game installation directory: "**base.scs**" and "**def.scs**".

## Root game folder

Root game folder consists of:

- **automat** - Material storage with generated material files produced during conversion of 3D model assets with conversion tools.
- **contentbrowser** - Folder used by Map Editor content browser.
- **custom** - Legacy folder for storing custom/modded definitions (NOTE: This folder is obsolete and might be removed in the future).
- **def** - Definitions folder (see Definitions section).
- **dlc** - Shared models used by dlc such like "dead end" sign.
- **effect** - Set of compiled shader effects used by game for rendering of any visual element.
- **font** - Fonts folder (see Fonts section).
- **map** - Storage for maps and its additional data.
- **material** - Predefined materials folder (see Predefined materials section).
- **model** - Storage for 1st generation of map assets.
- **model2** - Storage for 2nd generation of map assets.
- **prefab** - Storage for 1st generation of prefab assets.
- **prefab2** - Storage for 2nd generation of prefab map assets.
- **road_template** - Road template models for new system of road generation.
- **sound** - Sounds folder (see Sounds section).
- **system** - Low level engine resources needed for console and fall-back cases of missing resources.
- **ui** - UI definitions folder (see UI definitions section).
- **unit** - Definitions for predefined hookups spawned in game through locators, for example: light flare, light sources, no weather areas.
- **vehicle** - Vehicle model resources folder (see Vehicle model resources section).
- **video** - Video based animated textures for UI.
- **autoexec.cfg** - Configuration file which is automatically executed on game start-up.
- **version.txt** - File containing game version string.

## Definitions

Definitions for most of configurable game content like: vehicles, economy, map assets etc.

Root game folder structure includes:

```
├def
  ├animated_model
  ├camera
  ├cargo
  ├city
  ├climate
  ├company
  ├country
  ├desktop
  ├ferry
  ├initial_save
  ├regional_settings
  ├sign
  ├stamp
  ├vehicle
  ├world
  ├aux_lamp_colors.sii
  ├bank_data.sii
  ├car_colors.sii
  ├cargo.sii
  ├city.sii
  ├climate.sii
  ├company.sii
  ├country.sii
  ├economy_data.sii
  ├env_data.sii
  ├ferry.sii
  ├game_data.sii
  ├hdr.sii
  ├job_trailer_preview.sii
  ├job_truck_preview.sii
  ├job_wotr_trailer_preview.sii
  ├mail_data.sii
  ├photo_camera_data.sii
  ├police_data.sii
  ├sound_player.sii
  ├traffic_data.sii
  ├traffic_light_lamp_colors.sii
  ├trailer_preview_scene.sii
  ├truck_colors.sii
  ├truck_config_scene.sii
  ├truck_dealer_scene.sii
  └vehicle_lamp_colors.sii
```

### Camera definitions

Camera definitions folder ("**/def/camera**") is using "**camera_storage(.infix).sii**" files as storage files defining cameras that can be used by player while in game (UI interface is not handled by cameras, as UI is drawn directly on screen 2D plane). Note that this defines only storage for available in game cameras, but which camera is used in the game depends on currently user selected view and current used player vehicle.

Beside storage files camera definitions folder also includes "**cutscene.sii**" file which defines camera and its movement in different cut-scenes.

Structure:

```
├camera
  ├...
  ├ui
  ├units
  ├camera_storage.sii
  ├camera_storage.oculus.sii
  └cutscene.sii
```

### Cargo definitions

This folder contains all cargoes definitions that player can transport in the game.

Unique cargo is defined by SII file and folder having one or more SII files defining trailers which can carry this cargo. So for each cargo you have one SII file inside "**/def/cargo/**" and one or multiple SII files inside folder "**/def/cargo/<cargo_name>/**".

Structure:

```
├cargo
  ├<cargo_name_1>
  │  ├trailer.unit.name.sii
  │  └...
  ├<cargo_name_2>
  │  └...
  ├...
  ├<cargo_name_1>.sii
  ├<cargo_name_2>.sii
  └...
```

### Climate definitions

Each climate is defined in its own folder "**/def/climate/<climate_name>/**" and usually have profile SII files: one for nice weather "**nice.sii**" and second for bad weather "**bad.sii**". Climates definitions are used in Map Editor (Editor Settings -> Weather tab).

By default there should be at least two climates:

```
├climate
  ├reference
  │  ├bad.sii
  │  └nice.sii
  └...
```

### Company definitions

Companies are entry and exit places on map for player missions (e.g. trailer delivery). So when defining new company make sure to include it in company storage file "**/def/company(.infix).sii**" otherwise company won't appear in the Map Editor and later in game.

Structure:

```
├company
  ├<company_name_1>
  │  ├editor
  │  ├in
  │  └out
  ├<company_name_2>
  │  └...
  ├...
  ├<company_name_1>.sii
  ├<company_name_2>.sii
  └...
```

### Country definitions

Defines available countries that can be used in the Map Editor and later in game. While defining new country make sure to include it in country storage file "**/def/country(.infix).sii**".

Each country has its own folder defining all possible country specific data. Worth mentioning is modification of AI traffic appearing frequencies, which is done by adding SII files inside "**/def/country/<country_name>/ai/**" folder. Each SII file defines modified frequency for one AI vehicle, where its name tells which car it is. Possible file names are AI vehicles unit name suffixes used inside AI vehicle definitions (AI vehicles definitions can be found in: "**/def/vehicle/ai/**").

Structure:

```
├country
  ├<country_name_1>
  │  ├ai
  │  ├license_plates.sii
  │  └speed_limits.sii
  ├<country_name_2>
  │  ├...
  │  └...
  ├...
  ├<country_name_1>.sii
  ├<country_name_2>.sii
  └...
```

### Ferry definitions

Defines names of the ferries and their connections. For proper working in game this ferries has to be used in Map Editor while adding Ferry points. All ferries also have to be included in ferry storage file "**/def/ferry(.infix).sii**".

Connections on the other hand are defined in "**/def/ferry/connection/**" folder. Each file in that folder defines one direction connection from one ferry to second ferry. How connection is directed is defined by SiiUnit name, so for example SiiUnit name: "**conn.<ferry1>.<ferry2>**" is presenting ferry connection from <ferry1> to <ferry2>.

Structure:

```
├ferry
  ├connection
  └...
```

### Sign definitions

Sign definitions are meant for new on-the-fly sign generation system which uses:

- Image atlases which are used to combine several related image into one and use atlas entries to address only part of the image.
- Frame templates which replaces sign background images for generated ones, where quality is not compromised with scaling.

Moreover sign definitions includes projects and template folder where game saves projects and end sign templates created within Map Editor.

Structure:

```
├sign
  ├atlas
  ├frame
  ├project
  ├template
  └templates.sii
```

### Vehicle definitions

Vehicle definitions are responsible for configuration of any type of vehicles and its parts in SCS games that are not map assets. Biggest part of this configurations belongs to configuration of possible player vehicles and its parts.

```
├vehicle
  ├addon_hookups
  ├ai
  ├ai_wheel
  ├f_cover
  ├f_disc
  ├f_hub
  ├f_nuts
  ├f_rim
  ├f_tire
  ├f_wheel
  ├r_cover
  ├r_disc
  ├r_hub
  ├r_nuts
  ├r_rim
  ├r_tire
  ├r_wheel
  ├trailer
  ├truck
  ├truck_company
  ├truck_company_uk
  ├truck_dealer
  ├truck_dealer_uk
  ├truck_desktop
  ├truck_desktop_uk
  ├t_wheel
  ├addon_hookup_storage.sii
  ├physics.sii
  ├physics_interior_camera.sii
  ├rim_data.sii
  ├traffic_storage_bus.sii
  ├traffic_storage_car.sii
  ├traffic_storage_semi_trailer.sii
  ├traffic_storage_truck.sii
  ├traffic_trailer_type.sii
  ├traffic_vehicle_type.sii
  └trailer_storage.sii
```

Folder descriptions:

- **addon_hookups** - Folder for defining available libraries of players truck accessory hookups e.g. horns, interior toys or grill lights.
- **ai** - AI vehicle definitions folder.
- **ai_wheel** - AI vehicle wheel definitions containing separate definitions for front and rear wheels.
- **f_cover** - Players vehicle front wheel cover definitions.
- **f_disc** - Players vehicle front wheel rim definitions.
- **f_hub** - Players vehicle front wheel hub definitions.
- **f_nuts** - Players vehicle front wheel nuts definitions.
- **f_rim** - Obsolete. Used only for backward compatibility with 2nd gen. of players truck wheel system.
- **f_tire** - Players vehicle front tire definitions.
- **f_wheel** - Partially obsolete. Used for backward compatibility with 1st gen. of players truck wheel system and defining AI trucks front wheel.
- **r_cover** - Players vehicle rear wheel cover definitions.
- **r_disc** - Players vehicle rear wheel rim definitions.
- **r_hub** - Players vehicle rear wheel hub definitions.
- **r_nuts** - Players vehicle rear wheel nuts definitions.
- **r_rim** - Obsolete. Used only for backward compatibility with 2nd gen. of players truck wheel system.
- **r_tire** - Players vehicle front tire definitions.
- **r_wheel** - Partially obsolete. Used for backward compatibility with 1st gen. of players truck wheel system and defining AI trucks rear wheel.
- **trailer** - Trailer definitions folder.
- **truck** - Player trucks definitions folder.
- **truck_company** - Trucks configurations for Quick Jobs.
- **truck_company_uk** - Trucks configurations for RHD trucks (UK related) Quick Jobs. This folder exists only in: ETS2 game data.
- **truck_dealer** - Truck dealer definitions.
- **truck_dealer_uk** - Defines assortment of RHD trucks for dealers; has same structure as Truck dealer definitions and exists only in ETS2 game data.
- **truck_desktop** - Trucks configurations used in Truck Browser.
- **truck_desktop_uk** - Trucks configurations for RHD trucks used in Truck Browser, if player started game in UK.
- **t_wheel** - Trailer wheels definitions.

File descriptions:

- **addon_hookup_storage.sii** - Storage file for including truck accessory hookup libraries in the game. For new libraries use e.g. "**addon_hookup_storage.mymod.sii**".
- **physics.sii** - Defines players vehicle common physics parameters.
- **physics_interior_camera.sii** - Defines interior camera movement physics parameters.
- **rim_data.sii** - Defines players vehicle wheels assembling rules and backward compatibility for old game profiles using old wheels assembling system.
- **traffic_storage_bus.sii** - Storage file for AI traffic bus vehicles inclusion in game. For new AI buses use e.g. "**traffic_storage_bus.mymod.sii**".
- **traffic_storage_car.sii** - Storage file for AI traffic car vehicles inclusion in game. For new AI cars use e.g. "**traffic_storage_car.mymod.sii**".
- **traffic_storage_semi_trailer.sii** - Storage file for AI traffic semi trailers inclusion in game. For new AI semi trailers use e.g. "**traffic_storage_semi_trailer.mymod.sii**".
- **traffic_storage_truck.sii** - Storage file for AI traffic trucks inclusion in game. For new AI truck use e.g. "**traffic_storage_truck.mymod.sii**".
- **traffic_trailer_type.sii** - Defines types of AI traffic trailers for which storage files will be searched and included in game. For new trailer types use e.g. "**traffic_storage_truck.mymod.sii**".
- **traffic_vehicle_type.sii** - Defines types of AI traffic vehicles for which storage files will be searched and included in game.
- **trailer_storage.sii** - Storage file for inclusion of trailers for player. For new trailers use e.g. "**traffic_storage.mymod.sii**".

#### AI vehicle definitions

AI vehicle definition consists of AI traffic vehicles definition files and folders for them containing "**chassis.sii**" file defining chassis data of each vehicle. All of the vehicles definition files have to be included in one of traffic storage files: "**traffic_storage_bus(.infix).sii**", "**traffic_storage_bus(.infix).sii**", "**traffic_storage_bus(.infix).sii**" or any other custom defined traffic vehicle type storage file.

**Note:** Euro Truck Simulator 2 has extra: "**/def/vehicle/ai/truck/**" subfolder for grouping folders of traffic truck chassis definitions.

**Note:** This folder doesn't include trailers definitions for traffic as it's a common practice that trailers for AI traffic are defined inside Trailer definitions.

Structure:

```
├ai
  ├<ai_vehicle_1>
  │  └chassis.sii
  ├<ai_vehicle_2>
  │  └chassis.sii
  ├...
  ├<ai_vehicle_1>.sii
  ├<ai_vehicle_2>.sii
  └...
```

#### Trailer definitions

Trailer definitions defines trailers for usage with players truck or for usage by AI traffic. For defining a trailer, one SII file and folder with "**chassis.sii**" and/or additional cargo definitions has to be created. All of the trailers definition files also have to be included in one of the storage files to be used in game. In case trailer should be used by player it has to be included in one of the "**trailer_storage(.infix).sii**" files and if trailer should be used by AI trucks it has to be included in one of "**traffic_storage_semi_trailer(.infix).sii**" files or custom type of AI trailers storage file.

**Note:** AI trailers and player trailers are handled somewhat differently. Player trailers use the "**trailer**" SiiUnit class with a naming convention of `trailer.<name>`, while AI trailers use the "**traffic_trailer**" SiiUnit class and a naming convention of `traffic.trailer.<name>`.

Structure:

```
├trailer
  ├<trailer_1>
  │  ├company_paint_job
  │  │  └<trailer_look>.sii
  │  ├custom_paint_job
  │  ├<cargo_accessory>.sii
  │  ├...
  │  └chassis.sii
  ├<trailer_2>
  │  └chassis.sii
  ├...
  ├<trailer_1>.sii
  ├<trailer_1_cargo>.sii
  ├<trailer_2>.sii
  ├<trailer_2_traffic>.sii
  └...
```

#### Player trucks definitions

Player truck definitions are containing all definitions that defines trucks that player can use in game and accessories for them.

For more information see the dedicated page: Player trucks definitions.

### World definitions

Defines all world items that can be placed on the map with Map Editor and their behaviour. All of the different item types have their own definition file where items of the same type are defined.

While defining new world items alternative infixed naming of SII file shall be used e.g. for defining new static models infixed file example would be: "**model.mymod.sii**".

Structure:

```
├world
  ├building_model.sii
  ├building_scheme.sii
  ├detail_vegetation.sii
  ├detail_vegetation_def.sii
  ├hinge.sii
  ├model.sii
  ├model.custom.sii
  ├mover.sii
  ├overlay.sii
  ├overlay.custom.sii
  ├prefab.sii
  ├prefab.custom.sii
  ├railing.sii
  ├road.sii
  ├road_edge.sii
  ├road_look.sii
  ├road_look.template.sii
  ├road_material.sii
  ├road_sidewalk.sii
  ├semaphore_model.sii
  ├semaphore_profile.sii
  ├sign.sii
  ├sign.custom.sii
  ├sound_item_data.sii
  ├stamp.sii
  ├terrain_material.sii
  ├terrain_profile.sii
  ├traffic_lane.sii
  ├traffic_rules.sii
  ├traffic_rules.compat.sii
  ├trigger_action.sii
  ├vegetation.sii
  ├vegetation_model.sii
  └vegetation_old.sii
```

File descriptions:

- **building_model.sii** - Defines continuous models that can be used as curve path profile models.
- **building_scheme.sii** - Defines schemas for curve path building items (hedges, fences, electro wirings, tree avenues ...). In Map Editor used as Buildings item type.
- **detail_vegetation.sii** - Defines global detail vegetation data.
- **detail_vegetation_def.sii** - Defines detail vegetation models to texture assignments.
- **hinge.sii** - Currently unused. It defined object that could be placed on map and be swung by player truck e.g. swing doors.
- **model.sii** - Defines static map models which can be in Map Editor used as Models item type.
- **model.custom.sii** - Obsolete. Used only for backward compatibility.
- **mover.sii** - Defines map models with animations which can be in Map Editor used as Movers or Walkers item type.
- **overlay.sii** - Defines overlay names for cities and roads.
- **overlay.custom.sii** - Obsolete. Used only for backward compatibility.
- **prefab.sii** - Defines prefab map models like companies, gas stations, dealers, crossings. In Map Editor used as Prefabs item type.
- **prefab.custom.sii** - Obsolete. Used only for backward compatibility.
- **railing.sii** - Defines side roads elements like: crash barriers, anti noise barriers etc.
- **road.sii** - Basic road data definition like different road lines lengths.
- **road_edge.sii** - New template road system edge definitions.
- **road_look.sii** - Old road system definitions. In Map Editor used as Road item type.
- **road_look.template.sii** - New template road system definitions. In Map Editor used as Road item type.
- **road_material.sii** - Old road system materials definitions.
- **road_sidewalk.sii** - Old road system side walk definitions.
- **semaphore_model.sii** - Defines semaphore models that can be used in semaphore profiles.
- **semaphore_profile.sii** - Defines semaphore profiles which can be assigned to prefabs models. Used in Blender Tools or Maya.
- **sign.sii** - Defines road signs. In Map Editor used as Sign item type.
- **sign.custom.sii** - Obsolete. Used only for backward compatibility.
- **sound_item_data.sii** - Defines sound items that can be placed on map and will be triggered once player comes near. In Map Editor used as Sound item type.
- **stamp.sii** - Defines stamp brushes for brushing in Map Editor. They are used with Brush tool.
- **terrain_material.sii** - Defines terrain materials paths. Used indirectly on more map items through their properties.
- **terrain_profile.sii** - Defines terrain profiles that can be used on the sides of the road. Used indirectly on road items through properties.
- **traffic_lane.sii** - Defines general traffic lanes data like: allowed vehicles types, spawn count limits and frequencies.
- **traffic_rules.sii** - Defines traffic rules that can be used on Traffic area items in Map Editor. Additionally they can be used while creating prefab model using Blender Tools or Maya.
- **traffic_rules.compat.sii** - Obsolete. Used only for backward compatibility.
- **trigger_action.sii** - Defines action triggers that can be used to trigger different commands in game. Used in Blender Tools or Maya while creating prefab model.
- **vegetation.sii** - Defines vegetation profiles that can be used on road sides. In Map Editor they are used indirectly from properties of Road item type.
- **vegetation_model.sii** - Defines tree and bush vegetation models for usage in vegetation.sii file.
- **vegetation_old.sii** - Obsolete. Used only for backward compatibility.

## Fonts

Folder for storing game fonts. Mostly used in UI and inside vehicle dashboard displays.

Structure:

```
├font
  ├license_plate
  └sign
```

- **license_plate** - Fonts used by licence plates.
- **sign** - Fonts used by road signs.

## Predefined materials

Library of predefined materials and textures.

Structure:

```
├material
  ├...
  ├editor
  ├environment
  ├...
  ├logo
  ├...
  ├road
  ├...
  ├sign
  ├special
  ├terrain
  ├tiled
  ├ui
  └material.db
```

- **editor** - Map Editor background textures.
- **environment** - Environmental cube maps used for reflections.
- **logo** - Textures for in game company logos & SCS Software logos.
- **road** - Textures & materials for roads. Folder supports material aliasing.
- **sign** - Texture atlases & frames for new sign system.
- **special** - Special purposes texture atlases.
- **terrain** - Terrain textures & materials e.g. for grass, sand, water. Folder supports material aliasing.
- **tiled** - Collection of tillable textures.
- **ui** - Textures and materials used by UI such like buttons, windows, icons etc.
- **material.db** - Physical materials (substances) database. Names of this substances may be used on materials attribute called "Substance".

## Sounds

Library of sounds used by game.

Structure:

```
├sound
  ├ai
  ├environment
  ├mover
  ├music
  ├truck
  └ui
```

- **ai** - Sounds used by AI Traffic vehicles such like engine sounds, horns and sirens.
- **environment** - Environment ambient loops.
- **mover** - Sounds produced by mover objects in game.
- **music** - Music used in many places for example during cutscenes.
- **truck** - Truck related sounds such like engine sounds, crash sounds, trailer attach sounds etc.
- **ui** - Sound effects used when user is interacting with the UI. For example click on the UI element.

## UI definitions

Library of all UI layouts and control definitions including vehicle dashboards.

Structure:

```
├ui
  ├company_manager
  ├dashboard
  ├desc
  ├editor
  ├license_plate
  ├options
  ├template
  └...
```

- **company_manager** - Company manager UI layouts.
- **dashboard** - Truck dashboard UI layouts.
- **desc** - UI descriptors.
- **editor** - Editor UI layouts.
- **license_plate** - Licence plate UI layouts.
- **options** - Options screens UI layouts.
- **template** - UI templates (definitions of the controls look).

## Vehicle model resources

Structure:

```
├vehicle
  ├ai
  ├driver
  ├share
  ├trailer*
  ├truck
  └wheel
```

- **ai** - AI traffic vehicles models and resources of all types: cars, trucks, buses, trains.
- **driver** - Driver models for usage in AI traffic vehicles.
- **share** - Shared texture resources for vehicles.
- **trailer*** - Models and resources for player and AI traffic trailers. (*)-for ETS2 there will be "**trailer_eu**" instead.
- **truck** - Player trucks vehicles models and resources.
- **wheel** - Models and resources for all vehicle wheels except wheels for player trucks.
