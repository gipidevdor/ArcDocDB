<a id="spk-07--metodo-compaction-con-writer-active"></a>

# SPK-07 — Compaction method with an ACTIVE writer

Method registered before compilation and the check, 2026-10-08.
Scope: a Common Lisp/SBCL logical model only, with `safety 3`, in package
`arcdocdb.spk07.compaction`, exporting `CHECK`. The SPK-07 core is loaded
before the module; only `explore` and `require-outcome` are reused.

<a id="domanda-e-criterio-di-esito"></a>

## Question and outcome criteria

Do CLEAN and copying nonadjacent CLOSED sources preserve the value at the
snapshot CSN and the latest committed value while the writer commits in ACTIVE?
The positive check must exhaust every finite graph without violations or
reaching the limit. Each of the four mutants must produce the expected
violation with a nonempty witness: unconditional repoint, discarded tombstone,
lost snapshot version, and reclamation while pinned.
`CHECK` returns a plist with `:status :ok` only after these checks,
including actual counts, positive/negative reports, assumptions, and limits.

<a id="modello-e-oracle"></a>

## Model and oracle

Deterministic workloads with one or two keys, four CLOSED segments,
single CLEAN sources or a nonadjacent pair, older external records,
a separate ACTIVE segment, and one already registered snapshot. The model
enumerates PUT/DELETE in CLOSED, ACTIVE updates/DELETE/recreations, and two
ways to resolve committed prepared records: local OUTCOME and an outcome in
the manifest closure (ADR-0041). Aborted prepared records and SEAL/OUTCOME
metadata must not enter the output; committed records are copied as ordinary records.

Copying advances one record at a time; the writer advances through atomic
durable, published commits. These two sequences interleave with tmp sync,
syncdir, EDIT, rename, per-key repoint, pin release, and reclamation. EDIT is
one durable fact: before it, recovery uses the sources; after it, recovery
completes the output. Sources are immutable; reclamation deletes only removed
segments, after completion and relocations, with the pin released. The pin is
a contract boolean, without an implementation of epochs or snapshot expiration.

The writer's repoint changes only entries still on the sources and with the
same CSN as the copy; a newer ACTIVE entry remains intact.
Versions retained for the snapshot are relocated separately.
A tombstone is retained if retained versions or older external records could
resurface; ACTIVE does not justify discarding it.
The existence filter is exact or conservatively “maybe,” never producing
false negatives (ADR-0042).

The oracle uses an immutable committed history and the prefix of ACTIVE
commits, without calling the model's selection, repoint, or rebuild routines.
It compares values and CSNs after every state/interleaving. Crash and
reconciliation are also checked from every state, rebuilding solely from
sources permitted by the manifest and the durable ACTIVE prefix; latest and
historical values at CSNsnapshot are compared, and recovery idempotence is
checked. A snapshot does not survive a real restart (ADR-0040): the historical
value remains an oracle query over retained records, rather than a new
decision about snapshot persistence.

<a id="confini-e-conflitti-dichiarati"></a>

## Declared boundaries and conflicts

References read: ADR-0040/0041/0042 and INV-C1…C11. The specification's MERGE
policy excludes segments needed by active snapshots. The requested nonadjacent
pair with a snapshot checks the copy protocol and version preservation under
abstract admission: it does **not** prove or change the MERGE policy,
INV-C5/C6, stability, or low load.
No changes to decisions or the global SPK-07 gate.

Assumptions: sequentially consistent memory; atomic transitions; totally
ordered CSNs, one record per key and CSN; self-contained CLOSED segments and
ACTIVE CSNs greater than CLOSED CSNs; atomic durable/published ACTIVE commits;
snapshot and source selection fixed before copying; conservative retention of
selected versions even after release. The check covers safety and bounded
completability, without engine fairness or liveness. No real filesystem,
bytes/CRC, I/O errors, weak memory, decoder, benchmark, epoch internals, or
snapshot expiration.

<a id="esecuzione-e-registrazione"></a>

## Execution and recording

