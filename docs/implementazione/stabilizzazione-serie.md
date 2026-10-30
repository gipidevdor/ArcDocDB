<a id="completamento-dei-nomi-dellintera-serie"></a>

# Completing names across the entire Serie

`arcdocdb.recovery.series:stabilizza-nomi-serie-recuperata` coordinates
[per-source completion](stabilizzazione-nomi-recovery.md) across entire
already-recovered ACTIVE/CLOSED set. [Preregistered method](stabilizzazione-serie-metodo.md)
lists SGS-D01…D09 decisions and verification limits before code.
Implements ADR-0040 §2–3; no new format or commit point.

<a id="uso-e-responsabilita"></a>

## Use and responsibilities

```lisp
(arcdocdb.recovery.series:stabilizza-nomi-serie-recuperata
 directory sources active closed :max-segmenti 65536)
;; Two values: renamed count, already-final count.
```

`sources` is open owned set. `active` and `closed` are results
of `leggi-serie-recuperata`: CLOSED vector complete and ordered by
u64 ID. Caller keeps authoritative CONTROL, set, vector, FDs, and namespace
exclusive and stable throughout call in I/O pool. Transfers no
ownership and closes no individual children. Full Archivio gate remains
necessary before completion and admission.

Three passes separate validation and effects:

| Pass | Check |
|---|---|
| All-source metadata | Budget/count, strictly increasing IDs, unique ACTIVE, aligned CLOSED tokens, and EQ-identical CONTROL |
| All-source names | Same regular FD, exactly one name, consistent backend, exclusive rename available when needed |
| Completion | Set ID order; per-source primitive with postcondition and parent fsync in both branches |

Configuration, token, or namespace error in last source does not
first rename or fsync others. Name preflights read
only identities, not segment headers or contents. Primitives
repeat checks before use: global preflight neither reserves
names nor protects against external mutators.

<a id="completezza-senza-un-altro-contenitore"></a>

## Completeness without another container

CLOSED count matches manifest; source
count is CLOSED plus one. Set has strictly increasing IDs and every row
matches manifest state through canonical per-source guards.
Unique ACTIVE uses same ID/FD/EOF as token; each CLOSED consumes
next token with exact ID/FD/P and EQ-identical CONTROL. Cardinality,
membership, and order prove completeness without another array or hash.

Permuted CLOSED vector rejected even with same
elements. Zero ID and high bits remain meaningful; NIL represents
ACTIVE not yet found, so position zero valid too.
Before return, checks vector consumption, sum of both
counts, still-open parent and CONTROL. Result only emerges complete.

<a id="guasti-ed-effetti-parziali"></a>

## Faults and partial effects

Group is not atomic transaction. Fault during third phase
preserves previous completions and propagates same condition, without
partial counts, rollback, retry, or close. Error during I/O effect
retains existing primitive's parent fail-stop. If
interruption falls between completed calls, no pending I/O to
undo; coordinator observes names again and keeps traffic
unadmitted. Faulted capability requires new acquisition.

ACTIVE/CLOSED selection and semantic checks repeated by per-source
primitive. Caller prevents closes or vector mutations
during execution; result is no FD lease. General
Serie COD-24 boundary and Recovery Manager coordination
remain open.

<a id="preflight-io-riusabile-e-costo"></a>

## Reusable I/O preflight and cost

`io:verifica-stabilizzazione-temporaneo(directory, file, temporary, final)`
returns T for temporary name or NIL for final, after same
completion checks. Performs no rename, fsync, or close and
does not change parent state. Result is not authorization
token; private helper preparing leaves and branch shared
with `io:stabilizza-nome-temporaneo`.

`max-segmenti` is `index`, default 65536, zero allowed; includes ACTIVE.
Exceeded budget: `resource-exhausted` before scans. Incorrect cardinality,
order, set, or authority: `invalid-argument`. Scalar types/ranges
follow signature safety3 checks; I/O faults and invariants propagate
without masking. Budgets equal to count valid.

Work grows with source count; loops bounded by already-admitted
count. No new array or hash and no per-document object.
Private names, runtime checks, and FFI may allocate on cold
path; actual memory and RSS unmeasured. Each successful source
retains own parent fsync even when already final.

No locks, threads, or shared writes between Serie added:
sequence concerns one Serie. No removal, new
ACTIVE creation, CONTROL/index publication, or traffic admission performed.
Compilation and static review separate from functional tests, FI,
coverage, MC/DC, crashes, and performance measurement still to run.
