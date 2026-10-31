<a id="get-isolamento-dei-costi-e-crescita-dellinsieme-di-lavoro"></a>

# GET: isolating costs and growing the working set

C4 preregistration of 2026-10-23, before measurements with
[get-cost-bench.lisp](../../tools/get-cost-bench.lisp). It complements the
[current GET benchmark](get-performance-metodo.md), which includes the oracle,
sentinels, and cleanup in measured time. It changes neither product code,
formats, CRCs, concurrency contract, nor qualification criteria.

<a id="domande-e-perimetro"></a>

## Questions and scope

1. What do CRC, PUT verification, two copies, and oracle cost separately?
2. How much does real lookup change from eight hot keys to a
   whole-index distribution, with cardinality unchanged?
3. How much does XXH64 calculation add over precalculated digests?

The product CRC is already slicing-by-8; copies use `replace` on specialized
u8 arrays. CRC is not assumed to be the bottleneck.
Reader scaling without a writer demonstrates neither lock-freedom, no
contention, performance under mutation, nor latency bounds. No comparison
with theoretical memcpy/hardware CRC throughput is used as a measurement.

<a id="campagna-dei-byte"></a>

## Byte campaign

Values 16, 256, 4096 B, keys 16 B, nonprepared v2 PUT, CSN 7.
Per size: five replicates, 1024 warmup, 65,536 operations.
Fixed order by size, case, replicate; no discarded replicate.

| Case | Work inside window |
|---|---|
| `:crc-body` | Key + value CRC32C; expected-checksum check |
| `:record-verify` | `verifica-put-parole`, including header/body CRCs, frame, key, CSN |
| `:two-copies` | Record → scratch, value → output, via `replace` |
| `:oracle` | Fill sentinels, correct output already present, compare all bytes and sum |
| `:copy-verify-copy` | Previous copies with PUT verification between them |
| `:copy-verify-copy-oracle` | Fill, previous pipeline, output comparison/sum |

In `:oracle`, the fill uses a separate buffer: it isolates the same
sentinel-write volume without destroying the output to be verified.
Pipelines are in-memory microbenchmarks, not full GETs: they exclude
index, EBR, resolver, cache seqlock, per-GET clock, syscalls, GET cleanup.
Buffers are hot/reused; they do not represent sustained DRAM bandwidth.
Times are not summed/subtracted for causal attribution of GET costs.
Bytes/s is expressed in value bytes, not total physical traffic.

<a id="campagna-dellindice"></a>

## Index campaign

Fixed cardinalities: 1,024, 65,536, 1,048,576, 4,194,304. Per-fragment
capacity `min(8192, 2N)`, full directory with distinct fragments and average
50% load. Empty splits are published through real APIs before inserts;
the dynamic split policy is not measured. No writer during reads.
16 B binary keys: unique ID in first eight, present/absent domain
in final eight. Real XXH64 digests, fixed seed high `#x01234567`, low
`#x89abcdef`. Keys/digests are in contiguous specialized arrays.

Each size has five replicates for four cases:

- `:hot-eight`: only eight present keys, in full index.
- `:uniform-hit`: present across full corpus, precalculated digests.
- `:uniform-miss`: absent across full corpus, precalculated digests.
- `:hash-uniform-hit`: like uniform-hit, including key XXH64.

Each replicate: 4096 warmup, `max(262144, N)` measured attempts. Modulo-N
LCG cursor (`1664525*x + 1013904223`, seed 17) has period N for these
powers of two. The uniform path thus visits every key at least once
per window; neither IID sequence nor Zipf distribution.
CPU caches are not cleared: the campaign measures a reused working set of changing
size. No attribution of every access to DRAM without hardware counters.

Every attempt checks state and, on successful hits, index-independent
CSN/location. `:retry-limit` is neither retried nor confused with
success: the report retains a separate count. Before/after windows,
all present keys and five returned fields are checked,
including arena-key comparison through real lookup.

Calculated index payload: `F * (41*C + 16*C) + 8*F`; corpus and four
digest arrays add `48*N` B. Array accounting, not RSS:
excludes headers, structures, old roots/garbage, runtime, compiler.
The driver rejects fixtures exceeding 1 GiB before building. The command uses
4096 MiB dynamic space on host with 16 GiB physical RAM. `/usr/bin/time -l` records
whole-process peak RSS, distinct from windows/payloads.
Neither a 100-million cardinality nor a beyond-RAM index is tested.

<a id="integrità-della-misura"></a>

## Measurement integrity

One main thread; safety 3, speed 2 (speed 3 for loop
counter). Full GC before warmup, outside measurement. SBCL monotonic ticks and
global `get-bytes-consed` before/after; preallocated completions/sinks.
No performance threshold or baseline subtraction. Zero ticks
produces NIL rate. Self-check: standard CRC vector and independent bitwise
oracle, all components, hit/miss/hash/payload, corrupt-CRC and
altered-result detection, a positive control with a live 4 MiB
array and zero control. Windows, including incomplete ones, are persisted
before propagating failure. The report is written/reread with READ-EVAL NIL.

CLI `--self-test`, `--bytes`, `--index`, `--negative-fixture`, plus required
new directory. Overall timeout 900 s, window 60 s. An error
produces a failed report, message with file and COD-61, exit 1; the negative
option intentionally changes the expected CRC, separate from results.
Both performance commands first run a bounded self-check.

```sh
sbcl --script tools/record-command.lisp -- sbcl --dynamic-space-size 4096 --noinform --no-userinit --no-sysinit --script tools/get-cost-bench.lisp --self-test spikes/out/get-cost-self-test-01/
sbcl --script tools/record-command.lisp -- sbcl --dynamic-space-size 4096 --noinform --no-userinit --no-sysinit --script tools/get-cost-bench.lisp --negative-fixture spikes/out/get-cost-negative-01/
sbcl --script tools/record-command.lisp -- /usr/bin/time -l sbcl --dynamic-space-size 4096 --noinform --no-userinit --no-sysinit --script tools/get-cost-bench.lisp --bytes spikes/out/get-cost-bytes-01/
sbcl --script tools/record-command.lisp -- /usr/bin/time -l sbcl --dynamic-space-size 4096 --noinform --no-userinit --no-sysinit --script tools/get-cost-bench.lisp --index spikes/out/get-cost-index-01/
```

Sources must be stable in the external record. Failures and corrected
versions remain preserved. Author's two readings are not
independent review. Next product step depends on results,
without disabling checks or implicitly changing guarantees.
