<a id="piano-di-riconciliazione-dei-segmenti"></a>

# Segment reconciliation plan

Package `arcdocdb.recovery.manifest` compares the completed manifest
with a caller-supplied name inventory. It implements in memory
the table from [ADR-0040§3](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio):
recognizing renames, decided removals, anomalies, and missing segments.
Queries consult the plan without filesystem operations.

<a id="api-e-responsabilità"></a>

## API and responsibilities

| API | Result |
|---|---|
| `file-segmento(id, forma)` | Immutable descriptor, u64 ID including zero, form `:temporary` or `:final` |
| `pianifica-riconciliazione(manifest, files, :max-files, :max-segmenti)` | Owned plan from a complete stable simple-vector of descriptors |
| `pianifica-riconciliazione-directory(manifest, directory, …)` | Complete inventory from directory capability, verified segment identities, and same plan |
| `stato-riconciliazione(plan)` | `:ready`, `:degraded` or `:faulted` for required-name availability |
| `numero-azioni-riconciliazione(plan)` | Count of distinct IDs in plan |
| `azione-riconciliazione(plan, indice)` | ID, form, action, and manifest state, all scalars |

[Post-recovery ID selection](id-segmento-recovery.md) reuses this plan
to propose an ID beyond all observed names and at least the manifest
high-water. The proposal neither reserves a name, executes actions, nor admits traffic.

At the in-memory entry point, the caller interprets `.seg` and `.seg.tmp`, excludes other categories,
and supplies a complete inventory: a partial list would
falsely mark excluded segments missing. The module verifies neither this
precondition, filesystem stability, headers, physical identity,
CRCs, nor contents. `:ready` certifies neither integrity nor traffic authorization.

The plan contains every inventory ID and all missing ACTIVE/CLOSED
segments, once each, in increasing unsigned u64 order.
Absent REMOVED segments generate no entry. Two names for one ID become
one `:both` entry. The plan owns its vector; the caller may
reuse inventory and EDIT buffer after return. No internal hash
or vector is exported and manifest stays read-only.

<a id="azioni"></a>

## Actions

| Presence | Manifest state | Form / action |
|---|---|---|
| only `.seg.tmp` | ACTIVE or CLOSED | `:temporary / :rename` |
| only `.seg.tmp` | REMOVED or UNKNOWN | `:temporary / :delete` |
| only `.seg` | ACTIVE or CLOSED | `:final / :use` |
| only `.seg` | REMOVED | `:final / :delete` |
| only `.seg` | UNKNOWN | `:final / :anomaly`, preserve |
| none | ACTIVE or CLOSED | `:absent / :missing` |
| both | any | `:both / :conflict`, preserve both |

The ADR table does not resolve dual form: this **conservative application
contract** avoids choosing or overwriting a file
without checking identity and contents. The local proposal for a
REMOVED temporary uses positive manifest removal proof.
[Read-only source acquisition](fonti-recovery.md) opens only
ACTIVE/CLOSED from the complete plan without executing actions.
Actions are guidance: the future I/O executor must check
proofs, identities, and stability before durable effects.

Missing or conflicting ACTIVE produces `:faulted`; missing or
conflicting CLOSED produces `:degraded`. FAULTED takes precedence over DEGRADED. UNKNOWN
anomalies and REMOVED/UNKNOWN conflicts stay explicit in the plan without
changing this measure solely of required-name availability.
The manifest's next ID does not demonstrate historical membership: an
unknown final file below that limit remains an anomaly.

<a id="budget-errori-e-parallelismo"></a>

## Budgets, errors, and parallelism

Proposed configurable budgets: 65,536 physical files and 65,536 required
segments (`1 + CLOSED`). Zero is allowed; equality to limit is
valid. Budgets precede entry validation and coalescing:
duplicates and dual forms consume physical budget. Workspace
bound is physical files plus required segments. This opening path
allocates; it promises neither zero heap nor measured performance.

Integer budgets outside `index`, invalid descriptors, and duplicate names
report `invalid-argument`; for invalid/duplicate entries, offset is
the vector index. Out-of-range queries report `invalid-argument`.
Insufficient budgets report `resource-exhausted`; private inconsistencies
report `invariant-violation`. `ftype` types are checked with
safety3 and report `type-error`. No error exports a partial plan.

Calls own separate workspaces; queries on a published
plan are read-only. Planner creates no threads,
modifies no inputs, and introduces neither locks nor shared writes across Serie.

<a id="verifica"></a>

## Verification

<a id="raccolta-dalla-directory"></a>

### Collection from directory

