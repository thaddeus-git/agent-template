# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Working Principles

Before writing code, surface assumptions explicitly — state what you're about to do and why, flag tradeoffs, and ask if the approach is unclear rather than guessing silently.

Write the minimum code that solves the stated problem. No speculative features, no unrequested abstractions, no preemptive error handling for impossible cases.

Touch only what the task requires. Match the style of surrounding code. Clean up only what your own edits made obsolete.

Translate vague requests into verifiable outcomes before starting. If you can't state how success will be confirmed, clarify first.

Default to less, not more. New artifacts (diagrams, docs, tooling, abstractions) need to address an actual problem, not polish for its own sake.

## How features are added — intake-first

**For any new feature or agent, the first file you touch is `docs/intake/`.** Not the LikeC4 model. Not the agent prompt. Not code. The intake.

The flow:

1. **Intake** ([`docs/intake/0000-template.md`](docs/intake/0000-template.md)) — operator fills in plain English: napkin flow, tools list (with irreversibles flagged), happy/failure paths, open questions.
2. **Clarify** — Claude reads the intake and asks any remaining questions before designing.
3. **ADR** ([`docs/adr/`](docs/adr/)) — Claude drafts the decision rationale in MADR format. The operator reads and approves the ADR.
4. **LikeC4** ([`docs/architecture/likec4/`](docs/architecture/likec4/)) — Claude updates the structural model.
5. **Code** — only now write the agent prompt, skill, or CLI.

For new features, agents, or skills, if a request arrives without an intake, the first response is *"let's fill in `docs/intake/<name>.md` first"*, not code. Bug fixes, doc edits, and small chores skip the intake step.

## Project Invariants

These are session-critical rules. Violating one breaks the harness contract — fix the violation, do not weaken the rule.

- **The LikeC4 model is structural canon — auto-imported every session. Do not autonomously edit it as part of a bug fix.** If a fix requires a model change, stop and ask the human.
- **When sources disagree, follow [docs/AUTHORITY-ORDER.md](docs/AUTHORITY-ORDER.md).**

### Optional invariants — keep, replace, or delete

These are common shapes worth considering. Adopt the ones that fit; delete or rewrite the rest. The template makes no assumption about which apply.

- **State lives on the row, not the agent.** Workers are stateless; re-derive stage from the row each invocation. *(Applies if you have a pipeline DB.)*
- **The DB is the only durable pipeline state.** Skill output is transient — the agent must persist after each stage. *(Applies if you have a pipeline DB.)*
- **Three primitives only — CLI / Skill / Agent.** Pick by *does the inner loop need an LLM call?*
  - **CLI** — no LLM. Deterministic shell or TypeScript.
  - **Skill** — pure LLM transform. No DB or network I/O inside the skill body.
  - **Agent** — LLM driver that orchestrates I/O and invokes Skills.
- **External side-effects are declared in the agent's `side_effects:` frontmatter — never inferred.** Mirrors the LikeC4 `#side-effect-external` tag.

## Runtime Surfaces

> **None of the `.claude/` directories exist in the empty template** — create them when you add your first agent or skill. The conventions below describe what each should hold once it does exist.

- `.claude/agents/` is the canonical source for repo-defined agent prompts.
- `.claude/context/` contains runtime reference docs that prompts load inline.
- `.claude/skills/` is the canonical skill surface (source of truth and runtime).
- At runtime, invoke skills directly via `Skill(...)` instead of searching for `SKILL.md` files.

## Design Alignment

When in doubt about which doc to read, start at [docs/README.md](docs/README.md) — that's the doc map. When two docs disagree, see [docs/AUTHORITY-ORDER.md](docs/AUTHORITY-ORDER.md).

Structural architecture (components, boundaries, data flow) is the LikeC4 DSL under `docs/architecture/likec4/`. The sources below are auto-loaded into every session via `@` imports and are authoritative for boxes, arrows, and component ownership:

@docs/architecture/likec4/specification.c4
@docs/architecture/likec4/model.c4
@docs/architecture/likec4/views.c4

Decision rationale lives in [docs/adr/](docs/adr/).

Before modifying pipeline stages, skill contracts, ownership boundaries, or any external-side-effect behavior: verify alignment with the imported DSL and the relevant ADR. If your change requires the LikeC4 model to change, stop and confirm with the human first.

Run `npx likec4 validate` after editing any `.c4` file and before committing. Treat a validation error as a blocker — fix the model, do not commit broken DSL.

## Template usage

This repo is a **template** for building Claude Code agents. After cloning:

1. Replace this section with project-specific guidance.
2. Fill in `docs/architecture/likec4/model.c4` with your actual system.
3. Write `docs/intake/0001-<first-feature>.md` for the first thing you want to build.
4. Hand it to Claude.

See [README.md](README.md) for the full template usage guide.
