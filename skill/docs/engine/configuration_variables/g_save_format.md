# g_save_format

## Name

g_save_format

## Purpose

"Format used to store the game saves."

## Config

global

## Value

integer - format

## Format Options

| Value | Description |
|-------|-------------|
| 0 | default mode, whatever the game considers the default might change on build or state of testing |
| 1 | force binary only |
| 2 | force text only **(check hint below)** |
| 3 | simultaneous creation of binary and textual saves for debugging purposes **(check hint below)** |

## TIP

"Text format (2 and 3 options) takes much more time to save and may cause lag-spikes on auto save. Use with caution!"