> **API proposal** — Conservative application contract on ADR-0040,
> without new recovery formats or actions.

Entry `pianifica-riconciliazione-directory` moves name
collection into the product. It receives an `io:apri-directory` capability already open
on the `segments` directory, with namespace frozen by controller.
`io:elenca-directory` uses an independent cursor relative to parent FD,
delivers only after EOF and successful close, and leaves parent open.
Injected backend must provide `directory-entries` and `entry-identity`;
missing callbacks produce an explicit error.

Segment names follow format `<segment-id:016x>.seg` or
`.seg.tmp`: sixteen lowercase ASCII digits without narrowing u64 ID.
Other-category names stay intact; segment-like but noncanonical
names are rejected. Every segment must be a regular file
without symlinks, checked by `fstatat` on the same parent. Physical aliases
between distinct names produce `corruption-detected`. Manifest and planner
remain unchanged; only complete collection feeds the plan.

Beyond `max-files` and `max-segmenti`, configurable budgets are:
`max-names` (65,536), `max-total-name-bytes` (16 MiB), and `max-name-bytes`
(255, from 1 to 255). Every name, including storage-parser-ignored ones,
consumes these budgets; only `.` and `..` are excluded. The first two may
be zero for an empty directory. This is not an RSS ceiling.

The [preregistered method](inventario-directory-metodo.md) describes
decisions, failures, and native tests; [C1 readings](inventario-directory-revisione.md)
declare static boundaries. Namespace exclusivity remains
a precondition: POSIX enumeration does not certify an atomic snapshot.
Headers, CRCs, and contents require subsequent readers. No
renames, removals, CSN allocations, or traffic admission are performed.
[Preserved results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-serie-inventory/README.md)
distinguish failed attempts, full local check, and limits.
[Collection verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-serie-inventory-collection/catalogo.lisp)
preserves byte comparison and independent closed-archive checking.

<a id="planner-in-memoria"></a>

### In-memory planner

The [preregistered method](inventario-metodo.md) requires an independent
oracle, exhaustive matrix, permutations, u64 and budgets, ownership,
four threads, isolated mutations, and raw coverage. The
[decision table](inventario-decisioni.md) includes defensive
guards. Tests do not close the complete recovery gate.

The 2026-10-09 campaign is preserved in the
[inventory catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-inventory/catalogo.lisp):
13 dedicated tests, 95 recovery and 307 overall plus smokes in the first snapshot.
Subsequent [integration with WAL-CSN, CBOR structure, and writer recycling](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-inventory-integration/catalogo.lisp)
preserves successful `make check-core` with 377 tests plus smokes and ten complete spikes,
with stable source hashes. Inventory sources and tests are unchanged;
coverage and denominators remain from the previous campaign. The model
compares 6,144 plans (1,024 inventories × two versions
× three orders) and another 1,440 permutations (720 × two versions).
Four threads construct 32 private plans and query a common
plan after input reuse. This test does not measure performance.

Mutation baseline runs the 13 dedicated tests; all eight
mutants are detected with four isolated processes, zero survivors,
compilation, pre-test, or worker errors. Self-test checks ASDF
copies, now including CSN, and retains a child's SIGKILL signal
as worker error. This classification concerns tool
`foundation-mutation.lisp`; it does not qualify other project runners.
In the integrated snapshot, baseline repeats 13 tests and all eight mutants
are again detected with four processes: zero survivors, compilation,
pre-test, or worker errors. New self-test preserves 112 verified ASDF sources,
rejected omission, logs, and SIGKILL fixture with signal 9.
These campaign runners impose no automatic timeout.

| File | Observed / total forms | Observed / total branches |
|---|---|---|
| `inventory-build.lisp` | 306 / 390 | 41 / 56 |
| `inventory-query.lisp` | 27 / 32 | 2 / 2 |
| `inventory-types.lisp` | 7 / 18 | 0 / 2 |
| Raw total | 340 / 440 | 43 / 60 |

The 100 unobserved forms and 17 alternatives remain in the denominator,
including private guards. No exclusion is approved and MC/DC is not
demonstrated. Catalog preserves original `sb-cover` state, index, and
HTML for three files. It also preserves both C1 readings, the initial
finding on guards, and first build failed due to a missing parenthesis, later
corrected. Evidence-reading diagnostics remain distinct from
product failures. `make check` and campaigns preserve hashes,
environment, commands, and original output.

Requirements: REQ-REC-001/002/004, REQ-AFF-008/017/018.
Invariants: INV-A7/A8/A9/A10/A11, INV-C7, INV-P6.
