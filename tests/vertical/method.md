<a id="prova-verticale-con-arresto-del-processo"></a>

# Vertical process-crash test

> **Proposed** — C4 integration campaign, preregistered on 2026-10-15.

Question: do public components allow writing, updating, deleting, and reading documents,
then recovering them in a new process after SIGKILL?

One Serie, v1/v2 formats, exclusive 0700 temporary namespace. Writer uses product
ACTIVE preparer, WAL/CSN, controller, primary index, and GET. Bootstrap/coordination
are explicit in C4 fixture: no complete server, catalog, or Recovery Manager claimed implemented.

Four interruptions per format: after durable commits; after record fragment without
SEAL; after checkpoint preparation before publication; after publication, rotation,
and new commits on second segment. Real SIGKILL executes no Lisp cleanup.
Separate process opens CONTROL, decision log, and segments read-only, resolves ACTIVE,
builds/publishes checkpoint, rebuilds index from verified prefixes, and reads expected
values. Third process repeats opening and verification of published checkpoint.

Expected results are workload constants: latest A/C values, B absent, and after rotation,
A absent, new C, D present. They derive from neither index, manifest, nor recovery output.
Negative control alters only verifier expectation: must produce nonzero outcome.
Preexisting segment bytes/lengths must remain identical after recovery, including tail.
Unpublished CONTROL temporary retained under distinct name.

Limits: at most 8 KiB per file, four segments, 32 records, one serial worker,
60 seconds per child process. Archivio UUID/namespace are fixture facts.
Index replay and step ordering belong to test; limited to ordinary records and reject
prepared/OUTCOME. Tests qualify neither historical MVCC, index/root concurrency,
multiseries, compaction, power loss, P99, throughput, GC, nor C1/MC/DC.
No performance measured.

Execution planned through `tools/record-command.lisp`, including failed attempts;
final full check with `make check`. Suite belongs to ASDF; dedicated driver permits
separate repetition. Original records and source blobs retained in results campaign.

<a id="estensione-preregistrata-nuove-scritture-dopo-il-recovery"></a>

## Preregistered extension: new writes after recovery

On 2026-10-15, before fixture changes, add a question: can recovered Serie assign
later CSNs, write again, and preserve effects after a second SIGKILL?

For each of eight previous scenarios, after first recovery a new process verifies
all CLOSED, rebuilds maximum CSN from all ordinary records including tombstones,
and verifies empty ACTIVE. Closes inspection capabilities and creates a separate
environment: CSN registry, snapshots, GET scope, and controller share same new base.
A checkpoint also retains empty ACTIVE and opens a new segment.
Four commits follow: insert E, update C, delete A, delete E. Read each effect immediately;
then SIGKILL process. Two further processes perform recovery and independent verification.

Expected results remain constants: maximum and record count 9, or 12 after rotation;
A/B/E absent, C updated, D present only after rotation. Latest CSN is a tombstone,
not a live key. H must equal latest CSN after every resolved commit.
All preexisting bytes remain unchanged, including unsealed tail.
Negative case deliberately initializes registry to zero: typed oracle must catch
reused CSN before appending, with exit 1 and ACTIVE still only 64 bytes.

Name budget rises from four to eight IDs; other limits unchanged.
Full suite plans 18 workloads, 71 processes, 26 intentional SIGKILLs, two expected errors.
No performance measurement. Still a serial C4 fixture with one Serie, ordinary
records only, and empty decision log; not a recovery API or general Archivio admission gate.

<a id="collegamento-alla-proposta-id-di-prodotto"></a>

## Connection to product ID proposal

On 2026-10-15, fixture replaces first-free-ID search with
`scegli-id-segmento-recovery`: authoritative manifest and complete `.tmp`/`.seg`
name inventory in its eight-ID namespace. Verifies `:ready`, successor, and its
budget; does not apply plan actions. Test remains C4 with same 18 workloads
and constant oracles. ID-proposal contract/C1 verification remain separate.

<a id="collegamento-preregistrato-alle-aperture-relative-e-alleof"></a>

## Preregistered connection to relative opens and EOF

On 2026-10-16, before execution, connect `input` to new API
`io:apri-lettura-nella-directory`. Each read-only capability opens relative to
fixture's already owned directory FD, with 8 KiB transfer/size budgets.
API returns owned capability and EOF observed on same FD; fixture immediately
registers capability for closure and retains both values.

Canonical CONTROL, decision-log, and old-ACTIVE reads receive that EOF and
same-sized scratch. No longer derive size from image opened separately by pathname.
`file-image` remains independent for preexisting-byte comparisons and other C4
operations. In this extension, preparation/output, probe-based selection between
temporary/definitive names, and orchestration remain fixture responsibilities.
Inventory and ID proposal use product as below; eight-proposed-ID limit remains
a separate C4 budget.

Same 16 positive/two negative scenarios, 71 processes, 26 intentional SIGKILLs,
constant expected results, and byte oracles. Extension exercises product relative
open/EOF; introduces neither capability bundle, physical reconciliation, nor recovery
coordinator. I/O API contract/verification remain distinct from C4 composition tests.

