---
name: find-skills
description: Helps users discover and install agent skills when they ask questions like "how do I do X", "find a skill for X", "is there a skill that can...", or express interest in extending capabilities. This skill should be used when the user is looking for functionality that might exist as an installable skill.
---

# Find Skills

## Process

1. **Check [skills.sh leaderboard](https://skills.sh/)** for well-known skills first. Top sources: `vercel-labs/agent-skills` (React, Next.js, web design), `anthropics/skills` (frontend, docs).
2. **Search if needed:** `npx skills find [query]` — use specific keywords (e.g., `react performance`, `pr review`).
3. **Verify quality:** prefer 1K+ installs; treat unknown authors with <100 GitHub stars skeptically.
4. **Present results** with: skill name/purpose, install count, install command, and skills.sh link.
5. **Install if requested:** `npx skills add <owner/repo@skill> -g -y`

## Key Commands

| Command | Purpose |
|---|---|
| `npx skills find [query]` | Search for skills |
| `npx skills add <pkg> -g -y` | Install globally, no prompts |
| `npx skills update` | Update all installed skills |

## Common Categories

| Category | Keywords |
|---|---|
| Web Dev | react, nextjs, typescript, tailwind |
| Testing | jest, playwright, e2e |
| DevOps | docker, kubernetes, ci-cd |
| Docs | readme, changelog, api-docs |
| Code Quality | review, lint, refactor |

## No Results

If nothing matches, help directly and suggest `npx skills init` to create a custom skill.
