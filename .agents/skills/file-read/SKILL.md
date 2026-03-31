---
name: file-read
description: Read files efficiently to minimize token usage — use targeted reads instead of dumping entire files
---

# file-read

Read files efficiently by fetching only the content you need. Never read an entire file when a subset suffices.

## Token-Saving Priority Order

1. **grep** — find specific lines/patterns (best for targeted lookup)
2. **head/tail** — read start or end of file
3. **sed -n** — read a specific line range
4. **wc -l** — check file size before deciding how to read
5. **cat** — read the whole file (last resort, only for small files)

---

## Patterns

### Check file size first (avoid surprises)
```bash
wc -l file.txt
```

### Read first N lines
```bash
head -n 50 file.txt
```

### Read last N lines
```bash
tail -n 50 file.txt
```

### Read a specific line range
```bash
sed -n '10,30p' file.txt
```

### Search for a pattern (with context)
```bash
grep -n "pattern" file.txt          # matching lines + line numbers
grep -n -A 5 -B 2 "pattern" file.txt  # with 2 lines before, 5 after
```

### Read a section between two markers
```bash
sed -n '/^## Section/,/^## /p' file.txt
```

### Extract a specific function or block
```bash
grep -n "^def my_func" file.py      # find line number first
sed -n '42,60p' file.py             # then read just that block
```

### Read multiple non-contiguous sections
```bash
{ sed -n '1,10p' file.txt; echo "---"; sed -n '80,90p' file.txt; }
```

### Read only lines matching a pattern
```bash
grep "^import\|^from" file.py       # e.g., all imports
grep -v "^#\|^$" file.txt           # skip comments and blank lines
```

### Summarize a large file
```bash
wc -l file.txt && head -n 5 file.txt && echo "..." && tail -n 5 file.txt
```

---

## Decision Guide

| Situation | Command |
|-----------|---------|
| Need a specific symbol/function | `grep -n "symbol" file` |
| Need first N lines (config, header) | `head -n N file` |
| Need last N lines (logs, output) | `tail -n N file` |
| Need lines M–N | `sed -n 'M,Np' file` |
| File is small (< 100 lines) | `cat file` |
| File is large, unknown content | `wc -l file && head -n 30 file` |

---

## Best Practices

1. **Always check line count** with `wc -l` before reading large/unknown files
2. **Use grep first** when you know what you're looking for
3. **Read in chunks** — read 30–50 lines, then fetch more only if needed
4. **Avoid `cat` on files > 200 lines** unless full content is truly required
5. **Combine grep + sed**: grep to find the line number, sed to extract the block
