<a id="risultati-locali-del-collegamento-workerserie"></a>

# Local worker/Serie link results

Campaign on 2026-10-11, Apple M4 ARM64, SBCL 2.6.9, safety 3.
The [contract](worker-serie.md), [preregistered method](worker-serie-metodo.md),
[complete inventory](worker-serie-decisioni.md), and
[two C1 readings](worker-serie-revisione.md) bound the outcomes.
Readable originals and retention proofs are in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/catalogo.lisp).

The initial base is `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`.
The qualified v3 freeze incorporates hashes through
`8101eb856cbe9d7540682babb53afb00fde30f70`: all four bridge SHA-256 hashes
match the inventory. The general check also incorporates GET through
`96c0f4f4d6d1f1882723da1b631e78f89e613059`, without changes to
execution/Serie dependencies or the four sources. The GET module does not
call the bridge and retains its open qualification.
Subsequent [reader PR integration](worker-serie-integrazione.md)
on `65972a4` adds checks without changing product code; it requires a new
general check, separate from the previous PASS. That check passes with
**796 named tests, two smoke tests, and ten spikes**, in the
[final integrated record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/full-check-reader-integration.lisp)
`4000710249-command-34111-0`, `:OK/:STABLE`, exit 0.

<a id="correttezza-e-strumenti"></a>

## Correctness and tools

The 26 new tests pass with strict compilation in the
[final record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/target-final.lisp)
`4000708313-command-79577-0`, `:OK`, `:STABLE`, exit 0. They cover the
complete segment, FIFO/identity/span, batch debt, tokens and capabilities,
busy before and after the second lease, release order and end retry, original
errors, foreign owner, stale bypass, zero generation, and four closed findings.
Real threads verify a contended Serie and two simultaneously active Serie;
these finite tests demonstrate neither fairness nor scalability.

C4 `tools/worker-series-bench.lisp` is compiled in full with fatal warning
and style-warning; FASL self-tests and associated negative controls pass in
the [C4 record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/c4-final.lisp)
`4000708361-command-83427-0`. ASDF loading retains only the runtime exception
`sb-kernel:redefinition-warning` already documented by `tools/build.lisp`.
Source SHA-256 is
`93db07d3e553b61404926094650a2c0d69d1593017a82c62270cc11ddfb6438c`;
FASL SHA-256 is
`d22c6afc647678d3f807130f66c3664eb78fcecd0694254062aad009731dd019`.

The first general `make check` passes in the
[original record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/full-check.lisp)
`4000709286-command-15279-0`: `:OK`, `:STABLE`, exit 0, with 632 unchanged
sources and documents in the final freeze. 732 named tests and two smoke
tests, linter/self-test, snapshot runner/self-test, traceability, links,
retention and evidence, and all ten Phase 0 experiments pass. The
[experiment master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series-spikes-check/report.lisp)
`4000709427-check-16929-0` is `:COMPLETE`; every run has `:STABLE` sources
and exit 0 (SPK-07 `:PASS`, others `:OK`). Their stderr is empty;
general command stderr retains compiler notes and runner announcements,
without warnings or style-warnings. The subsequent general check is
motivated by new suites and the new reader gate incorporated from `main`.
The two intentionally failed snapshot self-test fixtures and their
`:PASSED` report are retained in the
[bundle](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/snapshot-selftest-bundle.lisp).
Documents updated after this outcome and new catalogs are checked separately
before publication.

<a id="copertura-senza-esclusioni"></a>

## Coverage without exclusions

The native campaign runs all 70 Series tests (44 existing and 26 new),
with [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-process.lisp)
`4000708333-command-80909-0`, `:OK`, `:STABLE`, exit 0. It retains all
12 sb-cover rows, including packages and types; no approved exclusion.

