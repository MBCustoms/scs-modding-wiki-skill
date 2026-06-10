# Package version info

**Package version info** is a unit containing workshop mod package information, such as the folder or archive name and compatible game versions. It appears in each workshop mod's `versions.sii` file.

## Special Case: Universal Version

Each workshop mod's `versions.sii` file may have a single package version info without defined `compatible_versions`, called the "universal version." This associated package applies to all game versions not explicitly defined by other package version info units in the `versions.sii` file.

## Attributes

| Name | Type | Required/Optional | Description |
|------|------|-------------------|-------------|
| package_name | string | Required | The folder or archive name with version-specific mod content. For zip archives, this is the filename without extension. |
| compatible_versions | string array | Optional | Array of versions compatible with this definition. If unspecified, the package applies to all game versions without explicit definitions. **Important:** Each `versions.sii` can only contain one `package_version_info` unit without this parameter. |
| informational | bool | Optional | When true, indicates the package contains information only. Defaults to false if unspecified. |

## Raw Unit Definition

```
"package_version_info":{
 "superclass":"unit",
 "attrs":{
  "package_name":{
   "type": "string"
  },
  "compatible_versions":{
   "type": "string_array"
  },
  "informational":{
   "type": "bool"
  }
 }
```

## See Also

Tutorial: How to Use Mod Versioning
