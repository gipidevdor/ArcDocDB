<a id="prima-lettura-c1-dellautore-sul-diff-integrato"></a>

# Author's first C1 reading of the integrated diff

Reading on 2026-10-09 by agent `/root/segment_header_code`, author
of the radix algorithm. Inspection outcome: no functional defect
identified in the integration bounded here. This addendum completes the
[first candidate reading](decisioni-radix-revisione.md#prima-lettura-c1-dellautore-sul-candidato-preliminare)
without replacing the second independent reading or attesting qualification
of the whole engine.

<a id="contenuti-riletti-e-confini"></a>

## Reread contents and boundaries

The following SHA256 hashes were rechecked after freezing
the 18 tests. They identify contents, not Git commits.

| File | SHA256 |
|---|---|
| [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) | `564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54` |
| [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp) | `be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115` |
| [`tests/recovery/decisions-radix.lisp`](../../tests/recovery/decisions-radix.lisp) | `75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0` |

Comparison with frozen candidate
`5093e1dda2876d3b31fd5a6e9196dc76bec04aa8a61ce933c63de59f73f36505`
shows only the updated opening comment, two constants, and two
added wrappers: the algorithm's eight bodies remain unchanged.
The builder differs from baseline only in the two sorter calls;
the public signature of `ricostruisci-decisioni` and its returned values
remain unchanged. Recovery registrations observed in
[`arcdocdb.asd`](../../arcdocdb.asd) follow the order
`decisions-sort` → `decisions-radix` → `decisions-build`, with
`decisions-radix` among recovery tests. This reading concerns these
registrations, not other concurrent changes to ASD or modules.

`sort-recovery-participants` chooses merge for `count < 1024` and radix
for `count >= 1024`: count is the participant count of an individual
record, not the log total. `sort-recovery-entries` chooses merge
for fewer than 256 entries and radix from 256 inclusive. This cardinality counts
physical DECISIONs, including duplicates, before `collapse-decisions`;
it does not count only unique TXIDs. Both wrappers retain full
types and delegate preconditions and final checks to sorters.

<a id="scelta-misurata-e-rilettura-dei-dati"></a>

## Measured choice and data rereading

The [method](decisioni-radix-metodo.md) and
[results](decisioni-radix-risultati.md) separate ID16/TXID thresholds and
require a radix/merge median ratio of at most 0.90 in all
measured scenarios with `N >= soglia`. The author reread retained plists
from the 100 ms matrix with `*read-eval* = nil`, without `load`
of data or new measurements, and recalculated medians from raw samples.

There are 63 campaigns and 63 selection scenarios. In adopted
suffixes, all calibrations reach 100 ms and all three
samples per algorithm reach at least 50 ms with usability flags:
16 ID16 scenarios from 1,024 elements have ratios
`0,131160..0,857956`; 25 TXID scenarios from 256 entries have ratios
`0,143755..0,759877`. Recalculated ratios match retained
selection within `1e-12`; the recorded process exits zero
with stable source consistency. The insufficient first matrix
remains distinct and retained. These findings concern only local
sorting cost, with allocations and GC included, on the measured
system: they do not qualify P99, zero heap, Linux/x86-64, or the engine.

<a id="lista-di-controllo-c1-sul-percorso-adottato"></a>

## C1 checklist on the adopted path

The checklist follows the twelve points of the
[coding standard](../affidabilita/standard-di-codifica.md).
The [inventory](decisioni-radix-decisioni.md) and
[second reading](decisioni-radix-revisione.md) remain separate
documents; this reading does not anticipate outcomes of final
coverage and mutation campaigns.

| C1 point | Author's integration finding and limit |
|---|---|
| 1. Requirements and ADR | Wrappers cite REQ-TXM-005, REQ-AFF-008, and REQ-VAL-001; the entry wrapper also REQ-TXM-001. Constants cite REQ-BEN-001. Selection follows the measured method and preserves the DECISION contract, locally consistent with ADR-0034/0035. No new TXID/CSN or persistent format constraint. |
| 2. Invariants and tests | Radix sum, prefix, position, consumption, and order checks unchanged. Public tests `public-participant-sort-threshold-boundaries` and `public-entry-sort-threshold-boundaries` exercise both sides and equality of thresholds; test `public-radix-first-physical-conflict-across-groups` checks global physical offset, even if the numerically smaller group is visited first. |
| 3. Errors and handling | Wrappers do not intercept or transform errors. Inconsistent measurements/counts, duplicate participants, and conflicts retain delegated checks; six negative tests also call internal guards for histogram, object, digit, array, and cursors. Runtime type/allocation errors and Serie transition to FAULTED remain external to the sorter. |
| 4. Loops and waits | Dispatch adds only two comparisons and calls. Bounds of 16/8 passes, 256 classes, and N actual elements remain; no new loop or wait. The six readers' finite waits belong to the fixture, not the product worker. |
| 5. Allocations and hot path | Wrapper prepares no additional workspace; selected sorter allocates on the build/open path. Scratch and histogram depend on actual data, not unused budgets; even private count 0/1 may allocate. No zero-heap promise or measurement for queries or runtime. |
| 6. Verified data | DECISION count budget precedes entry allocation; payload and total participant preflight precedes copies. `decode-decisions` passes the wrapper an ID16 copy and absolute offset; the entry wrapper receives the complete private vector before conflict checks and table construction. No partial result published and log buffer unchanged. |
| 7. Compound decisions | Diff adds two simple count `if` forms, without new compound Boolean predicates. Boundaries are 1023/1024/1025 and 255/256/257; the threshold itself uses radix. Algorithm compound guards remain those inventoried. Raw coverage and final C1 criteria require reports on the adopted diff. |
| 8. Owner and sharing | Wrappers retain construction ownership and export no vectors. Sorters reorder private copies only; entries and public table retain read-only fields. Boundary tests also compare log before/after; concurrent test queries an already complete table after overwriting the original log. |
| 9. Trace, compilation, lint, and check | Both new wrappers have `ftype`, pre/post/error docstrings, REQ, and file `safety 3`; within 60 lines. Reviewer's isolated baseline log reread: marker `decision-tests-complete 43` with the last three public tests green; reviewer reports strict compilation without warnings. Author did not rerun heavy processes. Trace, lint, `make check`, final coverage, and mutants are evidence distinct from this reading. |
| 10. Deviations | No waiver identified in the bounded diff. Thresholds are measured local choices, not format limits; existing budgets and guards remain active. No coverage exclusion or extension of measurements to other systems approved. |
| 11. Parallelism between Serie | No new lock, parking, pool, or shared store per Serie operation: added work concerns owned recovery workspace. Public queries remain scalar with no table writes. Six real readers check responses/ownership, not engine isolation, scheduler, or scalability against INV-P6. |
| 12. Atomicity and removals | Diff introduces no I/O, flush, publication, prepared application, deletion, or durable atomicity point. Scanner and durability protocol retain their contracts without requalification by adaptive sorting. |

<a id="regressioni-pubbliche-e-limiti-della-lettura"></a>

## Public regressions and reading limits

Frozen tests cover versions 1 and 2, absolute offsets beyond u32, and
no log modification. For 1023/1024/1025 participants, they compare
duplicate DECISIONs with the same set in reverse order, over three
patterns; for 255/256/257 entries they use distinct TXIDs and N duplicate records
producing one TXID. The global conflict uses 258 records in three
batches, with the first conflicting record in the maximum TXID group and a
later conflict in group zero; the error is checked twice
on the same stable buffer. Private oracles remain
independent of merge and radix and compare complete bytes and
entry identities.

This reading approves no other module changes or release
qualifications. Final integration tests, raw coverage and mutation
metrics, and their failed attempts must be
retained on the same hashes. Spikes are not promoted to runtime, and
complete recovery application, pool implementation, or scalability
between Serie is not attributed to this work.
