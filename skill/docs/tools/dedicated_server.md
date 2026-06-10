# Documentation/Tools/Dedicated Server

## How to download a dedicated server

### Game owner, using Steam client

The dedicated server can be obtained through the Steam client. You may search for the application ID in your library tab or locate it among listed tools by adjusting steam filters.

- Euro Truck Simulator 2 Dedicated Server ID = 1948160
- American Truck Simulator Dedicated Server ID = 2239530

### Anonymous, without game ownership, or without Steam Client

Users without game ownership or Steam client must use [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD) to download the server. Note that "SteamCMD does not auto-update your server."

## How to launch a dedicated server

The dedicated server can be launched either from the Steam client's library tab or by directly executing its executable file. Game ownership is not required. Different configurations can be applied using startup parameters:

- `-server "server packages file name"` (loads non-default server game setup)
- `-server_cfg "server config file name"` (loads non-default server configuration)
- `-homedir "path"` (redirects game/server home directory on Windows; use XDG_DATA_HOME environment variable on Linux)
- `-nosingle` (enables multiple instances of server; will be default in next patch)

If you have redirected the home directory for the game, you must also redirect the server home directory using the `-homedir` parameter.

### How to launch a dedicated server on Linux without Steam client installed

You may encounter the error: "`[S_API FAIL] SteamAPI_Init() failed; unable to locate a running instance of Steam, or a local steamclient.dll.`" To launch the server on Linux, the `steamclient.so` library is required. You can either use the provided `server_launch.sh` script located in the folder next to the server executable, or create a link using: `ln -s steamcmd/linux64/steamclient.so ~/.steam/sdk64/steamclient.so`

## First launch

The first launch creates the server home folder and default `server_config.sii`. By default, the server home directory points to the Game User Path. This location can be changed with the `-homedir` startup parameter, though it must be changed for both game and server.

On first launch, you will receive this error: "`<ERROR> [MP] Error: Server packages file not found. This is required to load proper map, DLCs and mods`". This indicates you must provide additional server configuration according to the following steps.

## Required files to run dedicated server

The following files are used in the server/game home folder to set up a dedicated server session:

**server_config.sii**
- Contains session description and configuration, connection ports info, logon token, and list of moderators
- Ports and logon token must be different for each session instance running simultaneously
- Default configuration is generated automatically on first launch

**server_packages.sii**
- Contains map details, DLC, and mods configuration

**server_packages.dat**
- Contains internal map data

The `server_packages.sii` and `server_packages.dat` files must be generated manually via the `export_server_packages` command while the normal game is running. The generated configuration mirrors your game configuration. These files are necessary for a dedicated server to start. If running a server without the base game installed, you must manually copy these files to the server home directory.

These files are NOT linked to your account in any way.

## How to export server_packages

In `config.cfg` (found in the game home directory), enable the game console by setting `uset g_console "1"`. When the game is running, press `~` to open the game console and run `export_server_packages` or `export_server_packages destination file` command. The `server_packages.sii` will be generated in the game home folder. The map must be loaded when this command is called. This generates both `server_packages.sii` and `server_packages.dat` files containing DLC and mod configuration based on your current game setup.

## Running server without game installed

After first launch, the server home directory will be created containing `server.log.txt` and `server_config.sii`. You must provide the generated `server_packages.sii` and `server_packages.dat` files to this location.

## Data requirements

The dedicated server does not require any additional DLC or mod data. Everything needed is handled via the `server_packages.sii` and `server_packages.dat` files. It is not required to copy any additional files. Since the dedicated server does not use the Steam Client, it cannot access the workshop.

## Network address translation (NAT)

The dedicated server does not handle NAT punching, and a public IP or port forwarding is required for the server to appear in the session browser. However, session direct search works even for servers behind NAT, and it is possible to connect to such a server.

The search ID is listed when the dedicated server starts or in the convoy info screen for hosted sessions. To search for a server, use the search field in the game server browser.

## Ports setup

**connection_virtual_port** and **query_virtual_port** are virtual ports used for connection to the server. The allowed range is <100,200>.

**connection_dedicated_port** and **query_dedicated_port** are physical ports used by the Steam game server API to fill the sessions browser. For LAN games, `query_dedicated_port` must be in the range <27015,27020>.

For port forwarding, both TCP/IP and UDP rules are required. Virtual ports do not need forwarding.

## Server logon token

By default, whenever a dedicated server is launched, it uses an anonymous account. For such an account, a non-persistent server ID is generated (used for direct search). To avoid this, you can acquire a logon token at [https://steamcommunity.com/dev/managegameservers](https://steamcommunity.com/dev/managegameservers) (game ownership is required). This token must be placed into `server_config`.

Use the game appID to generate the token, not the server appID.

Example:

```
server_logon_token: 6544F7E034119F113526E96474F
```

## Session moderators

Since the dedicated server has no user interface, it is not possible to promote any player to moderator while the session is running. You can register moderators in `server_config` using their steam_id to automatically promote them once they join the session.

Example for two moderators:

```
moderator_list: 2
moderator_list[0]: 123456789
moderator_list[1]: 234567891
```

Where 123456789 is the moderator's Steam ID.

## Quality of life

Any player who is a moderator can now change the game time or disable rain by sending a message containing an admin command via the chat message box. Available admin commands are:

```
/set_time <HH:MM>
/set_rain_factor <value from 0 to 1>
/help
```

## How to close server

Press Ctrl + C.

## Troubleshooting

In the server home folder, `server.log.txt` and `server.crash.txt` (when server crashes) files can be found to help solve any issues with a dedicated server.

## Known issues

When the server closes with the message:

```
[MP] Steam disconnected
[MP] Session closure requested (reason - 33).
[MP] Session closing
```

It is caused by Steam losing connection. This can happen when internet connection is lost or when the computer switches to sleep mode. This will be fixed in the next patch.

## Server config parameters

```
lobby_name: "Euro Truck Simulator 2 server"            // Session name, limited to 63 characters.
description: ""                                        // Session description, limited to 63 characters.
welcome_message: ""                                    // Session welcome message, limited to 127 characters.
password: ""                                           // Session password, limited to 63 characters.
max_players: 8                                         // Maximum players in session, limit is 8 players.
max_vehicles_total: 100
max_ai_vehicles_player: 50
max_ai_vehicles_player_spawn: 50
connection_virtual_port: 100
query_virtual_port: 101
connection_dedicated_port: 27015
query_dedicated_port: 27016
server_logon_token: 6544F7E034119F113526E96474F        // Token for game server login (persistent account).
player_damage: true                                    // Flag if player can receive damage from other players.
traffic: true                                          // Flag if traffic is enabled.
hide_in_company: false                                 // Flag if remote player are hidden in company area.
hide_colliding: true                                   // Flag to hide colliding vehicle after teleport.
force_speed_limiter: false                             // Flag to force speed limiter.
mods_optioning: false                                  // Flag to enable mods marked as optional, to be really optional.
timezones: 2                                           // Values 0 - 2.
service_no_collision: false                            // Disable collisions on service area.
in_menu_ghosting: false                                // Disable collisions when game paused.
name_tags: true                                        // Show player name tags above vehicles.
friends_only: false                                    // Not used for dedicated server.
show_server: true                                      // Not used for dedicated server.
moderator_list: 2                                      // Default moderators.
moderator_list[0]: 123456789                           // User steam id.
moderator_list[1]: 234567891                           // User steam id.
```
