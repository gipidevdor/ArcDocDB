<a id="testate-cbor-minime--risultati-del-2026-10-09"></a>

# Minimal CBOR headers — results of 2026-10-09

The local [minimal-header](cbor-minimo.md) reader passes the campaigns
recorded in the [method](cbor-minimo-metodo.md). The full document profile
and engine qualification remain later work.

Correction to the preservation method: the two historical inventory audits
used a Python helper, contrary to INV-X3 even for verification
tools. Original code and results remain preserved as historical data.
The new all-Common-Lisp checker, independently read and tested
with 24 fixtures, verifies both unchanged archives: 1313/87 files and
eight/six processes. The new original checks are in the
[minimal-scanner archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-minimal-scan/archive-index.lisp);
schema, closed inventory, bytes/SHA, and metadata pass, without inference
about product campaigns or gates. Limits in the
[C4 reading](archivi-comandi-lettura.md).

<a id="correttezza-e-concorrenza"></a>

## Correctness and concurrency

The full preliminary build reports **381 `ok` outcomes**: 379 suite
tests and two smoke tests; no warnings, lint and traceability passed. The new
suite contains 14 blind-oracle tests plus a declared supplement
after reading: [second review](cbor-minimo-revisione.md).
The three original files retain their frozen blobs.

Final `make check`, after recovery-inventory integration
from `e2f7a75`, passes **394 build outcomes**: 392 tests and two smoke tests.
The two additional lint-selftest markers bring the full-command total
of `ok` lines to 396; they are distinct from build tests. Lint,
traceability, links, preservation, and all ten spikes pass; the record
has exit zero and stable snapshot. Earlier frozen campaigns retain
their original bases and counts.

Verified: all 65536 binary16 values and 131072 exact binary32/64
expansions, including signs and NaN payloads. Fuzz with seed `4D494E43`
examines 12288 inputs: 11223 accepted, 1065 rejected, including 84 nonminimal.
Thresholds, neighbors, 152 truncations, all leads and simple values,
error precedence, exact six values, and immutable buffers complete
the fixed cases. The supplement adds 26 public calls on rationals.

Two workers on private buffers read 524288 headers, 4718592 bytes;
sinks 1406013828104192 and 5628138478764032. In the preliminary run,
work intervals overlap by 13762 ticks on a
1000000 ticks/s clock: wall-time observation, without inference about core
count, CPU time, or pool scaling.

<a id="allocazioni-e-mutazioni"></a>

## Allocations and mutations

Serial benchmark on SBCL 2.6.9, ARM64/Darwin, safety 3: eight fixtures,
five replicates of 4096 calls, warmup 128. All **40 samples have
zero observed heap**; zero baseline, positive control 16 × 1 MiB
of 16777472 bytes. All six values and the sink are checked, with preallocated
immutable inputs. The counter does not demonstrate universal nonallocation;
no speed threshold, throughput comparison, or scaling claim.

Full copy baseline passes; all **8 mutants are
DETECTED**, without INVALID or SURVIVED. Defects concern width
thresholds, high u64 word, binary16 normal/subnormal, and binary32 special/subnormal
values. Compilations and first rejections are attributed to actual logs,
with private caches and sources. Self-tests check exact markers, missing or
ambiguous targets, and compilation-error classification.

<a id="copertura-e-limiti"></a>

## Coverage and limits

| New file | Observed/total forms | Observed/total branch outcomes |
|---|---:|---:|
| `cbor-float-minimal.lisp` | 151/184 | 31/40 |
| `cbor-minimal.lisp` | 107/148 | 21/28 |
| Raw total | 258/332 | 52/68 |

The 74 missing forms include 10 declarations and 64 forms associated with
15 internal-error sites; the 16 missing outcomes belong to internal
guards. Complete state and all three HTML files are preserved. No
exclusion from the denominator, MC/DC attestation, unreachability proof,
or gate closure. [First reading](cbor-minimo-lettura.md),
[ten-decision inventory](cbor-minimo-decisioni.md),
[driver reading](cbor-minimo-driver-review.md), and
[tool reading](cbor-minimo-strumenti-review.md) distinguish
static and runtime findings.

<a id="conservazione"></a>

## Preservation

The [archive index](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-minimal/archive-index.lisp)
lists every file with size and SHA256, alongside command, status,
exit, and stability read from reports. Process directories retain
original reports, descriptors, gzip payloads, and preservation records.
Raw trees retain coverage, mutation source copies/logs,
review code and data; FASLs remain in the archived local copy.
The collector compares source before/after and destination; it neither rewrites
original reports nor infers requirements from their results.

The independent initial-archive audit passes **6673 checks** on
1313 indexed files and eight processes, without findings. The initial index remains
unchanged. The [second archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-minimal-final/archive-index.lisp)
preserves collection and final-verification commands, the ten original spike
results, and code, inventories, and logs from the publication audit. Later
audits and concluding wrappers are declared additions to the second derived
index; their original records remain unchanged.
The second reading passes 306 checks on 53 files and two processes; it confirms
the build count and presence of ten spikes. Before use, the index
supplement receives two static corrections: require the audit CLI
before loading and require the report in addition to helper files.
Earlier code and attribution are preserved; no product defect.

A C4 reading found and corrected, before collection, the filter that
omitted `.gz` payloads in trees. Earlier source is reconstructed
using only the reverse replacement and compared with the blob read by the reviewer;
provenance distinguishes it from an original file capture.
The first guard failed because its report did not preallocate plist
fields `:cases` and `:invocations`: adding them in local functions did not
update the head of the caller's report. Code, fixtures, logs, and the
failed report are preserved; correction concerns the C4 harness.
The second guard passes **8 cases and 10 invocations**, including two gzip calls:
copy and reread, collisions, missing or corrupt payload, prohibited reader-eval,
and extra form. The wrapper remains stable.

The independent measurement and mutation audit passes 586 reading checks.
Its two failed reader attempts are also preserved: incomplete
Lisp structure and wrong relative base. These errors belong
to the audit utility; original campaign data remains unchanged.
The coverage audit preserves code and output of all three successful attempts.

Product campaigns precede this collection utility and have
stable snapshots. Archive-index updates are derived and
do not constitute a durable database protocol. External load uncontrolled;
local tests, distinct from the reference platform.
