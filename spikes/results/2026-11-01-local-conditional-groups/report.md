# Explicit conditional Unix groups

One synchronous Unix client can now share a strong flush across 1..8 independent
conditional PUT/DELETE operations. Connect with `:conditional-groups t` and call
`client-write-group-if` with existing write descriptors, expected-u64 input,
separate token-u64 and applied-u8 output arrays, and an optional `:count` prefix.
The return value is the applied count. Each output member is either `1/new strong
CSN` or `0/current live CSN` (zero for absence); tails are unchanged.

The whole request requires distinct binary keys and validates before copies or
engine admission. A request drains earlier collected writes. Applicable members
reuse ADR-0086's unchanged internal projection and strong writer; all conflicts
skip writer maintenance/append/flush. Capacity refusal never splits the request.
Every applied record retains an independent SEAL, with a covering strong flush
and FIFO publication before acknowledgment. Incomplete exchanges authorize no
results and never retry automatically. This is not a group transaction.

Opcode 7 is independent of existing flags 4/5/6. All sixteen combinations have
exact independent handshake fixtures, retaining every old/default byte and the
two-value capacity decoder API. Extra cold array payload is 80 bytes per server
connection and eight per client; flag slots and object/array headers are additional.
Descriptor/wire allocations remain in M1. RAM/paged semantics are unchanged.
See [ADR-0087](../../../docs/adr/0087-explicit-conditional-unix-groups.md),
the [preregistered method](method.md) and [review/decision table](review.md).

## Qualification

The [source identity](source-identity.lisp) binds eleven completed final commands
to the same 1,685-file inventory, including focused tests, supplemental boundaries,
full 2.6.9 checks, strict 2.6.10 tests, documentation, CI self-test, both conditional
benchmarks and the GET self-test/two full GET campaigns. The baseline matches
base `6361666` and the preceding increment's 1,676-file qualified inventory.

All 22 new permanent methods passed: six wire, fourteen actor/client and two
process methods. They cover whole-request/whole-response validation, distinct
keys, max-u64 tokens, alias/short-output refusal, ignored tails, mixed/all
conflicts, no split, barriers, deadlines after draining/encoding/decoding,
post-flush resource faults, encoder failure, nonlocal exits, partial I/O and
uncertain replies. Ten supplemental fixed fixtures exercise false opcode/field
decisions, nine members, oversized documents, small client frames and output
ownership. Those fixtures are separate from the permanent method count.

Both complete runtime suites passed without warnings, including 194 engine
tests each. The [qualification summary](qualification.lisp) retains the per-runtime
group crash matrix (36 scenarios, 108 children, 72 SIGKILLs) and the
local process suite (18 methods, 169 children, 50 scenarios, 30 SIGKILLs).
The new process methods contribute eight scenarios, sixteen children and eight
SIGKILLs, already included in those local totals: both formats × resident/paged,
mixed/all-conflict results, exact flush counts, durable current tokens after
restart, and a deliberately lost complete strong reply. A subsequent explicit
application absence probe conflicts; the client does not retry automatically.
Full 2.6.9 `check-core` also completed all eleven spikes and the CI self-test.

Documentation passed: 562 Markdown sources, 1,153 HTML pages, 87,841 local
links/anchors, 54 packages, 697 exports and 634 prose contracts. The public Unix
roundtrip/reopen example passed. These are local Mac checks, not Linux, C1/MC/DC,
concurrent-reader or power-loss qualification.

## Single-client conditional writes

The unchanged driver runs formats 1/2, resident/paged primary storage and widths
1/2/4/8, with five windows of eight logical groups and 128-byte documents per
case: 80 samples, 640 groups and 2,400 mutations per campaign. Baseline performs
individual opcode-6 requests; final sends one explicit opcode-7 group. No cohort
gate or production wait is used. Hashes, every returned CSN/value, all actual
request/member counts and durable flushes are checked before interpretation.

Cells are median window elapsed time divided by operation count, in **ms/op,
before → after on SBCL 2.6.9**. This is amortized group cost, not each RPC's
response latency or a P99.

| Format / primary | Width 1 | Width 2 | Width 4 | Width 8 | Width-8 gain |
| --- | ---: | ---: | ---: | ---: | ---: |
| v1 / resident | 4.340 → 3.966 | 4.047 → 3.729 | 4.264 → 1.046 | 4.295 → 0.489 | 8.78× |
| v1 / paged | 4.174 → 3.889 | 4.070 → 1.985 | 4.476 → 0.958 | 4.840 → 0.540 | 8.96× |
| v2 / resident | 4.222 → 3.782 | 4.257 → 2.068 | 4.564 → 0.929 | 4.268 → 0.488 | 8.75× |
| v2 / paged | 4.468 → 3.734 | 4.334 → 1.934 | 4.070 → 0.974 | 4.552 → 0.565 | 8.06× |

