---
name: plan-and-solve
description: Maintain a living context document (plan.md) as a self-note to preserve the original agenda, track progress, and prevent context drift during complex tasks
---

# plan-and-solve

Write and maintain a **plan.md** in the session workspace as a self-note to stay on track during complex tasks.

## When to Use

- Task has many steps and you risk losing the thread
- Need to remember decisions or discoveries across steps
- User request is broad and needs crystallizing before acting
- Delegating to sub-agents and need a shared reference

## When NOT to Use

- Task is straightforward (< 3 steps)
- You can hold the full context in one response
- The user already gave a precise, step-by-step instruction

## How It Works

### 1. Write the plan early

Create `plan.md` in the session workspace at the start. Template:

```markdown
# Goal

<What the user wants and why, in your own words.>

## Agenda

- [ ] <concrete step>
- [ ] <concrete step>

## Constraints

- <conventions, existing tests, user preferences to respect>

## Open Questions

- <anything unclear — resolve by asking the user before proceeding>
```

Keep it terse. This is a note to yourself, not documentation.

### 2. Resolve open questions first

Don't guess. Ask the user to clarify before you start work. Remove resolved questions from the list; record answers in Constraints or Agenda as appropriate.

### 3. Re-read before each major step

Before starting a step, re-read `plan.md`. Check:
- Am I still aligned with the original goal?
- What's next?

Do this especially after detours, errors, or sub-agent results.

### 4. Update as you go

After completing a step or learning something new, edit `plan.md`:
- Mark done: `- [x] step — note if approach changed`
- Add new items discovered along the way
- Record key decisions and *why*

### 5. Handle plan failure

If reality diverges so much the plan no longer makes sense:
- Don't patch a broken plan — rewrite the Agenda section from scratch
- Keep the original Goal as anchor
- Note what changed and why in a `## Pivot` section

### 6. Delegate with the plan

When using sub-agents, include relevant sections of `plan.md` in the prompt so they share context. Update the plan with their findings.

### 7. Close out

When done, update `plan.md` one last time:
- What was actually done
- Any loose ends or follow-ups

## Rules

- **Write early.** Before you're lost, not after.
- **Keep honest.** A stale plan is worse than no plan.
- **Keep brief.** Bullets over paragraphs.
- **Re-read often.** The value is in consulting it, not writing it.
