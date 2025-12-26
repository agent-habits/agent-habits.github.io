<!-- GitHub Copilot / AI agent instructions for contributors and coding agents -->
# Agentic Systems Habits — AI Coding Agent Instructions

Purpose: quickly orient an AI coding agent to be immediately productive in this repo.

- **Big picture:** This repository is a small Jekyll/GitHub Pages documentation site that publishes the "7 Habits" framework. Content lives as Markdown pages (top-level .md files) and site-wide settings live in `_config.yml`.

- **Key files to inspect:** [README.md](README.md), [index.md](index.md), [habits.md](habits.md), [governance.md](governance.md), [CONTRIBUTING.md](CONTRIBUTING.md), and `_config.yml` (site config).

- **Architecture summary:** static content only — no application code, build scripts, or tests. Pages are authored as markdown; the site relies on GitHub Pages / Jekyll default build (theme `minima` set in `_config.yml`).

- **Primary workflows an agent may help with:**
  - Editing or reorganizing content in Markdown pages (preserve intent and editorial voice).
  - Adding examples or case studies mapped to a specific habit (update `habits.md` or add new page and link from index).
  - Updating governance or contribution docs (`governance.md`, `CONTRIBUTING.md`).

- **Build / preview commands (discoverable):**
  - Local preview (if contributors want local Jekyll preview): `bundle exec jekyll serve` (standard Ruby/Jekyll flow). If `bundle` not available, note that GitHub Pages will still build on push.

- **Repository conventions and patterns:**
  - Content is authoritative and curated. The maintainer retains editorial authority (see [CONTRIBUTING.md](CONTRIBUTING.md)).
  - Habit definitions are intentionally stable; supporting material can be extended but avoid adding new top-level "habits" without discussion.
  - Prefer adding examples as concrete, referenced case studies that map to one or more habits (update `habits.md` or create a new markdown page and link it).

- **Editing guidelines for AI agents:**
  - Preserve the existing voice: concise, design-focused, governance-first. Small wording improvements okay; do not change the intent of any habit.
  - When adding content, include a brief note in the PR description mapping the change to a habit and why it improves clarity.
  - For structural changes (new pages, renaming), open an issue first per [CONTRIBUTING.md](CONTRIBUTING.md) and mention the maintainer.

- **Examples (how to apply edits):**
  - To add a real-world example for Habit 2 (Embedded in Workflows): create `examples/embedded-workflow-<short>.md`, add front-matter with `title:` and `layout:`, and add a link from `habits.md` under the Habit 2 section.
  - To refine wording across site: update the canonical paragraph in [README.md](README.md) or [index.md](index.md) and keep changes minimal — prefer sentence-level edits.

- **Automation & PR tips for agents:**
  - Create focused PRs with a single intent (typo fix, add example, reorganize a single page).
  - Use the PR description to reference the habit(s) affected and link to the issue if one exists.

- **What not to do:**
  - Don't invent new habits or expand the canonical set without prior discussion.
  - Don't add marketing, vendor comparisons, or speculative frameworks — repository explicitly avoids those (see README).

If any section above feels incomplete or you want more examples (front-matter template, example PR body, or a sample example page), tell me which piece to expand and I'll update this file.
