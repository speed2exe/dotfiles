---
name: file-create
description: A skill for reliably creating files using shell commands
---
# file-create

A skill for reliably creating files using shell commands. Avoids common pitfalls with quoting, escaping, and redirection.

## Usage

Activate this skill when you need to create a file with specific content. The skill provides multiple reliable methods for different use cases.

## Method 1: tee (Recommended for most cases)

Use when: Creating a file with content that may contain special characters, quotes, or newlines.

```bash
process:
  command: "tee"
  args: ["/path/to/file.txt"]
  stdin: "Your file content here"
```

## Method 2: printf (Good for formatted output)

Use when: Need precise formatting, escape sequences, or complex characters.

```bash
process:
  command: "sh"
  args: ["-c", "printf '%s' '$CONTENT' > /path/to/file.txt"]
```

## Method 3: echo with here-doc (Alternative)

```bash
process:
  command: "sh"
  args: ["-c", "cat > /path/to/file.txt << 'EOF'
content here
EOF"]
```

## Method 4: cat with redirection (Avoid - breaks)

⚠️ **AVOID** using cat with direct redirection in process tool:
```bash
# DON'T DO THIS - redirection happens in shell, not in process
process:
  command: "cat"
  args: [">", "/path/to/file.txt"]  # WRONG - ">" becomes a filename
```

## Directory Creation

Always create parent directories first:

```bash
process:
  command: "mkdir"
  args: ["-p", "/parent/dir/path"]
```

## Best Practices

1. **Always use `-p` with mkdir** to create parent directories
2. **Prefer `tee` for file creation** - it handles content reliably
3. **Avoid shell redirection** (`>`, `>>`) in process tool arguments
4. **Use absolute paths** when possible to avoid confusion
5. **Test file creation** with `ls -la` after creation to verify

## Example: Creating a Skill

```bash
# Step 1: Create directory
process:
  command: "mkdir"
  args: ["-p", "~/.agents/skills/my-skill"]

# Step 2: Create SKILL.md
process:
  command: "tee"
  args: ["~/.agents/skills/my-skill/SKILL.md"]
  stdin: "# my-skill\n\nDescription...\n\n## Usage\n..."

# Step 3: Verify
process:
  command: "ls"
  args: ["-la", "~/.agents/skills/my-skill/"]
```
