# CLAUDE.md

This file is **runtime-mode guidance** for Claude Code. It's what agents (subagents in `.claude/agents/`, skills in `.claude/skills/`) and runtime Claude Code sessions see. It's committed and shared with anyone who clones the repo.

> **Builder-mode context** — the agent-building playbook, LikeC4 structural model imports, decision history — lives in **[`CLAUDE.local.md`](CLAUDE.local.md.example)**. That file is gitignored. Run `./bootstrap.sh` to create it from the example.

## Project Invariants (runtime)

Rules an agent has to honour while doing work. Violating one means an agent stepped outside designed behavior.

- **When docs disagree, follow [docs/AUTHORITY-ORDER.md](docs/AUTHORITY-ORDER.md).**

> *Add runtime-relevant project invariants here as they emerge. Each needs a **why** so future sessions can judge edge cases. Example shape: "All email sends go through `bin/send.sh` so retries are centralised. Why: prior incident where two skills retried independently and double-sent."*

## Project Layout

Filesystem conventions agents and CLIs depend on. Create these directories when you add your first agent or skill.

- `.claude/agents/` — repo-defined subagent prompts
- `.claude/skills/` — skills (canonical surface and runtime)
- `.claude/context/` — runtime reference docs that prompts load inline
- `bin/` or `scripts/` — CLI tools (deterministic, no LLM call)

At runtime, invoke skills directly via `Skill(...)` instead of searching for `SKILL.md` files.

## Project

> *Replace this section with project-specific runtime context once you've forked the template: a one-paragraph description of what this system does, the key entities agents work with, and the external integrations they call.*

After cloning:

1. Run `./bootstrap.sh` — pulls submodules, installs npm deps, creates your local `CLAUDE.local.md` from the example
2. Replace this section with runtime-facing project description
3. Edit `CLAUDE.local.md` for your builder context (it auto-imports the playbook)
4. Read [QUICKSTART.md](QUICKSTART.md) for the 7-step daily workflow

See [README.md](README.md) for the full template usage guide.
