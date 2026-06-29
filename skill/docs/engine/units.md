# Documentation/Engine/Units

**Source:** https://modding.scssoft.com/wiki/Documentation/Engine/Units

## What is unit?

Units are objects within the SCS game engine designed for serialization and deserialization, enabling content creators to define various game components. Each unit comprises:

- **Name**: Units can be nameless or named using 12-character tokens separated by dots (e.g., `vehicle.dummy.truck`). To create nameless units, prefix the name with a dot (e.g., `.my_mod.nameless.units`).
- **Attributes**: Data storage for numbers, text, unit connections, and collections thereof.

## SII files

Units are stored in SII (Serialized Information Interface) files, available in plain-text and binary formats. Only plain-text format is used for definitions.

### Structure

SII files follow this layout:

```
SiiNunit
{
    class_name : unit.name
    {
        attribute_number: 40
        attribute_string: "TEST STRING"
        attribute_unit: test.unit
        attribute_float3: (1.0, 1.0, 1.0)
        attribute_float_ieee754: &40490f5a
    }
}
```

### Unit definition entry

Format specification: `class name : unit name { attributes }`

### Comments

C-style multi-line comments use `/* */` syntax:

```
/* Definition of some unit.
 * Author: You */
```

Single-line comments use `#` or `//`:

```
some_unit : .my_mod.unit // Comment
{
    value: 45.875  # Inline comment
}
```

### Includes

The `@include` directive incorporates external file contents:

```
@include "filename.sui"
```

**Requirements**: The directive must begin a new line with no preceding whitespace. Inline usage is prohibited.

Use the `.sui` extension for included serialized unit files without the `SiiNunit` header.

## Attribute types

| Type | Value Format | Example | Notes |
|------|--------------|---------|-------|
| string | "x" | `attribute: "String value"` | Text data |
| float | x | `attribute: 1.0` or `&3f800000` | Decimal or IEEE754 hex notation |
| float2 | (x, y) | `(1.0, 2.0)` | Two-component vector |
| float3 | (x, y, z) | `(1.0, 5.0, 3.0)` | Three-component vector |
| float4 | (x, y, z, w) | `(1.0, 5.0, 3.0, 9.0)` | Four-component vector |
| placement | (x, y, z) (w; x, y, z) | `(0, 0, 0) (1; 0, 0, 0)` | Position and rotation |
| fixed | x | `attribute: 10` | Integer fixed-point |
| fixed2 | (x, y) | `(10, 22)` | Two-component fixed |
| fixed3 | (x, y, z) | `(10, 22, 33)` | Three-component fixed |
| fixed4 | (x, y, z, w) | `(10, 22, 33, 44)` | Four-component fixed |
| int2 | (x, y) | `(20, 69)` | Two-component integer |
| quaternion | (w, x, y, z) | `(1.0, 0.0, 0.0, 0.0)` | Rotation quaternion |
| s16 | x | `attribute: -15` | Signed 16-bit integer |
| s32 | x | `attribute: -15` | Signed 32-bit integer |
| s64 | x | `attribute: -15` | Signed 64-bit integer |
| u16 | x | `attribute: 15` | Unsigned 16-bit integer |
| u32 | x | `attribute: 15` | Unsigned 32-bit integer |
| u64 | x | `attribute: 15` | Unsigned 64-bit integer |
| bool | x | `true` or `false` | Boolean value |
| token | x | `attribute: value` | Alphanumeric string, max 12 characters, lowercase and underscore only |
| owner_ptr | x | `attribute: .some.nameless.unit` | References units within same SiiNunit |
| link_ptr | x | `attribute: some.named.unit` | References named units defined elsewhere |
| resource_tie | "x" | `"path/to/resource.pma"` | Binds animations to models |

### Arrays

Standard array syntax:

```
attribute_name[]: value
attribute_name[]: value2
attribute_name[]: value3
```

Fixed-array format:

```
attribute_name: 3           (size)
attribute_name[0]: 1        (element 1)
attribute_name[1]: 5        (element 2)
attribute_name[2]: 9        (element 3)
```

## Documented Unit Types

- accessory addon data
- accessory addon int data
- accessory addon int ui data
- accessory addon tank data
- accessory addon trailer cables data
- accessory cabin data
- accessory cargo data
- accessory chassis data
- accessory data
- accessory engine data
- accessory horn addon data
- accessory interior data
- accessory paint job data
- accessory rim data
- accessory sound data
- accessory trailer body data
- accessory transmission data
- accessory truck data
- accessory wheel data
- cargo data
- cargo def
- cargo model match
- company def
- company permanent
- dynamic cargo data
- glass pane data
- journey events cutscene
- journey events road event
- package version info
- sound data
- sound data voice navigation
- sound engine data
- sound noise data
- trailer
- trailer cable data
- trailer configuration
- trailer def
- transmission names
- vehicle accessory
- vehicle addon accessory
- vehicle paint job accessory
- vehicle wheel accessory
- wiper data
