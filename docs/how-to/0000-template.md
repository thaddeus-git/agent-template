# <Action verb> <thing>

<!--
File name: kebab-case verb-first, e.g. recover-stuck-lead.md, register-form.md.
Title is one line, sentence case, starts with the action ("Recover…", "Register…", "Replay…").
Add a row to docs/how-to/README.md when you create this file.
-->

Use when <one-sentence symptom that tells the operator they're in the
right runbook>.

## 1. Diagnose

<!--
First, the operator confirms what's actually wrong. Show the exact
commands that surface the relevant fields.
-->

```bash
<command to inspect state>
```

Look at `<field_a>`, `<field_b>`, …

## 2. Fix

<!--
The actual remedy. Group by root cause if there are multiple. Show the
exact commands; do not paraphrase.
-->

For <cause A>:

```bash
<remedy command>
```

For <cause B>: <one-sentence remedy + link>.

## 3. Verify

<!--
How the operator confirms the fix worked end-to-end.
-->

```bash
<verification command>
```

The expected outcome is <state>.

## Common causes

- **`<error_string>`** — <root cause>. <Remedy>.
- **<symptom>** — <root cause>. <Remedy>.
