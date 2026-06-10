# Frequently Asked Questions

---

## General

**Q: What is this project?**

A Claude Code skill that embeds the complete SCS Software Modding Wiki into Claude. When you ask ETS2 or ATS modding questions, Claude reads the actual official documentation rather than relying on general training knowledge.

**Q: Does this work with all versions of Claude Code?**

Yes. Claude Code skills use a standard directory format that works across all Claude Code platforms: CLI, desktop app (Mac/Windows), web app, and IDE extensions.

**Q: Is this skill official or endorsed by SCS Software?**

No. This is a community project. The skill content is sourced from the official [SCS Modding Wiki](https://modding.scssoft.com/wiki/Documentation), but the project itself is maintained independently by [MBCustoms](https://github.com/MBCustoms).

---

## Installation

**Q: Where does the skill get installed?**

To the `~/.claude/skills/scs-modding-wiki/` directory (macOS/Linux) or `%USERPROFILE%\.claude\skills\scs-modding-wiki\` (Windows). This is the global Claude Code skills directory — once installed, the skill is available in all your projects.

**Q: Can I install it for just one project?**

Yes. Copy the skill contents to `.claude/skills/scs-modding-wiki/` inside your project directory instead. Claude Code will use the project-local version when working in that directory.

**Q: How much disk space does it use?**

Approximately 3–5 MB for all 162 documentation pages plus the index files.

**Q: Do I need an internet connection to use the skill?**

No. All 162 wiki pages are stored locally. The skill works entirely offline once installed.

---

## Usage

**Q: How do I activate the skill?**

Claude Code activates the skill automatically when you ask ETS2/ATS modding questions. You can also invoke it explicitly with `/scs-modding-wiki` or by saying "Using the scs-modding-wiki skill, ...".

**Q: What if Claude doesn't use the skill for a modding question?**

Try being more explicit: "Using the scs-modding-wiki skill, how do I ...?" If the skill is installed correctly, Claude will use it.

**Q: Does the skill cover ATS (American Truck Simulator) as well as ETS2?**

Yes. The SCS Modding Wiki covers both games. Most modding systems (unit formats, Blender Tools, Workshop Uploader, Map Editor) are shared between ETS2 and ATS.

**Q: How does Claude find the right page for my question?**

Claude reads `index.json` first, which contains title, category, and keyword data for all 162 pages. It uses that to identify which 1–5 files are relevant, then reads those files to formulate its answer.

---

## Content

**Q: How current is the documentation?**

The skill content was crawled on **2026-06-10**. See [data-sources.md](data-sources.md) for details on freshness and how to update.

**Q: A wiki page has changed since the crawl. What should I do?**

[Open a Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=wiki_sync_issue.yml) describing what changed.

**Q: Can I update the skill myself to get newer wiki content?**

Yes. See [updating.md](updating.md) for instructions on running the update script.

**Q: Are there any wiki pages not covered?**

The skill covers all 162 pages under `Documentation/` on the SCS wiki as of the crawl date. Pages added to the wiki after 2026-06-10 are not included.

---

## Contributing

**Q: How can I contribute?**

See [CONTRIBUTING.md](../CONTRIBUTING.md). The most valuable contributions are wiki sync reports (outdated pages) and new usage examples.

**Q: Can I translate the skill documentation?**

Translations of the project documentation (`docs/`, `README.md`) are welcome. The wiki content itself should stay as-is, mirroring the official English wiki.
