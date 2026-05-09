# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Method

The team's agent-building method lives in the playbook below. Read it first; the rules in this file *extend* it with project-specific conventions, never duplicate it.

@docs/playbook/PLAYBOOK.md

## Project Invariants

These are session-critical rules. Violating one breaks the harness contract — fix the violation, do not weaken the rule.

- **The LikeC4 model is structural canon — auto-imported every session. Do not autonomously edit it as part of a bug fix.** If a fix requires a model change, stop and ask the operator.
- **When sources disagree, follow [docs/AUTHORITY-ORDER.md](docs/AUTHORITY-ORDER.md).**

> *Add project-specific invariants here as they emerge. Each one needs a **why** so future sessions can judge edge cases. Example shape: "All email sends go through `bin/send.sh` so retries are centralised. Why: prior incident where two skills retried independently and double-sent."*

## Runtime Surfaces

> **None of the `.claude/` directories exist in the empty template.** Create them when you add your first agent or skill.

- `.claude/agents/` — repo-defined subagent prompts
- `.claude/skills/` — skills (canonical surface and runtime)
- `.claude/context/` — runtime reference docs prompts load inline
- `bin/` or `scripts/` — CLI tools (deterministic, no LLM call)

At runtime, invoke skills directly via `Skill(...)` instead of searching for `SKILL.md` files.

## Architecture

The structural model is auto-loaded into every session via the `@imports` below. This is authoritative for components, boundaries, and ownership. Run `npx likec4 validate` after editing any `.c4` file and before committing.

@docs/architecture/likec4/specification.c4
@docs/architecture/likec4/model.c4
@docs/architecture/likec4/views.c4

If your change requires the LikeC4 model to change, stop and confirm with the operator first.

Decision rationale lives in [docs/adr/](docs/adr/).

## Template usage

> *Replace this section with project-specific guidance once you've forked the template.*

After cloning:

1. **Add the playbook as a submodule** (if not already done):
   ```bash
   git submodule add git@github.com:thaddeus-git/agent-playbook.git docs/playbook
   ```
2. Replace this section with project-specific overview, key entities, and external integrations.
3. Fill `docs/architecture/likec4/model.c4` with your actual system.
4. Write `docs/intake/0001-<first-feature>.md` for the first thing you want to build.
5. Hand it to Claude.

See [README.md](README.md) for the full template usage guide.
