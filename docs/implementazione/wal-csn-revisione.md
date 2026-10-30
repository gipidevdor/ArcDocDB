<a id="revisione-c1-statica-del-ponte-walcsn"></a>

# Static C1 review of the WAL–CSN bridge

**Current status: R1 statically resolved in the final addendum.** Observations and
fingerprints from the earlier reading are preserved below for traceability.
The file-preflight addendum documents the bridge's latest revision and fingerprint.

Date: 2026-10-09. Independent second reading by Codex of the product diff.
This is an automated static review: **no human certification**, no
execution of tests, benchmarks, compilation, lint, trace, or `make check`. No product
change and no commit. The only files written by this review are this document
and [wal-csn-decisioni.md](wal-csn-decisioni.md).

<a id="perimetro-e-versione-letta"></a>

## Scope and version read

Diff from `HEAD=673987ad819dd48741a7c0a4ff259137a1ed0bef`:
`src/foundation/{record,package}.lisp`, `src/wal/{types,builder,package,csn,group}.lisp`,
`arcdocdb.asd`. `group.lisp` was included at the parent's explicit request.
New file `src/wal/csn.lisp` was read as an addition against `/dev/null`.
Unchanged diff context was used only to understand modified functions.

Normative sources read: [ADR-0037](../adr/0037-lotto-sigillato.md),
[ADR-0038](../adr/0038-orizzonte-di-visibilita.md),
[ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md),
[coding standard](../affidabilita/standard-di-codifica.md), and related
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md).
Tests, benchmarks, CSN register implementation, executor,
controller, index, scheduler, and recovery were not read. Their properties remain explicit assumptions.

Git fingerprints of content read, calculated without writing objects:

| File | Fingerprint |
|---|---|
| `src/foundation/record.lisp` | `251ba51cfb723f4944df669788b4532489bd07ad` |
| `src/foundation/package.lisp` | `12cdf3488cf5d389f50e1d97cdb44fa564c04207` |
| `src/wal/types.lisp` | `10c4b1949994d01cb9ed231f66a69cf81f1ea062` |
| `src/wal/builder.lisp` | `91f964cc5b0c2195a6962a004317ba78f3c5f18c` |
| `src/wal/package.lisp` | `07538705ebbec9058296c44b668c4d04194bb626` |
| `src/wal/csn.lisp` | `a592a370135b8b24b548c38588215ad7d26bf1b5` |
| `src/wal/group.lisp` | `8245bc10cedafbff8665489fbced6833f078a373` |
| `arcdocdb.asd` | `0c0a05d798f04ee5012d1c3a3a98930ae9fba2d5` |

The review incorporates the final signature with expected token:
`risolvi-lotto-pubblicato(lotto registry slot high low level)` and
`annulla-csn-lotto(lotto registry slot high low)`.
The latest ASDF diff also includes `csn-threads` in the test system; the test file
was neither read nor executed.
A subsequent change to fingerprints requires rereading the affected portion.

<a id="rilievi-azionabili"></a>

## Actionable findings

<a id="r1--p2-evidenza-locale-cod-24-mancante-nel-kernel-di-ristampa"></a>

### R1 — P2: missing local COD-24 evidence in the restamping kernel

In `src/wal/builder.lisp:41`, `ristampa-record-parole` is a nontrivial C1 function:
it traverses offsets, modifies stamps and CRCs, and returns the aggregate checksum, but
contains no explicit precondition/postcondition assertions. COD-24 requires at least two
meaningful assertions per nontrivial C1 function. The caller checks count and SEAL
space in `verifica-chiusura-lotto` and final length in `sigilla-lotto-parole`, but this
does not document two kernel assertions or check each offset's validity.

The gap existed in the previous kernel and remains in the renamed function; it is not
evidence of new corruption introduced by the diff. Action: make the kernel's two meaningful
checks explicit, or bring evidence of the delegated check and necessary formal
deviation to the first reading. No recorded deviation is attested:
the deviation register is outside authorized scope.

