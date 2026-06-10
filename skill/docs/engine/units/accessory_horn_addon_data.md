# Documentation/Engine/Units/accessory horn addon data

## Overview

The **accessory_horn_addon_data** unit class extends **accessory_addon_data**, specifically designed for air horn accessories. It functions identically to its parent class with one additional feature: the _sound_path_ attribute that connects a horn sound event to the accessory. This is primarily utilized for customizing the player's vehicle. This unit type debuted in version 1.38.

## Attributes

This class inherits many common attributes from parent classes **accessory_addon_data** and **accessory_data**.

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
| sound_path | string | | Path to the sound bank/event or soundref to be used for the horn accessory. |
