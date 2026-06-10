# Installation Guide

This guide covers all installation methods for the SCS Modding Wiki skill.

---

## Prerequisites

- [Claude Code](https://claude.ai/code) — CLI, desktop app, or IDE extension
- Git (for cloning) or a ZIP download from the [Releases page](https://github.com/MBCustoms/scs-modding-wiki-skill/releases)

---

## Method 1 — Clone and Install (Recommended)

### Windows

```powershell
# Clone the repository
git clone https://github.com/MBCustoms/scs-modding-wiki-skill.git
cd scs-modding-wiki-skill

# Install the skill globally
$dest = "$env:USERPROFILE\.claude\skills\scs-modding-wiki"
New-Item -ItemType Directory -Force $dest | Out-Null
Copy-Item -Recurse -Force "skill\*" $dest
Write-Host "Installed to: $dest"
```

### macOS / Linux

```bash
# Clone the repository
git clone https://github.com/MBCustoms/scs-modding-wiki-skill.git
cd scs-modding-wiki-skill

# Install the skill globally
mkdir -p ~/.claude/skills/scs-modding-wiki
cp -r skill/* ~/.claude/skills/scs-modding-wiki/
echo "Installed to: ~/.claude/skills/scs-modding-wiki"
```

---

## Method 2 — Download ZIP

1. Go to [Releases](https://github.com/MBCustoms/scs-modding-wiki-skill/releases) and download the latest `scs-modding-wiki-skill-v1.0.0.zip`
2. Extract the archive
3. Copy the `skill/` folder contents to your Claude skills directory:

| Platform | Target directory |
|---|---|
| Windows | `%USERPROFILE%\.claude\skills\scs-modding-wiki\` |
| macOS | `~/.claude/skills/scs-modding-wiki/` |
| Linux | `~/.claude/skills/scs-modding-wiki/` |

---

## Method 3 — Project-Local Install

To make the skill available only within a specific project (not globally):

```powershell
# Windows — run from your mod project root
New-Item -ItemType Directory -Force ".claude\skills\scs-modding-wiki" | Out-Null
Copy-Item -Recurse -Force "path\to\scs-modding-wiki-skill\skill\*" ".claude\skills\scs-modding-wiki\"
```

```bash
# macOS / Linux — run from your mod project root
mkdir -p .claude/skills/scs-modding-wiki
cp -r path/to/scs-modding-wiki-skill/skill/* .claude/skills/scs-modding-wiki/
```

Project-local skills take precedence over global skills when Claude Code is running inside that project directory.

---

## Verifying the Installation

After installing, open Claude Code in any project and ask:

```
Using the scs-modding-wiki skill, what parameters does accessory_engine_data require?
```

Claude should respond with detailed engine unit parameters and cite the source URL from the SCS wiki.

You can also check the skill is discovered:

```
/skills
```

The `scs-modding-wiki` skill should appear in the list.

---

## What Gets Installed

The `skill/` directory contains:

```
~/.claude/skills/scs-modding-wiki/
├── SKILL.md          # Skill definition — Claude reads this first
├── index.json        # Search index for 162 pages
├── sources.json      # URL-to-file mapping
├── crawl_report.md   # Crawl status and page list
└── docs/             # 162 wiki pages as Markdown
    ├── engine/
    └── tools/
```

Total size: approximately 3–5 MB depending on content.

---

## Updating

To update the skill to a newer version:

```powershell
# Windows — pull latest and reinstall
cd scs-modding-wiki-skill
git pull
$dest = "$env:USERPROFILE\.claude\skills\scs-modding-wiki"
Copy-Item -Recurse -Force "skill\*" $dest
```

```bash
# macOS / Linux
cd scs-modding-wiki-skill
git pull
cp -r skill/* ~/.claude/skills/scs-modding-wiki/
```

For more details on updating wiki content, see [updating.md](updating.md).

---

## Troubleshooting

See [troubleshooting.md](troubleshooting.md) for common installation issues.
