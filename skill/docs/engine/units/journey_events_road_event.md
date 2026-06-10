# journey_events_road_event

The **journey_events_road_event** unit class defines Random Road Events in the SCS game engine.

## Overview

This unit class manages random road events with cutscene attributes that utilize link pointers to `journey_events_cutscene` units for connecting cutscene data to each event.

## Attributes

| Name | Type | Default | Description |
|------|------|---------|-------------|
| name | string | | Event name/description |
| set_idx | unsigned | | Index determining 'master' attributes set |
| start_cutscene | link_ptr | NULL | Initial cutscene |
| end_cutscene | link_ptr | NULL | Final cutscene |
| layer_cutscenes | array<link_ptr> | | Cutscenes between start/end for stacked elements |
| mirror_cutscenes | array<link_ptr> | | Opposite direction cutscenes |
| layer_min_curve | array<float> | | Minimum road curvature per layer (degrees) |
| layer_max_curve | array<float> | | Maximum road curvature per layer (degrees) |
| min_length | float | -1.0 | Minimal event length (meters) |
| max_length | float | 10000.0 | Maximal event length (meters) |
| min_shoulder_space | float | -1.0 | Minimal shoulder width (meters) |
| max_shoulder_space | float | 100.0 | Maximal shoulder width (meters) |
| traffic_block | bool | false | Block outermost lane requirement |
| weight | float | 1.0 | Generation probability weight |
| countries | array<token> | | Allowed country tokens |
| excluded_countries | array<token> | | Excluded country tokens |
| min_time_constraint | unsigned | 0 | Minimum spawn time (game minutes) |
| max_time_constraint | unsigned | 1440 | Maximum spawn time (game minutes) |
| min_duration | unsigned | 0 | Minimum duration when active (minutes) |
| area_tag | token | NULL | Limit to traffic area tag |
| slow_down_passing | bool | false | Slow adjacent lane AI vehicles |
| centerline_displacement | bool | false | Drive near centerline when passing |
| bridge_forbidden | bool | false | Prevent bridge spawning |
| tunnel_forbidden | bool | false | Prevent tunnel spawning |
| left_hand_traffic | bool | false | Traffic direction specification |
| allowed_lane_types | array<token> | | Permitted lane types |
| excluded_lane_types | array<token> | | Excluded lane types |
| allowed_road_looks | array<token> | | Permitted road appearance tokens |
| remove_map_sign | bool | | Remove conflicting speed limit signs |
| inner_lane_allowed | bool | false | Allow innermost lane placement |
| center_lane_allowed | bool | false | Allow center lane placement |
| outer_lane_allowed | bool | false | Allow outermost lane placement |
| allowed_lanes_count | array<unsigned> | | Permitted lane count specifications |
| mirror_active | bool | false | Spawn in opposite direction |
| forward_allowed | bool | true | Allow forward direction placement |
| backward_allowed | bool | true | Allow backward direction placement |
| signs_cutscenes_outer | array<link_ptr> | | Outer lane sign cutscenes |
| signs_distances_outer | array<float> | | Outer lane sign distances (meters) |
| signs_cutscenes_inner | array<link_ptr> | | Inner lane sign cutscenes |
| signs_distances_inner | array<float> | | Inner lane sign distances (meters) |
| parent | link_ptr | NULL | Parent event for attribute inheritance |

## Composition of the Road Event

Road events utilize a layered composition system where cutscenes stack sequentially between start and end points. Examples include roadwork with sign layers preceding construction layers.
