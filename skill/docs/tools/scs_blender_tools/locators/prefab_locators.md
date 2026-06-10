# Prefab Locators

Prefab locators are utilized during prefab map asset creation. These assets include roads, crosses, docking companies, services, and gas stations. The locators store data for "AI traffic connection/rules, players interactions and GPS navigation."

## Control Node

Control nodes serve three purposes: prefab control in the SCS map editor, connection to other map assets, and AI traffic entry/exit points.

Requirements for proper prefab creation:
- Prefab must have 2 to 6 control nodes
- Each control node requires a unique index via the "Node Index" property
- Multiple nodes must be placed clockwise starting with index 0
- For in-game terrain generation, control nodes need terrain points assigned on their **right** side

### Node Index

Property defining the control node's index.

### Assign Terrain Points

Operator for assigning terrain points from mesh to the control node.

### Clear All Terrain Points

Operator for clearing all terrain points from the control node.

### Preview Terrain Points [Visible|All]

Operators for previewing assigned terrain points. "Visible" shows only points from currently visible mesh; "All" includes hidden mesh points.

## Sign

Sign locators place signs or static objects like lamps and trash bins on prefabs. The "Sign Model" property determines which sign appears in-game.

> **Note:** Ensure the Sign Library path is properly configured if unable to assign signs.

### Sign Model

Property defining the sign ID for in-game use. A reload button (🗘) allows reloading the sign models library without navigating to global settings.

## Spawn Point

Spawn point locators define predefined action points or action result origins. Example for Euro Truck Simulator 2 company docks requires:
1. "Company Point" type defining the check-in point
2. "Unload (Easy)" type defining the parking location

### Spawn Type

Property defining the spawn point type.

## Traffic Semaphore

Traffic semaphore locators define stop and go actions for AI traffic. Primarily used for traffic lights, they can also trigger other game-defined actions like AI refueling at gas stations.

Behavior is determined by the "Profile" and bound to a user-specified "ID," which navigation points reference.

### ID

Property defining the semaphore ID.

### Profile

Property defining the profile from the Traffic Semaphore Library, establishing behavior including intervals/distances and cycle delays. A reload button (🗘) allows library reloading without accessing global settings.

> **Note:** Verify the Traffic Semaphore Library path is properly set if unable to assign profiles.

### Type

Property defining semaphore type. In most cases, "(use profile)" should be selected, allowing the profile to define all intervals/distances and cycle delays.

### Intervals/Distances [G,O,R,O]

Properties defining intervals/distances for each traffic semaphore state. Only enabled when the type is not "(use profile)".

### Cycle Delay

Property defining delay before each semaphore cycle restarts. Only enabled when the type is not "(use profile)".

## Navigation Point

Navigation Point locators create AI traffic lanes with curves. These lanes define driving paths for AI cars inside prefabs and must connect control nodes properly. Navigation points at each end require boundary lanes for traffic from/to connected map assets.

If no traffic is desired, no navigation points should be created.

### Low Probability

Property defining reduced visiting probability for AI cars.

### Additive Priority

Property indicating that the "Priority Modifier" value will be added to existing lane priority.

### Limit Displacement

Property defining extra limited displacement for AI cars.

### Allowed Vehicles

Property defining vehicle types suitable for AI traffic curves starting at this navigation point. AI cars attempt most suitable curves but can use any if preferred curves are unavailable.

### Blinkers [Left Blinker|No Blinker|No Blinker (forced)|Right Blinker]

Property defining blinker usage for incoming AI traffic curves.

### Priority Modifier

Property defining vehicle priority when entering the next curve. Set priority only on navigation points where the next curve intersects opposite lanes or merges multiple curves.

> **Note:** Improperly set modifiers will generate game errors for correction.

### Traffic Semaphore

Property binding a Traffic Semaphore to AI lanes by ID matching. When the semaphore's "ID" matches this property, AI follows semaphore rules.

### Traffic Rule

Property defining additional AI rules like city areas, motorways, or stop lines from the Traffic Rules Library. A reload button (🗘) allows library reloading.

> **Note:** Avoid speed limit rules; signs now regulate speed limits.

> **Note:** Verify the Traffic Rules Library path if the list appears empty.

### Boundary

Property defining input/output AI traffic lanes for the selected "Boundary Node."

> **Note:** Each control node allows only one unique boundary value; identical input/output lanes cannot repeat across multiple navigation points for the same control node.

### Boundary Node

Property binding the control node using this navigation point's "Boundary" setting. Only relevant when "Boundary" has a value.

### Connect/Disconect Navigation Points

Operator connecting/disconnecting two navigation points into curves. Two navigation points must be selected; selection order determines curve direction.

## Map Point

Map Point locators visualize prefabs on world maps and GPS navigation. Proper connections are essential—cross prefabs connect node-to-node, while company prefabs use "Polygon" visualization.

Connections depend on "Road Size":
1. **Polygon** - Map points connect in closed quads (for building visualization)
2. **Other options** - Map points lead node-to-node (like Navigation Point locators)

### Road Over

Property marking this map point for drawing after map points without this flag.

### No Outline

Property marking no outline drawing, useful for building visualization.

### No Arrow

Property marking no "green" pointing arrow on GPS navigation, useful for prefabs with multiple control nodes and clear navigation paths.

### Prefab Exit

Property marking this map point as a prefab exit, stopping GPS navigation visualization. Useful for company docks.

### Road Size

Property defining the road type visualization. "Polygon" visualizes polygons instead of roads, connecting with 3 others into quads and enabling "Custom Color" selection.

### Road Offset

Property defining center offset between road lanes.

### Custom Color

Property allowing custom color type selection when "Road Size" is "Polygon." Three custom colors exist:
1. **Light** - Accessible prefab areas
2. **Dark** - Buildings
3. **Green** - Grass and inaccessible areas

### Assigned Node

Property binding map points to control nodes, required for entry/exit GPS navigation points.

### Destination Nodes

Property defining control nodes for GPS navigation from this map point. Use only when map point neighbors have multiple neighbors and this map point lacks "Assigned Node."

### Connect/Disconnect Map Points

Operator connecting/disconnecting two map points for world map and GPS navigation lines. Two map points must be selected; order doesn't matter as connections are undirected.

## Trigger Point

Trigger points mark prefab areas where actions occur. Actions come from the Trigger Action Library and trigger when players enter polygon or sphere areas.

Example usage includes marking rest areas in Euro Truck Simulator 2 with polygons.

### Action

Property defining the action triggered when players enter the area. Available actions load from the Trigger Actions Library. A reload button (🗘) allows library reloading.

> **Note:** Verify the Trigger Actions Library path if unable to assign actions.

### Range

Property defining trigger point range or activation area. For "Sphere Trigger," this defines the sphere radius; otherwise, it defines vertical range.

### Reset Delay

Property defining seconds required outside the trigger area before reactivation.

### Sphere Trigger

Property defining whether this trigger behaves as a sphere. Sphere triggers should not connect to other trigger points.

### Partial Activation

Property defining that border contact alone triggers the action.

### One Time Activation

Property defining that this trigger activates only once.

### Manual Activation

Property defining that players must manually activate actions once inside the trigger area.

### Connect/Disconnect Trigger Points

Operator connecting/disconnecting trigger points into areas. Ensure trigger areas form closed n-gons. Two points must be selected; order doesn't matter as connections are undirected.
