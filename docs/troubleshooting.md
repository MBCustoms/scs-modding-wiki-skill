# Troubleshooting

Common problems and how to fix them.

---

## Skill Not Activating

**Problem:** Claude answers modding questions from general knowledge instead of using the skill.

**Checks:**
1. Verify the skill is installed in the correct location:
   - Windows: `%USERPROFILE%\.claude\skills\scs-modding-wiki\SKILL.md`
   - macOS/Linux: `~/.claude/skills/scs-modding-wiki/SKILL.md`

2. Verify `SKILL.md` exists and has valid YAML frontmatter:
   ```powershell
   Get-Content "$env:USERPROFILE\.claude\skills\scs-modding-wiki\SKILL.md" -TotalCount 5
   ```
   Expected output should begin with `---` and include `name: scs-modding-wiki`.

3. Try invoking explicitly: "Using the scs-modding-wiki skill, ..."

---

## Skill Installed But Claude Can't Find a Page

**Problem:** Claude says it can't find information about a topic that should be in the skill.

**Checks:**
1. Verify `index.json` is present and readable:
   ```powershell
   $idx = Get-Content "$env:USERPROFILE\.claude\skills\scs-modding-wiki\index.json" | ConvertFrom-Json
   Write-Host "Index entries: $($idx.pages.Count)"
   ```
   Expected: `Index entries: 162`

2. Check if the topic is actually covered — see [coverage.md](coverage.md).

3. If the topic should be there but isn't found: try rephrasing your question using terms from the wiki page title (e.g., "accessory_engine_data" rather than "engine definition").

---

## Outdated Information

**Problem:** Claude's answer doesn't match what the current SCS wiki says.

**Explanation:** The skill content was crawled on 2026-06-10. If SCS Software has updated the wiki since then, the skill file may be out of date.

**Fix:**
1. Check the official wiki page directly: https://modding.scssoft.com/wiki/Documentation
2. [Open a Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=wiki_sync_issue.yml)
3. Or update the file yourself — see [updating.md](updating.md)

---

## Missing Files After Installation

**Problem:** Some pages are missing from `skill/docs/`.

**Check:**
```powershell
$files = Get-ChildItem "$env:USERPROFILE\.claude\skills\scs-modding-wiki\docs" -Recurse -Filter "*.md"
Write-Host "Files found: $($files.Count)"
```
Expected: `Files found: 162`

**Fix:** Re-run the installation, ensuring you copied the full `skill/` directory contents.

---

## index.json Parse Error

**Problem:** Claude reports an error reading `index.json`.

**Check:**
```powershell
try {
    Get-Content "$env:USERPROFILE\.claude\skills\scs-modding-wiki\index.json" | ConvertFrom-Json | Out-Null
    Write-Host "index.json: valid JSON"
} catch {
    Write-Host "index.json: INVALID — $_"
}
```

**Fix:** Re-copy `skill/index.json` from the repository. If the file is corrupt, re-clone the repository.

---

## PowerShell Execution Policy (Windows)

**Problem:** `.\scripts\update-wiki.ps1` fails with an execution policy error.

**Fix:**
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

This allows locally created scripts to run. It does not affect signed scripts from the internet.

---

## Claude Code Version Compatibility

**Problem:** The skill loads but Claude behaves unexpectedly with the instructions.

**Check:** Ensure you are using a current version of Claude Code. Skills rely on the skill-loading behavior introduced in Claude Code's skills system — very old versions may not support it.

Update Claude Code via the CLI:
```bash
npm update -g @anthropic-ai/claude-code
```

Or download the latest desktop app from [claude.ai/code](https://claude.ai/code).

---

## Still Stuck?

[Open a Bug Report](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=bug_report.yml) with as much detail as possible.
