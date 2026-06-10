# Documentation/Tools/SCS Workshop Uploader/versions.sii

In Steam Workshop mods, you must include a unit file called "versions.sii" that defines which content folder applies to each game version.

This file contains a set of `package_version_info` serialized unit information with appropriate attributes.

## Example File

```
SiiNunit
{
package_version_info : .latest {
	package_name: "latest"
}
package_version_info : .122.content {
	package_name: "content_122"
	compatible_versions[]: "1.22.*"
}
package_version_info : .120and121.content {
	// No special difference between 1.20 and 1.21
	package_name: "content_120_121"
	compatible_versions[]: "1.20.*"
	compatible_versions[]: "1.21.*"
}
}
```

The structure uses `package_version_info` units to map content folders to specific game versions through the `compatible_versions` array, allowing a single mod to support multiple game versions with different content packages.
