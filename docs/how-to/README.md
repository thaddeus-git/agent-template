# How-to runbooks

Short operator runbooks for specific recovery scenarios. Each runbook
is a verb-first recipe: *Diagnose → Fix → Verify*.

Use [`0000-template.md`](0000-template.md) as the starting point.

## When to write a runbook

When the same recovery scenario has come up twice, or when the steps
are non-obvious enough that future-you (or another operator) would
spend more than a few minutes figuring them out.

If a runbook turns out to never get used, delete it — stale runbooks
mislead.

## Index

<!-- Add a row when you create a new runbook. -->

| Runbook | Use when |
|---|---|
| _example: recover-stuck-lead.md_ | _A lead is stuck in `review` and needs manual intervention._ |
