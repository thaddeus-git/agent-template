# Authority Order

**When documents disagree, the lower number wins.**

| Priority | Source | Location | Why authoritative |
|----------|--------|----------|-------------------|
| 1 | Agent execution prompts | `.claude/agents/` | Runtime truth — what agents actually execute |
| 2 | Runtime context docs | `.claude/context/` | Live configuration injected at task start |
| 3 | Code (schema + state machine) | `src/` | Machine truth |
| 4 | Architecture model | `docs/architecture/likec4/` | Structural source of truth (components, boundaries, relationships) |
| 5 | ADRs | `docs/adr/` | Historical decisions; superseded ADRs are kept for audit but lose authority |
| 6 | Intake | `docs/intake/` | Captures intent at design time; once built, the artifacts above supersede it |
| 7 | How-to runbooks | `docs/how-to/` | Operator recipes; may lag code changes |
| 8 | External-API references | `docs/references/` | Third-party contracts — pinned to the API version in use |

> Note on intake's position: an intake is the *seed* for the artifacts
> above it (ADR + LikeC4 + code). Once those exist, they are canonical
> and the intake is historical. Don't update an intake to "match" the
> built result — write a new ADR if the design changes.

## Resolution protocol

1. **Identify the conflict** — note which two documents disagree and at which priority levels.
2. **Trust the higher-priority source** — the lower-priority document is wrong or stale.
3. **Update the stale document** — do not leave conflicting state. Open an issue if you cannot fix it immediately.
4. **Record a decision if the conflict reveals an undocumented choice** — create a new ADR in `docs/adr/` rather than embedding the rationale in a comment.

## Adding a new document

Choose the location that matches the document's purpose:

- **Intake** (`docs/intake/`) — start here for any new feature or agent.
- **LikeC4** (`docs/architecture/likec4/`) — add or modify components and relationships. Humans read the rendered diagrams.
- **ADR** (`docs/adr/`) — one decision per file, MADR format. Required whenever a change introduces behavior not obvious from code alone.
- **How-to** (`docs/how-to/`) — short operator runbook for a specific recovery scenario.
- **External reference** (`docs/references/`) — pinned copies of third-party API behavior the code relies on.

Add a pointer at the top of any new canonical document:

```markdown
> Authority: see [docs/AUTHORITY-ORDER.md](../AUTHORITY-ORDER.md)
```
