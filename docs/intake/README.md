# Intake

The intake folder is where every feature or agent **starts**. Before any
DSL, ADR, or code is written, you fill in an intake file in plain
English. Claude reads it first, asks clarifying questions, then drafts
the ADR, the LikeC4 update, and the agent/skill code from your intake.

This is the operator-level artifact you can verify yourself — *before*
the technical layer (LikeC4, code) is touched.

## Why this exists

The recipe for adding an agent or feature is:

1. **Napkin flow** — one sentence describing what it does.
2. **Tools list** — every external action it can take, irreversible ones flagged.
3. **Happy path vs failure paths** — for each step, success and ≥2 failure modes.
4. **ADR** — written *after* alignment, captures the "why".
5. **Hand to Claude** — only now write the agent prompt, code, and diagrams.

Without an intake, those steps live in a chat transcript and rot. With
an intake, they live in `docs/intake/0001-…md` and travel with the
project.

## Workflow

1. Copy [0000-template.md](0000-template.md) → `0001-<your-feature>.md`.
2. Fill sections 1–4 in plain English. Leave section 5 for now.
3. Hand it to Claude: *"build this from the intake."*
4. Claude asks clarifying questions, then drafts ADR + LikeC4 + code.
5. You review the **ADR** to approve direction. (Not the DSL or code.)
6. Once built, append a "Built" section with cross-links to ADR / views / agent.

## Index

| # | Title | Status |
|---|---|---|
| 0001 | [Example — daily digest](0001-example-daily-digest.md) | Example (do not build) |

<!--
Add a row per real intake, e.g.:
| 0002 | Lead scoring | Approved |

Delete the example row once your project has its own real intakes.
-->

