---
name: create-skill
description: A meta-skill to create new skills in the default skill directory with proper YAML front matter
---

# create-skill

A meta-skill to create new skills in the default skill directory.

## Usage

When the user wants to create a new skill, call this skill by name "create-skill" and provide:
- `skill_name`: The name of the new skill (directory name)
- `description`: A brief description of what the skill does
- `usage_instructions`: Detailed instructions on how to use the skill

## Skill Directory Structure

```
~/.agents/skills/
└── <skill-name>/
    └── SKILL.md
```

## Creating a New Skill

1. Create the skill directory: `mkdir -p ~/.agents/skills/<skill-name>`
2. Create `SKILL.md` using the template below — **the file MUST start with the `---` YAML frontmatter block on line 1**
3. The skill is now available to be activated

## ⚠️ Critical Rule

**`SKILL.md` must begin with YAML frontmatter on the very first line.** Omitting it causes a runtime warning and the skill may not be discovered:

```
warning: skill ".../<skill-name>": SKILL.md must begin with YAML frontmatter (---)
```

## SKILL.md Template

Use this template exactly — do not add anything before the opening `---`:

```markdown
---
name: <skill-name>
description: <brief one-line description of what the skill does>
---

# <skill-name>

A longer description of the skill and its purpose.

## When to Use This Skill

- Trigger condition 1
- Trigger condition 2

## Usage

Instructions on how to call and use this skill.

## Parameters

- `param1`: Description of parameter 1
- `param2`: Description of parameter 2

## Notes

- Any important caveats or tips
```

## Validation Checklist

Before finishing, verify the new skill:
- [ ] `SKILL.md` line 1 is exactly `---`
- [ ] `name` in frontmatter matches the directory name
- [ ] `description` is concise and informative (used for skill discovery)
- [ ] File contains meaningful usage instructions