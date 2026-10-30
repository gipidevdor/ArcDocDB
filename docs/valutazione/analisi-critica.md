<a id="analisi-critica"></a>

# Critical analysis

> Preliminary assessment. See the [caveats](README.md).

<a id="punti-di-forza"></a>

## Strengths

| # | Choice | Why it holds up |
|---|---|---|
| F1 | Immutable segments + copy-on-write compaction | Compaction crash safety is structural: until the swap, the system does not depend on output, and sources are never touched. Intermediate states are few and recognizable. |
| F2 | Physically independent Serie | Workload isolation, parallel per-Serie recovery, no shared log on the ordinary write path. |
| F3 | One logical writer per Serie | Eliminates per-document locks: version checking and application are atomic by construction (INV-T2). The Serie has a total order of changes. |
| F4 | Separate CLEAN and MERGE | Space recovery (necessary) is not coupled to defragmentation (optional). Avoids cascading compaction typical of leveled systems. |
| F5 | Opportunistic MERGE | Structural maintenance does not compete with traffic: it favors P99 predictability, a stated goal. |
| F6 | Derived metadata | Incorrect counters cannot cause data loss; a single set of sources of truth (WAL, data, index). |
| F7 | Decision log separate from data | Single-Serie transactions pay nothing for multiseries transactions' existence. |
| F8 | Discipline about numbers | Targets declared as hypotheses, comparisons only under equal conditions, SIMD only when measured: reduces risk of optimizing the wrong thing. |
| F9 | Fault injection as a requirement | Protocols are designed to be interrupted at every point. |

<a id="tensioni-interne-alla-specifica"></a>

## Internal tensions in the specification

Points where two requirements, taken literally, pull in different directions. These are not errors:
they are places requiring an explicit decision.

<a id="t1--indice-immutabile-per-i-reader-contro-scritture-continue"></a>

### T1 — Immutable index for readers versus continuous writes

The “Index snapshot” section calls for immutable indexes with atomic swap (v17 → v18). The primary
index receives a change on every write, targeting up to millions of operations per
second, and must be compact and contiguous. Building a new version at each
commit is impractical; a persistent structure with structural sharing contradicts the
compactness requirement and burdens GC.

*Proposed interpretation:* the “version + swap” model applies literally to secondary indexes
(base + delta) and bulk replacements; for the primary index the requirement becomes “a
reader never observes an intermediate state.” → QA-24, RSK-02.

<a id="t2--wal-e-segmenti-due-scritture-per-ogni-record"></a>

### T2 — WAL and segments: two writes per record?

