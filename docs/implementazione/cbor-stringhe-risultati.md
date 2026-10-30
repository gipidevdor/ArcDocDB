<a id="verifiche-della-scrittura-delle-stringhe-cbor"></a>

# Verification of CBOR string writing

Campaigns on 2026-10-11 under the [preregistered method](cbor-stringhe-metodo.md),
blob `56342dae95caf8705e0b28b3c0ea7ac86fdd8fa0`. Frozen product
`a2c5c77dd51bff760bff4508e998d94370921eda`; header writer,
UTF-8, and limit dependencies were not modified. The increment concerns one
minimal MT2/3 item, without document composition or durable publication.

The method's “Tests frozen before the product” heading describes the preregistered
plan. The actual chronology is that of the two readings: product
and corpus were developed in parallel; the test author read
the product only after corpus freeze, before the second
reading and any compilation or campaign. The original method remains
preserved without attributing a pre-product freeze to the corpus.

<a id="corpus-e-concorrenza"></a>

## Corpus and concurrency

21 new tests: 20 serial and one with reused real workers. Preliminary
`make test lint trace` passes in 13.692469 s: 681 nominal tests and two smokes,
without warnings or style-warnings, lint on 125 files without violations,
116 requirements/65 invariants/13 FI scenarios/52 ADRs without errors.
The blind corpus retains the three blobs `e45437a5…`, `ed0f6a67…`, `33c7e6a9…`;
the [two](cbor-stringhe-revisione.md) [C1 readings](cbor-stringhe-lettura.md)
have no open static findings.
The [data review](cbor-stringhe-dati.md) checks complete records,
including origin and order of failures in mutated logs.

8,194 cold comparisons on lengths 0..4096 for both majors,
1,138 insufficient capacities, and 2,048 differential cases seed53574342:
1,546 accepted and 502 UTF-8 rejected. Checks cover width thresholds,
maximum 16 MiB item and maximum+1, arbitrary bytes, multibyte, NUL/BOM and
noncharacters, absolute offsets and error precedence, disjoint aliases,
header overlap, exact arity, and whole arrays unchanged on rejection.
The minimal scanner is only supplementary verification after cold
expected bytes.

Two workers, two waves, 8,192 items each per wave: 32,768 writes
and 32 MiB payload from shared immutable source to private
destinations. Sinks 9,707,520/9,969,664 per wave and complete arrays checked.
Observed overlap 47,821/47,752 ticks at 1,000,000 ticks/s in the preliminary run;
bounded semaphores, joins, and cleanup. This verifies functional concurrency
without certifying simultaneous core execution, scaling, or pool throughput.

<a id="heap-e-mutazioni"></a>

## Heap and mutations

Nine independent fixtures, five replicates of 4,096 calls with warmup
128: 45 samples with observed zero heap. Null baseline and positive sensor
16×1 MiB, 16,777,472 bytes observed. NEXT, all bytes, and sentinels
feed tokens and sinks recalculated by the independent audit. Serial measurement
83.243866 s, including output checks, without a speed threshold;
the local counter is not absolute proof of nonallocation.

Eight frozen mutations: 8 DETECTED, zero SURVIVED/INVALID/WORKER-ERROR.
Complete baseline succeeds, private copies and caches; 210 files for each
of nine copies in the declared inventory. The audit compares baseline,
single substitution, and runtime logs: 11,828 successful checks.
Failed compilation, OS signal, or post-completion failure does not count
as detection; self-tests exercise these cases with real
processes too. Mutated overlap ignores precisely the header's initial byte.

<a id="copertura-e-verificatori"></a>

## Coverage and verifiers

Coverage of only the new file: **256/308 expressions, 39/52 branches**.
52 expressions and 13 branch outcomes remain in the denominator: seven
declarations, 44 internal-error forms, and default MAX-BYTES in the
lambda-list, line 99, raw path `(8 2 11)`, without unreachability
deductions. The 13 missing outcomes are syntactically associated with internal guards.
Raw state and two HTML files agree, verified with 74 checks.
The [inventory](cbor-stringhe-decisioni.md) retains five AND forms and six
chained relations, without exclusions or MC/DC/100% certification.
ADR-0035's C1 gate remains open; these data do not qualify the engine.

The first self-test of the benchmark's independent verifier fails
with exit 1: synthetic fixture accessor setters were missing.
Original source `1e0fe5b8…`, failed process, and diff are
preserved. Fix `ae591bf0…` adds only two setters: successful retry
with four positive and 54 negative fixtures, 37,424 checks. Product,
measurement driver, and corpus remain unchanged. The reader preserves T/NIL,
blocks READ-EVAL, and requires EOF; the clock allows the actual
metadata collection order. The coverage/mutation helper also passes its
self-tests, derived from the preserved previous verifier.

These audits check data consistency and byte stability without
authenticating execution. Copy inventory concerns declared
fingerprints; it does not automatically certify closure of private trees.
Gap associations are syntactic and do not establish unreachability.

<a id="conservazione-e-integrazione"></a>

## Preservation and integration

[Original archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write/archive-index.lisp)
with processes, failed attempt, frozen sources, helpers, state/HTML,
copies, and logs. Gzip compression preserves and verifies reconstructed bytes;
it neither rewrites earlier campaigns nor infers qualifications from their outcomes.
The closed audit verifies 2,026 indexed files and the two archive metadata files,
including hidden files: complete fingerprints and inventory, 15 processes.

Integration on `ceac2dedfcfd6af05f2331282645bebf4b5be442`, retaining
hash/key-hash, GET, and EBR/read suites. `make check` passes in 172.707537 s,
with STABLE sources: 791 nominal tests and two smokes, 793 distinct OK names,
138 product files without violations, traceability without errors, and ten
completed spikes. The 643 source items match before/after;
warning-free compilation, frozen corpus and product unchanged.
The writer's two waves retain previous sinks, with overlap
49,011/47,867 ticks at 1,000,000 ticks/s. Integrated coverage selector
self-test passes separately. ASD blob `4a4734596cada6eac70dda6709b4804a25acb9de`,
coverage `3a4af4b1efe2a2c37599ec804f6ed06c80733491`.

The [final archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write-final/archive-index.lisp)
preserves collection, original closed audit, integrated check, self-tests,
results of ten spikes, and copies of the two integration files.
Passing checks does not close the C1/MC/DC gaps described above.

The further main update `92decf4` adds the worker/Serie connection;
it is merged in commit `997f5e6505cdcf4554d5f99ede7d5743ce4be7bd`.
A second `make check` passes in 177.072076 s: 817 nominal tests and two
smokes, 819 distinct OK names, warning-free compilation, lint on 142 files
without violations, traceability without errors, and ten completed spikes.
The 655 source items remain STABLE; writer product and corpus
are unchanged. Overlap of both waves 47,829/47,750 ticks, sinks unchanged.
Integrated ASD has blob `3b163722ff7b49e6ada85e37e21a7665cc7ce28f`;
coverage driver retains blob `3a4af4b1…`.
The [worker/Serie supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write-worker-integration/archive-index.lisp)
preserves the new full check, its spikes, and integrated files,
without rewriting previous campaigns.
