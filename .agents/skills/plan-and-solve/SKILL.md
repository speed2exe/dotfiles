---
name: plan-and-solve
description: Maintain a living context document (plan.md) as a self-note to preserve the original agenda, track progress, and prevent context drift during complex tasks
---

# plan-and-solve

Write and maintain a **plan.md** file as a self-note so you don't lose sight of the original goal during long or complex tasks. This is your scratchpad for what you set out to do, what you've learned, and what's left.

## When to Use

- The task will take many steps and you risk forgetting the original intent
- You need to remember decisions, constraints, or discoveries across steps
- The user's request is broad and you need to crystallize it before acting
- You're about to delegate to sub-agents and need a shared source of truth

## How It Works

### 1. Write the initial note

At the start of a complex task, create `plan.md`. This is your working document to capture:
- The original context and user request
- The concrete steps you plan to take (agenda)
- Any constraints or requirements you need to respect

```markdown
# Context

<What the user asked for, in your own words. Include the *why* if known.>

## Agenda

- <concrete thing to do>
- <concrete thing to do>
- ...

## Constraints

- <anything that must be respected: conventions, existing tests, user preferences>

## Open Questions

- <anything still unclear>
```

Keep it short and direct. This is a note to yourself, not a formal document.

### 2. Re-read before acting

**Before starting each major step**, re-read `plan.md` to check:
- Am I still aligned with the original context?
- Has anything changed that I should account for?
- What's the next thing to do?

### 3. Update as you go

After completing a step or learning something new, **edit plan.md** to reflect reality:
- Mark completed items (prefix with `[x]` or move to a `## Done` section)
- Add new items you discovered along the way
- Record key decisions and *why* you made them
- Note anything that surprised you or deviated from the plan

Example update:

```markdown
## Agenda

- [x] Scaffold the new module
- [x] Wire up routes — ended up using middleware pattern instead of manual wiring
- [ ] Add tests
- [ ] Update README (discovered it references old API)

## Decisions

- Used middleware pattern for routes because it matches the existing auth module style
```

### 4. Refer back after detours

If you went down a rabbit hole, got sidetracked by an error, or context feels fuzzy — **re-read plan.md**. It's there to pull you back on track.

### 5. Final update

When the task is done, update the note one last time:
- Summarize what was actually done
- Note any loose ends or follow-ups

## Rules

- **Write it early.** Don't wait until you're lost — write the note at the start.
- **Keep it honest.** Update it when reality diverges from the plan. A stale note is worse than no note.
- **Keep it brief.** Bullet points over paragraphs. This is a working note, not documentation.
- **Re-read often.** The value is in *consulting* the note, not just writing it.
