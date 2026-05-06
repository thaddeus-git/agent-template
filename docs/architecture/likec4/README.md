# LikeC4 architecture sources

LikeC4 is the single source of truth for structural diagrams (system
context, container, dynamic views). Decision rationale lives in
[`../../adr/`](../../adr/).

The `.c4` sources here are the **only** persisted form of the model.
There are no committed rendered diagrams — view them on demand via the
LikeC4 dev server.

## Edit loop

```bash
npx likec4 preview     # live preview in browser, auto-reloads on save
npx likec4 validate    # validate DSL before commit
```

Edit the `.c4` files; refresh the browser. Stop the server with Ctrl-C
when done.

## File map

| File | Contents |
|------|----------|
| `specification.c4` | Element kinds, relationship kinds, and tags. Visual conventions live here. |
| `model.c4` | Elements, actors, the system, containers, components, and all relationships. |
| `views.c4` | C1 system context (one), C2 container views (one per pipeline), dynamic flow views (only when needed). |

## Editing model

| Author | What |
|---|---|
| **You** | Sketch C1 / C2 intent in plain English in the [intake](../../intake/), or describe the change in chat. |
| **Claude** | Maintains the `.c4` source. Translates your intent into element / relationship / view edits. |

You don't need to write DSL. Read the rendered diagram, tell Claude
what's wrong or missing.

## Conventions

These rules keep the model load-bearing.

### When to use which element kind

| Kind | Use for | Don't use for |
|---|---|---|
| `actor` | Humans (ops, sales). Always interacts with the system or a CLI, never with a datastore directly. | Background jobs (those are `component`s). |
| `system` | The single boundary around your agent. | Sub-systems. |
| `container` | A logical grouping inside the system (a pipeline, a shared core). | Anything with behavior — behavior lives in `component`s. |
| `component` | A long-running process (manager) or an ephemeral worker (Claude agent / CLI invocation). Components may have side effects. | Pure transforms (those are `skill`s). |
| `skill` | Pure transforms invoked by a component. **No DB writes, no external side effects.** | Anything that owns a side effect. If it must write, promote it to `component`. |
| `gate` | A fail-closed decision point with a binary pass/fail outcome. Always paired with a `blocked` terminal state for the fail branch. | Routine branching (use plain edges). |
| `blocked` | A terminal state — review-needed or final. Made explicit so the lifecycle endpoint is visible in the diagram. | Transient states. |
| `datastore` | The pipeline DB. **Actors must not connect to a datastore directly**; they go through a CLI component. | External services (those are `externalSystem`). |
| `externalSystem` | Anything outside the system. | Internal infrastructure. |

### Relationship kinds

Defined once in `specification.c4` so every diagram renders consistently.

| Kind | Visual | Use for |
|---|---|---|
| `dispatches` | bold solid | Coordinator hands a unit of work to a worker. |
| `calls` | dotted | Synchronous skill invocation or sub-call. |
| `reads` | dashed | Read access to the datastore. |
| `writes` | solid | Write access to the datastore. |
| `handshake` | dashed amber | Cross-component coordination via the DB. |

### Skills are pure

If a component you're modeling needs to call something stateful, that
"something" is a `component`, not a `skill`. Skills don't own
persistence — letting them write fragments the contract.

### When NOT to add a view

Each view has ongoing maintenance cost. Before adding a view, check it
against this list:

- **Don't add swim-lane / actor-responsibility diagrams** unless accountability is genuinely split between multiple actors.
- **Don't add 1:1 mirror views of agents.** The agent's `.md` prompt is canonical.
- **Don't add per-state-machine views beyond one canonical lifecycle view.**
- **Don't migrate to a different diagramming tool** (Structurizr, mermaid, draw.io) without an ADR weighing the migration cost.

When you genuinely need a new view, write an ADR first explaining what
question the view answers that existing views can't.
