<a id="verifiche-della-scrittura-delle-testate-cbor"></a>

# Verification of CBOR header writing

Campaigns of 2026-10-11 against the contract preregistered in the
[method](cbor-scrittura-metodo.md), with product frozen at blob
`61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`. The function writes only
minimal MT0..6 headers, up to nine bytes; payloads and the full document
profile remain outside this increment.

<a id="correttezza-e-parallelismo"></a>

## Correctness and parallelism

17 new tests, including the supplementary 77-pair roundtrip, bring
the build to 475 tests and 2 smoke tests: 477 successful outcomes, without warnings. The blind
corpus retains the three initial blobs `92327e4…`, `903a213…`, `878f0fa…`.
Verified: 458,752 u16 arguments × 7 majors, 4,096 differential cases
seed57524342, and 140 insufficient capacities, with the entire destination
unchanged on rejections. Fuzz exercises the five widths in
560/465/511/512/2048 cases, respectively.

Two real workers with exclusive destinations execute 229,376 headers and
check sinks 15,466,496/17,006,592. In the preliminary build,
work intervals overlap by 6140 ticks at 1,000,000 ticks/s;
in the full check by 6134. This observation verifies functional
concurrency; it does not demonstrate simultaneous execution on cores, scaling, or pool
throughput. Semaphores, joins, and cleanup have explicit bounds.

The [two](cbor-scrittura-revisione.md) [C1 readings](cbor-scrittura-lettura.md)
have no open static findings. Before compilation, COD-13 was resolved
by extracting preflight from the public wrapper. Traceability
introduces REQ-CBR-001 without attributing encoding to the file-versioning
requirement REQ-FOR-002. An initial setup check, before
test creation, correctly reported the missing reference;
a transcript of that result and the subsequent green check are
preserved, distinguished from recorded processes.

<a id="heap-mutazioni-e-copertura"></a>

## Heap, mutations, and coverage

Seven fixtures × five replicates × 4096 calls, warmup 128: 35 samples with
zero observed heap. The sensor verifies a zero baseline and positive
control 16 × 1 MiB; NEXT and all bytes, including sentinels, feed
verified tokens and sinks. Output-check costs are included.
The independent audit recalculates encodings, tokens, and sinks: these local
results are not absolute proof of no allocation or a speed
threshold. Measurements are serial, separate from parallel campaigns.

Eight mutations: 8 DETECTED, 0 INVALID, 0 SURVIVED, 0 WORKER-ERROR, with a
successful full baseline and private copies/caches. Smoke and completion are
recognized only on exact lines; compilation failures, OS signals, and
faults after completion do not count as detection. Self-tests with
real processes and infrastructure errors verify these distinctions.
Capacity on the physical suffix produces an internal condition different
from the expected one: the active guard still prevents out-of-bounds access.

Coverage of only `src/codec/cbor-write.lisp`: 224/258 expressions and 43/52
branches; 34 missing expressions and 9 branches remain in the denominator. The independent
map distinguishes 6 declarations and 28 internal-error forms;
the 9 missing branches are internal guards, with no unclassified cases. Full raw
state and two HTML files preserved. Internal guards not reached
through the valid API and declarations remain visible; the [inventory](cbor-scrittura-decisioni.md)
also documents the redundant condition in the u32 domain. No
100% or MC/DC attestation, no closure of the ADR-0035 C1 gate.

The auditor's third self-test reported OK while emitting a warning
for a wrong SETF form in the new gap map: source and log are
preserved, the form was corrected, and self-tests rerun without warnings.
The first final audit then rejected source-report counts
due to its own parsing error: SB-COVER leaves the HTML header
row closure implicit. The parser was corrected and checked
against that HTML form too. Original reports remain unchanged;
failed process, tool versions, and later attempts are preserved.
The fifth self-test passes without warnings: 30 fixtures, 1561 checks.
The successful final audit performs 11,069 checks on measurements, coverage, and
180 declared files per mutation copy; it does not load the product to
calculate expected values. It confirms the baseline and eight exact replacements.
An additional C4 reading retains two verifier limits: the fingerprint
catalog is not compared with the project's entire inventory,
and automatic log checking does not enforce rejection order/package.
Reading the actual logs shows an assert from the
CBOR.WRITE.TESTS suite after smoke in all eight cases. This audit does not rule out
additional files in the copies; full copies remain in the backup.

<a id="integrazione-e-conservazione"></a>

## Integration and preservation

Full `make check` passes: build, lint and its self-tests, traceability,
links, evidence preservation, and ten spikes. The process takes
135.727259 seconds with stable sources; these tests do not qualify the
engine or reference platform. Final link and evidence
checks also verify the added documentation and archives.

After integration of `f16e978` (index rebuild published
separately), the full check is repeated on `7a8349c`:
594 tests and 2 smoke tests, 596 successful build outcomes, without warnings; the
other checks and ten spikes also pass in 154.41837 seconds, sources stable.
The unified coverage driver's self-test passes. The only integration
conflict concerned scope listing/usage in the C4 driver, resolved
by retaining both `cbor-write` and `index`. Product and three blind tests
retain the same blobs; local campaigns were not rewritten.

Merge `b4ea74f` then includes snapshots from `f23b33c` and workers from
`d9aeae3`: full check successful in 163.081183 seconds, with 660 tests
and 2 smoke tests, sources stable. The scope list also retains `mvcc`.
Subsequent cache integration `01dd641` on `997a85b` repeats all
checks in 166.766875 seconds: the same 662 build outcomes, no warnings,
snapshot mutator self-test and ten spikes successful. The unified coverage
driver passes its self-test. Codec and blind tests
remain unchanged; the new cache module is compiled, while its
dedicated checks remain pending as stated in the corresponding
[increment](cache-record.md). In the final check, both CBOR workers
retain the expected sinks and overlap by 6175 ticks; the same
limit on scaling conclusions applies.

The [original records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-header-write/archive-index.lisp)
preserve stdout/stderr, sources, tests, drivers, coverage, mutated copies
of the new file and logs, self-tests, and Common Lisp audits with reader-eval NIL
and EOF. Bytes and SHA256 are checked during copying and by the archive
auditor; the catalog checks structure and presence without inferring
results or authenticity from declarations. Full mutation
copies and FASLs are also retained in the local backup
`spikes/out/cbor-header-write-isolated-20261011/` in the main checkout.
Frozen Markdown copies are original `.md.txt` data, without
rewriting historical links. The [concluding records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-header-write-final/archive-index.lisp)
collect collection checks, integrated checks, and final
documentation. Each execution retains its own commit and
counts: later increments do not change the original evidence.
