# Game Radio

**Source:** https://modding.scssoft.com/wiki/Documentation/Engine/Game_Radio

## File structure

The foundational layout for game radio includes a manifest, icon, description file, and a dedicated `offline_radio` folder containing station definitions and music files.

The basic organization follows this pattern:

```
├─ manifest.sii
├─ icon.jpg
├─ mod_description.txt
└─ offline_radio
   ├─ offline_radio.mymod.sii
   ├─ mymod_stn0
   │  ├─ tracks.sii
   │  └─ music
   │     ├─ song_a.ogg
   │     └─ song_b.mp3
   └─ mymod_stn1
```

**Supported audio formats:** `ogg` and `mp3`

While a `offline_radio/stationid/music` subfolder structure is recommended for organization, the actual audio file locations are flexible since full game file system paths are specified in track definitions.

## Unit descriptions

### Definition of station(s)

Station data lives in `offline_radio/offline_radio.<my_mod_id>.sii`

Required fields for each station include:

- **id**: Globally unique station identifier (required, token)
- **name**: User-friendly station name (required, string)
- **genre**: Category displayed in radio table (required, string)
- **language**: Language code shown in radio table (required, string)

Optional parameters include:

- **stream_safe**: Indicates tracks are royalty-free (optional, boolean, default false)
- **recently_played_history_size_fraction**: "History size" as fraction of total tracks (optional, float 0.0-1.0, default 0.5)
- **min_num_tracks_between_same_artist**: Minimum tracks before same artist repeats (optional, non-negative integer, default 0)
- **cover_img**: Path to radio table image (optional, string)
- **miniplayer_img**: Path to miniplayer cover image (optional, string)
- **miniplayer_title_pml**: Custom PML for miniplayer title text (optional, string)
- **music_crossfade_duration_ms**: Crossfade duration between tracks (optional, non-negative integer, default 2000, disabled at 0)

#### Track selection & playback history

Two configuration values govern track randomization:

1. **recently_played_history_size_fraction** establishes a "history window" preventing recently played tracks from immediate replay. With a value of 0.5 on a 20-track station, 10 additional songs must play before the original track can repeat.

2. **min_num_tracks_between_same_artist** adds artist-level restrictions. String matching is case-sensitive and exact, so variations like "Artist" versus "Artist feat. Someone" are treated as distinct.

Exercise restraint when configuring these values; overly restrictive settings may break the selection algorithm.

### Per-station definitions

Track information resides in `offline_radio/<my_station_id>/tracks.sii`

Each track requires:

- **artist**: Artist name (string)
- **name**: Track title (string)
- **ufs_path**: Full game file system path to audio file (string)

## Known limitations

Compressed audio assets present technical challenges, making the `.zip` mod format unsupported. Use `.scs` packs or regular folder structures instead.
