# Quick start — for the daily operator

> **You don't need to learn the framework. Claude reads it.** Your job is to talk to Claude in plain English. This page is what you read once. After that, you do the 7 steps below.

---

## One-time setup (per project)

```bash
git clone <project-url>
cd <project>
./bootstrap.sh
```

That's it. `bootstrap.sh` pulls the playbook submodule and installs npm dependencies. Then run `claude` in the project directory to start a Claude Code session.

---

## Your daily workflow — 7 steps

1. **Open Claude Code in the project root.** `cd` into the project, run `claude`.

2. **Tell it what you want to build, in one plain-English sentence.**
   > *Example: "I want to build a workflow that reads our customer feedback emails and summarizes them weekly."*

3. **Answer its questions in plain English.** It will ask things like *"where do the emails come from?"* and *"who reads the summary?"* If a question feels too technical, say:
   > *"I don't know — what would you recommend, and why?"*

4. **Review the draft it shows you.** If it doesn't make sense, say:
   > *"Explain it in plain English again."*

5. **Approve when it looks right** — *"Approved, continue."*
   Or push back — *"This doesn't fit because [reason]. Can we try [alternative]?"*

6. **When Claude says "phase done / PR open"** — go to GitHub and merge the PR.

7. **Open a fresh chat for the next phase.** Don't continue the same chat across phases.

That's the whole job.

---

## When you get stuck

Tell Claude:

> *"Based on the playbook, what should I do next?"*

Claude reads the relevant section and answers. The playbook (`docs/playbook/PLAYBOOK.md`) is for Claude — you don't need to open it yourself.

---

## What the 4 phases look like

A typical feature goes through these phases. Each phase is one chat, ending with a merged PR.

| Phase | What you do | What Claude produces |
|---|---|---|
| **Intake** | Describe the feature in plain English | `docs/intake/000N-<name>.md` — a 1-page brief |
| **ADR** | Approve the design tradeoffs | `docs/adr/000N-<title>.md` — the decision record |
| **Implementation** | Approve the code + diagram updates as they land | Working code + LikeC4 diagram update + cli-tools.md row |
| **Test/use** | Run it on a real input, report what's broken | Fixes + improvements |

---

## What you don't have to do

- ❌ Read the 400-line playbook
- ❌ Learn LikeC4 syntax
- ❌ Write code yourself
- ❌ Edit `.c4` files or YAML frontmatter
- ❌ Manage git branches manually

Claude does all of these. Your role is the human approval gate — the person who knows the business, the constraints, and what *good* looks like.

---

## Phrases that work well with Claude

**When you don't know something:**
- *"I don't know — recommend something and explain why."*
- *"What are the tradeoffs?"*
- *"What would the simplest version look like?"*

**When you want to push back:**
- *"This feels too complex. Is there a simpler version?"*
- *"Why are we doing X instead of Y?"*
- *"What does the playbook say about this?"*

**When you want to review:**
- *"Show me the changes."*
- *"Walk me through this in plain English."*
- *"What are the risks?"*

**When you want to approve and move on:**
- *"Approved, continue."*
- *"Looks good. Open the PR and stop there."*

---

## More detail (optional)

If you want to understand *why* the framework is set up this way, read [`docs/playbook/PLAYBOOK.md`](docs/playbook/PLAYBOOK.md). It's optional. The 7 steps above are what you do daily.
