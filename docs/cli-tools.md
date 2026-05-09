# CLI tools

Index of every CLI in the repo. The point of this page is the
side-effect column at a glance — anything irreversible is `external`.
Each tool exposes its own `--help`.

> Authority: side-effect classification is canonical on LikeC4 edges
> (`#side-effect-external` tag in
> [architecture/likec4/specification.c4](architecture/likec4/specification.c4))
> and on each agent's `side_effects:` frontmatter. The table below
> mirrors that. See [AUTHORITY-ORDER.md](AUTHORITY-ORDER.md).

Tools live under `bin/`, `scripts/`, or `src/<name>-cli/` — pick one
location per the playbook and stay.

| Command | Purpose | Side-effect¹ |
|---|---|---|
| _(empty — fill in as CLIs land)_ | | |

¹ **Side-effect class.**

- `local` — DB writes or read-only network. No third-party state changes.
- `external` — irreversible write to a real third party (mailbox, CRM, customer-facing sheet, paid ad, posted content).

`external` rows are the operational "needs human gate" signal. See [playbook section 4](playbook/PLAYBOOK.md#4-documentation-map) for the three-place mirroring rule.
