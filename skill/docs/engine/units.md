# Documentation/Engine/Units

## What is unit?

Units are objects inside the SCS game engine that can be serialized or deserialized, providing content creators a way to define various game components.

A unit consists of:

- **Name**: Units can be nameless or named using 12-character tokens separated by dots (e.g., `vehicle.dummy.truck`). Create nameless units using a dot prefix like `.my_mod.nameless.units`.
- **Attributes**: Data storage for numbers, text, unit connections, and arrays.

## SII files

Units are stored in SII files in either plain-text or binary format. Only plain-text is used for definitions.

### Structure

A basic SII file contains:

```
SiiNunit
{
some_unit : .my_mod.unit
{
    attribute_number: 40
    attribute_string: "TEST STRING"
    attribute_unit: test.unit
    attribute_float3: (1.0, 1.0, 1.0)
    attribute_float_number_ieee754: &40490f5a
}
}
```

Always include a blank line at the file end.

### Unit definition entry

Format: `class name : unit name { attributes }`

### Comments

Multi-line comments use `/* */` syntax:

```
/* Definition of some unit.
 *
 * Author: You */
some_unit : .my_mod.unit
{
}
```

Single-line comments use `#` or `//`:

```
some_unit : .my_mod.unit // Some unit
{
    # This value should be tweaked after users feedback
    some_value: 45.875
}
```

### Includes

Use `@include` to insert other files:

```
SiiNunit
{
example: doing.includes
{
    foo: "bar"
    over: 9000
@include "some_file_to_include.sui"
}
}
```

The included file becomes part of the parent file. Use the `.sui` extension for included unit files without the `SiiNunit` header.

**Important**: `@include` must start at the beginning of a line with no whitespace before it. Inline or indented includes will not work.

## Attribute types

| Type | Value | Example | Notes |
|------|-------|---------|-------|
| string | "x" | `attribute: "String value"` | |
| float | x | `attribute: 1.0` or `&3f800000` (IEEE754 hex) | |
| float2 | (x, y) | `attribute: (1.0, 2.0)` | |
| float3 | (x, y, z) | `attribute: (1.0, 5.0, 3.0)` | |
| float4 | (x, y, z, w) | `attribute: (1.0, 5.0, 3.0, 9.0)` | |
| placement | (x, y, z) (w; x, y, z) | `attribute: (0, 0, 0) (1; 0, 0, 0)` | |
| fixed | x | `attribute: 10` | |
| fixed2 | (x, y) | `attribute: (10, 22)` | |
| fixed3 | (x, y, z) | `attribute: (10, 22, 33)` | |
| fixed4 | (x, y, z, w) | `attribute: (10, 22, 33, 44)` | |
| int2 | (x, y) | `attribute: (20, 69)` | |
| quaternion | (w, x, y, z) | `attribute: (1.0, 0.0, 0.0, 0.0)` | |
| s16 | x | `attribute: -15` | |
| s32 | x | `attribute: -15` | |
| s64 | x | `attribute: -15` | |
| u16 | x | `attribute: 15` | |
| u32 | x | `attribute: 15` | |
| u64 | x | `attribute: 15` | |
| bool | x | `attribute: true` or `false` | |
| token | x | `attribute: value` | Max 12 chars, lowercase alphanumeric and underscore only |
| owner_ptr | x | `attribute: .some.nameless.unit` | References units within same SiiNunit |
| link_ptr | x | `attribute: some.named.unit` | References named units defined elsewhere |
| resource_tie | "x" | `attribute: "path/to/some/resource.pma"` | Binds animations to models |

### Arrays

Dynamic arrays use repeated syntax:

```
attribute_name[]: value
attribute_name[]: value2
attribute_name[]: value3
```

Fixed arrays specify size first:

```
attribute_name: 3
attribute_name[0]: 1
attribute_name[1]: 5
attribute_name[2]: 9
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