| Series file | Hit / total expressions | Hit / total branches |
|---|---:|---:|
| events | 288 / 335 | 38 / 46 |
| io-events | 185 / 220 | 23 / 32 |
| ownership | 223 / 279 | 42 / 52 |
| package | 0 / 1 | 0 / 0 |
| publication | 156 / 203 | 16 / 22 |
| query | 65 / 79 | 5 / 6 |
| retirement | 166 / 182 | 14 / 18 |
| types | 75 / 84 | 4 / 10 |
| worker-boundary | 74 / 86 | 18 / 20 |
| worker-package | 0 / 1 | 0 / 0 |
| worker-run | 145 / 161 | 12 / 14 |
| worker-types | 124 / 168 | 19 / 30 |
| **Total** | **1501 / 1799** | **191 / 250** |
| **Four new files** | **343 / 416** | **49 / 64** |

298 expressions and 59 branches remain unhit in the complete scope,
including 73 and 15 in new files. Missing paths are enumerated in the
[audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-audit-final.lisp);
[native state and all HTML](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-bundle.lisp)
are compressed losslessly, with original-byte checksums and rereading.
The reader verifies forms/bits/lengths and compares the 12 HTML rows with
native data. Complete compilation, negative self-tests, and final audit
pass in [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-audit-final-process.lisp)
`4000708823-command-7776-0`, with empty stderr. The three independent pairs
of compound decision B01 are described in the inventory; sb-cover counters
do not attest to MC/DC, human review, or complete coverage.

<a id="allocazione-osservata-sul-percorso-seriale"></a>

## Allocation observed on the serial path

The [benchmark process](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/benchmark-process.lisp)
`4000708391-command-85710-0` and
[raw data](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/benchmark-data.lisp)
are `:OK` and `:STABLE`; the process ends with exit 0.
Five replicas of 4096 complete cycles, each after 128 warmup cycles,
use the same preallocated context and real monotonic generations.
The independent sink expected and obtained in each sample is 8800256.

| Replica | Observed consed bytes | Raw ticks (units/s: 1000000) |
|---|---:|---:|
| 1 | 0 | 5603 |
| 2 | 0 | 5558 |
| 3 | 0 | 5536 |
| 4 | 0 | 5487 |
| 5 | 0 | 5489 |

The positive control deliberately allocates 16 1 MiB buffers and detects
16777472 bytes; sink 16777336. Wrong sink 3 instead of 1 is rejected;
a zero clock is classified below resolution; baseline heap 0.
GC, fixture creation, mock I/O, and printing remain outside measurement.
The SHA-256 of the original 49744-byte report is
`418eed082f688416298fe28f593ed7282da79e23aaf4dc445b33831072a3eead`.
These data observe only local serial success; they do not prove universal
zero heap, throughput, P99, fairness, real I/O use, or pool performance.

<a id="tentativi-e-conservazione"></a>

## Attempts and retention

No attempt is replaced by the final result. In the catalog:

- `tool-probe-01` retains the initial SB-MD5 read failure in C4;
  `tool-probe-02/03/04` retain subsequent preliminary compilations.
- `target-01` retains failure for unused WRITER in the fixture;
  `target-02` retains success of the 23 preliminary tests before WS-REV-03/04
  and new regressions. Both preliminary bundles retain their sources.
- `selftest-01` retains ASDF runtime failure before restoration of the
  existing load policy; `c4-argv-probe` a malformed CLI handler rejected
  before any file compilation.
- `coverage-audit-process` retains the first audit: reader compiles without
  warnings and audit passes, but runner emits two style-warnings for forward
  calls in `-eval`. The new runner avoids those static calls and separately
  qualifies compile/FASL/self-test/audit.
- `orchestration-final` also retains the original publication wrapper and
  its output: one style-warning for the runtime-loaded compactor, followed
  by successful byte validation. It is not the tool's C4 gate. Copying and
  compaction reuse existing retention helpers; descriptor, payload, expanded
  bytes, and catalog are reread and verified.
- `source-final` retains v3 freeze sources;
  `orchestration` and `orchestration-final` retain drivers and reader.
- `source-make-check` retains sources and documents of the final integrated
  freeze. The spike catalog separately retains master, ten original records,
  and finalization, including original gzip payloads.

Routing, Archivio coordinator, pool, admission, wake/park, and payload
application remain to be integrated. No complete engine or Phase 0 gate
is closed by this local campaign.