<a id="o1--obbligo-del-controller-validare-levento-prima-della-pubblicazione-esterna"></a>

### O1 — Controller obligation: validate the event before external publication

In `src/wal/csn.lisp:80`, `risolvi-lotto-pubblicato` checks expected identity, health, and
coverage **after** index publication required by its precondition.
The function protects credit release; it cannot prevent external publication
already performed with an old event or faulty log. A controller publishing
before discarding that event could alter the index even if the bridge rejects it.
The controller was not read: this is an integration obligation, not a defect
demonstrated in its code.

Action: at the writer boundary, check token captured in event, batch incarnation,
healthy log, coverage, and order before publishing; make the
check/publication/resolution sequence indivisible relative to other writer events.
Do not reconstruct the expected token by reading the current batch when the event arrives.
On `busy` after publication, retain its outcome and retry only resolution.

<a id="o2--obbligo-fail-stop-distinguere-rifiuto-sicuro-e-interruzione-dopo-mutazione"></a>

### O2 — Fail-stop obligation: distinguish safe rejection from interruption after mutation

In `src/wal/csn.lisp:35`, `prendi-csn` modifies the register before all
token fields are retained in the batch; in `src/wal/csn.lisp:72`, `risolvi-csn` frees
the slot before `csn-pending` becomes `nil`. These cross-object steps are not a
single atomic write. The docstring requires fail-stop for unexpected interruption
during resolution and error after assignment: this requirement is consistent.

Action: distinguish `resource-exhausted` before mutation from unexpected failure
after mutation. Move Serie/log to faulty state, retire consumers, and prohibit
ordinary retry. With a complete token still pending, abort uses the same
register and words; with incomplete association or uncertain register outcome,
the controller must have an explicit reconciliation or Archivio shutdown strategy.
Stopping only the writer without resolving that credit can leave `H` stalled.
Implementation of this external handling was not verified.

<a id="riscontri-statici-positivi-e-confini"></a>

## Positive static observations and boundaries

| Aspect | Diff observation | Conclusion limitation |
|---|---|---|
| CSN at closure | Batch/log validation precedes `prendi-csn`; token then retained and bytes sealed. | Indivisible assignment/registration and rejection without mutation depend on unread register. |
| On-disk identity | Stamp written low u32 then high u32, in ordinary records and SEAL; header CRCs updated and aggregate checksum recalculated. | Binary codec and recovery not reexamined. |
| Prepared/TXID | Restamping predicate changes PUT/TOMBSTONE/EDIT only when prepared bit absent. | Bridge accepts nonempty segments; it does not prove batches contain only ordinary operations. Controller governs single-Serie use. |
| Atomicity point | Sealing prepares SEAL; `:async` requires write, `:group`/`:strong` require durable coverage. | Sealing alone is neither durable I/O nor index publication. |
| Group from wrong log | `verifica-identita-lotto`, `group.lisp:18`, rejects differing `csn-log` via `eq` before ownership CAS and group modification. | Numerically equal file-id/version do not replace log object identity. Batches without bridge follow legacy contract. |
| Old event after reuse | `esigi-identita-csn-lotto`, `csn.lisp:43`, checks `eq registry` and slot/high/low equality before health/coverage and resolution. | Expected token must belong to original event; uniqueness without wraparound is register responsibility. |
| Other register, same numbers | Register `eq` rejects other Archivio even if slot/high/low match. | Check does not prove register supplied at sealing belonged to correct Archivio; this is a precondition. |
| Duplicate resolution | Pending check precedes identity: already resolved token yields `:lotto-csn-not-pending`; stale event on new pending token yields `:lotto-csn-stale`. | `leggi-csn-lotto` retains numbers after resolution; it does not authorize a second resolution. |
| Old covered batch, log now faulty | `risolvi-lotto-pubblicato` checks original log health even if batch remains `:written`/`:durable`. | `coperto-p` observes only batch state: alone it does not prove health or publication. |
| Abort | Requires exact token and original log `:faulted`, then resolves; does not reopen or delete data. | FAULTED Serie and absence of consumers are controller preconditions, not bridge checks. |
| Reuse | `riusa-lotto` requires durable, nonpending token, and null owner, then clears association. | Null owner does not prove absence of external events/readers; controller must have completed their lifecycle. |
| Preallocation | Token in typed slots of existing batch; buffer, offsets, SEAL, and group slots preallocated. | No allocation measurements. **No claim of absence of heap**, boxing, or GC. |
| Nonblocking | Modified code has no syscall, wait, blocking lock, or retry loop; one allocation/resolution attempt per call. | Register functions not read; try-lock, critical-section bound, and parking bounded by time/bytes remain to be proved. |
| Wiring | Package imports new symbols; ASDF loads CSN module before WAL and bridge after group/executor; `log-io` precedes its use in batch type. | No attestation of warning-free build or ASDF-registered tests. |

