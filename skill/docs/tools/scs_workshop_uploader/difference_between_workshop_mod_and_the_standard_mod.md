# Difference between Workshop mod and the Standard mod

## Differences between standalone and workshop mods

- Workshop mods have a specific layout. See details in the Workshop mod Structure page.
  - A root directory containing the `versions.sii` file.
  - Subdirectories containing each version of the mod pointed by the `versions.sii` file, where the actual mod files reside.
  - New version subdirectories should be created when the mod becomes incompatible with changes introduced by new versions of the game, to keep backwards compatibility for people using old versions.

- The following configuration directives should be removed from the version subdirectories' `manifest.sii` files:
  - **compatible_versions**: inherited from the `versions.sii` file
  - **display_name**: uses the name configured in the SCS Workshop Uploader tool

- Standard mods require taking care of their distribution, and users need to manually update them upon new releases.
- Steam Workshop mods are automatically updated to the subscriber when a new version is uploaded.
- Steam Workshop mods also are capable of selecting specific mod versions known to work in specific game versions, when available, allowing for automatic backwards compatibility.
