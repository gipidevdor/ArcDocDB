<a id="risultati-del-contesto-worker-dei-writer"></a>

# Writer worker context results

Campaigns on 2026-10-09 against base `cf60913`, with sources frozen after
the first C1 reading. Contract in [writer-worker](writer-worker.md),
[preregistered method](writer-worker-metodo.md),
[complete inventory](writer-worker-decisioni.md), and
[retained data catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker/catalogo.lisp).
Qualifications concern this local composition, not the complete pool.

<a id="correttezza-e-integrazione"></a>

## Correctness and integration

Process `4000547204-command-93189-0` ends OK/STABLE/exit0:
387 tests plus smoke, compilation without warning or style-warning, lint
on 63 files with zero violations, traceability of 114 requirements/65
invariants/13 FI scenarios/52 ADRs without errors, 221 documents and 2007
links without breaks, retention self-tests, evidence verification, and ten
spikes. The [complete record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker/check-finale-processo.lisp)
also retains intentional rejections from negative tool fixtures.

There are 89 execution tests, 23 new. The independent list oracle runs
8000 steps over eight combinations K1/4, ready capacity1/2, and quantum1/2,
13 writers, final drain, and accepted/delivered payload equality.
Fixtures check cumulative quotas, FIFO, buffers/sentinels, home/cursor,
stale ack, busy with snapshot, finishing latch, room/full recycling,
adoption/handoff without active leases, overflow without wrap, and persistent
faults. The not-ready regression retains the original condition and prevents
the old context from consuming a new wave.

One test reuses four threads over six waves, with live producers and 36
CRC-checked payloads, verifying progress on one shard while another is busy.
Another reuses two competing owner contexts over eight waves, with only
one winner per obligation. These tests do not attest to fairness, wake/park,
shutdown, or lease migration between threads.

<a id="integrazione-della-base-aggiornata"></a>

## Updated base integration

After these campaigns, the primary integrates recovery inventory in `e2f7a75`.
Separate check `4000548048-command-40192-0` is OK/STABLE/exit0:
400 tests plus smoke (execution89, recovery95), lint66/zero, traceability
114/65/13/52 without errors, 224 documents/2017 links without breaks, and
ten spikes. The [integrated record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker/check-integrazione-processo.lisp)
and [its spike catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-integration/catalogo.lisp)
retain the new gate. Scope `4000548017-command-37007-0` compares execution,
test, and worker tool bytes with the qualified copy: unchanged; ASDF and
index also incorporate inventory. Completed worker campaigns are not rerun
for changes in independent recovery. Both masters retain their original
descriptors/payloads in distinct directories, avoiding gzip name collisions.
Final documents are checked separately from frozen-source compilation.

<a id="mutazioni-e-qualità-degli-strumenti"></a>

## Mutations and tool quality

Both C4 tools are compiled in full with COMPILE-FILE and self-tests run
from FASLs, with fatal warnings: `4000547221-command-94073-0` and
`4000547221-command-94074-0`, both OK/STABLE/exit0. The retained adapter
has an inherited editorial final marker `RECYCLE-TOOL-STRICT-SELF-TEST-PASS`;
argv, compiled source, and results explicitly identify worker.

The [mutation campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker/mutazioni-dati.lisp)
`4000547268-command-97067-0` completes the 89-test baseline and detects
12/12 preregistered mutants. Every mutant has exit1, NIL signal, and a real
test start marker; zero survived, compilation-failure, before-tests, or
worker-error. All thirteen logs are retained with exact targets.

The [review probe catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-review/catalogo.lisp)
separately retains the large original process record, with original gzip
payload. Complete audit and compact projection are both retained; initial
projection adapter failure is declared in the inventory and not attributed
to the product.

The separate OS fixture uses real SIGKILL: signal9/exit137, worker-error
classification, and detected0. Authentic completion followed by nonzero exit,
quoted markers, warning/compilation failure, partial reports, and preexisting
destinations are checked by self-tests and not promoted to detection.

<a id="allocazione-del-percorso-composto"></a>

## Composed path allocation

The [allocation campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker/allocazioni-dati.lisp)
`4000547268-command-97066-0` is OK/STABLE/exit0. A context created on the
owner thread, writers, ready ring, and buffers are preallocated. Each cycle
composes enqueue, publish, claim, begin, pop/ack, end, and full/room recycle;
writer identities, count/status/cursor, and persistent generations are
checked. Initial role rotates among C+1 distinct writers per shard.

| Shards K | Capacity C | Calls/cycle | Token | Sink per replica | Complete samples | Observed heap |
|---|---|---|---|---|---|---|
| 1 | 1 | 35 | 578 | 10754048 | 5 × 4096 cycles | 0 bytes |
| 1 | 3 | 49 | 858 | 11900928 | 5 × 4096 cycles | 0 bytes |
| 4 | 1 | 137 | 2520 | 18708480 | 5 × 4096 cycles | 0 bytes |
| 4 | 3 | 193 | 4084 | 25114624 | 5 × 4096 cycles | 0 bytes |

