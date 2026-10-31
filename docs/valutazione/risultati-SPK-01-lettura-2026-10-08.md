<a id="spk-01--lettura-in-buffer-2026-10-08"></a>

# SPK-01 — reading into buffers, 2026-10-08

> **Proposal** — Local Phase 0 evidence; experimental Common Lisp kernel,
> not engine qualification. ADR-0043 v1 layout, four words or five
> with an additional final CSN; this fifth word is not the v2 format.

<a id="provenienza-e-contratto"></a>

## Provenance and contract

Isolated checkout from `74f0949`, Apple M4 ARM64, 16 GiB, Darwin 27.0.0,
SBCL 2.6.9. Three agents developed kernel, independent CHECK, and consumer
in disjoint files; parent integrates, profiles, and measures serially. External load
uncontrolled, 1 µs clock, benchmark process heap 4 GiB.

The [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/catalogo.lisp) also preserves
failures, full driver sources, before/after hashes, commands,
original stdout/stderr, and decoded results. Records are schema1 data,
read with `*read-eval*=nil` without loading spike packages.
References: REQ-VAL-001, REQ-AFF-012, REQ-IDX-001, REQ-IDX-007, REQ-BEN-001.
No engine requirement changes status.

`arcdocdb.spk01.lettura-buffer:leggi` receives a private four-word u64
simple-array buffer: CSN, location, length, end-CSN. It returns status and
discarded attempts. Only HIT writes, after seqlock checking and root/generation
rechecking; miss, retry-limit, and synchronous errors preserve the buffer.
At most eight attempts; one writer per index, no new lock or
shared state across Serie. Both paths, direct and with fixture callback,
are expansions of the same algorithm. Both retain `safety 3`.
The destination cannot be shared during the call or atomically
published to another reader. Arbitrary callbacks have no time bound.

The HIT candidate represents the stable seqlock interval; root rechecking
is the acceptance point. A writer can update the slot after
the second sequence read: the payload is not attributed to the state at
the instant of subsequent root rereading. ADR-0050 qualifications
apply. [Kernel method](../../spikes/SPK-01-primary-index/metodo-lettura-buffer.md)
and [integration method](../../spikes/SPK-01-primary-index/metodo-integrazione-lettura-buffer.md).

<a id="profilo-e-diagnosi-del-residuo"></a>

## Profile and diagnosis of residual allocation

The [initial profile](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/profile-before.lisp)
observes 47,960,640 bytes allocated by lookup over one million calls
with a fixed key, or 47.96064 B/op. Key generation and hash in u64 arrays
observe zero. The
[first matrix](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/benchmark.lisp)
completes 80 samples: the buffer variant reduces high-u64 field
allocations but retains 47.604375 B/op in every cell. The result
contradicting the zero-allocation hypothesis remains published.

Generic validator `intero-limitato` constructs `(integer minimo massimo)`
on every call. The
[isolated diagnostic](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/validazione-profilo.lisp)
compares dynamic and static checks on 1,000,000 values 1..8, separate
10,000 warmup, equal sink, and equivalent rejections on five invalid inputs:
dynamic observes **47,960,640 bytes**, static **zero**. This diagnosis
supports attributing residual allocation to the validator on this path.

The buffer kernel therefore uses literal type `(integer 1 8)` and the same
`type-error`, retaining input checks. The comparison core
remains identical. Final comparison concerns the entire variant: buffer,
typed intermediates, expanded probing, and static checking, with `speed 3`
versus core `speed 2`. It does not isolate the API change alone.

<a id="prove-funzionali"></a>

## Functional tests

[Independent method](../../spikes/SPK-01-primary-index/metodo-check-lettura-buffer.md),
[first CHECK](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/check-indipendente.lisp),
and [final CHECK](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/check-finale.lisp).
The launcher always checks both core and buffer; the new suite is
included in `make check`.

| Check | Result |
|---|---:|
| Main cases | 54 |
| Independent map / kernel / baseline comparisons | 2,032 |
| Root/seqlock witnesses and callbacks | 18 |
| Distinct retry budgets, for both widths | 16 |
| Negative checks | 79 |
| Mutants detected with relevant reason | 16 |
| Final asserts / ceiling | 26,227 / 200,000 |

The journal is replayed in full and compared with the expected map;
each width executes 1,024 seeded operations, 576 history events, six splits,
and 18 rebuilds. Bounded search finds seven keys with identical fingerprint and
initial probe, including wrap 15→0; visits 11,870 candidates.
Boundaries: zero, fixnum-max/+1, 2^63, max64, location with two maximum u32s, and
maximum 24-bit length. Output preservation, original callback errors,
and input/budget rejections are checked. Mutants remove
root/seqlock, truncate u64, or write prematurely into the buffer.

