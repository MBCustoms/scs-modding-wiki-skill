# Documentation/Engine/Units/company def

## Overview

The **company_def** unit class is used to assign a prefab to a company_permanent unit. Units of this type are typically defined in **/def/company/<company_name>/editor/<city_name>.sii**.

## Attributes

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| **city** | token | | The tokenized name of the city where the prefab is located. Example: for _city.san_francisc_, use `city: san_francisc` |
| **prefab** | token | | The tokenized name of the prefab to be linked. Example: for _prefab.d_port_sf_, use `prefab: d_port_sf` |

## Important Note

"This implementation requires that each depot prefab may only appear once per city."

## Related Units

- company_permanent
