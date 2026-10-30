<a id="decision-log-recuperato--revisione-statica-c1"></a>

# Recovered decision log — static C1 review

Date: 2026-10-15. Reviewer: Codex, independent reading assignment.
Shared worktree: `/Users/gpicchiarelli/.codex/worktrees/decisioni-verifica/ArcDocDB`.
Observed Git revision: `c6a21d810dabdc1218efbbeaa1f7dab560da8893`;
observations concern the working files read, without attesting a global freeze.

**Outcome:** two static readings completed, both by the **same reviewer**.
One concrete COD-25 conformance finding, described below. Readings
found no additional demonstrable functional defects under contract
preconditions. This outcome attests neither absence of defects nor C1 qualification.

<a id="perimetro-e-metodo"></a>

## Scope and method

Read all six files in `src/recovery-archive/` in full: `package.lisp`,
`types.lisp`, `read.lisp`, `build.lisp`, `query.lisp`, `active.lisp`.
Compared with [API contract](decisioni-recuperate.md), ADR-0041, ADR-0052,
[coding standard](../affidabilita/standard-di-codifica.md), deviation
register, repository guide, requirements, and traceability matrix.

Statically followed relevant delegations: storage header and constants;
`io/types.lisp`, `io/transfer.lisp`, and lifecycle; recovery scanner;
`decisions-types/build/query/sort.lisp`; ACTIVE recovery entry, preflight, resolution,
and result; identity of `ambito-get` and Serie view.
This deeper delegation reading does not constitute full review of
those modules or the Recovery Manager.

| Reading | Concrete method | Outcome |
|---|---|---|
| L1, same Codex reviewer | Contract to flow: bootstrap, preflight, header, body, replay, query, ACTIVE binding; followed delegations to check contracts. | R1 found; EOF, catalog, and ownership preconditions distinct from local checks. |
| L2, same Codex reviewer | Full rereading in reverse file order; checked rejections before I/O, range extremes, absence/zero, tail/duplicates, FD, and budget correspondence. | R1 confirmed; no additional functional defect demonstrated within scope. |

Both readings are passes by the same reviewer, not two independent
reviewers. No test, compilation, lint, benchmark, coverage tool,
mutation, or security scan run. No skill used.

<a id="r1--io-dentro-il-predicato-delle-asserzioni-di-invariante"></a>

## R1 — I/O within invariant assertion predicates

**Medium priority; static nonconformance with COD-25.** Found in L1 and
confirmed in L2; no runtime fault observed or inferred as inevitable.

- Locations: [`src/recovery-archive/read.lisp`](../../src/recovery-archive/read.lisp),
  lines **39–40** (`leggi-header-decisioni`) and **58–59** (`leggi-corpo-decisioni`).
- Both `unless … (error 'invariant-violation …)` checks execute
  `leggi-esatto` directly in the assertion predicate. This call
  performs I/O and modifies scratch: the condition is not side-effect-free.
  The delegation making the effect concrete is `src/io/transfer.lisp`, lines 55–77,
  particularly buffer transfer at lines 67–73.
- Branches signal respectively `:archive-recovery-header-read` and
  `:archive-recovery-read`; the latter retains `:offset start`.
- COD-25 requires assertions to have no side effects. These are
  explicit invariant checks even though written with `unless` rather than
  the `assert` macro. The deviation register read contains no
  approved waivers.
- Concrete consequence: the read operation and result check
  are coupled in the predicate; removing or reformulating the check may
  also remove the operation. In current code the check remains active:
  no claim that the read is skipped or corrupted data
  returned.
- Proposed correction, not applied: assign the `leggi-esatto` result
  to a local variable and then check equality with a pure predicate,
  retaining order, single call, original condition, and offset.

<a id="confronto-concreto-tra-contratto-e-implementazione"></a>

## Concrete contract-to-implementation comparison

