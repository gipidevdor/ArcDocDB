<a id="completamento-dei-nomi-dellarchivio--metodo"></a>

# Completing Archivio names — method

Method preregistered on 2026-10-22 on base `f17535d1`, before code
and diagnostics. Composes existing Archivio gate and Serie completion;
implements ADR-0040 §2–3 without new formats or durable points.

<a id="ingresso-e-autorita"></a>

## Input and authority

`recovery.bootstrap:stabilizza-nomi-archivio-recuperato(set, decisions,
directories, sources, active, closed, :max-segmenti-serie 65536,
:max-segmenti-totali 1048576)` receives complete canonical catalog set,
same decision replay, and four simple-vectors parallel to views.
ACTIVE/CLOSED are canonical-reader results; every directory and set
remains caller-owned. Namespace, FDs, vectors, CONTROL, and replay
exclusive/stable in I/O pool; traffic not admitted, no concurrent close.

Prior CSN plan alone is not accepted as proof of current vectors:
plan is scalar and retains no sources/tokens. Full gate
recreated from results actually used, before effects. Same Archivio,
exact view, and replay origin remain EQ comparisons.

<a id="ordine-dei-passaggi"></a>

## Step order

1. Authority, shape/lengths of four vectors, and row types;
   minimum ACTIVE count within budget. Per-Serie cardinality and segment
   sum before source scans, without new containers.
2. All per-Serie metadata, reusing existing guards on u64 order,
   ACTIVE, CLOSED consumption, CONTROL, ID/FD/EOF/P. Canonical Archivio gate
   reconfirms views, replay, and complete CLOSED set; private plan only.
3. Name I/O preflight of every Serie, in catalog order.
   No rename or fsync before last successful preflight.
4. Per-Serie completion reusing existing API; aggregate counts,
   sum equal to admitted segments, and decision log still open.
   Only success returns plan, renamed count, and already-final count.

`index` budgets, zero valid as a limit rejecting nonempty Archivio.
Per-Serie limit includes ACTIVE, total includes all Serie.
CSN gate counts its own local CLOSED limit; local check
including ACTIVE is stricter and precedes gate. No byte scan or
reopening; name observation and scalar guard repeated
before use. Preflight is not namespace reservation.

<a id="guasti-costo-e-limiti"></a>

## Faults, cost, and limits

Group is not atomic. Error during completion preserves all
already completed sources, including earlier Serie, and propagates original
condition without partial result, rollback, retry, or close. I/O primitive's
parent retains fail-stop. Coordinator keeps admission
closed until full recovery; general COD-24 remains open.

New loops bounded by count and budgets. No per-source array/hash/plan
added: private cursors and counts, existing scalar plan and canonical
gates. Names, runtime, and existing gates may allocate; no RSS
or zero-heap promise. Bootstrap sequence, no new locks/threads/shared
state between Serie. Removals, new ACTIVE, checkpoint, indexes, runtime binding,
operational CSN, and admission not completed by this API.

<a id="decisioni-da-qualificare"></a>

## Decisions to qualify

| ID | Boundary |
|---|---|
| SGA-D01 | Same EQ Archivio, four simple vectors, lengths, and row types |
| SGA-D02 | Minimum and per-Serie/total budgets, zero, equality, and minus one |
| SGA-D03 | Count and sum before metadata; invalid final row without effects |
| SGA-D04 | Aligned tokens and sources, canonical view, exact replay, full CLOSED gate |
| SGA-D05 | All name preflights before first rename/fsync |
| SGA-D06 | Catalog order, temporary/final mix, per-source fsync |
| SGA-D07 | Complete plan/count; summed counts, decisions FD still open |
| SGA-D08 | Fault/interruption, earlier effects preserved, original cause |

Code committed and sources frozen before processes; two author readings
and independent review, agent closed. Forced compilation
of product only with fatal warnings and private hierarchical cache, lint, trace,
links, and compiled-code reading. Recorded diagnostics including failures;
compact lossless copies and common collection with four workers, verified
closed inventory. Staging reports with `.source` suffix.
No functional tests, FI, coverage, mutations, or benchmarks added
or run. SGA-D01…D08, C1/MC/DC, and file-system/crash behavior remain to qualify.
