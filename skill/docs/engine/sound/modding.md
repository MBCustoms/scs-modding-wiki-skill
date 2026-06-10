# Documentation/Engine/Sound/Modding

## Modding Sound

FMOD requires each sound bank to have its own globally unique identifier (GUID). The main mix buses of the master bank must share the same GUIDs across sound implementations. Since FMOD Studio lacks a user interface for GUID editing, SCS provides their Master Bank as a template for third-party sound creation.

Key requirements:
- All modded sounds must exist within a new FMOD bank for game compatibility
- FMOD Studio software installation is necessary for sound authoring
- Always use the game version-specific sound bank template
- Download templates and examples from the Downloads section

## Create own bank - Step by step

1. Download the template.bank project
2. Unzip the project to your new sound project folder
3. Rename "template.fspro" (in project root) to "[my project name].fspro" _(recommended but optional)_
4. Open your project by launching the .fspro file in FMOD Studio
5. Locate the banks browser in the event editor window, right-click empty space, and select "New Bank"
6. Set the bank name using system-independent naming conventions (lowercase characters, no spaces)
7. The new bank receives an automatically generated GUID

**Notes:**
- Always create new banks to ensure unique GUIDs
- Create new banks when using other templates; GUIDs must remain unique
- Never rename the 'master' bank
- Never delete standard buses included with the template; recreating them won't restore functionality even with identical names

## Create own sound - Step by step

1. Open your project in FMOD Studio
2. In the events browser, right-click empty space and select "New Event"
3. Choose either 3D Event or 2D Event depending on your sound requirements
4. Set a system-independent name for the event
5. Assign the event to your bank by right-clicking it, selecting "Assign to Bank," and choosing your target bank
6. Open the "Mixer Routing" window and drag the new event to your target audio bus
7. Edit your sound

**Notes:**
- Always create new events
- Create new events with unique GUIDs when using other templates
- The copy-paste process generates new GUIDs, making it the recommended duplication method
- Carefully manage sound abilities (2D/3D, looping, controlling parameters) based on sound type requirements

## Prepare bank to the game - Step by step

1. Build the bank by selecting File / Build... in FMOD Studio. The "[bank name].bank" file will be created in the "build" subfolder. The "master.bank" and "master.strings.bank" files may also appear but should be ignored.

2. Export GUIDs by selecting File / Export GUIDs... The "GUIDs.txt" file will be created in the build subfolder containing your new events in the object list.

3. Rename "GUIDs.txt" to "[bank name].bank.guids"

4. Optimize the guids file by retaining only objects you created that remain in your new bank _(optional)_

5. Use only the "[bank name].bank" and "[bank name].bank.guids" files in your sound mod

6. Edit game configuration files to include links to your audio events

7. Enjoy new sounds

**Notes:**
- Minimize file overwrites to provide space for other modders
- To change all bank sounds, create a new bank with the same name and overwrite it
- To change global or default sounds, create a new bank with new events, then overwrite only the .soundref file to redirect sound events
- To change specific sounds, create a new bank with new events, then overwrite the configuration file of the specified component or accessory to redirect sound events

## Fan-created video tutorials and info

Various approaches and process variants exist in the first post of the FMOD thread on the SCS forum. Community-created tutorials may provide alternative perspectives beneficial for learning: https://forum.scssoft.com/viewtopic.php?f=178&t=281124