<a id="errori-precondizioni-e-stati-da-conservare"></a>

## Errors, preconditions, and states to preserve

| Phase | Condition or failure | Expected state and handling |
|---|---|---|
| Before CSN allocation | Incorrect state/association/content/identity/frontier: `invalid-argument`; faulty log: `io-fault`; inconsistent internal budget: `invariant-violation`. | Bridge allocates no CSN. Invariant errors require C1 fail-stop boundary; other rejections authorize neither mutation nor publication. |
| CSN allocation | Register full/busy/64 bits exhausted: `resource-exhausted`, according to external contract. | Batch open and unassociated if register rejects before mutation. Busy/full: reschedule with bounds; 64-bit exhaustion: no wraparound or infinite retry. |
| After successful allocation | Encoding failure or interruption during token transfer. | Do not request a second CSN. Complete association retained until resolved; partially open or sealed buffer not reusable. Fail-stop according to O2. |
| Resolution with wrong event | `:lotto-csn-stale` or `:lotto-csn-not-pending`. | No `risolvi-csn` call; no bridge change to pending/credit/H. |
| Publication requested | Faulty log: `io-fault`; uncovered batch: `invalid-argument`. | Token remains pending. Do not publish/acknowledge using only old batch state; handle faulty Serie. |
| Busy resolution | `resource-exhausted`, only if register guarantees no mutation on busy. | Pending and identity preserved; park obligation. If index already published, do not publish it again. |
| Resolution with wrong internal token/interruption | `invariant-violation` or unexpected failure. | Fail-stop; do not treat as busy. Slot potentially already freed and local pending still true require O2. |
| Abort | Healthy log: `:lotto-log-not-faulted`. | Credit preserved; abort is not used to discard a healthy commit. |
| Premature reuse | Pending or owner present: `invalid-argument`. | No token/buffer reset. A faulty batch cannot automatically reopen. |

Wrong Lisp types, corrupt internal offsets, and asynchronous interruptions are not proved to be
conditions in the ArcDocDB hierarchy by `safety 3` alone: the worker/controller boundary must
convert or record failure and perform the fail-stop transition. It was not read.

<a id="complessità-cod-13"></a>

## COD-13 complexity

Manual static count per function: base 1; +1 per `if`/`when`/`unless`, loop, and early
exit `thereis`; +`n-1` per `and`/`or` with `n` operands, including nested forms.
`not`, comparisons, and calls add no decisions; called-function cost
is counted in the respective function. This is not measured coverage.

