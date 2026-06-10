# Documentation/Engine/Configuration variables

> "Be aware that this page is obsolete, it should be updated with all comments in the future time."

The following variables configure different aspects of the game.

Some of them (global settings) are loaded from the **config.cfg** file found in the game user folder; others (associated with a player's profile) are saved in the profile folder (e.g. `<game_user_path>/profiles/<profile_id>`).

Most variables can be changed during gameplay using the console. Enter the variable name followed by the desired value and press Enter. The command **uset** can be used before the cvar name, though it is not necessary.

To determine the current and default value of a variable, enter only its name.

## Examples

```
g_police 0     (disables traffic fines)
g_colbox 1     (displays collision boxes)

r_mirror_view_distance  (might return the following)
"r_mirror_view_distance" is: "400" default:"80.0"
```

## Variables List

The following table contains configuration variables organized by name, type, default value, configuration scope, and purpose:

| Name | Type | Default | Config | Purpose |
|------|------|---------|--------|---------|
| g_additional_water_fov | float | 20.0f | global | Increase horizontal FOV used for water effect rendering |
| g_adviser | integer | 1 | profile | Adviser mode: 0 = hidden, 1 = shown, 2 = mini mode |
| g_adviser_auto_parking | integer | 1 | profile | Enable/disable auto parking feature |
| g_adviser_keep_hidden | integer | 0 | profile | Keep adviser in hidden state (do not show messages) |
| g_artist_id | integer | 0 | global | Artist specific id (0-15 range) |
| g_auto_traffic_headlights | integer | 1 | global | Enable/disable headlights from automatic traffic |
| g_autoload_ignore_autosave | integer | 0 | profile | Ignore autosaves and use only manual saves |
| g_axle_drop_auto | integer | 1 | profile | Automatic axle drop enabled |
| g_bad_weather_factor | float | 0.07 | profile | Bad weather factor; affects rainy weather probability |
| g_brake_intensity | float | 1.0 | profile | Brake intensity modifier |
| g_brake_light_all | integer | 1 | profile | Show brake light for all brakes (1) or only service/retarder/trailer (0) |
| g_cam_blinker | integer | 0 | profile | Interior camera movement based on blinker activation |
| g_cam_physics | integer | 1 | profile | Interior camera movement based on physics movement |
| g_cam_physics_value | float | 1.0 | profile | Value of interior camera physics-based movement |
| g_cam_steering | integer | 0 | profile | Interior camera movement based on steering angle |
| g_cam_steering_reverse | integer | 1.0 | profile | Interior camera movement behavior on reverse |
| g_cam_steering_value | float | 1.0 | profile | Multiplier for steering angle-based camera movement |
| g_cargo_sort | integer | 0 | global | Current cargo sort method |
| g_city_name_move | integer | 0 | global | Enable ability to move city names on map |
| g_clock_24 | integer | 1 | profile | Use 24-hour clock (1) or 12-hour clock (0) |
| g_console | integer | 0 | global | Console enabled |
| g_convoy_allow_load | integer | 0 | global | Load functionality during convoy session enabled |
| g_cruise_control_grid | float | 5.0 | profile | Digital cruise control grid step |
| g_cruise_control_smart | float | 0.0 | profile | Smart cruise control window (negative disables) |
| g_currency | integer | 0 | profile | Currency used in game |
| g_cutscenes | integer | 1 | profile | Enable/disable cutscenes |
| g_debug_interior_cam | integer | 0 | global | Draw truck geometry in interior camera mode |
| g_debug_map_limits | integer | 0 | global | Enable/disable map speed limits debugging |
| g_desktop_fadeout | float | 60 | global | Desktop UI fade-out delay (seconds) when idle |
| g_desktop_tutorial | integer | 1 | profile | Desktop tutorial enabled |
| g_developer | integer | 0 | global | Developer mode enabled |
| g_disable_hud_activation | integer | 0 | global | Specific HUD activations disabled |
| g_engine_start_auto | integer | 1 | profile | Engine automatic start enabled |
| g_fahrenheit | integer | 0 | profile | Display temperature in fahrenheit (1) or celsius (0) |
| g_fatigue | integer | 1 | profile | Fatigue simulation state |
| g_flyspeed | float | 100.0 | global | Debug camera fly speed |
| g_force_economy_reset | integer | 0 | profile | Force economy reset; player should be free-roaming |
| g_force_load_selector | integer | 0 | profile | Force appearance of load slot selector |
| g_force_online_lscrs | integer | 0 | global | Force online loading screens |
| g_fps | integer | 0 | global | Display FPS in mini console |
| g_fuel_simulation | integer | 0 | profile | Realistic fuel consumption enabled |
| g_gallon | integer | 0 | profile | Display volume as gallon (1) or liters (0) |
| g_gfx_advanced | integer | 0 | global | Graphics settings mode (0 = simple, 1 = advanced) |
| g_gfx_all_scales | integer | 0 | global | Enable all rendering scales in UI |
| g_gfx_quality | integer | -1 | global | Quality presets (-1 = custom) |
| g_global_force_load_selector | integer | 0 | global | Force load slot selector for all profiles |
| g_grass_density | integer | 2 | global | Grass density setting |
| g_hardcore_simulation | integer | 0 | profile | Air brake simulation enabled |
| g_hmd_no_3d_background | integer | 0 | profile | Disable 3D background for menu |
| g_hmd_no_artifical_movement | integer | 0 | profile | Disable artificial angle-based interior movement |
| g_hmd_no_special_menu | integer | 0 | profile | Disable special menu UI variants for HMD |
| g_hmd_reduced_cabin_movement | integer | 1 | profile | Reduce cabin movement |
| g_hshifter_layout | integer | 0 | profile | Type of H-shifter layout |
| g_hshifter_layout_shifting | integer | 1 | profile | Layout analyzed for realistic shifting sounds |
| g_hshifter_synchronized | integer | 1 | profile | Behave/sound like synchronized transmission |
| g_hud_speed_limit | integer | 1 | profile | Speed limit state on adviser |
| g_ignore_low_fps | integer | 0 | global | Enable/disable low frame rate warnings |
| g_income_factor | float | 1.0 | profile | Income factor multiplier (0.0-1.0 range) |
| g_input_configured | integer | 0 | profile | Input configured |
| g_interior_camera_zero_pitch | integer | 0 | global | Ignore default mouse position in truck interior (HMD) |
| g_job_distance_limit | float | -1.0 | profile | Job generation distance limit (negative = no limit) |
| g_kdop_preview | integer | 0 | global | Enable/disable k-DOP preview |
| g_lang | string | en_gb | profile | Currently used language |
| g_lang_set | integer | 1 | profile | Language set manually |
| g_light_distance_factor | float | 1.0 | global | Light fade start distance multiplier |
| g_light_span_factor | float | 1.0 | global | Light fade span multiplier |
| g_line_sort | integer | 0 | global | Current line sort criteria for jobs |
| g_lod_factor_parked | float | 1.0 | global | LOD distances for parked vehicles multiplier |
| g_lod_factor_pedestrian | float | 1.0 | global | LOD distances for pedestrians multiplier |
| g_lod_factor_traffic | float | 1.0 | global | LOD distances for traffic vehicles multiplier |
| g_max_convoy_size | integer | 8 | global | Maximum convoy size in multiplayer |
| g_menu_aa_limit | integer | 8 | global | Tile count threshold for menu SSAA |
| g_minicon | integer | 0 | global | Mini console enabled |
| g_mm_help_shown | integer | 0 | global | First mod manager welcome screen indicator |
| g_motor_brake_auto | integer | 0 | profile | Automatic engine brake usage |
| g_mph | integer | 0 | profile | Use miles (1) or kilometers (0) |
| g_news | integer | -1 | global | Online news enabled |
| g_online_loading_screens | integer | -1 | global | Online loading screens enabled |
| g_parking_difficulty | integer | 0 | profile | Parking difficulty |
| g_pedal_clutch_range | float | 1.0 | profile | Clutch range |
| g_pedestrian | integer | 1 | global | Pedestrian generation enabled |
| g_police | integer | 1 | profile | Police simulation enabled |
| g_pounds | string | kg | profile | Weight unit setting |
| g_radio_mode | integer | 1 | global | Radio player mode |
| g_rain_reflect_actor | integer | 1 | global | Reflect game actor in rain |
| g_rain_reflect_cache | integer | 1 | global | Reflect geometry cache in rain |
| g_rain_reflect_hookups | integer | 1 | global | Reflect hookups in rain |
| g_rain_reflect_traffic | integer | 1 | global | Reflect traffic in rain |
| g_rain_reflection | integer | 3 | global | Rain reflection quality |
| g_reflection | integer | 3 | global | Reflection detail |
| g_reg_setting | string | No default | profile | Regional settings unit name |
| g_remove_missing_accessories | integer | 0 | profile | Remove unavailable accessories |
| g_retarder_auto | integer | 0 | profile | Automatic retarder usage |
| g_save_format | integer | 0 | global | Game save storage format |
| g_save_idx | integer | 1 | profile | Current profile save index |
| g_screenshot_on_bug | integer | 0 | global | Auto-generate screenshots on bug report |
| g_show_game_elements | integer | 1 | global | Activation points enabled |
| g_start_in_truck | integer | 0 | profile | Skip desktop and start in truck |
| g_steam_browser | integer | 1 | global | Use Steam browser or user default browser |
| g_steam_rich_presence | integer | 1 | global | Steam rich presence enabled |
| g_steam_screenshots | integer | 2 | global | Steam screenshot handling method |
| g_steer_autocenter | integer | 1 | profile | Steering wheel autocenter enabled |
| g_texture_usage_stats | integer | 0 | global | Print texture usage statistics |
| g_throttle_auto_shift | integer | 0 | profile | Auto gearbox uses throttle for shifting |
| g_tooltip_delay | float | 0.4 | global | Tooltip display delay (seconds) |
| g_toy_physics | integer | 1 | profile | Toy physics movement simulation |
| g_trackir | integer | 1 | global | TrackIR support enabled |
| g_traffic | float | 1.0 | global | Traffic intensity (0.0-10.0 range) |
| g_trailer_stability | float | 0.5 | profile | Trailer stability factor |
| g_trans | integer | 0 | profile | Transmission type |
| g_truck_light_quality | integer | 1 | global | Headlight result quality |
| g_truck_light_specular | integer | 1 | global | Specular use in headlight calculation |
| g_tutorial | integer | 1 | profile | Tutorial enabled |
| g_use_speed_limiter | integer | 1 | profile | Speed limiter enabled |
| g_veg_detail | integer | 2 | global | Vegetation detail (0=low, 1=medium, 2=high) |
| g_vehicle_flare_lights | integer | 1 | global | Vehicle flare lights enabled |
| i_virtual_cursor_speed | float | 500.0 | global | Gamepad cursor speed (pixels/second) |
| p_profile_draws | integer | 0 | global | Profile draw calls |
| r_anisotropy_factor | float | 0.25 | global | Anisotropy factor |
| r_cloud_shadows | integer | 1 | global | Cloud shadows enabled |
| r_color_correction | integer | 1 | global | Color correction state |
| r_color_cyan_red | float | 0.0 | global | Cyan-red color correction factor (-1 to 1) |
| r_color_magenta_green | float | 0.0 | global | Magenta-green color correction factor (-1 to 1) |
| r_color_saturation | float | 1.0 | global | Color saturation factor (1.0 = neutral) |
| r_color_yellow_blue | float | 0.0 | global | Yellow-blue color correction factor (-1 to 1) |
| r_deferred | integer | 1 | global | Deferred rendering enabled |
| r_deferred_debug | integer | 0 | global | Deferred renderer debug mode |
| r_deferred_mirrors | integer | 1 | global | Use deferred rendering for mirrors |
| r_device | string | dx9 | global | Render device (dx9, dx11, gl) |
| r_dof | integer | 1 | global | Depth Of Field effect enabled |
| r_dof_filter_size | float | 0.5 | global | Depth Of Field filter size |
| r_dof_start | float | 200.0 | global | Depth Of Field starting range |
| r_dof_transition | float | 400.0 | global | Depth Of Field blur range length |
| r_fake_shadows | integer | 2 | global | Fake shadows state |
| r_fullscreen | integer | 1 | global | Fullscreen enabled |
| r_gamma | float | 1.0 | global | Gamma correction factor (fullscreen only) |
| r_hdr | integer | 1 | global | HDR enabled |
| r_manual_stereo_buffer_scale | float | 1.0 | global | Stereo buffer creation scale factor |
| r_manual_stereo_in_menu | integer | 1 | global | Manual stereo enabled in menu |
| r_manual_stereo_ui_dist | float | 0.8 | global | UI draw plane distance (stereo) |
| r_manual_stereo_ui_dist_game | float | 0.5 | global | UI draw plane distance (stereo, gameplay) |
| r_manual_stereo_ui_fov | float | 80 | global | Manual stereo UI field of view |
| r_manual_stereo_ui_fov_game | float | 100 | global | Manual stereo UI FOV (gameplay) |
| r_minimal_unfinished_frames | integer | 0 | global | Simulate bigger tracking completion queue |
| r_mirror_scale_x | float | 1.0 | global | X-axis mirror rendering scale |
| r_mirror_scale_y | float | 1.0 | global | Y-axis mirror rendering scale |
| r_mirror_view_distance | float | 80.0 | global | Mirror view distance |
| r_mlaa | integer | 1 | global | MLAA anti-aliasing enabled |
| r_mlaa_threshold | float | 1.0 | global | MLAA edge threshold |
| r_mode | string | No default | global | Current resolution format: {width}x{height}x{depth}x{rate} |
| r_multimon_border_fov_left | float | 0 | global | Additional left camera offset angle |
| r_multimon_border_fov_right | float | 0 | global | Additional right camera offset angle |
| r_multimon_exterior_in_aux | integer | 0 | global | Render exterior in auxiliary view |
| r_multimon_fov_horizontal | float | 50 | global | Horizontal FOV for multi-monitor |
| r_multimon_fov_vertical | float | 0 | global | Vertical FOV for multi-monitor |
| r_multimon_interior_in_main | integer | 1 | global | Render interior in main views |
| r_multimon_mode | integer | 0 | global | Multi-monitor mode control |
| r_multimon_rotation_aux | float | 0 | global | Auxiliary monitor roll |
| r_multimon_rotation_center | float | 0 | global | Center monitor roll |
| r_multimon_rotation_left | float | 0 | global | Left monitor roll |
| r_multimon_rotation_right | float | 0 | global | Right monitor roll |
| r_multimon_vert_offset_left | float | 0 | global | Left monitor vertical offset |
| r_multimon_vert_offset_right | float | 0 | global | Right monitor vertical offset |
| r_no_frame_tracking | integer | 0 | global | Disable frame tracking feature |
| r_normal_maps | integer | 1 | global | Normal mapping enabled |
| r_nowmi | integer | 0 | global | Disable WMI for graphics card memory detection |
| r_nv_stereo_mode | integer | 2 | global | NV 3D vision stereo handling |
| r_path | string | No default | global | Render path |
| r_scale_x | float | 1.0 | global | X-axis rendering scale |
| r_scale_y | float | 1.0 | global | Y-axis rendering scale |
| r_segment_buffer_size | integer | 128 | global | Segment buffer size (MB) |
| r_setup_done | integer | 0 | global | Default graphics settings setup complete |
| r_show_light_pixel_coverage | integer | 0 | global | Show light debugging helpers |
| r_startup_progress | integer | 0 | global | Game startup progress indicator |
| r_sun_shadow_quality | integer | 4 | global | Sun shadow quality |
| r_sun_shadow_texture_size | integer | 4096 | global | Sun shadow texture size |
| r_sunshafts | integer | 1 | global | Sunshafts enabled |
| r_texture_detail | integer | 0 | global | Texture detail (mipmap skip level) |
| r_use_depth_bounds | integer | 1 | global | Use depth bounds for light rendering speedup |
| r_vsync | integer | 1 | global | Vertical synchronization enabled |
| r_wireframe | integer | 0 | global | Wireframe rendering enabled |
| s_air_noise | float | 1.0 | profile | Sound of air at high speed |
| s_interior_volume | float | 1.0 | profile | Interior sound volume multiplier |
| s_master_volume | float | 1.0 | profile | Master volume |
| s_music_enabled | integer | 1 | profile | Music enabled |
| s_music_volume | float | 0.8 | profile | Music volume |
| s_radio_volume | float | 1.0 | profile | Radio volume |
| s_reverse_enabled | integer | 1 | profile | Reverse sound enabled |
| s_reverse_stereo | integer | 0 | profile | Stereo reversed |
| s_rumble_enabled | integer | 1 | profile | Rumble sound enabled |
| s_sfx_enabled | integer | 1 | profile | Sound effects enabled |
| s_sfx_volume | float | 1.0 | profile | Sound effects volume |
| s_wheel_noise | float | 1.0 | profile | Sound of wheels at high speed |
| sys_info | string | No default | global | Operating system information storage |
| t_averaging_window_duration | integer | 100 | global | Frame duration averaging window (milliseconds) |
| t_averaging_window_length | integer | 10 | global | Frame duration averaging window (frame count) |
| vid_mem | string | No default | global | Video memory information |
| vid_name | string | No default | global | Graphics card name information |
| vid_ver | string | No default | global | Graphics card driver version information |
