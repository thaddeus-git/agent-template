# Architecture Decision Records

One file per decision, [MADR](https://adr.github.io/madr/) format. Use
[`0000-template.md`](0000-template.md) as the starting point.

## Workflow

1. A decision arises during intake review or implementation.
2. Claude drafts the ADR from the intake's "Decision rationale" section.
3. You read and approve the ADR — this is the artifact you can defend in a meeting six months later.
4. Once accepted, the LikeC4 model and code follow.

## When to write an ADR

- The change introduces behavior not obvious from code alone.
- The choice has non-trivial alternatives that were rejected.
- A future reader will ask "why did we do it this way?"

If none of those apply, you don't need an ADR. Don't write decisions you wouldn't defend.

## Numbering

Sequential, four digits. Never renumber. Superseded ADRs stay in place
with a `Status: Superseded by NNNN-title.md` line; the new ADR
references the old one.

## Index

| # | Title | Status |
|---|---|---|
| – | (no ADRs yet) | – |

<!--
Add a row per ADR, e.g.:
| 0001 | Choose SQLite as the pipeline datastore | Accepted |
-->

