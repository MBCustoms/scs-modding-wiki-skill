# Updating the Wiki Mirror

This guide explains how to refresh `skill/docs/` with the latest content from the official SCS Modding Wiki.

---

## When to Update

Update the skill when:

- A new ETS2 or ATS game version is released (SCS often updates the wiki with patch notes)
- You receive a [Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues?q=label%3Awiki-sync) report
- You want to add newly published wiki pages to the skill

---

## Quick Update (Single Page)

To update one specific page:

```powershell
# Windows — run from the repository root
.\scripts\update-wiki.ps1 -Pages "Documentation/Engine/Units/accessory_engine_data"
```

```bash
# macOS / Linux — use Claude Code CLI with WebFetch
# (see Full Update below for manual steps)
```

The script fetches the page from the official wiki and overwrites the corresponding file in `skill/docs/`.

---

## Full Update (All 162 Pages)

```powershell
# Windows — run from the repository root
.\scripts\update-wiki.ps1 -All
```

This re-crawls all 162 pages and updates `skill/docs/`, `skill/index.json`, `skill/sources.json`, and `skill/crawl_report.md`.

**Expected duration:** 5–15 minutes depending on network speed and wiki response time.

---

## Manual Update Process

If the script is unavailable, you can update a page manually using Claude Code:

1. Open Claude Code in the repository directory.
2. Ask Claude to fetch the page:

```
Fetch https://modding.scssoft.com/wiki/Documentation/Engine/Units/accessory_engine_data
and update skill/docs/engine/units/accessory_engine_data.md with the full article content.
Convert to clean Markdown, preserving all headings, tables, code blocks, and parameter descriptions.
Do not include navigation menus, sidebars, or page footers.
```

3. Verify the file was updated and the content matches the official wiki.
4. Update `skill/crawl_report.md` to reflect the new crawl date for that page.

---

## Adding a New Wiki Page

If SCS Software has added a new page to the wiki that isn't in the skill yet:

1. Determine the page's URL and the correct file path in `skill/docs/`
2. Fetch and save the page content
3. Add an entry to `skill/index.json`:

```json
{
  "title": "Documentation/Engine/Units/new_unit_type",
  "file": "docs/engine/units/new_unit_type.md",
  "url": "https://modding.scssoft.com/wiki/Documentation/Engine/Units/new_unit_type",
  "category": "engine_units",
  "keywords": ["engine", "units", "new", "unit", "type"]
}
```

4. Add the URL-to-file mapping to `skill/sources.json`
5. Update `skill/crawl_report.md` with the new page count

---

## After Updating

If you updated locally and want to contribute back:

1. Commit the changed files in `skill/`
2. Open a pull request referencing the relevant [Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues)
3. In the PR description, note which pages were updated and the new crawl date

---

## Reinstalling After Update

After pulling an updated version of the repository, reinstall the skill:

```powershell
# Windows
$dest = "$env:USERPROFILE\.claude\skills\scs-modding-wiki"
Copy-Item -Recurse -Force "skill\*" $dest
```

```bash
# macOS / Linux
cp -r skill/* ~/.claude/skills/scs-modding-wiki/
```
