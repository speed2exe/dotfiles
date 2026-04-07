---
name: create-skill
description: A meta-skill to create new skills in the default skill directory with proper YAML front matter
---

# create-skill

Creates a new skill under `~/.agents/skills/<skill-name>/SKILL.md`.

## Steps

1. `mkdir -p ~/.agents/skills/<skill-name>`
2. Write `SKILL.md` using the template below (use the `file-create` skill to write the file)
3. Verify: line 1 is `---`, `name` matches the directory, `description` is informative

## ⚠️ Critical Rule

**`SKILL.md` MUST begin with `---` on line 1.** Anything before it breaks skill discovery.

## SKILL.md Template

```markdown
---
name: <skill-name>
description: <one-line description>
---

# <skill-name>

<purpose>

## When to Use

- <trigger>

## Usage

<instructions>

## Parameters

- `param`: <description>

## Notes

- <caveats>
```