| Modified/new function | Base | Selections and loops | Short circuit | Total |
|---|---:|---:|---:|---:|
| `scrivi-record` | 1 | 0 | 0 | 1 |
| `scrivi-record-parole` | 1 | 0 | 0 | 1 |
| `aggiungi-record` | 1 | 4 | 1 | 6 |
| `ristampa-record-parole` | 1 | 2 | 3 | 6 |
| `verifica-chiusura-lotto` | 1 | 2 | 2 | 5 |
| `sigilla-lotto-parole` | 1 | 1 | 0 | 2 |
| `sigilla-lotto` | 1 | 1 | 0 | 2 |
| `riusa-lotto` | 1 | 2 | 0 | 3 |
| `verifica-identita-lotto` | 1 | 3 | 4 | 8 |
| `aggiungi-lotto` | 1 | 7 | 1 | 9 |
| `verifica-log-csn` | 1 | 5 | 3 | 9 |
| `sigilla-lotto-con-csn` | 1 | 0 | 0 | 1 |
| `esigi-identita-csn-lotto` | 1 | 1 | 3 | 5 |
| `esigi-csn-pendente` | 1 | 2 | 3 | 6 |
| `risolvi-token-lotto` | 1 | 0 | 0 | 1 |
| `risolvi-lotto-pubblicato` | 1 | 2 | 0 | 3 |
| `annulla-csn-lotto` | 1 | 1 | 0 | 2 |
| `stato-csn-lotto` | 1 | 2 | 0 | 3 |
| `leggi-csn-lotto` | 1 | 1 | 0 | 2 |

Maximum 9, so no modified function exceeds 10 with this count.
Restamping loop bounded by count ≤ preallocated offsets; duplicate search by
group count ≤ preallocated slots. Construction bounds visible in diff context
are 65.536 records, 64 MiB per batch, and 1.024 batches per group; correctness of corrupt
internal state does not follow from the bound alone. No recursion added.

<a id="checklist-delle-due-letture-nellordine-richiesto"></a>

## Two-reading checklist, in required order

**Reading 1: parent.** Responsibility assigned to parent; specific evidence of its
12 answers and review references was not provided in this session. Communications
about changes alone do not attest to a complete checklist. The column remains for
the parent to complete, without implicit human signature or certification.

**Reading 2: this independent review.** Completed on scope and fingerprints
above; new group `eq` check and expected-token signature reread after
parent updates. It is not attested that a complete first reading preceded
this one: the parent must still document the formal sequence.

| # | Standard item | Reading 1 — parent | Reading 2 — static evidence |
|---|---|---|---|
| 1 | Consistent REQ and ADRs | To attest | REQ-FOR/LIM/WAL/MVC/AFF present; closure and token consistent with ADR-0037/0038/0046. Register internals outside scope. |
| 2 | Invariants and tests capable of failure | To attest | INV-F2/F3/V5/M4/M5/A8/A11/P6 analyzed; concrete scenarios in decisions document. No test read or run. |
| 3 | Type, handling, and tests for every error | To attest | Error table above; external O1/O2 handling unverified, tests unattested. |
| 4 | Bounded loops and waits | To attest | Loops on preallocated state and complexity ≤10; register nonblocking/parking conditional. |
| 5 | No allocation, measured | To attest | **Unattested: measurements absent.** Two u32 words and preallocation are structural evidence, not a heap measurement. |
| 6 | No unvalidated data leaves module | To attest | Validation before writing; token and high/low returned with ownership preconditions. Suitability for external publication remains O1. |
| 7 | New compound decisions listed | To attest | COD-54 inventory in `wal-csn-decisioni.md`, including registry/slot/high/low identity. Per-condition coverage not run. |
| 8 | Owner of shared state | To attest | OWNER/SHARED declare writer, I/O, and register per batch; external handoff and mutual exclusion unverified. |
| 9 | Updated trace and `make check` | To attest | ASDF updated; matrix, trace, and `make check` not read/run. |
| 10 | No violation without deviation | To attest | R1 open on COD-24. No attestation of deviation register; COD-01/30 require subsequent tests. |
| 11 | No per-operation serialization across Serie | To attest | Diff touches register only at closure/resolution; register cost and progress require measurement/verification. |
| 12 | Atomicity, discardability, idempotence, deletion | To attest | SEAL explicitly prepared; no deletion. Duplicates/stale rejected; retry only after rejection without mutation, O2 for interruptions. |

