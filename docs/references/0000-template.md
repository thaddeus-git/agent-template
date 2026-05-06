# <External system> — <topic>

<!--
File name: kebab-case noun phrase, e.g. example-api-rate-limits.md.
Title names the external system + the specific topic this file pins.
-->

> Source: <where this content was extracted from>
>
> Fetched: YYYY-MM-DD
>
> <One-line description of what this file pins.>

<!--
Why "Fetched" matters: external APIs change. The fetched date is the
verifiable point at which this content was true.
-->

---

## Endpoints / Surface

| Operation | Endpoint | Method | Notes |
|---|---|---|---|
| <Operation> | `https://…` | POST | <auth/quota/etc.> |

## Pinned behavior

<!--
Specific quirks, undocumented limits, error codes, retry semantics, or
timing constraints that the code relies on. This is the load-bearing
part of the file.
-->

- **<quirk 1>** — <description>.
- **<quirk 2>** — <description>.

## Drift checks

<!--
How to verify the contents of this file are still true. A specific
command is best ("run X, expect Y").
-->

```bash
<command to probe upstream>
```

If the check fails, this file is stale. Update the **Fetched** date once
re-verified, and amend any sections that changed.
