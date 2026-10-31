# Main integration — 2026-10-31

Integrates `f3c86ab` (local discovery, readiness and CRC qualification) with
`a21fb42` (automatic operational M1 index) and preceding main reconciliation
commits. Work is performed in the feature worktree; primary checkout is untouched
until final fast-forward. Neither branch's source changes are discarded.

Conflict resolution keeps ADRs 0071–0074 and both sets of appended local-server
tests, then regenerates the traceability matrix from merged requirements.
Discovery's sealed-image fixture now explicitly selects `:index-policy :legacy`,
as required by the new automatic engine. Service startup with discovery already
selects that profile through the engine's documented default. Without discovery,
normal automatic selection remains enabled.

[Targeted discovery checks](targeted-discovery/report.lisp) pass on merged
sources, including actual v1/v2 product CLI server/client processes. An initial
whole check was intentionally interrupted before the fixture adjustment and
is not treated as qualification.

Full [`make check` on SBCL 2.6.10](full-2.6.10/report.lisp) and
[strict all-suite build on SBCL 2.6.9](strict-2.6.9/report.lisp) both pass
with exit code zero and stable before/after source identities. The full gate
includes product tests, lint, traceability, links, evidence validation and
self-tests, spike correctness checks and CI self-tests.
No merged-source performance claim is inferred from historical branch benchmarks;
those records retain their original source identities.
