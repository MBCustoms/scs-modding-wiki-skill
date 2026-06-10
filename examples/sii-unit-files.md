# SII Unit Files — Example Prompts

These examples demonstrate using the skill for `.sii` and `.sui` unit file structure questions.

---

## Understanding Unit Files

**Prompt:**
> What is the SII unit file format? How is it structured?

**What the skill reads:**
- `docs/engine/formats.md`
- Source: https://modding.scssoft.com/wiki/Documentation/Engine/Formats

**What you get:** A full explanation of the SII/SUI binary and text formats, including unit block syntax, data types, and how the engine parses them.

---

## Accessory Data Base Class

**Prompt:**
> What fields does the base accessory_data unit contain that all accessories inherit?

**What the skill reads:**
- `docs/engine/units/accessory_data.md`

---

## Cargo Definition

**Prompt:**
> How do I define a new cargo type in a .sii file? What parameters are required in cargo_def?

**What the skill reads:**
- `docs/engine/units/cargo_def.md`
- `docs/engine/units/cargo_data.md`
- `docs/engine/units/dynamic_cargo_data.md`

---

## Cargo Model Matching

**Prompt:**
> How does cargo_model_match work? How do I associate a 3D model with a cargo definition?

**What the skill reads:**
- `docs/engine/units/cargo_model_match.md`

---

## Company Definition

**Prompt:**
> How do I define a company in ETS2/ATS? What unit types are involved?

**What the skill reads:**
- `docs/engine/units/company_def.md`
- `docs/engine/units/company_permanent.md`

---

## Package Version Info

**Prompt:**
> What is package_version_info and how do I set it up for my mod?

**What the skill reads:**
- `docs/engine/units/package_version_info.md`

---

## Trailer Definition

**Prompt:**
> What is the difference between trailer, trailer_def, and trailer_configuration unit types?

**What the skill reads:**
- `docs/engine/units/trailer.md`
- `docs/engine/units/trailer_def.md`
- `docs/engine/units/trailer_configuration.md`

**What you get:** A clear explanation of how the three unit types relate — `trailer_def` is the mod definition, `trailer_configuration` specifies body and coupling options, and `trailer` is the in-game instance data.

---

## Trailer Cables

**Prompt:**
> How do I define trailer cable physics? What unit types handle electrical and air connections?

**What the skill reads:**
- `docs/engine/units/trailer_cable_data.md`
- `docs/engine/units/accessory_addon_trailer_cables_data.md`
- `docs/engine/units/physics_trailer_cable_data.md`

---

## Glass Pane Data

**Prompt:**
> How does glass_pane_data work? What parameters control glass breakage?

**What the skill reads:**
- `docs/engine/units/glass_pane_data.md`

---

## Wiper Data

**Prompt:**
> How do I define wiper animation parameters in a truck mod?

**What the skill reads:**
- `docs/engine/units/wiper_data.md`

---

## Journey Events

**Prompt:**
> How do journey event cutscenes and road events work in .sii files?

**What the skill reads:**
- `docs/engine/units/journey_events_cutscene.md`
- `docs/engine/units/journey_events_road_event.md`