| Aspect | Static evidence and conclusion | Limit |
|---|---|---|
| Requirements and ADR | Definition REQ markers cover REQ-REC-001, REQ-TXM-001/005/007, REQ-FOR-001/002/003, and REQ-AFF-002/008/009 by function. ADR-0052 governs header/identity, ADR-0041 decisions and resolution. | Partial implementation of Recovery Manager requirements; does not close all REQ-REC-001 or participant outcome durability. |
| Preflight | `read.lisp:14–28`: open `:input` capability, UUID alias, chunk, size/header, byte budget, scratch, transfer capacity, replay and scanner budgets, before `leggi-header-decisioni`. | Argument type validity is a signature precondition; not all type rejections are `invalid-argument`. |
| Header and version | `read.lisp:38–45` reads 64 bytes; `storage/log-header.lisp:39–59` checks range, CRC, multiseries magic, supported version, all reserved fields, and all 16 UUID bytes. `build.lisp:28` passes read version to replay. | No bytewise v1/v2 test run. The `2` in scanner preflight is not the version used to decode body. |
| Ownership | `types.lisp:20–22` checks 16 bytes and uses `copy-seq`; read-only slots at lines 11–12 and 31–37. `decisions-build.lisp:89–95` copies participants; result retains owned table, Archivio, and capability, without scratch. `package.lisp:14–17` exports no array accessors. | Immutability is that of protocol and public APIs; not protection against access to Lisp internals or mutations outside protocol. |
| Wrong scope | `active.lisp:15–19` compares canonical Archivio scope and CONTROL view scope with `eq`, then checks alias and capability. `active.lisp:37` precedes delegation performing ACTIVE I/O. | Equal UUIDs do not make distinct scopes equivalent. Initial UUID/scope association and bootstrap uniqueness remain controller responsibilities, as documented. |
| FD lifetime | `read.lisp:14,60`, `build.lisp:36`, `active.lisp:19,43` require open read-only capability; `io/types.lisp:83–91` checks mode, state, and descriptor. `io/transfer.lisp:65–73` rechecks capability around transfers. | Retained reference is not a lease preventing close. Final ACTIVE check observes decision log on return; alone it does not guarantee continuous lifetime. FD/file/namespace freeze and close after readers remain preconditions. |
| EOF and frontiers | `build.lisp:28–35` uses `file-size = size`, file offset zero, and checks `64 <= P <= size`, COMPLETE with `P = size`, TAIL with `P < size`. Scratch represents file from offset zero: P is therefore absolute. | No EOF/fstat measurement: incomplete size violates precondition. Read-only does not prevent external writes. |
| Tail and witnesses | `decisions-build.lisp:178–190` runs scanner first; `scan.lisp:181–184` looks for witnesses before returning TAIL. `scan.lisp:144–158` visits every candidate position within budget and signals incomplete search or durable corruption. | Tail excludes the whole failed batch. Does not attest support or file remain healthy after return. |
| Duplicates and absence | `decisions-build.lisp:120–153` coalesces equal TXIDs only after comparing CSN and canonical participant set; conflict with `:decision-conflict`. `decisions-sort.lisp:54–66` rejects repeated participants. `decisions-query.lisp:35–43,69–78` distinguishes presence/CSN zero and checks ID16 even for absent TXID. | Semantics delegated to canonical replay; this reading does not rerun its previous campaigns. |
| ACTIVE resolution | `active.lisp:38–42` passes verified table to canonical reader. `recovery-active/resolve.lisp:13–23` checks participant and OUTCOME/DECISION agreement before classification. | No fallback from NIL or reader error. ACTIVE result does not retain table (`recovery-active/types.lisp:10–27`); publication and forgetting decisions outside scope. |

<a id="bounds-e-inoltro-dei-budget"></a>

### Bounds and budget forwarding

Let `H = 64`, `N = size`, `C = chunk`; preflight imposes `N >= H`,
`C > 0`, `N <= max-bytes`, and scratch length at least N. Loop in
`read.lisp:56–59` has `ceiling((N-H)/C)` iterations. For every executed
iteration, `H <= start < end <= N`, with `end = min(N, start+C)`.
For N = H it does not read body; last chunk may be short.
Capacity check covers `max(H, min(N-H,C))`. Lisp integer arithmetic
introduces no offset wrap before `min`.

The limit concerns logical calls to `leggi-esatto`: short reads
may require multiple backend calls. The I/O primitive has a loop
bounded by byte count and requires positive progress
(`io/transfer.lisp:31–38,64–76`). No maximum syscall times inferred.

In `build.lisp:28–32`, replay receives `max-bytes`, `max-batches`,
`max-batch-records`, `max-batch-bytes`, `max-decisions`, `max-participants`,
and `max-participants-per-decision`; `max-search-bytes` receives `max-bytes`.
`chunk-bytes` bounds local reading, not scanner. Wrapper byte budget
includes header; scanner budget bounds body, after the wrapper's more
restrictive `size <= max-bytes` check.

Physical and cumulative counts precede coalescing: DECISION check
in `decisions-build.lisp:183–184`, participant check at lines
62–66, copies at lines 89–95. Duplicates consume budget before
coalescing; an error does not become presumed abort. Zero is allowed for
DECISION/participant counts in the empty case, not for chunk or maximum
batch count of scanner configuration (`scan.lisp:68–74`).

In the ACTIVE wrapper, all eight exposed budgets are forwarded without replacement
(`active.lisp:28–31,40–42`, compared with `recovery-active/build.lisp:32–35`):

