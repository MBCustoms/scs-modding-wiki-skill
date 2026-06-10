# New Editor Features 1.49

## Top Menu changes

The top menu **File - Edit - View - Map - Tools - Debug - Help** underwent structural reorganization with content redistribution across sections and some section renaming.

The revised structure is:

- **File** - unchanged
- **Edit** - contains Edit functions and various Edit modes; isolation functions relocated
- **Selection** - represents actions performable on map selections

Note: Cut/Copy/Paste remain in Edit to maintain consistency with standard software conventions

- **View** - visualization options and information-display dialogues

Note: View Distance Debug Tool was renamed to "View Distance Display Range" for accuracy

- **Map** - interactions with the entire map file
- **Debug** - debug views, validation, and traffic tool
- **Editor** - software documentation, help, and Editor/Map Settings

## Compound update

- **RMB click** on compound items now opens Compound Properties without locating the Compound node
- **CTRL+RMB click** on compound items opens that item's Properties without breaking the Compound

## Find Reference search in Find dialogue

You can now search for specific items by:

- item index
- node index
- UID

Rather than camera teleportation (risking crashes), the Found dialogue window enables remote access to:

- open item properties
- delete the item

Note: Previously only "go to" function and console deletion were available.

## Changes in Errors&Warnings

- The small error popup for undersized items no longer appears
- ALL ERRORS now display in the Found window for direct interaction
- Use **Debug -> Validate errors** button to display error lists at any time, not only during map save

Delete items in Validate errors dialog using g_delete_by_uid via right-click menu.

Warning: Only works on unlocked, invalid items and is irreversible.

## Far Model Item & Visibility Area - interaction tools

A **Selection -> Find Parents** button was added.

### Usage

- Select item(s)
- Selection -> Find Parents

### Result

Found items dialogue displays Far Models Items/Visibility Areas the selected item(s) is assigned to.

Use this to verify whether items are children of FMI/VA or if compounds can be safely broken.

## Other changes and new features

- **CTRL+F6** key combination drops any item node onto other items' geometry, improving lamp and model placement on sidewalks
- **F8** map window no longer switches focus when moving mouse cursor over it
- Brush Tool material list now displays the "editor name" of materials
