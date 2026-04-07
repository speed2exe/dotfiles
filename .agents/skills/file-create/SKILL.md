---
name: file-create
description: A skill for reliably creating files using shell commands
---
# file-create

Reliably create files via shell commands, avoiding quoting/escaping/redirection pitfalls.

> Use this when a tool's `create` or `write` primitive isn't available, or when content has special characters that break redirection.

## Methods

**Method 1: tee** (recommended — handles special chars, quotes, newlines)
```bash
process:
  command: "tee"
  args: ["/path/to/file.txt"]
  stdin: "file content here"
```

**Method 2: here-doc** (alternative for multiline content)
```bash
process:
  command: "sh"
  args: ["-c", "cat > /path/to/file.txt << 'EOF'\ncontent here\nEOF"]
```

**Method 3: printf** (for escape sequences / precise formatting)
```bash
process:
  command: "sh"
  args: ["-c", "printf '%s' '$CONTENT' > /path/to/file.txt"]
```

## Directory Creation

Create parent dirs first with `-p`:
```bash
process:
  command: "mkdir"
  args: ["-p", "/parent/dir"]
```

## Example

```bash
# 1. Create directory
process:
  command: "mkdir"
  args: ["-p", "~/.agents/skills/my-skill"]

# 2. Write file
process:
  command: "tee"
  args: ["~/.agents/skills/my-skill/SKILL.md"]
  stdin: "# my-skill\n\n## Usage\n..."

# 3. Verify
process:
  command: "ls"
  args: ["-la", "~/.agents/skills/my-skill/"]
```
