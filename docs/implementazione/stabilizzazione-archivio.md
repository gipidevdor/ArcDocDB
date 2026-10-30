<a id="completamento-dei-nomi-dellintero-archivio"></a>

# Completing names across the entire Archivio

`recovery.bootstrap:stabilizza-nomi-archivio-recuperato` connects the
[Archivio gate](recovery-archivio.md) to [Serie completion](stabilizzazione-serie.md).
The [preregistered method](stabilizzazione-archivio-metodo.md) precedes code;
SGA-D01…D08 remain decisions to qualify.

<a id="contratto"></a>

## Contract

```lisp
(arcdocdb.recovery.bootstrap:stabilizza-nomi-archivio-recuperato
 set decisions directories source-sets active closed
 :max-segmenti-serie 65536 :max-segmenti-totali 1048576)
;; Three values: reconfirmed CSN plan, renamed count, already-final count.
```

`set` is the complete catalog set, including Registri, and `decisions`
is the canonical replay of the same Archivio object. The four simple-vectors
parallel the set's views: directory, owned read-only set, recovered ACTIVE,
complete CLOSED vector ordered by u64 ID. `active` and `closed` may come
from `leggi-archivio-recuperato`. The complete catalog remains attested by
the caller; the API does not discover omitted Serie.

The caller keeps CONTROL, replay, sets, FDs, vectors, and namespace exclusive
and stable throughout the operation in the I/O pool. Directories correspond
to their Serie, without concurrent mutators or close; name checks link them
to the same FDs as already verified tokens. Ownership is not transferred,
no source is reopened, and no writer is created.

<a id="tutti-i-controlli-prima-degli-effetti"></a>

## All checks before effects

| Step | Check |
|---|---|
| Shape and capacity | Same Archivio EQ, four simple-vectors of exact length, row types, manifest/source counts, and local/global budgets |
| Source metadata | All Serie guards: u64 order, unique ACTIVE, aligned CLOSED, CONTROL EQ, same FD, ACTIVE EOF, and CLOSED P |
| Canonical Archivio gate | Exact view and replay origin, complete CLOSED, maximum of all Serie and all DECISION records |
| Names of all Serie | Name/FD, exactly one form present, backend and exclusive rename when required |
| Completion | Catalog order, existing Serie API, complete counts, and parent fsync per source |

The previous scalar CSN plan does not attest to current vectors: it retains
no tokens or FDs. The gate is therefore recreated using exactly the results
to be completed; plan and counts remain private until success. Plan statistics
must match the Serie and segment counts admitted before scans. Before returning,
the sum of the two counts must equal the segments and the decision FD must
still be open.

An invalid source or inconsistent name in the last Serie precedes all
renames and fsyncs. The gate and preflights do not reread segment bytes.
Per-Serie completion repeats metadata and name checks; the per-source
primitive repeats identity and postcondition. Global preflight does not
reserve names or protect against external mutators.

<a id="budget-e-costo"></a>

## Budgets and cost

Budgets are `index`, explicit/configurable with the defaults shown.
Zero is valid and rejects a nonempty canonical Archivio. The per-Serie
limit includes ACTIVE and all CLOSED; the total limit sums segments across
all Serie. Sum and cardinalities are checked before source scans.
Equality at the limit is allowed. The CSN gate has a local limit on CLOSED
only: the new check including ACTIVE is stricter.

Wrong shape, authority, count, or row types produce `invalid-argument`;
exceeded budgets produce `resource-exhausted`. Scalar types/ranges use safety3,
guard errors and invariants preserve original conditions. No default is
automatically adapted to load.

New loops are bounded by admitted Serie and segments, with only private
cursors and counts. No new per-source array/hash or plan; the scalar plan
and allocations of existing canonical gates, names, and FFI remain. This
defines neither RSS nor zero heap and measures neither throughput nor latency.
Each source retains its own fsync, even when already final. The sequence
belongs to bootstrap; no new lock/thread/shared state in operational traffic
between Serie.

<a id="guasti-e-lavoro-restante"></a>

## Failures and remaining work

The operation is not atomic across Serie. A failure during completion retains
all already completed sources, including those from previous Serie, and
propagates the original condition without a partial plan or counts, retry,
rollback, or close. The I/O primitive retains its own parent fail-stop;
interruptions between completed calls do not imply pending I/O. The caller
reacquires faulted capabilities and keeps traffic unadmitted until all
recovery is complete.

Removals, new ACTIVE, CONTROL checkpoint, index reconstruction, runtime binding,
CSN registry, and admission remain to be coordinated. This API does not close
the general COD-24 boundary. Compilation, lint, trace, links, and static review
are separate from functional tests, FI, coverage, MC/DC, mutations, filesystem
failures, crashes, and benchmarks: qualification remains open.
