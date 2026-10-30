<a id="revisione-statica-del-recovery-closed"></a>

# Static review of CLOSED recovery

2026-10-16; shared worktree `closed-verifica/ArcDocDB`.
Two distinct readings by same reviewer: P1 from reader to delegation;
P2 from public entries to parsers, findings rechecked.
First batch saved before completion; references to locations read.
No frozen-snapshot attestation or claim of two independent reviewers.
No tests, compilation, diagnostics, benchmarks, or security scan run;
no other runtime results used. No C1 qualification.

Rules read: CONTRIBUTING, repository guide, engineering principles,
coding standard, and deviation register. C1 checklist: standard, lines 89–108.
Contracts: `docs/implementazione/closed-recuperato.md` and `recovery-csn.md`;
ADR-0020/0040/0041. All nine `src/recovery-closed/` files read, including
`csn.lisp`/`csn-serie.lisp`, and delegates in recovery-active, control, recovery/manifest,
foundation/batch, storage/header and compaction-scan, io/transfer and capabilities.
ASDF registration, requirements/matrix, and available REQ-* cases in
`tests/recovery-closed/` sources read; reading does not demonstrate outcomes.

<a id="rilievi-e-correzioni-suggerite-al-coordinatore"></a>

## Findings and corrections suggested to coordinator

**R1 — Contract correctness: orphan OUTCOME/EDIT conflict undetected.**
Original observation: `src/recovery-closed/resolve.lisp:18` iterates only
prepared TXIDs; comparison at line 21 does not reach orphan OUTCOMEs.
`src/recovery-active/frames.lisp:48` compares only duplicate OUTCOMEs;
`src/recovery-closed/build.lisp:18`–`:25` resolves, aggregates, and builds result.
Deduced, unexecuted counterexample: OUTCOME(T, 7), SEAL CSN 8, EDIT(T, 9),
no prepared T, intact frozen sources. Returned maximum 9,
without comparison of both proofs. No document loss demonstrated.
ADR-0041 requires prepared resolution; additional orphan obligation
here derives from contract `recovery-csn.md:48`/CSR-D04 (`:104`), explicitly
confirmed by coordinator. Not deduced from self-containment alone.
Agreed correction: compare all OUTCOMEs with any same-name EDIT
before prepared classification, without new containers;
preserve `:closed-recovery-outcome-conflict` and prepared-only counts.
Loop remains OUTCOME-budget bounded, without multiserie.log access.
Status: correction announced by coordinator, still to reread statically.
Suggested post-freeze case: `test-REQ-TXM-007-CLOSED-conflitto-orfano`,
with matching, zero, high-bit variants, rejection before result/maximum.
Case read at `tests/recovery-closed/semantics.lisp:50` contains prepared record.

**R2 — Standard COD-24: only one assertion in EDIT-outcome fold.**
Observed location: `src/recovery-closed/csn.lisp:8`–`:16`,
`massimo-csn-chiusura`: checks only entry presence at line 13,
then iterates hash table with untyped values and returns scalars.
COD-24 requires at least two meaningful assertions in nontrivial C1 functions;
`docs/affidabilita/deviazioni.md:18` declares no approved exception.
Concrete proposal, scalars only: save expected cardinality before fold;
for every outcome check `(typep csn 'u64)` before `max`, increment
`used`, and check `used = expected` before result return.
First check also detects negative values `max` might hide;
second detects incomplete traversal against expected source.
Signal `invariant-violation` with dedicated reasons; preserve existing
CLOSED check. Reasserting maximum greater than zero insufficient:
zero valid. No runtime failure demonstrated; Serie FAULTED handling
at controller boundary to verify separately.

<a id="passaggio-1--checklist-c1-dal-reader-alle-deleghe"></a>

## Pass 1 — C1 checklist, reader to delegation

“Open” means evidence not acquired, not a positive outcome.

| # | C1 point | Static evidence / limit |
|---|---|---|
| 1 | REQ and ADR | Annotated REQs; ADR-0040/0041 for P and self-containment; R1 on additional CSN contract. |
| 2 | Invariants and tests | INV-S7/A2/A9/P6 relevant; cases REQ-TXM-007, REQ-MVC-005, REQ-AFF-008 read; effectiveness open. |
| 3 | Errors | Typed rejections, propagation without module handler; R1 missing contractual rejection. |
| 4 | Loops and waits | Chunks/batches/records/prepared/OUTCOME/EDIT/set bounded; no recursion or waits introduced. |
| 5 | Allocations | Workspace/hash table at opening; zero heap, RSS, u64/GC costs unmeasured. |
| 6 | Verified data | Construction after CRC/SEAL and local semantics; R1 limits orphan-proof consistency. |
| 7 | Decisions | CDR-D01…07 and CSR-D01…10 listed; MC/DC open. |
| 8 | Ownership | OWNER/SHARED declared; private scratch, capabilities/sources retained by controller. |
| 9 | Traceability/checks | REQ, ASDF, matrix read; regeneration and `make check` not established. |
| 10 | Standard/deviations | Safety 3, ftype, typed/read-only slots; R2 COD-24, no recorded exception. |
| 11 | Parallelism | No new locks, mutable global, or write between Serie; I/O in dedicated task. |
| 12 | Durability | Read-only reader; CONTROL rename/parent fsync delegated to canonical publisher. |

<a id="passaggio-2--checklist-c1-dagli-ingressi-ai-parser"></a>

## Pass 2 — C1 checklist, entries to parsers

