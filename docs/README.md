# docs/

Start here. This is the doc map — every other document in the project
is reachable from this page, organized by *what question you are
asking*.

When two documents disagree, see [AUTHORITY-ORDER.md](AUTHORITY-ORDER.md).

## Doc map — by question

| If you want to know… | Read this |
|---|---|
| **What is this project? How do I get started?** | [`../README.md`](../README.md), [`../CLAUDE.md`](../CLAUDE.md) |
| **I want to add a new feature or agent — where do I start?** | [`intake/`](intake/) — fill in an intake file in plain English **before** any DSL or code is written. |
| **What are the components and how do they connect?** | [`architecture/likec4/`](architecture/likec4/) — `model.c4`, `views.c4`, `specification.c4`. Run the LikeC4 preview for the live diagram view. |
| **Why was a design decision made?** | [`adr/`](adr/) — one file per decision (MADR). Index in [`adr/README.md`](adr/README.md). |
| **What does an agent actually do at runtime?** | `.claude/agents/<name>.md` — the live execution prompt. |
| **What runtime configuration does an agent read?** | `.claude/context/<topic>.md` — runtime reference docs that prompts load inline. |
| **How do I run / fix / recover from X?** | [`how-to/`](how-to/) — operator runbooks. |
| **How does an external API work?** | [`references/`](references/) — pinned third-party API behavior. |
| **Which document wins when two disagree?** | [`AUTHORITY-ORDER.md`](AUTHORITY-ORDER.md) |

## Directory shape

| Directory / File | Purpose |
|---|---|
| [`intake/`](intake/) | **Where every new feature starts.** Plain-English intake form filled in before any DSL or code. The operator-level artifact. |
| [`architecture/likec4/`](architecture/likec4/) | C4 model — structural source of truth. View live with the LikeC4 preview. |
| [`adr/`](adr/) | Architecture decision records (MADR). |
| [`how-to/`](how-to/) | Operator runbooks. |
| [`references/`](references/) | External-API references. |
| [`AUTHORITY-ORDER.md`](AUTHORITY-ORDER.md) | Resolution order when sources disagree. |

## Editing model

The author of each artifact is intentional:

| Artifact | Author |
|---|---|
| `intake/` | **You.** Plain English. Claude assists, but the operator owns intent. |
| `adr/` | Claude drafts from the intake; you approve direction. |
| `architecture/likec4/` | Claude maintains. You read the rendered diagram. |
| `.claude/agents/`, `.claude/skills/` | Claude. |
| `how-to/`, `references/` | Either, as needed. |

The flow is: **intake → ADR → LikeC4 + code**. Always in that order.
Skipping intake means decisions live in a chat transcript and disappear.