Outcome: independent second static reading completed, with R1 and external obligations O1/O2 open.
It is not complete C1 approval, coverage proof, heap measurement, or human certification.

<a id="addendum-finale--r1-risolto-2026-10-09"></a>

## Final addendum — R1 resolved, 2026-10-09

Final `builder.lisp` diff reread, including formatting-only refinements.
**R1 is statically resolved**: `ristampa-record-parole` now requires `esigi-lotto :open`,
asserts count ≤ offset length before iteration (`:lotto-record-count`), and,
for each record, pos + header-bytes ≤ used before reading header
(`:lotto-record-offset`). Both new explicit assertions signal
`invariant-violation`; the docstring describes conditions. With nonnegative u32 pos
and used ≤ buffer already checked, the current record's header lies within used bytes.

| Preserved observation | Fingerprint |
|---|---|
| Builder at original reading, before R1 correction | `91f964cc5b0c2195a6962a004317ba78f3c5f18c` |
| Builder after guards, before format refinement | `63db635f031d5f74d954b9cdcc9d2ad01680561c` |
| **Final builder reread** | **`5b4be8856be1e25f35f7a6e68f45ae727c18b168`** |
| ASDF initially observed, before adding test `csn-threads` | `09ac3f6db87d5f45709bd9eee453131cae5de580` |
| ASDF after adding only test `csn-threads`, already reread in diff | `0c0a05d798f04ee5012d1c3a3a98930ae9fba2d5` |

Fingerprints of eight final in-scope files recalculated: all others
match the earlier-reading table. No historical fingerprint is replaced
by this addendum; final builder fingerprint identifies R1 closure version.

Current `ristampa-record-parole` count is **1 base + 4 selections/loops + 3
short circuits = 8** (previously: 6). `esigi-lotto` remains counted in its own function.
Overall maximum unchanged: **9 ≤ 10**. Both new guards are simple, without
new `and`/`or`: compound inventory D01…D12 and E01…E07 unchanged.

The offset check precedes access to its header, not every batch
modification: earlier records may already be restamped. In the bridge, restamping occurs
after CSN allocation and storage; a corrupt offset therefore preserves the pending
obligation and requires O2 fail-stop, without rollback or ordinary retry. For corrupt count,
the external check may already reject `:lotto-seal-space` before allocation; the new
local guard also protects the kernel with `:lotto-record-count`.

Item 10 of the second checklist is updated to **R1 statically closed**; items
2/3 now include typed count/offset scenarios from the decisions addendum.
O1/O2 are external obligations agreed by the parent, with implementation still outside
scope. The parent communicated addition of the offset FI test in `csn-threads` and
will attest to its first reading after this update: neither item of
evidence is certified here. No test was read or run, and no measurements were made.
No product change or commit; no human certification or heap guarantee.

<a id="addendum--preflight-file-prima-della-presa-csn-2026-10-09"></a>

## Addendum — file preflight before CSN allocation, 2026-10-09

Bridge diff reread after introducing `verifica-file-csn` (`csn.lisp:9`).
Previous fingerprint preserved: `a592a370135b8b24b548c38588215ad7d26bf1b5`;
**current fingerprint: `9e1bcfc2dcc92908600dfced771869677b2e90b5`**.
Fingerprints of eight authorized files recalculated: all others remain as
documented in previous addendum, including builder `5b4be8856be1e25f35f7a6e68f45ae727c18b168`.

Actual order is closure check → log association/content/identity → log health
→ file preflight → `prendi-csn` → token storage → encoding. The new helper:

1. Reads written from the log's file and calculates size = used + SEAL.
2. Rejects written > file-start with `invalid-argument :lotto-written-offset`.
3. Calls `verifica-capienza-append(file, (file-start − written) + size, size)`.
4. Rejects durable > file durable-position with `:lotto-future-durable`.

