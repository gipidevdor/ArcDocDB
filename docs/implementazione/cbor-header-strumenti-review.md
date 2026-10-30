<a id="lettura-c4-degli-strumenti-cbor-header"></a>

# C4 reading of CBOR header tools

Local reading on October 9, 2026, completed before product campaigns.
Outcome: no open defect found in the frozen drivers. The reader is also
the codec author: this report concerns C4 tools and is neither
an independent C1 reading of the product nor human approval.
No new compilations, tests, or measurements were performed during this reading.

<a id="benchmark-e-sensore"></a>

## Benchmark and sensor

`tools/cbor-header-bench.lisp` matches the method: nine cells, five replicates
of 4096 calls, warmup 128, and GC outside measurement. Fixtures, copies, and closures
are prepared before counters. Each call compares all six values
with explicit constants and incorporates them into the sink: major + 8·AI + 256·high +
65536·low + 1048576·next + 16777216·form, with form 1/2/3 respectively for
argument/indefinite/break. Measured cost includes these comparisons and the sink.

The nine fixture tokens, recalculated with independent arithmetic without
calling the product, match: direct 21037192; u8 37683392; u16 4297851080;
u32 280224000901328; u64 282574516584408; float64 549649973471;
simple 37683399; indefinite 36700412; break 53477631. Expected sink is
N·token + N(N−1)/2, modulo most-positive-fixnum; for N=4096 the maximum before
modulo is 1157425219938121728, compatible with a 64-bit SBCL fixnum.

The baseline uses the same call count and must observe zero heap; the
positive control retains the last object and requires at least 16 MiB observed
across 16 allocations of 1 MiB. Zero time produces rate NIL. These criteria
remain to be verified in the campaign: static reading does not certify zero codec heap.
Before/after snapshots, strict loading with fatal warnings, fixture immutability,
and nonzero exit for errors or changed sources are present.

<a id="copertura-e-mutazioni"></a>

## Coverage and mutations

The `cbor` filter in `tools/foundation-coverage.lisp` selects only the exact suffixes
`/src/codec/cbor-package.lisp` and `/src/codec/cbor-header.lisp`, anchored
to the pathname end. The self-test rejects extended names, subdirectories, and tests.
The `codec` scope runs both UTF8 and CBOR suites. Raw state and HTML are
preserved; guards remain in the denominator. The runner must assign a
new directory because the coverage driver does not enforce exclusivity.

`tools/cbor-header-mutation.lisp` requires the complete unchanged baseline to PASS,
exclusive copies/caches, and exactly one target per substitution before the nine mutants.
Failed compilation or absence of the exact smoke line is INVALID; zero exit
is SURVIVED; an error after the real marker is DETECTED. The self-test also includes
markers quoted in backtraces. The relevance of the test detecting each mutant must
be checked against final logs: DETECTED alone does not establish it.

<a id="raccoglitore-e-provenienza"></a>

## Collector and provenance

The collector reads data with read-eval NIL and an EOF guard, copies originals
byte for byte, and retains stdout/stderr embedded as strings with explicit
provenance, including NIL or absent channels. It preserves all process states,
coverage state/HTML, and mutation reports/all logs. Top-level entries
are schema 1 datums with basenames; raw files are associated separately.
Metadata `formats NIL`, schema aliases and append with previous catalog retained,
captured-byte checks, and repeated-name rejection are present.

Finding closed before campaigns: an unquoted `:scope` list in the first
collector produced compilation diagnostics without being exercised
by the first guard. The previous apparent PASS 10/10 is INVALID and remains
preserved with the attempted code. The correction quotes the list, makes
warnings fatal when loading the trusted tool, and adds a
coverage guard on two literal sources, test prefix, and state/two HTML files bytewise.
The report `/tmp/cbor-header-collector-self-test-v2.lisp`, read as data text
without load/eval, reports 11 PASS, zero failures; the log records the same outcome.
The guard concerns temporary collector fixtures, not product campaigns.

<a id="versioni-lette-e-limiti"></a>

## Versions read and limits

MD5s of files frozen at closure:

| File | MD5 |
| --- | --- |
| src/codec/cbor-package.lisp | 41ace98eff0e92e6e002cf7b204b84d1 |
| src/codec/cbor-header.lisp | 6e8c6a49314c2f460aa6f8a1759200b6 |
| tools/cbor-header-bench.lisp | bb91c787dd47d263172866fc609e6ee1 |
| tools/cbor-header-mutation.lisp | 1ce45dc548d20ebc6f430bad974ae9df |
| tools/foundation-coverage.lisp | 5da6c65297dc7dd28be00b4c519ed48e |
| /tmp/collect-cbor-header-evidence.lisp | f39c4c1172d91570c745e69f2fbac48c |
| /tmp/cbor-header-collector-guard-test.lisp | d00b5cfe42f1c82b7752ce07417f3da4 |

Runtime evidence, final catalog, and links remain to be acquired and checked.
The benchmark is serial, on successes and preallocated buffers; it does not
qualify the complete CBOR parser, document budgets, pool, or parallel scaling.