| Keyword | Transmitted value |
|---|---|
| `:chunk-bytes` | `chunk-bytes` |
| `:max-bytes` | `max-bytes` |
| `:max-batches` | `max-batches` |
| `:max-batch-records` | `max-batch-records` |
| `:max-batch-bytes` | `max-batch-bytes` |
| `:max-records` | `max-records` |
| `:max-prepared` | `max-prepared` |
| `:max-outcomes` | `max-outcomes` |

<a id="errori-tipizzati-e-gestione"></a>

### Typed errors and handling

| Origin | Condition / `reason` observable in code |
|---|---|
| UUID not 16 bytes long | `invalid-argument / :archive-recovery-identity`, `types.lisp:20–21`. |
| Wrong alias, chunk, or initial configuration | `invalid-argument / :archive-recovery-alias` or `:archive-recovery-arguments`, `read.lisp:15–18`; scanner/replay propagate their own reasons. |
| Physically attested header too short | `corruption-detected / :archive-recovery-header-truncated`, `read.lisp:19–20`. |
| Total file budget | `resource-exhausted / :archive-recovery-byte-budget`, `read.lisp:21`; I/O capacity: `:io-byte-budget`. |
| Scratch or ID16 range | `invalid-argument / :buffer-range` or `:serie-id-length`, through delegates. |
| Intact but incompatible header | `corruption-detected / :log-header-crc`, `:log-magic`, `:log-reserved`, `:log-identity`; unknown version: `unsupported-format / :file-version`. |
| Wrong or closed capability | `invalid-argument / :io-mode`, `io-fault / :io-unavailable`; no-progress read: `:io-eof` or `:io-invalid-progress`; syscall: `:io-syscall`, through `io`. |
| Different scope | `invalid-argument / :active-recovery-archive`, `active.lisp:15–16`, before ACTIVE I/O. |
| Invalid replay | Propagated `log-corruption / :log-durable-corruption`, scanner/replay budgets, `:decision-conflict`, `:decision-duplicate-participant`, and codec conditions. |
| Inconsistent internal results | `invariant-violation / :archive-recovery-preflight`, `:archive-recovery-header-read`, `:archive-recovery-header`, `:archive-recovery-read`, `:archive-recovery-prefix`. |

The module does not catch these conditions or return partial
results in their place. FAULTED transition and recording
are delegated to controller; they are not certified in this assignment.
Precontractual type violations may signal `type-error`, as
declared in docstrings: they are not locally translated to
`arcdocdb-error`. C1-boundary handling of these conditions and allocation
failures remains to be checked; unconditional COD-22 conformance
or COD-24 closure is not attested by propagation alone.

<a id="checklist-c1--i-dodici-punti-dello-standard"></a>

## C1 checklist — the standard's twelve points

“Statically consistent” indicates only a reading conclusion.
“Open” requires further evidence, collected elsewhere by coordinator.

| No. | Standard point | L1 — same reviewer | L2 — same reviewer |
|---|---|---|---|
| 1 | REQ requirement and ADR indicated and consistent | Markers read in all definitions; consistent with ADR-0041/0052 for subtask. | Distinction confirmed between reading decisions and completing Recovery Manager. |
| 2 | Invariants listed and test that would fail on violation | INV-F1/F2/F3, INV-A2/A4/A7/A8/A9, INV-T4/T5, INV-S7, INV-P5/P6, and INV-X3 affected; INV-A10/A11 as constraints against durable effects. | Static connections described above. Violation tests neither run nor declared covered: open. |
| 3 | Every error has type, handling, and test | Conditions and reasons inventoried above; no local generic handler hiding failure. | Propagation confirmed; controller handling, TYPE-ERROR, allocations, and dedicated tests remain open. |
| 4 | Bounded loops/waits, bounded recursion | Body loop with explicit bound; budgeted scanner and bounded binary queries. | Bounds reexamined, no recursion or lock wait introduced. Blocking I/O allowed only in I/O task specified by precondition. |
| 5 | Measured absence of hot-path allocations | Read/replay are opening with explicitly allowed allocations; UUID copy and owned table. | No heap, RSS, or query measurement: measured point open, no zero-heap promise. |
| 6 | No unverified data leaves module | Header before body, scanner before payloads/copies, result after frontiers and capability check. | Scalar-only queries; ID16 span and length checked even on absence. Statically consistent under authoritative EOF/stability. |
| 7 | Compound decisions in table | DAR-D01 = `read.lisp:17`; DAR-D02 = `read.lisp:53`; DAR-D03 = `build.lisp:33–34`. | Inventory of three `and` forms confirmed, including DAR-D03 COMPLETE/TAIL branches. Condition-by-condition coverage not attested. |
| 8 | Shared-state owner declared and respected | OWNER/SHARED in six files; exclusive scratch, private copies, read-only result. | No table mutation by wrapper; freeze and lifetime entrusted to controller. Statically consistent. |
| 9 | Matrix updated and `make check` passed | REQ and matrix links read; module registered in ASDF. | No matrix regeneration or `make check` run; standard-required outcome open. |
| 10 | No rule violated without deviation | R1 on COD-25; no approved deviation in register read. FTYPE, read-only slots, and safety 3 present. | R1 confirmed. Warning-free build, lint, and full conformance not attested; error/invariant handling limited as above. |
| 11 | No new lock/wait/shared write per operation between Serie | Only decision reads and private scratch; no new lock, CSN, or global registry. | Confirmed within module; Archivio opening precedes Serie recovery. No parallelism measurement run. |
| 12 | Atomicity point, preparation/idempotence, authorized removal | No durable change: read and in-memory construction only; no new atomic point. | No truncate/delete/rename/flush or publication introduced. Subsequent durable effects and their idempotence outside scope. |