The arithmetic identity written + planned-budget = file-start + size also includes
bytes planned before the current batch. The third argument is only the sealed
batch's size: cumulative budget is not used as a single transfer.
Equality written = file-start is allowed and produces a budget equal to size;
written < file-start is allowed for already planned batches. This check alone does not prove
the planned sequence contiguous: order remains the writer/group's responsibility.

File availability, append mode, transfer limit, and final budget are
delegated to the existing I/O function. Its body remains outside scope: these are
contract obligations, not a rereading of predicates or proof of purity.
Rejections occur in the bridge before allocation and any bridge mutation;
absence of changes in the I/O validator also remains conditional on its contract.
Preflight validates a state observed after handoff; it neither reserves space nor guarantees
file availability through the subsequent I/O task.

| Function | Base | Selections/loops | Short circuit | Current total |
|---|---:|---:|---:|---:|
| `verifica-file-csn` | 1 | 2 | 0 | **3** |
| `verifica-log-csn` | 1 | 4 | 3 | **8**, previously 9 |

No new `and`/`or`, loop, or retry in helper. Overall maximum still **9 ≤ 10**;
delegated validator cost is neither added to local complexity nor reexamined.
The new helper's docstring and REQ declare frontiers, budgets, conditions, and no
syscall. Durable check moved without changing predicate.

Items 2/3/6/7 of second checklist incorporate pre-CSN rejections and delegated
contract E08 in decisions document. The parent reports coverage of six budget/availability
cases and unchanged image: **reported evidence, not verified here**.
R1 remains statically closed; O1/O2 remain agreed external obligations. No new
local-diff finding. Parent's first reading requires attestation; no test or benchmark
read/run, product change, commit, human certification, or heap guarantee.

<a id="prima-lettura-del-parent--2026-10-09-prima-delle-campagne"></a>

## Parent's first reading — 2026-10-09, before campaigns

The author reread integrated product and tests: word codec and wrapper,
closure with log/file/budget preflight, register and token preservation,
event and log identity, coverage distinct from publication, abort
only after FAULTED, and reuse only after resolution/durability/quiescence.
The author corrected R1 and added availability and planned-budget checks.

Items 1, 4, 6, 7, 8, 11, and 12 of the first checklist are supported by the
contract and reread product. Items 2 and 3 have dedicated tests for rejections,
carry/max, stale events and distinct registry, append/flush faults, corrupt internal
count and offsets; a four-Serie test with K=3 forces saturation and
checks 2000 cycles, uniqueness, and convergence. These tests are still to run.
For 5, 9, and 10, heap measurements, warning-free build, and gates remain to collect.
No whole-engine requirement is promoted to verified.

O1 and O2 are accepted as future integration obligations: expected event
validated before publication, already-published outcome preserved on busy;
Archivio fail-stop for interruption after mutation or uncertain state.
Index, Serie lifecycle, and scheduler are not implemented by the bridge.
This first reading and independent reading are automated, without
human certification. Tests will be reported in campaign results.

<a id="esiti-della-campagna-del-parent"></a>

## Parent campaign outcomes

[Results](wal-csn-risultati.md) record integrated build and tests, C4,
mutants, coverage, and heap measurements. The bridge has 40/40 covered branches in the
final SB-COVER report; this is not an MC/DC declaration. Three campaigns observe zero
heap in thirty successful serial windows and detect the positive control.
Initial failed tests and tool/test-only fixes are preserved.

Overall verification on integrated code includes 364 tests and two smoke tests,
trace, links, lint, evidence, and ten spikes. This parent observation completes
local tests for items 5 and 9 and dynamic verification associated with 2/3/10;
it does not extend the static second reading to modified tools. O1/O2 and
absence of controller/index/snapshot remain integration boundaries.
