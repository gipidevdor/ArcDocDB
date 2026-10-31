# M1 readiness / CRC 2.6.10 integration — 2026-10-31

[Preregistered contract](../../../docs/implementazione/prestazioni-local-m1.md),
[ADR-0074](../../../docs/adr/0074-crc32c-sbcl-2.6.10.md).
Dedicated managed worktree only; no edits or messages to other chats. ADR-0074
was selected after observing that the other checkout already contains ADR-0073.

## Implementation

The client and server no longer impose a fixed 1 ms sleep after EAGAIN/EINTR.
A private bounded poll set waits on listener/peer input or output readiness,
with the closest original absolute deadline and 100 ms cap. Actor still gives
all slots a finite nonblocking step before waiting. No pin/lease spans the peer
wait; no global event handler, thread per peer, or protocol change is added.
Poll descriptors are borrowed, including FD zero; a maximum of 72 payload bytes
for server scratch and eight for a client is allocated before admission.
Owner/reentry checks and unwind release apply even to injected backend faults.

The CRC compiler allowlist adds exact SBCL 2.6.10 on macOS ARM64. CPU/OS CRC and
NEON confirmation, safety 3, range checks, immutable startup selection and the
explicit software override remain. Unknown versions/platforms retain fallback.
No checksum, record format, canonical authority or durable ACK rule changes.

## Qualification

[Targeted qualification](targeted-qualification/report.lisp) passed, exit 0,
SOURCE-CONSISTENCY STABLE, SBCL 2.6.10/native on the local M4. It executes I/O,
foundations, local server/native and distinct-process suites. Includes 4,224
unaligned span/seed cases, incremental splits and unchanged buffers; real pipe
input/output/HUP; malformed counts/flags, EINTR/faults, FD zero, deadlines,
all nine interests, wrong owner/reentry and nonlocal cleanup.

[Native cache phase](cache-native-1/report.lisp),
[forced software phase](cache-software/report.lisp),
[native phase again](cache-native-2/report.lisp) all passed in fresh 2.6.10
processes with no force. Software phase has no native kernel or SB-SIMD-NEON
package. These precede the final owner guards; full checks below cover final sources.

An [initial instruction-inspection attempt](attempt-mnemonic-disassembly/report.lisp)
failed because SBCL prints these emitted opcodes as BYTE rather than CRC mnemonics.
No checksum mismatch occurred. The driver now decodes the actual little-endian
instruction words, masks only register fields, and requires CRC32CX/CRC32CB
opcodes. Known-word positive/negative parser fixtures precede inspection.
[Pre-owner qualification](pre-owner-qualification/report.lisp) passed; a test-file
parenthesis error during development is also [retained](attempt-test-parser.log.gz).
These preliminary attempts are not the final strict qualification.

## Final checks and measurements

[Full recorded make check](check-run/report.lisp) on SBCL 2.6.10 passed,
exit 0, SOURCE-CONSISTENCY STABLE. Strict build and all suites passed with no
warnings, including 160 I/O, 35 foundation, 83 engine and 70 page-index tests.
457 source files: zero lint violations. Trace: 138 requirements, 71 invariants,
13 FI scenarios, 71 ADRs, zero errors. Links: 724 files, 3469 links, zero broken.
Eleven [spike checks](check-run/spikes/report.lisp) and the [recorded CI self-test](check-run/ci-selftest/report.lisp)
passed; no claim about remote CI or Linux execution is made.

[Strict SBCL 2.6.9 build and all suites](strict-2.6.9-run/report.lisp) passed,
exit 0, stable sources. [Strict forced-software 2.6.10 build and all suites](strict-software-run/report.lisp)
also passed with native kernel/NEON package absent, exit 0, stable sources.
Its separate 24 MiB ASDF cache was removed after completion. Final-source
[native](final-cache-native-1/report.lisp) → [software](final-cache-software/report.lisp)
→ [native](final-cache-native-2/report.lisp) fresh-process transitions all passed
with no force and stable sources.

Post-change comparison completed serially after validation, using the exact
unchanged baseline driver. [2.6.10 command](bench-2.6.10-command/report.lisp),
[2.6.9 command](bench-2.6.9-command/report.lisp): both exit 0, status OK,
SOURCE-CONSISTENCY STABLE. Both raw matrices completed 120 rows, three replicas
per configuration, all GET data, mutations and CSNs checked.
[Raw 2.6.10 samples](bench-2.6.10-run/result.lisp),
[raw 2.6.9 samples](bench-2.6.9-run/result.lisp).

[All 448 paired comparisons](comparison.csv),
[2.6.10 metrics](metrics-2.6.10/metrics.csv),
[2.6.9 metrics](metrics-2.6.9/metrics.csv),
[2.6.10 startup](metrics-2.6.10/startup.csv),
[2.6.9 startup](metrics-2.6.9/startup.csv).

## Before/after: canonical v2, 4096-byte CBOR payload

