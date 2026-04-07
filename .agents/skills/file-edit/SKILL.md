---
name: file-edit
description: Edit files using efficient Unix command-line tools instead of rewriting entire files
---

# file-edit

Edit files using sed/awk/grep instead of rewriting entire contents. Use for targeted line changes, search-and-replace, or insertions.

> **macOS**: BSD sed requires `sed -i ''`; Linux GNU sed uses `sed -i`.

## Common Patterns

```bash
sed -i 's/old/new/g' file.txt                   # replace all occurrences
sed -i '/pattern/s/old/new/g' file.txt          # replace on matching lines only
sed -i '/pattern/d' file.txt                    # delete matching lines
sed -i '5d' file.txt                            # delete line 5
sed -i '10,20d' file.txt                        # delete lines 10-20
sed -i '/pattern/a\new line' file.txt           # insert after match
sed -i '/pattern/i\new line' file.txt           # insert before match
sed -i '1i\new first line' file.txt             # prepend
echo 'content' >> file.txt                      # append
sed -n '5,10p' file.txt                         # extract lines 5-10

awk -F',' '{print $2}' file.txt                 # print 2nd CSV field
grep '^def ' main.py | sed 's/def //;s/(.*//'  # extract function names

diff -u original.txt modified.txt > changes.patch
patch original.txt < changes.patch
```

## Best Practices

- Backup first: `cp file.txt file.txt.bak`
- Use git to track changes
- Escape special characters in sed patterns (`/`, `&`, `\`)
- Use `file-read` skill to locate target lines before editing