<a id="collegamento-alla-directory-posseduta--2026-10-16"></a>

## Connection to owned directory — 2026-10-16

Fixture adopts canonical names of sixteen lowercase hex digits followed by
`.seg`/`.seg.tmp`. ID selection now directly uses
`scegli-id-segmento-recovery-directory` on owned parent, with one enumeration to
EOF, without building a C4 inventory by probing eight IDs.
Explicit limits: 16 segment names, eight live segments, 64 total names,
8,192 total name bytes, 255 bytes per name. Eight-proposed-ID limit remains
separate fixture check. Scenarios, processes, crashes, and oracles remain
preregistered; no plan action executed. Real collection also checks other process
names, ignored by storage parser but included in budgets.

<a id="verifica-della-composizione-delle-due-integrazioni"></a>

## Verification of both integrations' composition

Before new execution, root and separate reviewer read composition with `main`
at `110e79f1`: opening/EOF and name collection use same owned parent with canonical
names and independent budgets. I/O code unchanged from S1; fixture composition changes.
Freeze merge and run `make test lint trace links` with fresh ASDF cache.
Original record remains distinct from full S1 and CI; do not promote this check
to a new full `make check`.

<a id="creazione-relativa-dei-temporanei--2026-10-17"></a>

## Relative temporary-file creation — 2026-10-17

Before execution, connect `output` to `io:crea-temporaneo-nella-directory`:
receives fixture's already owned parent and `.tmp` leaf only, with same 8 KiB
budgets. Returned append capability immediately registered for cleanup.
CONTROL, decision log, and new segments thus use product exclusive relative creation;
fixture still chooses names and preparation order.

The [contract](../../docs/implementazione/io-creazione-relativa.md) and
[preregistered I/O method](../../docs/implementazione/io-creazione-relativa-metodo.md)
distinguish native tests from injected faults and remain separate from this C4
composition. Same 16 positive/two negative scenarios, 71 processes, 26 intentional
SIGKILLs, constant oracles. No physical reconciliation or general Archivio admission
added: a post-creation error may leave orphan `.tmp` and implies neither removal nor flush.

<a id="conservazione-del-parent-ed-esito-strutturato--2026-10-22"></a>

## Parent preservation and structured outcome — 2026-10-22

Parent collects stdout/stderr at one point in each child's cleanup, including
after timeout, startup error, or process error. After 60-second deadline, attempts
SIGKILL and waits up to five seconds for cleanup; captures observed state/code
before closing handle. Both reads and both emissions attempted independently:
first error remains failure cause without skipping other channel. Each channel
emitted once to parent stdout, then flushed, before oracle assertions and root removal.

Root deleted only after successful scenario completion. Any failure, including
log read/emission, retains root and reports path on stderr with `VERTICAL-ROOT-RETAINED`.
Original files therefore remain available even if parent stdout is unwritable.
Cleanup SIGKILL after timeout is not a successful crash: original error reraised,
run emits no success summary.

Every `run` owns an event list through fresh dynamic binding; special declaration
has no shared global value. Scenario/process IDs are run-local ordinals.
Process event records scenario, format, phase, mode, observed state/code, assertion
outcome. Scenario records completion after successful cleanup. Events retain
preregistered sequence's deterministic order. Four cases remain directly callable
from CI catalog: each creates temporary context if `run`'s dynamic one is absent,
and releases it on return. These entries accumulate no cross-call events and emit
no aggregate summary, which belongs to full `run` entry
(dedicated driver `tools/vertical-crash.lisp --self-test`).

Only at end of successful run does parent emit one readable Lisp form on one line,
with this structure (lists abbreviated here):

```lisp
(:VERTICAL-SUMMARY :SCHEMA-VERSION 1 :RESULT :PASS
 :COUNTS (:SCENARIOS 18 :POSITIVE-SCENARIOS 16 :PROCESSES 71 :CRASHES 26 :NEGATIVES 2)
 :SCENARIOS (...) :PROCESSES (...) :CRASHES (...) :NEGATIVES (...))
```

`:SCENARIOS` and `:PROCESSES` contain events; `:CRASHES` and `:NEGATIVES` contain
corresponding process IDs. Counts derived from recorded events and compared with
18 scenarios (16 positive/two negative), 71 processes, 26 observed SIGKILL terminations,
and two negative-mode exits 1, after checking existing typed markers.
Any deviation prevents `:PASS` summary. Form contains no random roots, PIDs,
durations, or child logs; original diagnostics retain variable data, not duplicated
in summary.

Freeze concerns only parent and this method: no new execution claimed.
V1/v2 workloads, expectations, C4 coverage unchanged. Preservation is diagnostic
for parent process and temporaries; it proves neither power-loss resistance,
parent termination safety, nor filesystem-fault tolerance. If SIGKILL or cleanup
wait fails, retained root does not certify child termination. C4 limits of one
serial Serie, ordinary records, and empty decision log remain: this change qualifies
neither general product startup/recovery/admission nor Unix server PUT/GET path.
