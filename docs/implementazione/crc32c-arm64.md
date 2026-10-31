<a id="crc32c-arm64-in-common-lispsbcl"></a>

# ARM64 CRC32C in Common Lisp/SBCL

[ADR-0059](../adr/0059-crc32c-arm64-sbcl.md),
[preregistered method](crc32c-arm64-metodo.md). Checksum format and
record, cache, WAL, and page checks remain unchanged.
Subsequent [platform check](crc32c-piattaforme.md) also isolates
loading and dependencies before runtime selection.

<a id="implementazione"></a>

## Implementation

`crc32c` delegates to kernel selected before workers start.
`backend-crc32c` exposes `:lisp` or `:arm64-crc32c`. The slicing-by-8
fallback also preserves standalone foundation loaders.
Hardware backend enabled only on macOS ARM64/SBCL 2.6.9 or 2.6.10
([qualification extension](../adr/0074-crc32c-sbcl-2.6.10.md)),
after OS confirmation of CRC32C and NEON availability. OS
detection is in I/O module; no syscall, allocation, or shared write
is added to GET for backend selection.

VOPs are written in Lisp and operate on integer registers; two
CRC32CX instructions consume the 16 B loaded through SB-SIMD APIs. These retain
index checks at safety 3. Tail uses `aref` and CRC32CB. No
checksum in foreign libraries, retained pointer, pinning, or disabled GC.
Local disassembler shows opcodes as bytes; the two Castagnoli
encodings are `#x9ac05c00` and `#x1ac05000`, before register fields.

<a id="risultati-locali"></a>

## Local results

Apple M4, 16 GiB, SBCL 2.6.9, safety 3, five replicates per cell.
First GET campaign preserved in full: host load above
18 on ten logical CPUs makes wall time highly variable. Second
campaign retains the same matrix, adding diagnostic CPU time;
it does not replace or remove earlier results. No confidence
interval or P99 inferred from medians.

Second campaign: microseconds per GET, median wall time, CSN 7.

| Value | Cache hit, software | Cache hit, hardware | Hot segment, hardware |
|---:|---:|---:|---:|
| 16 B | 0.792 | 0.750 | 1.350 |
| 256 B | 1.129 | 0.777 | 1.375 |
| 4096 B | 6.758 | **1.684** | 2.359 |

With maximum u64 CSN: 4096 B cache hit **1.683 µs**, hot segment
2.390 µs. Gain attributable to CRC with the same throughput driver
is about **4.01×** for 4 KiB cache hit. In the original loop with
every byte compared inside timing: software 15.068 µs, hardware
9.886 µs. Comparison 15 → 1.68 also includes exclusion of oracle
from measured time and does not represent a 9× product acceleration.

New product CRC microbenchmark on 4112 B body measures
about **0.748 µs**; compact spike about 0.73 µs. The CRC objective
of 0.4–0.6 µs is not reached. The 4 KiB cache-hit GET objective
under 2 µs is reached within measured scope. The 64 B unrolled kernel
measures about 0.81 µs in spike and is not integrated.

Both GET campaigns have **720 windows, 28.8 million GETs**, all
complete with zero Lisp heap delta. Separate byte campaign has
90 complete windows, also with zero heap delta. This does not demonstrate
no allocation in every execution or a bound on GC/OS pauses.
Separate diagnostic CPU profile collects 259 samples: hardware CRC
42.1% self; not used as throughput or latency measurement.

<a id="integrità-e-perimetro"></a>

## Integrity and scope

Spike passes 6,624 cases per variant with bitwise and software oracle,
offsets, seeds, and incremental operation. Three new product tests bring
foundations to 31 tests. GET benchmark runs 72 bounded windows before
every campaign, checks every byte on `:exact` path, and checks
all eight keys before/after every `:throughput` window. CLI negative
preserves failed window and exits 1. Product corruption tests
remain distinct from driver negative check.

Server/network, cold documents, working sets beyond RAM,
one hundred million keys, concurrent mutations, and P99 remain outside scope. No
lock-free property derives from speed: concurrency contract does not
change. Other platforms/versions retain software and require
separate qualification before enabling acceleration.

<a id="letture-c1-e-decisioni"></a>

## C1 readings and decisions

Two author readings, not an independent review:

- u32/u64 domain, Castagnoli opcodes, validated ranges before loads,
  seed and finalization, tail 0..15, GC lifetime, and no retained addresses
  or boxing in loop. Assembler checks opcode and registers
  before generating every instruction.
- Cold selection and fallback, `sysctlbyname` ABI, kernel unchanged during
  service, standalone loader, private benchmark bindings, guards,
  A/B comparability, preservation of failures and both drivers.

New compound decisions: OS status/size/feature for detection,
version/feature/NEON for selection. Positive case exercised on
this host; software and ranges checked separately. An MC/DC
campaign of synthetic OS responses and qualification on other
platforms remain distinct from local tests and performance target.

<a id="verifica-conclusiva"></a>

## Concluding verification

Full `make check` passed with exit 0 and stable sources: build and tests
without warnings/style-warnings, lint, traceability (137 requirements, 71 invariants,
59 ADRs), links, full-text tools, negative checks and preservation,
audit of 315 catalogs, 11 spikes, and CI self-tests. Normal compiler
NOTE messages are not warnings. First global attempt stopped at a
preexisting style warning in a Unix-process test: stream `ignore`
replaced with `ignorable`, because cleanup uses it. No check
was disabled; failure and previous source are preserved.

[Concluding catalog, sources, and raw data](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-crc32c-arm64/catalogo.lisp).
Archive preserves this campaign's sources. Subsequent integration
and checks are in the [platform check](crc32c-piattaforme.md).