<a id="limiti-e-consegna"></a>

## Limits and delivery

The execution freeze requested by coordination is respected. This
reading does not import previous local evidence as its own results or
add tests, campaign, or runtime outcomes. New entry-point tests,
FI, mutations, coverage/MC/DC, compilation and full
verification, allocations/performance, and controller/fail-stop integration remain open.

The worktree is shared: during reading, others' changes appeared
in `arcdocdb.asd`, `tools/foundation-coverage.lisp`, and `tests/recovery-archive/`.
They were neither modified nor restored by this assignment; conclusions
do not attest the final version of that work or the entire worktree.

**Only file written by this assignment:**
`docs/implementazione/decisioni-recuperate-revisione.md`.
No product source modified; no commit. Both readings and this
checklist constitute static delivery, with R1 open and no claim
of full qualification.

<a id="addendum--seconda-revisione-statica-della-patch-r1"></a>

## Addendum — second static review of R1 patch

Date: 2026-10-15. Reviewer: the same Codex as readings L1 and L2.
Second review after the author's applied correction, limited
to the diff of `src/recovery-archive/read.lisp`; it is neither a second
independent reviewer nor a new full module review.

The original observation, checklist, and earlier line references
remain retained and describe source observed at revision
`c6a21d810dabdc1218efbbeaa1f7dab560da8893`. Observed HEAD is still that revision;
the examined patch is in the worktree. The product diff read reports only two
hunks, with abbreviated blob IDs `a07e6357..b46823a3`.
Lines below refer to the corrected file; they do not retroactively
update those of the original observation.

| Patch check | Static evidence | Outcome |
|---|---|---|
| Header: operation separate from assertion | `read.lisp:39–41`: `let` assigns `next` the result of `leggi-esatto`; `unless` predicate only compares `next` with `+log-header-bytes+`. | Predicate performs no I/O or scratch write. |
| Body: operation separate from assertion | `read.lisp:59–61`: at each iteration `let` assigns `next` the same read's result; `unless` only compares `next` with `end`. | Predicate performs no I/O or scratch write. |
| Read count, arguments, and order | One header call with `input scratch 0 +log-header-bytes+ 0` remains, after `check-range` and before header verification; one body call with `input scratch start end start` per iteration remains. | No duplication, omission, or order change introduced in two hunks. |
| Conditions and propagation | `invariant-violation / :archive-recovery-header-read` and `invariant-violation / :archive-recovery-read` remain, with `:offset start` in body. No handler, retry, or cleanup added; `leggi-esatto` conditions still propagate before comparison. | Same checks and errors in examined flow. |
| Scope and bounds | New `next` variables lexical; header variable ends before next `multiple-value-bind`. Loop count, `start/end`, final capability check, signatures, and budgets unchanged in two hunks. | No lexical interference or bounds change identified in patch. |

**Updated status: R1 closed exclusively statically for the examined
patch.** I/O now executes before checking, and both invariant
predicates are free of the side effect contested under COD-25.
No new findings emerged in the two hunks. The earlier open R1 entry and checklist
point 10 remain evidence of the first version;
this addendum records subsequent static resolution.

No runtime execution, test, compilation, lint, or benchmark performed.
Closure does not attest measured equivalence, absence of runtime regressions,
full module conformance, or C1 qualification; all other limits of the
original review remain valid. This follow-up only
added this addendum to `docs/implementazione/decisioni-recuperate-revisione.md`;
no other file modified and no commit made. Assignment concluded for
the coordinated freeze.
