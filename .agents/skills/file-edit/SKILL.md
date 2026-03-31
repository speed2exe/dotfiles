---
name: file-edit
description: Edit files using efficient Unix command-line tools instead of rewriting entire files
---

# file-edit

Edit files efficiently using Unix command-line tools (sed, awk, grep, etc.) rather than rewriting entire file contents. This minimizes token usage and is much faster for small edits.

## When to Use This Skill

- Making small targeted changes to existing files
- Adding, removing, or modifying specific lines
- Search-and-replace operations
- Inserting content at specific positions
- Extracting or transforming file content

## Common Patterns

### Replace text in a file
```bash
sed -i 's/old-text/new-text/g' file.txt
```

### Replace on specific lines only
```bash
sed -i '/pattern/s/old/new/g' file.txt
```

### Delete lines matching a pattern
```bash
sed -i '/pattern/d' file.txt
```

### Delete specific line numbers
```bash
sed -i '5d' file.txt        # delete line 5
sed -i '10,20d' file.txt    # delete lines 10-20
```

### Insert text after a matching line
```bash
sed -i '/pattern/a\new line content' file.txt
```

### Insert text before a matching line
```bash
sed -i '/pattern/i\new line content' file.txt
```

### Append to end of file
```bash
echo 'new content' >> file.txt
```

### Prepend to beginning of file
```bash
sed -i '1i\new first line' file.txt
```

### Extract specific lines
```bash
sed -n '5,10p' file.txt     # lines 5-10 only
```

### Using awk for column operations
```bash
awk '{print $1}' file.txt           # print first column
awk -F',' '{print $2}' file.txt     # comma-separated, print 2nd field
awk '/pattern/ {print NR": "$0}'   # print line number and content
```

### Patch files using diff/patch
```bash
# Create a patch
diff -u original.txt modified.txt > changes.patch

# Apply a patch
patch original.txt < changes.patch
```

## macOS vs Linux Notes

- macOS uses BSD sed which requires `sed -i ''` for in-place edits
- Linux uses GNU sed which uses `sed -i` without the empty string
- This skill assumes Linux-style sed; on macOS add the empty string: `sed -i '' 's/old/new/g' file`

## Examples

### Add a new import statement after existing imports
```bash
sed -i '/^import /a\import newpackage' main.py
```

### Update a version number in a config file
```bash
sed -i 's/version: .*/version: 2.0.0/' config.yaml
```

### Remove debug print statements
```bash
sed -i '/print.*debug/d' main.py
```

### Extract function names from a Python file
```bash
grep '^def ' main.py | sed 's/def //' | sed 's/(.*//'
```

## Best Practices

1. **Always backup** before making changes: `cp file.txt file.txt.bak`
2. **Test on a copy** first when unsure
3. **Use version control** (git) to track changes
4. **Combine tools** for complex operations: `grep pattern file | sed 's/old/new/'`
5. **Escape special characters** properly in sed patterns

## Parameters (for agent usage)

- `file`: Path to the file to edit
- `operation`: Type of operation (replace, delete, insert, append)
- `pattern`: Search pattern or line reference
- `content`: New content to insert/replace
- `backup`: Whether to create a backup (default: true)