Warmup128 and GC outside measurement; positive control 16777472 allocated
bytes, zero counter baseline, wrong sink rejected, and clockzero distinguished
from valid duration. The method formula is recalculated against driver
operations. All raw times and samples remain in data; uncontrolled external
load, no promise of speedup, throughput, P99, or universal heapzero.
Startup and errors are outside the measured normal path. The composed
benchmark uses one worker; functional parallelism is verified by real-thread
fixtures, not a scalability measurement.

<a id="copertura-e-limiti"></a>

## Coverage and limits

Coverage `4000547204-command-93188-0`, export
`4000547249-command-95826-0`, independent native/HTML/export audit
`4000547296-command-98426-0`: 1427/1660 expressions and 199/230 outcomes
across all eleven execution files. Four new files have 498/600 expressions
and 65/76 outcomes. The 233 unmarked expressions and 31 alternatives,
including legacy ones, remain in denominator and inventory. No approved
exclusion or MC/DC inferred from sb-cover; engine C1 gate remains open.

Local faulted boundary is terminal and diagnostic: it does not yet implement
the Serie FAULTED controller or resource release after fault. Ack attests to
the caller, without checking external WAL effects. Full chains remain on
the same shard; global quotas, admission, adaptive pool, wakeup/park/shutdown,
and durable integration remain subsequent work. Empty is only a local
observation. Initial probe `4000545928-command-51771-0` is retained as
development before final code and is not used to qualify it.

<a id="conservazione-finale-delle-evidenze"></a>

## Final evidence retention

The first publication adapter (`4000548817-command-74667-0`) rejected an
identical copy: it compared reread objects containing uninterned symbols
with EQUALP. Corrected comparison checks original and decompressed bytes,
SHA256, and Git blob, with validated reading and without overwrite.
Separate audit `4000549512-command-14958-0` retains fourteen positive/negative
fixtures and comparison of 46 canonical copies, all passed. Audit final
marker prints an incorrect cosmetic count; report contains fifteen results,
verified by `4000549715-command-34672-0`. Initial audit attempt
`4000549424-command-9085-0` is also retained, stopped by the relative payload
path during fixture preparation, without involving worker code.

Resumption `4000549781-command-39344-0` completes 69 pairs and five bundles,
then exhausts the reader's default heap limit during the integrated catalog.
Already valid copies remain original. Only closure uses a 4096 MiB heap
limit and rechecks existing files. These attempts concern retention; their
reports and adapters remain in catalogs and do not qualify product correctness.

<a id="verifica-della-consegna-con-il-codec-aggiornato"></a>

## Delivery verification with updated codec

Final base `e07d772` incorporates minimal CBOR header checking published by
another chat. Frozen integration runs only one new full check,
`4000550386-command-90070-0`: OK/STABLE/exit0, 415 tests plus smoke across
eleven suites, no warning/style-warning, lint68/zero, traceability114/65/13/52
without errors, 232 documents/2044 links without breaks, evidence self-tests,
and ten spikes. Execution, test, and worker tool bytes remain those of
qualified campaigns; ASDF and index retain both workers and the primary's
recovery and CBOR additions.

The [final integrated record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker/check-consegna-processo.lisp)
and [its spike catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-final-integration/catalogo.lisp)
retain originals. Private compilation cache and 4096 MiB heap limit are
explicit in argv; this limit concerns verification/retention processes.
The new gate does not extend worker measurement promises to throughput,
latency, or scalability. Delivery retains all previous campaigns and
separately closes final links and catalogs.

Final read-only projection retains attempt
`4000550586-command-9874-0`, rejected by an adapter assertion accepting only
OK marker. SPK-07 uses PASS marker, with exit0 and stable sources. Corrected
projection `4000550696-command-14941-0` verifies actual results and ends
OK/STABLE/exit0; full check was not repeated and no product source changed.

C1 addendum `4000550907-command-25363-0` is OK/STABLE/exit0:
twenty execution/test/tool files identical, 3517 upstream blobs retained,
ASDF and index with worker insertions only, 101 historical copies intact.
The three previous readers are retained: macOS var/private-var alias,
WT document advanced relative to historical copy, and difference between
argv make check and actual env/make check-core. Corrections concern the
reader; they are not new product tests and do not alter original data.
Delivery is on branch `codex/writer-worker` with qualified base `e07d772`;
the primary continues independently with other chats' changes.
Subsequent [common base integration](writer-worker-integrazione.md)
retains full check on `edb043b` and keeps original campaign and updated
assembly scopes distinct.

Final retention attempt `4000551045-command-31231-0` is preserved:
a driver helper had not been loaded. Resumption defines only the flat-name
resolver and verifies existing copies without overwriting them; it modifies
neither worker code nor campaign results.
