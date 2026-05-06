# Intake: example — daily digest

> **This is a worked example, not a real feature request.** It exists so a new operator can see what a filled-in intake looks like before writing their own. Do **not** build it. Delete this file once your project has a real intake of its own.

> Status: Example
>
> Owner: (template author)
>
> Date: 2026-05-06

## 1. Napkin flow

Every weekday at 09:00, send the operations director a one-page summary email of yesterday's pipeline activity (leads in, leads converted, leads stuck).

## 2. Tools / external actions

- [x] Database read
- [ ] Database write
- [ ] External API read (which?): __________
- [ ] External API write (which?): __________
- [x] Email / messaging send (!)
- [ ] CRM write (!)
- [ ] Web scraping / browser automation
- [ ] File system writes outside the repo
- [ ] Other: __________

Irreversible actions identified: sending the digest email is irreversible — needs a fail-closed gate (e.g. "if no leads at all yesterday, skip rather than send a misleading digest").

## 3. Happy path vs failure paths

Step 1: Cron fires at 09:00 Mon–Fri.
  - ✓ Happy: scheduler invokes the digest agent.
  - ✗ Failure A: clock drift / cron skipped → operator notices missing email by 09:30, runs the agent manually with `digest run --date=yesterday`.
  - ✗ Failure B: scheduler fires twice → second invocation no-ops because today's digest row already exists in the DB.

Step 2: Agent reads pipeline DB and renders the digest.
  - ✓ Happy: digest contains lead counts by stage, top 3 stuck leads, week-over-week delta.
  - ✗ Failure A: DB unreachable → agent retries 3× then writes a "digest failed" row and exits non-zero. Cron alerts operator.
  - ✗ Failure B: zero leads in the window → fail-closed gate skips email rather than sending a blank report.

Step 3: Agent sends the digest email via SMTP.
  - ✓ Happy: SMTP returns 250, agent records `sent_at` in the DB.
  - ✗ Failure A: SMTP returns 5xx → retry once after 60s; if still failing, log and exit non-zero. **Do not** retry indefinitely — re-sending stale digests is worse than missing one.
  - ✗ Failure B: digest renders empty due to template bug → upstream test (Step 2) should catch this; if it leaks through, recipient sees `<!-- empty -->` and pings operator.

## 4. Open questions for Claude

- Is a SQLite cron table the right primitive for "today's digest already sent," or should the agent query the SMTP sent log?
- Recipient list: hard-coded constant, env var, or a `recipients` table?
- Do we render Markdown → HTML for the email body, or send plain text?

## 5. Decision rationale

- Cron + a single deterministic CLI invocation beats a long-running scheduler — fewer moving parts, easier to re-run.
- Read-only against the pipeline DB. The agent must not write anything except its own `digest_sent_at` audit row.
- Alternatives considered: Slack DM rejected because director prefers email; live dashboard rejected because it requires a frontend nobody will maintain.

---

<!-- After build, append:
- ADR: [0001-daily-digest.md](../adr/0001-daily-digest.md)
- LikeC4: digest container view added to model.c4
- Agent: .claude/agents/daily-digest.md
-->
