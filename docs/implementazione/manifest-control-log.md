<a id="manifest-ricostruito-dal-control-log"></a>

# Manifest rebuilt from the control log

Module `arcdocdb.recovery.manifest` folds EDITs from the
verified `control.log` prefix in memory under
[ADR-0040](../adr/0040-manifest-a-record-unico.md). It prepares the source of
truth for a Serie's inventory: ACTIVE, CLOSED with valid lengths
and closure outcomes, removed segments, and identifier limit.

<a id="contratto"></a>

## Contract

`ricostruisci-manifest` receives a stable buffer, record range,
explicit version, `file-offset`, and authoritative `file-size`. Serie identity
and header are checked by caller. The range ends
at physical EOF under the [scanner](scansione-log.md) contract.
Returns owned manifest, prefix end in buffer, and state
`:complete` or `:tail`.

First it checks the whole log and searches for any durable witness beyond
the tail. Then it checks EDIT payloads and budgets in the prefix and
applies them in physical order. An error returns no partial state.
A semantic error inside a prefix with verified frames and SEALs does not
become a tail. An undersized frame remains subject to
scanner classification.

First EDIT must be complete with nonzero ACTIVE and `next-id`
nonzero and above every named ID. An empty log or incomplete first batch
supplies no usable manifest. Subsequent EDITs
are differential; `open = 0` retains ACTIVE.

| Query | Result |
|---|---|
| `segmento-attivo(manifest)` | ACTIVE u64 ID |
| `prossimo-id-segmento(manifest)` | explicit presence and u64 ID; `nil, 0` if space exhausted |
| `numero-segmenti-chiusi(manifest)` | distinct CLOSED count |
| `numero-segmenti-rimossi(manifest)` | distinct removed count |
| `trova-segmento(manifest, id)` | `:active`, `:closed`, `:removed` or `:unknown`; valid length and outcome count, both zero outside CLOSED |
| `trova-esito-chiusura(manifest, id, txid)` | explicit presence and CSN, including zero; `nil, 0` after segment removal |

Queries return scalars only. Result owns its data and
retains no buffer spans; caller may reuse the buffer after return.
ACTIVE, CLOSED, and removed are disjoint. Unknown ID stays distinct
from explicitly removed ID: absence is not proof of deletion.

Arguments outside declared types report `TYPE-ERROR` with `safety 3`.
Configuration, corruption, exhausted resources, and internal inconsistencies use
module typed conditions with contract-described offsets.

<a id="applicabilità-e-duplicati"></a>

## Applicability and duplicates

> **Proposal — local application contract.** Following checks make
> the conservative fold interpretation explicit; existing codecs
> verify structure without deciding these transitions.

An EDIT's `open`, `closed`, and `removed` sections are disjoint. A
rotation closes old ACTIVE and opens new ACTIVE in the same
EDIT. Closing ACTIVE without replacing it, or replacing it without
closing it, is an error. A new CLOSED may be previously unknown
compaction output. A CLOSED or removed segment cannot
become ACTIVE again.

Identical repeats are idempotent: CLOSED with same length and
same TXID/CSN set; repeated outcome with same CSN; already recorded
removal; `open` repeating current ACTIVE. Mismatching lengths or outcomes
are corruption. Removing ACTIVE or unknown ID is
an error. Duplicates still consume physical budgets.

EDITs in the same batch may share a stamp. ID publication
order need not increase: a worker may reserve a
compaction ID and publish its EDIT after a rotation.
Limit is the maximum of initial complete `next-id` and one plus the
maximum observed ID; removals do not decrease it. Introducing
maximum u64 exhausts space, represented only in memory by the
query returning no next ID. Persistent format does not change.

Manifest detects reuse of IDs still present in CLOSED or
removed. It cannot distinguish a legitimate reservation from historical
reuse of an ID now absent from checkpoint: that guarantee remains
the writer allocator's responsibility. Numeric limit alone
does not demonstrate reuse.

<a id="budget-e-parallelismo"></a>

## Budgets and parallelism

> **Proposal — configurable budgets.** 65,536 EDITs, 65,536 segment
> mentions and 65,536 cumulative outcomes; 65,536 CLOSED, removed and outcomes per
> EDIT; 16 MiB per payload. Scanner budgets remain separate.

Mentions include every CLOSED, every removed segment, and every nonzero `open`
before coalescing. Checks precede result
construction. This opening path may allocate; it promises no zero
heap. Loops are bounded by verified bytes and counts.

Every call owns its workspace. Serie may construct
independent manifests in parallel without locks or shared writes;
queries on a published manifest are read-only. Module
creates no threads or engine scheduler. Mutation
campaigns use separate processes and caches; performance measurements, if
requested, remain serial.

<a id="verifica-e-limiti"></a>

## Verification and limits

The [method](manifest-control-log-metodo.md) distinguishes independent fixtures,
logical oracle, real parallel tests, mutations, and raw coverage. The
[decision table](manifest-control-log-decisioni.md) records
compound predicates and internal guards.

The 2026-10-09 campaign preserves results in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-manifest/catalogo.lisp): 20 dedicated
tests, 64 recovery tests in the initial snapshot, four threads with 32 private reconstructions and
a common manifest; eight manifest mutants detected and seven DECISION
mutants detected to check tool compatibility. Raw coverage
across six manifest files is 888/1067 forms and 114/146 branches; no
exclusion approved. Queries have 8/8 observed branches. HTML data and
original `sb-cover` state remain preserved with preliminary
failures and command records.

Initial alignment with writer queues and radix selector preserves this historical
data and adds a distinct integrated check in the catalog. The isolated-campaign
copier also includes `execution` components and tests;
every mutant still starts from verified baseline. The initial-snapshot
DECISION campaign selected 25 tests; after alignment,
runner also selects 18 radix tests, for 43 dedicated tests. That snapshot's
suite includes 82 recovery tests and 17 writer-queue tests.

Subsequent alignment with UTF-8 and writer-slice handoff
also includes `codec` sources and tests in isolated copies. Suite
includes 82 recovery tests, 34 execution tests, and 17 UTF-8 tests; manifest
retains its 20 dedicated tests. This integration's records are
distinct from earlier snapshots in the
[integration catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-manifest-integration/catalogo.lisp).

Radix, UTF-8, and handoff runners retain process exit code and signal: an OS interruption
or nonzero exit after test completion is worker error,
distinct from a detected mutant. Self-test uses a child process that
prints the start marker and terminates itself with SIGKILL; original
runner, logs, and reports are preserved in catalog. This test concerns
the tool, not a product failure.

This module neither reconciles files/directories, renames or deletes,
reads segments, resolves prepared records, nor writes a new control
log. In-memory reconstruction does not close the full recovery gate.

The [checkpoint preparer](checkpoint-control.md) reuses this decoder
to verify a complete in-memory state before writing new
`control.log.tmp`. Rename, authoritative inventory, and adoption remain with controller.

Requirements: REQ-WAL-001/005, REQ-REC-001/002/004, REQ-FOR-003,
REQ-AFF-008/009/017/018/019, REQ-VAL-001.
Invariants: INV-S2/S4/S5/S7, INV-F1/F2/F3, INV-A7/A8/A9/A10/A11, INV-P6/X3.
