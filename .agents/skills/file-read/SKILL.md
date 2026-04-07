---
name: file-read
description: Read files efficiently to minimize token usage — use targeted reads instead of dumping entire files
---

# file-read

Read files efficiently — fetch only what you need. **Never `cat` a large file when a subset suffices.**

## Decision Guide

| Situation | Command |
|-----------|---------|
| Know what you're looking for | `grep -n "symbol" file` |
| Need first N lines | `head -n 50 file` |
| Need last N lines | `tail -n 30 file` |
| Need lines M–N | `sed -n 'M,Np' file` |
| Unknown file, check size first | `wc -l file && head -n 30 file` |
| File < 100 lines | `cat file` |

## Patterns

```bash
wc -l file.txt                                     # check size before reading

grep -n "pattern" file.txt                         # find lines + line numbers
grep -n -A 5 -B 2 "pattern" file.txt              # with surrounding context
grep "^import\|^from" file.py                      # filter specific line types
grep -v "^#\|^$" file.txt                          # skip comments/blank lines

head -n 50 file.txt                                # first 50 lines
tail -n 30 file.txt                                # last 30 lines
sed -n '10,30p' file.txt                           # lines 10–30

sed -n '/^## Section/,/^## /p' file.txt            # between markers

grep -n "^def my_func" file.py                     # find block start line
sed -n '42,60p' file.py                            # then extract the block

{ sed -n '1,10p' f.txt; echo "---"; sed -n '80,90p' f.txt; }  # non-contiguous

wc -l file.txt && head -n 5 file.txt && echo "..." && tail -n 5 file.txt  # summarize
```

## Rules

- Check `wc -l` before reading unknown files
- Use `grep` first when you know what you're looking for
- Read in chunks (30–50 lines); fetch more only if needed
- Avoid `cat` on files > 200 lines unless full content is required
