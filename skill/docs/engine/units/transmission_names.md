# transmission_names

The **transmission_names** unit class defines custom gear names displayed in the UI and dashboard. These units are typically located in `/def/vehicle/truck/<make.model>/transmission/*.sii` files or included from `.sui` files as nameless units (prefixed with a dot, like `.names`). They're assigned to transmissions via the _transmission_names_ attribute in the [accessory_transmission_data](/wiki/Documentation/Engine/Units/accessory_transmission_data) unit class.

## Attributes

| Name | Type | Description |
|------|------|-------------|
| neutral | string | The gear name displayed when transmission is in neutral. |
| reverse | array<string> | Gear names for reverse gears; array indices correspond to _ratios_reverse_ in parent accessory_transmission_data unit. |
| forward | array<string> | Gear names for forward gears; array indices correspond to _ratios_forward_ in parent accessory_transmission_data unit. |

**Note:** While not a hard limit, it is advisable to keep the length of the gear names within three characters to avoid truncation.

## Example of an Embedded transmission_names Unit

The typical usage embeds **transmission_names** in the same file as its **accessory_transmission_data** unit. Here's an 8LL (8 + 2 crawler gears) example:

**/vehicle/truck/<foo.bar>/transmission/rt8ll.sii:**

```
SiiNunit
{
accessory_transmission_data : rt8ll.foo.bar.transmission
{
	name: "Example 8LL with custom gear names"
	price: 8750
	unlock: 0
	icon: "transmission_generic"
	transmission_names: .names
	differential_ratio: 4.11
	ratios_reverse[0]: -20.47
	ratios_reverse[1]: -13.24
	ratios_reverse[2]: -3.89
	ratios_forward[0]: 19.58
	ratios_forward[1]: 12.67
	ratios_forward[2]: 8.39
	ratios_forward[3]: 6.23
	ratios_forward[4]: 4.58
	ratios_forward[5]: 3.41
	ratios_forward[6]: 2.46
	ratios_forward[7]: 1.83
	ratios_forward[8]: 1.35
	ratios_forward[9]: 1.0
}
transmission_names: .names
{
	neutral: "N"
	forward[0]: "LL"
	forward[1]: "L"
	forward[2]: "1"
	forward[3]: "2"
	forward[4]: "3"
	forward[5]: "4"
	forward[6]: "5"
	forward[7]: "6"
	forward[8]: "7"
	forward[9]: "8"
	reverse[0]: "RLL"
	reverse[1]: "RL"
	reverse[2]: "RH"
}
}
```

## Example of an Included transmission_names Unit

For projects with many transmissions sharing custom gear names, create a single `.sui` file containing all unique _transmission_names_ instances and include it as needed.

**/vehicle/truck/<foo.bar>/transmission/rt8ll.sii:**

```
SiiNunit
{
accessory_transmission_data : rt8ll.foo.bar.transmission
{
	name: "Example 8LL with custom gear names"
	price: 8750
	unlock: 0
	icon: "transmission_generic"
	transmission_names: .8ll.names
	differential_ratio: 4.11
	ratios_reverse[0]: -20.47
	ratios_reverse[1]: -13.24
	ratios_reverse[2]: -3.89
	ratios_forward[0]: 19.58
	ratios_forward[1]: 12.67
	ratios_forward[2]: 8.39
	ratios_forward[3]: 6.23
	ratios_forward[4]: 4.58
	ratios_forward[5]: 3.41
	ratios_forward[6]: 2.46
	ratios_forward[7]: 1.83
	ratios_forward[8]: 1.35
	ratios_forward[9]: 1.0
}
@include "gear_names.sui"
}
```

**Note:** Observe that the include occurs _outside_ the scope of the _accessory_transmission_data_ unit, but _within_ the scope of the SiiNunit.

**TIP:** Use descriptive nameless unit names for _transmission_names_ units to intuit which unit is assigned without opening the included file.

**/vehicle/truck/<foo.bar>/transmission/gear_names.sui:**

```
transmission_names: .8ll.names
{
	neutral: "N"
	forward[0]: "LL"
	forward[1]: "L"
	forward[2]: "1"
	forward[3]: "2"
	forward[4]: "3"
	forward[5]: "4"
	forward[6]: "5"
	forward[7]: "6"
	forward[8]: "7"
	forward[9]: "8"
	reverse[0]: "RLL"
	reverse[1]: "RL"
	reverse[2]: "RH"
}

transmission_names: .other.names
{
}
```

**Note:** Because the _transmission_names_ units are nameless, the 'gear_names.sui' file can be included in many transmission definitions without fear of namespace collisions because nameless units only exist within the scope of the SiiNunit in which they are declared. However, nameless units _within_ an SiiNunit **must** have unique names within that scope.
