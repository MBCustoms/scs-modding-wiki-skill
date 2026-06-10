# Data Sources

This document describes where the skill content comes from and the freshness policy.

---

## Primary Source

**SCS Software Modding Wiki**
- URL: https://modding.scssoft.com/wiki/Documentation
- Operated by: SCS Software s.r.o.
- Coverage: Euro Truck Simulator 2 and American Truck Simulator modding documentation

All 162 documentation pages in `skill/docs/` are sourced directly from this wiki. The content is the official modding reference published and maintained by SCS Software.

---

## Crawl Details

| Field | Value |
|---|---|
| Crawl date | 2026-06-10 |
| Pages crawled | 162 |
| Missing pages | 0 |
| Undersized pages | 0 |
| API endpoint | `https://modding.scssoft.com/api.php?action=query&list=allpages&apprefix=Documentation&aplimit=500` |

The page list was fetched via the MediaWiki API, then each page was fetched individually and converted to clean Markdown.

---

## Content Freshness

Wiki content reflects the state of the wiki on **2026-06-10**. SCS Software updates the wiki when:

- New game versions (1.x patches) introduce new modding features
- Existing documentation is corrected or expanded
- New tools or systems are added

The skill does not auto-update. To refresh content, run the update script — see [updating.md](updating.md).

### How to know if content is stale

- Check `skill/crawl_report.md` for the crawl date
- Compare against recent SCS game version release notes
- Follow the [SCS Software blog](https://blog.scssoft.com/) or [modding forums](https://forum.scssoft.com/) for documentation update announcements

---

## Intellectual Property

The documentation content in `skill/docs/` is the intellectual property of **SCS Software s.r.o.** This repository mirrors that content for offline AI-assisted reference use.

The skill infrastructure — `SKILL.md`, `index.json`, `sources.json`, scripts, and repository metadata — is original work by [MBCustoms](https://github.com/MBCustoms) and is released under the [MIT License](../LICENSE).

This project is not affiliated with or endorsed by SCS Software.

---

## Reporting Outdated Content

If you find a page that has changed on the official wiki, please [open a Wiki Sync Issue](https://github.com/MBCustoms/scs-modding-wiki-skill/issues/new?template=wiki_sync_issue.yml).
