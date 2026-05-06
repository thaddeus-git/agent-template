# Intake: <feature or agent name>

<!--
File name: kebab-case noun phrase, e.g. 0001-lead-scoring.md, 0002-daily-digest.md.
This is the FIRST file you fill in for any new feature or agent.

Workflow:
  1. You (the operator) fill in sections 1–4 in plain English.
  2. Hand the file to Claude: "build this from the intake."
  3. Claude asks any clarifying questions, then drafts:
       a. an ADR (docs/adr/) capturing the decision rationale
       b. a LikeC4 update (docs/architecture/likec4/) for the structural change
       c. the agent prompt or skill (.claude/agents/, .claude/skills/)
  4. You review the ADR — not the DSL or code — to approve direction.
-->

> Status: <Draft | Approved | Built | Superseded>
>
> Owner: <your name>
>
> Date: YYYY-MM-DD

## 1. Napkin flow

<!--
ONE sentence describing what this thing does. If it doesn't fit, split it.

Good: "When a new lead arrives from the contact form, send a thank-you
       email and create a CRM record."
Bad:  "Lead handling system that ingests, validates, enriches, classifies,
       routes, and persists leads from multiple sources..." (too big — split)
-->

<one sentence>

## 2. Tools / external actions

<!--
Tick every external action this thing can take. Mark IRREVERSIBLE actions
with (!) — those need a fail-closed gate or human approval before they fire.

If you don't know whether an action is needed, leave it unticked and add a
note to section 4 (Open questions for Claude).
-->

- [ ] Database read
- [ ] Database write
- [ ] External API read (which?): __________
- [ ] External API write (which?): __________
- [ ] Email / messaging send (!)
- [ ] CRM write (!)
- [ ] Web scraping / browser automation
- [ ] File system writes outside the repo
- [ ] Other: __________

Irreversible actions identified: <list, or "none">

## 3. Happy path vs failure paths

<!--
Step-by-step. For each major step, the success outcome AND at least two
failure modes. Don't skip — your strongest review skill is operational
edge cases. Make yourself do this exercise.

Format:
  Step 1: <what happens>
    ✓ Happy: <success outcome>
    ✗ Failure A: <what goes wrong>  → <handling>
    ✗ Failure B: <what goes wrong>  → <handling>
-->

Step 1: <what happens>
  - ✓ Happy: <success outcome>
  - ✗ Failure A: <what goes wrong> → <handling>
  - ✗ Failure B: <what goes wrong> → <handling>

Step 2: <what happens>
  - ✓ Happy: <success outcome>
  - ✗ Failure A: <what goes wrong> → <handling>
  - ✗ Failure B: <what goes wrong> → <handling>

## 4. Open questions for Claude

<!--
Things you don't know how to answer. Claude proposes options, you pick.
Examples:
  - "Should this run on a schedule or be triggered by an event?"
  - "Does this need to dedupe by email or by domain?"
  - "What happens if the external API is down for 30 minutes?"

If you have NO questions, write "None — proceed to build" so it's explicit.
-->

- <question 1>
- <question 2>

## 5. Decision rationale

<!--
WHY this design over alternatives. Filled in jointly with Claude before the
ADR is written. This becomes the "Decision" + "Consequences" sections of
the resulting ADR in docs/adr/.

Keep it short — 3–6 bullets. The ADR is the long form.
-->

- <reason 1>
- <reason 2>
- Alternatives considered: <alt A> rejected because <reason>; <alt B> rejected because <reason>.

---

<!--
Once approved + built, append a "Built" section here with links:
  - ADR: [NNNN-title.md](../adr/NNNN-title.md)
  - LikeC4: which view(s) changed
  - Agent / skill: .claude/agents/<name>.md
-->