Every Serie has a WAL *and* append-only segments. If the complete record goes to both, every byte
is written twice, and the high end of INSERT targets exceeds one device's bandwidth
([estimates](stime-ordine-di-grandezza.md#banda-di-scrittura)). If it goes to only one, the other's role
changes. → QA-02, RSK-03.

<a id="t3--atomic-index-swap-mentre-il-writer-lavora"></a>

### T3 — “Atomic index swap” while the writer is working

During CLEAN, the Serie writer continues receiving writes. A document already copied
to the new segment may be updated before swap: its copy started `LIVE` and has
become `DEAD`. The swap therefore cannot be a blind index replacement.

*Observation:* the copy is identical to the original, and the original stays readable until
`OBSOLETE`; to a reader the two locations are equivalent. Atomicity is truly needed at
only one point — changing the valid segment set — while index entries
can be updated with conditional replacements. This greatly simplifies the problem but must
be verified in a model. → QA-04, QA-24.

<a id="t4--writer-che-non-si-ferma-contro-2pc-che-aspetta"></a>

### T4 — Nonstopping writer versus waiting 2PC

In 2PC, a participant waits for the decision after PREPARE. But the logical writer is the Serie's only
write flow: if it waited, all Serie writes would stop
for the duration of a `multiserie.log` flush, and a Serie involved in many multiseries transactions
would become a bottleneck for others (contrary to INV-P3). The writer must continue,
setting pending changes aside; this introduces one more per-document state. → QA-07.

<a id="t5--serie-indipendenti-contro-snapshot-coerente-di-archivio"></a>

### T5 — Independent Serie versus consistent Archivio snapshot

Serie independence means no common order among their commits. A consistent multiseries
snapshot requires one, at least for multiseries transactions, which must appear
in full or not at all. Any solution introduces a shared Archivio-level element;
the question is how lightweight it is. What two successive simple GETs
on different Serie guarantee while applying a multiseries transaction must also be decided. → QA-06, QA-09.

<a id="t6--merge-vietato-su-segmenti-necessari-a-uno-snapshot"></a>

### T6 — MERGE prohibited on segments needed by a snapshot

MERGE is copy-on-write and sources stay readable until reclaim: from a correctness
perspective it could proceed with active snapshots (as CLEAN does by copying
`SNAPSHOT-LIVE` versions). The specification instead prohibits it. This is prudent and consistent with
MERGE's opportunistic nature, but has a consequence: a long-lived snapshot suspends
defragmentation as well as retaining space. → QA-14, RSK-09.

<a id="t7--merge-solo-a-basso-carico-contro-carico-sostenuto"></a>

### T7 — MERGE only under low load versus sustained load

If the engine never falls below the low-load threshold, MERGE never starts and small
segments accumulate. The specification accepts this (“may remain small
indefinitely”), but the cost of many small segments (open files, metadata, locality)
grows without a declared bound. → QA-12, RSK-08.

<a id="t8--metadata-derivati-contro-regola-dei-50-secondi"></a>

### T8 — Derived metadata versus the 50-second rule

Close time is the reference for 50 s, but metadata are derived and rebuildable.
After rebuilding, the original close time may be unknown. → QA-13.

<a id="t9--registri-è-una-serie-ma-descrive-le-serie"></a>

### T9 — Registri is a Serie, but describes Serie

If the catalog lives in an ordinary Serie, opening it requires the catalog. Embedded
configuration resolves the circularity, but must be decided. → QA-10, RSK-15.

<a id="lacune-di-progetto"></a>

## Design gaps

Aspects the specification does not address and without which the architecture is incomplete.

| Gap | Question |
|---|---|
| Record, document, and `_id` format | QA-01 |
| Index persistence and restart time | QA-03 |
| Durability-level semantics | QA-05 |
| Isolation level | QA-09 |
| Growth of `multiserie.log` | QA-08 |
| Tombstone lifetime | QA-15 |
| Reader tracking | QA-16 |
| Secondary-index consistency | QA-25 |
| Numeric latency objectives; per-Serie or aggregate targets | QA-26 |
| Reference platform | QA-19 |
| Protocol, queries, schema | QA-20, QA-21 |
| Replication, backup, security | QA-23 |

<a id="confronto-con-architetture-note"></a>

## Comparison with known architectures

Useful for knowing which problems others have already encountered, not for establishing
rankings.

| Aspect | ArcDocDB (specification) | Reference model | What it tells us |
|---|---|---|---|
| Append-only log + in-memory key index | yes | Bitcask | Known limits: index must fit in memory; restart requires hint files. → QA-03, RSK-07 |
| Separation of log and values | to decide (QA-02) | WiscKey | Writing values once reduces amplification; costs space management |
| File set as change log | to decide (QA-04) | LSM-tree manifests | Established mechanism for atomic changes to file sets |
| Compaction | Per-segment CLEAN + opportunistic MERGE, without sorting | Leveled LSM-tree | Sorted runs are unnecessary here (index is in RAM): compaction is much simpler and less invasive |
| Atomic multi-partition commit | 2PC with single decision log | Classic 2PC with coordinator | Blocking of PREPARED participants is the known problem. → QA-07 |
| One writer per partition | yes | Single-writer partitioned architectures | No locks, but per-partition ceiling is one core. → RSK-04 |

<a id="che-cosa-cambierebbe-il-giudizio"></a>

## What would change the assessment

The architecture would need revision, not just refinement, if:

- SBCL GC pauses proved incompatible with the P99 objective even with
  indexes and caches outside the managed heap (SPK-02);
- a compact primary index with concurrent readers could not be implemented in Common Lisp alone
  with performance at the required scale (SPK-01);
- protocol modeling showed atomic multiseries visibility and a nonblocking
  writer to be incompatible without heavy global coordination (SPK-07).
