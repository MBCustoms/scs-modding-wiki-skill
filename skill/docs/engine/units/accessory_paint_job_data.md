# accessory paint job data

The **accessory_paint_job_data** unit class is used to define paint jobs for trucks and trailers (as of ETS2 1.25/ATS 1.4).

## Usage

### Airbrush

In airbrush mode, the RGB of **paint_job_mask** is blended with the base color, using the alpha channel as the blend factor. This mode activates when the **airbrush** attribute is set to _true_.

### Colormask

In colormask mode, each of **paint_job_mask**'s color channels (RGB) acts as a mask for a color being blended over the base texture. They are applied in the order _blue_, _green_, and _red_. The red channel has the highest "priority", followed by green and then blue.

**TIP:** Texture compression can lead to minor aliasing at sharp boundaries between mask channels. To prevent colors from "bleeding through" at these boundaries, blend the lower-priority channel 'under' the higher-priority channel along their shared boundary. For example, at a sharp boundary between red (255, 0, 0) and green (0, 255, 0) channels, a thin line of base color may be visible. This can be mitigated by extending the edge of the lower-priority mask 'under' the higher-priority mask. In the case of a sharp line between red and green masks, extend the green mask slightly into the red mask area. The resultant RGB color would be yellow (255, 255, 0).

## Attributes

Many common attributes are inherited from **accessory_data**.

| Name | Type | Default Value | Modes | Description |
|------|------|---------------|-------|-------------|
| mask_r_color | float3 | (1, 0, 0) | colormask | Defines the default color applied to each channel of the color mask. |
| mask_g_color | float3 | (0, 1, 0) | colormask | Defines the default color applied to each channel of the color mask. |
| mask_b_color | float3 | (0, 0, 1) | colormask | Defines the default color applied to each channel of the color mask. |
| base_color | float3 | (1, 1, 1) | all | Defines the default color of the paint job. |
| mask_r_locked | bool | true | colormask | When false, the player may change the channel's color via the color picker. |
| mask_g_locked | bool | true | colormask | When false, the player may change the channel's color via the color picker. |
| mask_b_locked | bool | true | colormask | When false, the player may change the channel's color via the color picker. |
| base_color_locked | bool | true | all | When false, the player may change the base color via the color picker. |
| flip_color_locked | bool | true | flipflake | When false, the player may change the flip color via the color picker. |
| flake_color_locked | bool | true | flipflake | When false, the player may change the flake color via the color picker. |
| flip_color | float3 | (1, 0, 0) | flipflake | Defines the color of the flip effect. |
| flip_strength | float | 0.27 | flipflake | Defines the relative strength of the flip effect. |
| flake_color | float3 | (0, 1, 0) | flipflake | Defines the color of the flake effect. |
| flake_uvscale | float | 32.0 | flipflake | Defines how many times the flake_noise texture repeats within one UV tile. |
| flake_density | float | 1.0 | flipflake | Defines how 'tight' the flake effect is to the specular highlight. Higher values result in a smaller area; smaller values result in a broad area. |
| flake_shininess | float | 50.0 | flipflake | Defines flake shininess. |
| flake_clearcoat_rolloff | float | 2.2 | flipflake | Adjusts the sharpness of the clearcoat specular highlight. Higher values yield sharper edges. |
| flake_noise | string | "/material/custom/flake_noise.tobj" | flipflake | Path to the flipflake texture. RGB multiplies the flake_color; alpha masks the flake effect. |
| flipflake | bool | false | all | When true, flipflake (metallic/pearlescent) behavior and attributes are enabled. Cannot be used with colormask. |
| airbrush | bool | false | all | When true, airbrush behavior and attributes are enabled. Cannot be used with colormask. |
| alternate_uvset | bool | false | all | When true, the resulting material will have the _altuv_ flavor, triggering the alternate UV layout if configured. |
| stock | bool | false | all | Defaults to false. This was previously used to mark paintjobs available when purchasing a truck when true. Currently must be set to false to avoid undesirable behavior. |
| paint_job_mask | string | (empty) | all | Defines the path to the texture resource (.tobj) for color masking (colormask) or blending (airbrush). If empty, mask is ignored. |
| base_texture_override | string | (empty) | all | Defines the path to a texture resource (.tobj) to override the base texture of the truckpaint material(s). If empty, the base texture will be used as defined in the materials. |
