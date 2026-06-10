# Editor online data

The **editor_online_data** class defines API URLs and supplementary information for editor online services. During initialization, the editor attempts to load this configuration first from `/home/editor_online_data.sii` in your home directory, then from `/def/editor_online_data.sii` as a fallback.

## Configuration Example

```
SiiNunit
{
editor_online_data : .edit_online 
{
	# Parallel arrays of map filename and url for fetching sector locks.
	map_server[]: "http://example.com"
	map_name[]: "/map/europe.mbd"

	# The url for fetching notes.
	note_server: "http://example.com"

	# URL address of mapping of map note user IDs to usernames.
	note_username_url: "http://example.com/list.json"

	# URL address of mantis bug resolve page.
	qa_bug_resolve_url: "https://example.com/bug_actiongroup_page.php"

	# Map note autosave interval from start of session (in seconds).
	note_autosave_interval_session_start: 300

	# Map note autosave interval from last session modification (in seconds).
	note_autosave_interval_session_modified: 30

	# How often should the editor try to refresh map notes (in seconds).
	note_autorefresh_interval: 60

	# The index of each name corresponds to the artist id
	# which is determined by the value of g_artist_id
	artists[0]: "None"
	artists[1]: "ArtistName1"
	artists[2]: "ArtistName2"
}
}
```

## Username Mapping JSON Structure

The JSON file referenced at `note_username_url` follows this format:

```json
{
    "1":"NoteUser1",
    "2":"NoteUser2",
    "3":"NoteUser3"
}
```

The numeric IDs correspond to the `g_map_note_user_id` value.