Observed requests and flushes fall from 2,400 each to 640 each. At width eight,
eight flushes become one (87.5% reduction). Width-eight observed gains are
8.06–8.96×, median 8.77× across the four cases. Width-four gains are 4.08–4.91×.
The v1/resident width-two case improves only 1.09× despite its verified single
flush; the other width-two cases improve 2.05–2.24×. It remains in the table.

Width-one throughput ratios are also 1.07–1.20 in the final period without
reducing flush count, indicating material between-period variation. Do not attribute
superlinear gains or the weak width-two result to one cause from these data.
Host load/storage latency are uncontrolled. Exact values and all supplementary
2.6.10 cases are in [metrics.lisp](metrics.lisp). The latter independently checks
another 2,400 mutations/640 flushes and has no old-code 2.6.10 baseline.

## Current 60,000-byte Unix GET measurements

The historical GET driver is byte-identical to base `6361666`, with its Git blob
and SHA-256 checked before/after. Its normal self-test passes. Both full final-source
runs use eight cases, five windows of 1,024 checked warm GETs: 40,960 operations
per run, **81,920 total**, transferring 4,915,200,000 useful serialized document
bytes. Startup, strong seeding and warmup are excluded. Paged cases use the
existing low primary quota and 1,200 seed keys, not a physical-RAM-scale dataset.
The untimed wrapper verifies copied child bytes before fixture removal.

Bandwidth below is `completed operations / actual window seconds × 60,000`,
reported as median window MB/s (decimal), not reciprocal P50. Latency columns
are medians of the five per-window empirical P50/P99 values in microseconds.

| Format / primary / cache | First MB/s | Repeat MB/s | First P50/P99 µs | Repeat P50/P99 µs |
| --- | ---: | ---: | ---: | ---: |
| v1 / resident / zero | 302.34 | 439.04 | 212 / 280 | 132 / 162 |
| v1 / resident / 4 MiB | 288.63 | 429.08 | 214 / 271 | 133 / 172 |
| v1 / paged / zero | 275.50 | 270.74 | 218 / 296 | 220 / 233 |
| v1 / paged / 4 MiB | 286.75 | 397.91 | 217 / 261 | 147 / 226 |
| v2 / resident / zero | 280.70 | 280.05 | 213 / 234 | 215 / 228 |
| v2 / resident / 4 MiB | 290.90 | 281.18 | 209 / 248 | 212 / 223 |
| v2 / paged / zero | 272.85 | 271.12 | 218 / 248 | 220 / 243 |
| v2 / paged / 4 MiB | 430.07 | 277.46 | 134 / 174 | 217 / 229 |

Retain both [first](get-metrics.lisp) and [repeat](get-repeat/get-metrics.lisp)
metrics and complete latency vectors. The fast configuration changes between
runs: the initial 430 MB/s case returns to 277 MB/s on repetition. Observed case
medians span 270.74–439.04 MB/s (258.20–418.70 MiB/s); this is variability to
investigate, not a consistent read improvement caused by conditional groups or
a cache gain. These remain one-client hot reads, not loaded-service tails or
physical disk bandwidth. Client allocation is about 61.55–61.61 MB per 1,024-GET
window; it is not server allocation and does not demonstrate zero allocation.
The [next measurement boundary](next-measurements.md) separates client/server CPU,
allocation, readiness waits, mixed load and maintenance interference.

## Retained evidence and limits

The first GET wrapper self-test failed before any fixture/server creation because
it loaded SBCL CRC VOP definitions twice. Its exact variant and failed command
are retained separately. The corrected wrapper lets the immutable driver own
the sole ASDF load, verifies untimed log copies and restores its temporary hook.
No failed command qualifies a benchmark or product source.

Raw records, child logs, complete samples, hashes and source identities are
retained. Large evidence is compressed losslessly before owned cleanup. No
historical MVCC, group atomicity, exactly-once delivery, complete COD-30/RSS,
reference-platform SLO or power-loss guarantee follows from these campaigns.

The completed [closure](closure.lisp) verifies 173 retained file hashes and
records 78 compactions. All three analyses pass again on compressed evidence;
the [final self-record compaction](tail-compaction.lisp) preserves those outputs
and the closure command. The [cleanup receipt](cleanup.lisp) records removal
of 203,940,076 logical regular-file bytes from fifteen owned generated directories.
This is not a measurement of physical free-space change. The primary checkout,
other chat worktrees and shared Git storage were not cleaned or reset.