Every compile/check attempt produces a new file under
`spikes/SPK-07-protocols/out/`, without overwriting earlier evidence.
The schema 1 Common Lisp data record preserves exact argv and stdin,
SBCL/OS/CPU/RAM/heap environment, timings, before/after content blobs,
outcome/exit code, result, limits, raw stdout/stderr, and failures.
No Git commands: blobs are identified by content digests, and Git history is
not queried. Warnings/style-warnings, compilation errors, exhausted budgets,
and malformed output also fail the attempt and are recorded. Compiled files
are confined to the same out directory.

Separate compilation of the existing core and module treats every warning
(including style-warning) as fatal, and checks the warnings-p and failure-p
values from `compile-file`. A short check uses an explicit per-graph limit;
no benchmark or commit.

<a id="risultati-osservati-e-consegna"></a>

## Observed results and delivery

Check run on SBCL 2.6.9, Darwin 27.0.0 ARM64, Apple M4, 16 GiB RAM;
process heap 1,024 MiB. Strict compilation and loading completed,
stderr empty, `CHECK` returned `:status :ok`. No randomness.

| Positive check | Actual count |
|---|---:|
| Graphs exhausted without violations | 98 |
| Distinct states visited | 7,994 |
| Transitions explored | 16,952 |
| Final states with all commits and reclamations completed | 98 |
| Maximum states per graph / limit | 140 / 10,000 |
| Reads from the current index / pinned snapshot | 12,034 / 5,750 |
| Crash projections | 11,592 |
| Recovery prefixes also checked after restart | 46,368 |
| Forward/reverse rebuilds | 92,736 |
| Post-crash comparisons, latest / historical at CSNsnapshot | 139,584 / 139,584 |

The 98 graphs comprise 64 one-key configurations, 32 complementary two-key
configurations, and two cases of safely discarding an isolated tombstone,
with an exact/“maybe” filter. They cover 16 one-key PUT/DELETE combinations
and a declared two-key sample; OUTCOME/manifest resolution and exact/“maybe”
filters alternate across workloads, without exhausting their Cartesian
product. Crash projections enumerate tmp/final names and possible persistence
of already deleted sources; they are not filesystem crashes. Every projection
has four recovery prefixes, including start and end, and two rebuild orders,
rather than all permutations.

Negative checks: four mutants for each key cardinality, yielding eight specific
counterexamples with nonempty paths. BFS discovers 568 states and visits 510
before the violations (1,165 transitions).

| Mutant | One-key counterexample |
|---|---|
| Unconditional repoint | ACTIVE commit CSN 5 is overwritten by the CLOSED copy at CSN 4. |
| Discarded tombstone | After EDIT, external PUT CSN 3 resurfaces, previously hidden by DELETE CSN 4. |
| Lost snapshot version | After EDIT, snapshot CSN 2 returns PUT CSN 1 instead of CSN 2. |
| Reclamation while pinned | Sources are deleted with the reference still active, after completion. |

All attempts are also collected in the single schema 1 record
[`spk07-compaction-campaign.lisp`](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-compaction-campaign.lisp),
which embeds the individual records in full, including command/stdin,
environment, blob contents and digests, result, limits, and raw output.
The `:git-blob` digests are SHA-1 of `blob <length> NUL <content>`,
computed without invoking Git; the content SHA-256 is also retained.

Four initial failures are preserved: one wrapper failure (nonexistent UIOP
symbol, before compile/check started), and three module compilation failures
(missing parenthesis, unsupported LOOP clause, extra parenthesis). The first
record is reconstructed from the raw log and declares
`:source-blobs-before :not-captured`; it does not invent missing provenance.
These are followed by the successful check and the final compilation/check
after the Italian revision of comments and docstrings. Sources are compared
before/after every attempt managed by the wrapper.

The delivery covers `compaction.lisp`, this method, and new artifacts with
the `compaction-` prefix under `out/`. `run-module.lisp` is intended for later
integration and is neither modified nor used by these checks. The module is
verified by loading the core before its FASL. The global gate remains open,
with the limits declared above and the MERGE admission conflict made explicit;
no decision is promoted or changed.
