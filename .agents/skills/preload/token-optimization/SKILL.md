---
name: token-optimization
description: Rules to minimize token usage
---

## Cap output

Every command can produce unbounded output. Always limit it.

- Redirect to file first, then extract: `cmd > /tmp/out.txt 2>&1` → `grep`/`head`/`tail` → `rm`
- Pipe to `head -n` or `tail -n`. Use `--quiet`, `--short`, `--oneline`.
- Must cap: `find`, `ls -R`, `cat` on unknown files, test suites, `git log`, builds.

## Search before read

Never read entire files. Locate the relevant lines first.

- `glob` → `grep -n` → `sed -n '30,50p'` → stop.
- Narrow: filter by directory, file type (`--include='*.go'`), match count (`-m 10`), or `grep -q` for boolean checks.

## Extract fields, never dump

Do not dump raw JSON/YAML/XML.

- Use `jq '.key'`, `awk '{print $2}'`, `cut -d: -f1`.
- For build/test output: `grep -m1 'ERROR\|FAIL'` + `tail -30`.

## Diff before full read

Use `git diff -- file` first. Read the full file only when diff lacks sufficient context.

## No re-ingestion

Check context before any read. Do not re-read files, re-run searches, or verify what is already known.

## Batch calls

- Run independent reads/searches in parallel within one turn.
- Chain dependent commands: `cmd1 && cmd2`.
- Combine patterns: `grep -n 'pat1\|pat2' file`.

## Surgical edits only

Use targeted replacements (`sed -i '' 's/old/new/g'`). Never rewrite whole files.

## Concise responses

State the result. Skip the process. Omit what the user already knows.

- One short paragraph or a few bullets. Not both.