Interleavings are synchronous and deterministic; they are not scheduler
stress or a hardware memory-model proof. Final strict compilations
succeed without warnings/style-warnings. An initial SBCL argument-order
error, consumer syntax error, and rejected DEFMACRO redefinition
are also preserved. Final consumer uses local MACROLET.
Four expected CLI rejections are separate from CHECKs: unknown variant,
duplicate option, unrelated matrix option, zero operations.

<a id="matrice-seriale-finale"></a>

## Final serial matrix

[Method](../../spikes/SPK-01-primary-index/metodo-bench-lettura-buffer.md),
[raw data](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/benchmark-finale.lisp),
and [statistics with source](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/statistiche-finali.lisp).

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --bench SPK-01 -- --variant buffer
```

4,096 documents per cell, capacity 8.192, five replicas, 128,000 lookups per
sample, 4,096 warmup per method/cell. Eight cells, 40 pairs, 80 samples,
**10,240,000 measured lookups**, half per method. Order 20 AB / 20 BA.
One immutable index serves both methods in a pair; no writer
during measurement. Queries, oracle, and buffer are prepared before samples.
Full GC before every sample; in-loop GC included. Consumer checks
four fields, hit/miss, retry, and checksum, equal for every pair.

Local medians, times including lookup, oracle, checksum, and guards:

| Words | Fields | Queries | Baseline ns/op | Buffer ns/op | Baseline B/op | Buffer B/op |
|---|---|---|---:|---:|---:|---:|
| 4 | fixnum | hit | 153.16 | 78.09 | 47.60 | 0 |
| 4 | fixnum | hit/miss | 150.28 | 68.70 | 47.60 | 0 |
| 4 | maximum u64 | hit | 171.58 | 79.34 | 111.60 | 0 |
| 4 | maximum u64 | hit/miss | 160.33 | 68.59 | 79.86 | 0 |
| 5 extra-end | fixnum | hit | 153.60 | 78.74 | 47.60 | 0 |
| 5 extra-end | fixnum | hit/miss | 149.36 | 68.43 | 47.60 | 0 |
| 5 extra-end | maximum u64 | hit | 177.30 | 78.75 | 143.86 | 0 |
| 5 extra-end | maximum u64 | hit/miss | 166.08 | 69.23 | 96.24 | 0 |

All **40 buffer samples** observe zero consed bytes, including values
beyond fixnum and misses. Median ratios of individual-pair timings
range from 1.95 to 2.40; intervals and all replicas remain in the
record without claimed statistical significance.

The positive control publishes a u8 array in a global and keeps it live
past measurement: payload 262,144 bytes, primitive-object-size
262.160, consed delta 262.160, observed final content 172. This checks
the sensor without assuming a nonescaped array is heap-allocated.
The counter is process-cumulative; it does not measure RSS. Observed zero
does not guarantee every path, callback, or future compiler configuration.

<a id="valutazione-e-seguito"></a>

## Assessment and follow-up

> **Proposal** — Use this variant as reference for the future typed
> reader: literal types for fixed constraints, u64 retained in arrays/registers,
> private buffer, and publication only after validation. Before engine
> adoption, v2 integration and measurements at its index scale are required.

The dataset is small and memory-resident; it does not measure database GET/s,
P99, I/O latency, WAL, snapshots, MVCC, compaction, beyond-cache/RAM scale,
concurrent writer, Linux, or x86-64. The campaign does not close ADR-0028, the v2
gate, or RSK-02. No foreign dependency, global reader state,
or lower priority for data integrity is introduced.

<a id="verifica-dellintegrazione"></a>

## Integration verification

The [complete record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/verifica-integrazione.lisp)
checks `362f3f3` in a clean checkout with stable sources: compilation
without warnings/style-warnings, 26 foundation tests, 18 storage, 18 I/O,
19 recovery, lint and its self-test, traceability, links, and catalogs.
The [ten-spike campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/spikes-verifica.lisp)
includes original outputs and each process's results, also preserving
dependencies from already integrated I/O and bitmap work. SBCL compiler
informational notes remain in original streams. Verification does not
promote engine requirements based solely on experimental tests.
The [publication rejection](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/verifica-pubblicazione-incompleta.lisp) is preserved:
initial packager did not accept legacy result `:pass` and catalog
referenced a still-missing composite artifact. Corrected packaging retains
original `:ok`/`:pass` outcomes; verification is repeated before push.
The [final repetition](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/verifica-finale.lisp)
succeeds on `0c43f45`, clean checkout and stable sources; the
[ten final processes](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/spikes-verifica-finale.lisp)
are preserved in full. Reader code remains the final matrix's version.