4099 encoded document bytes, warm local files, 512 keys, same 2-frame 4 KiB
image configuration. Percentiles pool the original raw ticks across three
replicas. Socket GET uses one persistent connection and one overall in-flight
request. Timers and full GET oracles remain inside the original driver calls.

| Runtime | Operation | Before calls/s | After calls/s | Factor | Before p50 us | After p50 us | Before p99 us | After p99 us |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| 2.6.10 | socket paged GET | 578 | 20,392 | 35.25x | 1558 | 47 | 3106 | 63 |
| 2.6.10 | strong PUT | 175 | 241 | 1.38x | 6103 | 4009 | 7693 | 5611 |
| 2.6.10 | strong DELETE | 209 | 250 | 1.19x | 4580 | 4000 | 6179 | 4225 |
| 2.6.10 | direct paged GET | 39,559 | 70,657 | 1.79x | 21 | 11 | 34 | 20 |
| 2.6.9 | socket paged GET | 585 | 20,532 | 35.11x | 1553 | 47 | 3092 | 63 |
| 2.6.9 | strong PUT | 178 | 239 | 1.35x | 6091 | 4005 | 9199 | 10913 |
| 2.6.9 | strong DELETE | 213 | 250 | 1.17x | 4582 | 3998 | 6166 | 4214 |
| 2.6.9 | direct paged GET | 71,183 | 70,972 | 1.00x | 11 | 11 | 20 | 20 |


The exact [baseline driver](../2026-10-31-local-index-bench/bench.lisp) will be
reused after checks, preserving payloads, budgets, replicas, warmups, per-call
oracles and timer costs. [Explicit driver hashes](driver-manifest.json).
See [baseline results and limits](../2026-10-31-local-index-bench/report.md).


All 288 service PING/hit/miss groups improved throughput: 29.2x–68.9x, across
both runtimes, formats, payload sizes, startup conditions and 1/4/8 connections.
The 2.6.9 before/after keeps native CRC on both sides; it independently confirms
the readiness gain without changing that runtime's checksum backend.

All 64 mutation groups improved aggregate throughput. Write tails are not
uniformly better: 14/64 grouped P99 values increased. Each write group contains
only 75 timed mutations, with strong filesystem synchronization and uncontrolled
external storage load. In the shown 2.6.9 PUT case P99 rises from 9.20 to 10.91 ms.
No write-tail SLO or removal of storage latency is claimed. Median strong writes
remain about 4 ms; no batching, weaker flush or changed acknowledgment is used.

[2.6.10 resource samples](metrics-2.6.10/resources.csv) show server CPU delta
median 0.09 s per complete case versus baseline 0.23 s, with the same operation
counts. RSS point samples were 156.91–158.45 MiB versus baseline 151.83–151.86 MiB.
2.6.9 RSS was 108.92–110.47 MiB. These are runtime/process point observations,
not peak RSS or paging memory savings; the complete resident index remains.

The [GET throughput component campaign](get-throughput-command/report.lisp)
also passed: [data](get-throughput-run/report.lisp), selected backend
`:ARM64-CRC32C`, 360 measured windows plus 72 embedded small self-test windows,
positive/empty allocation-sensor controls passed. The [GET worker campaign](get-workers-command/report.lisp)
passed all self-tests and 90 serial + 270 parallel windows:
[data](get-workers-run/report.lisp). An initial worker command used an invalid
output-directory prefix and was [rejected before measurement](attempt-get-worker-directory/report.lisp);
the corrected command retains the exact same parameters. No product change was
made to work around that tool guard.

## Scope and retention

This is local Apple M4/macOS ARM64 evidence. Desktop load and OS cache are
uncontrolled. Values fit RAM and files are recently written. The 8-connection
socket matrix is round-robin serial, not concurrent scaling. Compiler/backend
changes are identified in the 2.6.10 profile; driver code and budgets match.
One-microsecond timer granularity and allocator chunking limit per-call claims;
zero observed Lisp bytes do not measure native allocations or total RSS.
No cold-NVMe, beyond-RAM, Linux runtime, remote CI or power-loss qualification.
[Validation receipt](validation.lisp) verifies all archived command results,
source consistency, group/replica/sample counts and raw-tick vectors.


[All 144 component metric groups](component-metrics.csv) and
[campaign inventory](component-inventory.lisp) preserve the lower-level results.
For a 4096-byte segment GET/small CSN, selected native CRC reached about 441k/s
versus 145k/s with the explicitly rebound software kernel in the same 2.6.10
process. The separate oracle-heavy worker campaign reached 114.5k/s (one worker),
216.0k/s (two) and 415.3k/s (four). These exclude the service/socket and retain
the component driver's different oracle costs; they must not be substituted
for the end-to-end numbers above.

[Compaction receipt](compaction.lisp) records lossless compression of two raw
matrices from 9,148,003 to 1,180,187 bytes, with SHA-256 payload verification.
[Cleanup receipt](cleanup.lisp) records removal of byte-verified duplicates,
regenerable self-test fixtures and the private software ASDF cache. Unique
records and samples remain. Source files, images and data of other chats were
not modified or deleted. The managed worktree remains available for review.
