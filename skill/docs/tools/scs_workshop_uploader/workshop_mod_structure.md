# Workshop mod structure

The standard mod consists of a single **package** containing a manifest.sii file, description and icon files, plus mod data files. Workshop mods can contain multiple **packages**, allowing you to provide different versions for users on various game versions through a single Workshop mod submission. The **versions.sii** file specifies which **package** to use for each game update. Note that this multi-package structure applies only to Workshop mods; standard mods continue using the single package approach.

Each package directly contains mod metadata (manifest.sii, description, icon) and mod data files.

Starting with SCS Workshop Uploader version 1.0.38, packages may contain subdirectories or files that mount only when the corresponding DLC is owned. If the mod root contains a "base" directory, "base.zip" archive, or directories/archives prefixed with "dlc_", the game mounts only parts matching owned DLCs. The "base" part always mounts if present. Mod manifest and metadata remain in the package.

With new-style packages, each directory or zip archive validates separately, with only game base data and matching DLC mounted for validation. If you need additional DLCs mounted, list them in the manifest's **dlc_dependencies** array.
