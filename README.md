# agent-template

A starter template for building Claude Code agents using **C4 + ADR + plain-English intake forms**.

Designed for non-technical operators who use Claude Code as their primary builder. The artifacts you (the operator) read and approve are intentionally separated from the artifacts Claude maintains underneath.

## What's in the box

```
.
├── CLAUDE.md                       # session-loaded guidance for Claude Code
├── docs/
│   ├── README.md                   # doc map — start here
│   ├── AUTHORITY-ORDER.md          # which doc wins when sources disagree
│   ├── cli-tools.md                # index of every CLI + its side-effect class
│   ├── intake/                     # plain-English intake forms (you fill in)
│   ├── architecture/likec4/        # C4 structural model (Claude maintains)
│   ├── adr/                        # decision records, MADR format
│   ├── how-to/                     # operator runbooks
│   └── references/                 # pinned external API behavior
└── README.md                       # this file
```

There is no `src/`, no `.claude/agents/`, no `package.json` yet. Those are added when you start building. The template is the **scaffolding for thinking**, not a runnable system.

## How to use this template

### 1. Create your project from the template

```bash
# Clone, rename, set new remote.
git clone git@github.com:thaddeus-git/agent-template.git my-agent
cd my-agent
git remote set-url origin <your-new-repo-url>
```

Or use GitHub's "Use this template" button after marking the repo as a template in Settings → Template repository.

### 2. Add the playbook as a submodule

The template's `CLAUDE.md` `@imports` `docs/playbook/PLAYBOOK.md`. The playbook is the team's agent-building method (canonical rules; this template only extends it with project-specific bits).

```bash
git submodule add git@github.com:thaddeus-git/agent-playbook.git docs/playbook
git commit -m "Add agent-playbook submodule"
```

If you don't want the playbook (e.g., you're forking outside the team), remove the `@docs/playbook/PLAYBOOK.md` line from `CLAUDE.md`.

### 3. Replace the template-specific bits

- Edit `CLAUDE.md` — replace the *Template usage* section with project-specific guidance.
- Edit `docs/architecture/likec4/model.c4` — replace the placeholder with your actual system, containers, and external integrations.
- Update this `README.md` to describe your project, not the template.

### 4. Write your first intake

```bash
cp docs/intake/0000-template.md docs/intake/0001-<your-first-feature>.md
```

Fill in sections 1–4 in plain English:

1. **Napkin flow** — one sentence.
2. **Tools / external actions** — what writes/sends/scrapes? Flag irreversibles.
3. **Happy path vs failure paths** — for each step: success + ≥2 failure modes.
4. **Open questions for Claude** — things you don't know how to decide.

### 5. Hand it to Claude

> *"build this from the intake at `docs/intake/0001-<feature>.md`."*

Claude will:

1. Ask any clarifying questions raised in section 4.
2. Draft the **ADR** (`docs/adr/0001-<title>.md`) with decision rationale.
3. Update **LikeC4** (`docs/architecture/likec4/model.c4` + a view).
4. Write the agent prompt / skill / code (`.claude/agents/`, `.claude/skills/`, `src/`).

### 6. Review what you can verify

- **You** read the intake and the ADR. These are operator-level artifacts.
- **Claude** maintains the LikeC4 DSL and the code. You read the rendered diagram, not the DSL source.

If the ADR captures the decision correctly, the rest is downstream.

## Editing model

| Artifact | Author | Why |
|---|---|---|
| `docs/intake/` | **You** | Plain English. Captures operator intent before any technical layer exists. |
| `docs/adr/` | Claude drafts; you approve | The "why". Defendable in a meeting six months later. |
| `docs/architecture/likec4/` | Claude maintains; you read rendered | Structural canon, auto-loaded into every Claude Code session. |
| `docs/how-to/` | Either | Operator recipes. |
| `docs/references/` | Either | External API contracts with fetched dates. |
| `.claude/agents/`, `.claude/skills/`, `src/` | Claude | Runtime. |

## Why this layout?

Two principles:

1. **Operator artifacts are first-class.** The intake form, the ADR, and the rendered C4 diagram are things a non-technical operator can verify. The DSL source and code are not. Designing the doc tree around what *you* can verify means the technical layer can be Claude's responsibility without leaving you blind.

2. **C4 + ADR is a deliberate pair.** C4 says *what the system is*; ADR says *why it's that way*. LikeC4 specifically (over PlantUML, Mermaid, Structurizr, draw.io) because it's typed, the DSL is hierarchical, and it auto-loads into every Claude Code session via `@imports`. Switching DSLs adds friction without adding operator value — see the rationale in your project's first ADR if you want to revisit.

## What this template is NOT

- **Not a runnable agent.** No `package.json`, no `src/`, no agent prompts. Those come from your first intake.
- **Not opinionated about the runtime stack.** Use TypeScript, Python, shell scripts, whatever fits — the template is documentation conventions, not a codebase shape.
- **Not a substitute for an engineering peer review.** This template helps you express intent; it does not make Claude's architectural choices verifiable. If your project is high-stakes, schedule senior engineering review on the ADRs.

## License

Pick one for your project (MIT, Apache 2.0, proprietary). The template itself has no license file — add one when you fork.
