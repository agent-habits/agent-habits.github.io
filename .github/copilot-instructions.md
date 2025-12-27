<!-- GitHub Copilot / AI agent instructions for contributors and coding agents -->
# Agentic Systems Habits — AI Coding Agent Instructions

Purpose: quickly orient an AI coding agent to be immediately productive in this repo.

- **Big picture:** a small Jekyll/GitHub Pages docs site that publishes the "7 Habits" framework. Content is Markdown (top-level pages and `habits/*` pages). Site config lives in `_config.yml`; theme override is in `_layouts/default.html` and header in `_includes/site-header.html`.

- **Key files / dirs:** [README.md](README.md), [index.md](index.md), `habits/` (per-habit pages), `governance/governance.md`, [CONTRIBUTING.md](CONTRIBUTING.md), `_config.yml`, `_layouts/default.html`, `_includes/site-header.html`, `assets/images/`, `tools/`.

- **What this repo is:** static documentation and design guidance — no application code, CI, or tests. Use GitHub Pages / Jekyll for publishing.

- **Primary agent workflows:**
  - Edit or refine Markdown copy while preserving voice (concise, governance-first).
  - Add example pages under `habits/` and link from `habits/habits.md`.
  - Small UI/UX tweaks to the site (includes, layout, favicon support) — keep changes minimal and reversible.

- **Local preview:**
  - If you have Ruby/bundler: `bundle install` then `bundle exec jekyll serve --livereload`.
  - Or use Docker: `docker run --rm -it -v ${PWD}:/srv/jekyll -p 4000:4000 jekyll/jekyll jekyll serve --livereload --host 0.0.0.0`.

- **Repo conventions & guidance:**
  - Preserve voice: concise, design-focused, governance-first.
  - Use `{{ '/path/' | relative_url }}` for internal links so `baseurl` is respected.
  - Open an issue for editorial or structural changes; create focused PRs mapped to a single habit or change.
  - Maintain historical stability of the seven habits; avoid adding new top-level habits without discussion.

- **Files added by agents/tools:**
  - `_includes/site-header.html` (site header/navigation)
  - `_layouts/default.html` (layout override to include header)
  - `tools/generate-favicons.ps1` (PowerShell helper — optional local tool)
  - `assets/images/favicon.svg` (fallback favicon)
  - `.gitignore` contains `tools/` and generated favicon names by default; remove those lines if you want generated images tracked.

- **Editing rules for AI agents:**
  - Do not change the intent of any habit. Edits must be editorial (clarity, grammar, small restructuring) and preserve meaning.
  - When adding examples, include front-matter (`title`, `layout`, `permalink`) and add a single link from `habits/habits.md`.
  - When changing layout/includes, keep changes minimal and explain why in the PR description.

- **PR template suggestion (use in PR body):**
  - **Summary:** One-line summary
  - **Related habit(s):** (if applicable)
  - **Why:** short rationale
  - **Testing:** how to preview locally

- **Maintainer / Contact:** Inbar Rose — https://inbarrose.com (the maintainer has editorial authority; use issues for discussion).

If you want a runnable task (generate favicons, add an example page, or update phrasing across files), say which action and I will implement it.