| # | C1 point | Static evidence / limit |
|---|---|---|
| 1 | REQ and ADR | Resolution and CSN sources reread; observed maximum distinct from H and full Archivio base. |
| 2 | Invariants and tests | Prepared partition rechecked; R1 requires dedicated orphan case. No tests run. |
| 3 | Errors | Budget produces rejection, never abort/absence; short-read/EOF errors propagated. FI/controller handling open. |
| 4 | Loops and waits | Set budget before seen; exact batch limit accepted; parser over batches+records, compaction over count. |
| 5 | Allocations | Result without scratch/workspace; seen remains opening allocation, no measurement. |
| 6 | Verified data | EQ CONTROL, u64 ID, P, uniqueness and presence/zero rechecked; R1 confirmed in read sources. |
| 7 | Decisions | Compound forms in read/verify/resolve/publication and CSR-D06 rechecked; per-condition coverage not established. |
| 8 | Ownership | Freezing, catalog authority, and FD stability explicit controller preconditions. |
| 9 | Traceability/checks | REQ-* names read; no build/trace/lint/coverage/check evidence produced here. |
| 10 | Standard/deviations | R2 confirmed in EDIT fold; safety and delegated checks do not grant overall approval. |
| 11 | Parallelism | Local read-only aggregation; no CSN allocation or new serialization between Serie. |
| 12 | Durability | CLOSED gate before claim; same CAS/rename/publisher states; external inventory and admission. |

<a id="controlli-effettivi-e-precondizioni"></a>

## Actual checks and preconditions

- **End P / EOF.** `read.lisp:33` obtains P from manifest, `:70` bounds body;
  `verify.lisp:19` verifies complete batches without TAIL scanner. Half-batch P is
  error; later bytes unread. Short file: `src/io/transfer.lisp:34`
  signals EOF/no progress. P does not measure EOF. Header plus
  `ceiling((P-64)/chunk)` are exact logical reads: short reads may
  require more syscalls with positive progress and per-byte bound.
- **Identity/set.** `read.lisp:31` compares backend, including NIL; `:55`
  delegates header CRC/UUID/full ID/version/origin/reserved fields.
  `publication.lisp:16` checks budget before seen; `:17`–`:30` check
  cardinality, EQ CONTROL token, membership, P, unique EQL IDs.
  Under stability this proves all and only old CLOSED, including zero/high-u64 IDs.
  Names/inodes, catalog, and physical reconciliation remain preconditions.
- **Lifetime.** Reader: CONTROL/input before/after. Gate: each input,
  CONTROL rechecked at end. `csn-serie.lisp:16`/`:22`: ACTIVE before/after.
  No atomic acquisition of all FDs: controller keeps open and freezes
  file, namespace, manifest, and vector throughout operation. Individual scalar
  queries describe completed read without rechecking openness.
- **Budgets.** `read.lisp:30`–`:40` checks configuration/P/outcomes/range/capacity
  before I/O; `verify.lisp:23` bounds records before workspace. ACTIVE parser
  bounds distinct prepared and physical OUTCOMEs including duplicates.
  Canonical EDITs bounded by count; max-segmenti excludes ACTIVE. No RSS ceiling established.
- **TXID/CSN and scope.** `src/recovery-active/frames.lisp:73` excludes prepared
  stamps; `:78` takes CSN from OUTCOME payload, `:82` from writer SEAL.
  `csn.lisp:14` includes all EDITs, including orphans; `:35` allows only
  ordinary compaction stamps. u64 maxima, NIL/0 distinct from T/0, no increment.
  Complete set concerns this Serie: all Serie and complete decision log
  still needed to initialize unique Archivio register.
  Orphan outcomes produce no documents/commits; maximum does not authorize traffic.
- **Token/durability.** `publication.lisp:44` precedes every claim; ACTIVE
  and CONTROL delegates check closing, view, conservative transition.
  `src/control/publication.lisp:49` uses canonical CAS; `:52` renames, `:56`
  synchronizes parent, `:62` marks incomplete owner exit FAULTED.
  No new token; CLOSED check does not certify Recovery Manager.

Delivery: R1 preserved as original observation, correction announced;
R2 supplied with concrete proposal. Later patches to reread before freeze.
Executable verification and other C1 gates unestablished.

<a id="addendum--rilettura-statica-delle-patch-r1r2-2026-10-16"></a>

## Addendum — static rereading of R1/R2 patches, 2026-10-16

This addendum updates finding status; previous observations and locations
remain tied to sources before coordinator corrections.

- **R1:** `src/recovery-closed/resolve.lisp:18`–`:21` traverses all
  OUTCOMEs before prepared classification (`:22`–`:25`). Present EDIT and
  different CSN cause `:closed-recovery-outcome-conflict`, even without prepared.
  Presence separate from CSN preserves zero/high bits; prepared-only counts
  unchanged. No new container; work bounded by already budgeted maps.
- **R2:** `src/recovery-closed/csn.lisp:14`–`:22` saves cardinality, checks
  u64 before `max`, and compares `used` with `expected` before return.
  Dedicated reasons: `:closed-recovery-csn-value` and `:closed-recovery-csn-outcomes`.
  Informative value/consumption checks; count does not prove concurrent
  stability, which remains precondition. Counters only added, zero CSN allowed.

R1/R2 addressed relative to static findings; no new product
problem identified in either patch. For CDR-D06, compound comparison now
EDIT present AND different CSN; OUTCOME presence implicit in loop, orphan to cover.
Rereading complete for freeze; no execution, commit, or runtime qualification.
