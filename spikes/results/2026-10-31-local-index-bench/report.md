# M1 index/service benchmarks — 2026-10-31

[Preregistered method](method.md), [driver](bench.lisp),
[driver hashes](driver-manifest.json). Installed SBCL 2.6.10, macOS ARM64,
Apple M4, 16 GiB RAM. Desktop/external load and OS page cache are uncontrolled.
Product code is unchanged since the successful local-service verification.
All work and fixtures belong to this isolated worktree.

## Standard suite

[Recorded command](standard-command/report.lisp):
`make SBCL=/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl spikes-bench`,
exit 0, status OK, SOURCE-CONSISTENCY STABLE.
[Full runner report](standard-runs/report.lisp), all eleven entries completed.

| Experiment | Scope | Result | Runner wall s |
|---|---|---|---:|
| SPK-01 | Primary-index prototype | measured | 1.793 |
| SPK-02 | GC/live set and threads | OK | 9.119 |
| SPK-03 | Group commit, fsync/fullfsync | OK | 1.851 |
| SPK-04 | Synthetic writer pool | OK | 1.165 |
| SPK-05 | Immutable reads, pread/mmap | OK | 3.724 |
| SPK-06 | Copy/compaction interference | OK | 20.162 |
| SPK-07 | Protocol models | correctness PASS; no timing campaign | 9.061 |
| SPK-08 | Generated-code kernels | measured | 6.044 |
| SPK-09 | CRC/integrity paths | OK | 6.319 |
| SPK-10 | Format-v2 component limits | OK | 4.542 |
| SPK-11 | Unix-session prototype | unsupported: no benchmark defined | 3.716 |

Runner wall time is orchestration duration, not a throughput measurement.
Each individual SPK file records its numerical results and qualifications.
SPK-07 runs its model checks even for --bench; it is not presented as measured
performance. SPK-11 is not presented as a successful benchmark. The dedicated
campaign below measures the real product server/client instead.

## Driver self-checks and development failures

The [final self-test](self-test-final-command/report.lisp) passed on both
canonical formats, including all 4/16/64 KiB image profiles and actual server
requests with 1/4/8 connections. Percentile arithmetic and a deliberate wrong
GET response are checked before measurements. It is not a performance result.

An initial driver syntax error is [retained](driver-initial-syntax-failure.log.gz).
An initial full-matrix attempt was correctly rejected by the product because
the driver omitted `:version 1` on reopening its v1 fixture:
[failed record](attempt-format-driver-command/report.lisp),
[failed result](attempt-format-driver/result.lisp). Fixed the driver's explicit
version propagation and expanded the self-test to both formats. No product
change or relaxed format check was made; that attempt produced no timing rows.

## Dedicated measurements

The SBCL 2.6.10 focused matrix passed: [record](focused-command/report.lisp),
exit 0, status OK, SOURCE-CONSISTENCY STABLE; [raw samples](focused-run/result.lisp).
120 rows = 72 engine cases + 48 service cases; each configuration has three
replicas. 224 pooled metric groups and 40 startup groups were independently
reduced from raw ticks, with exact group/replica/sample-count checks.

[All request metrics](metrics.csv) · [all startup timings](startup.csv) ·
[CPU/allocation/RSS records](resources.csv) · [structured summary](summary.lisp).
Request percentiles pool raw samples across three replicas; startup figures are
medians and ranges of three opens. Small write samples (75 per grouped case)
make write P99 indicative, not a production-tail qualification.

Representative canonical-v2, 4096-byte CBOR payload (4099 encoded bytes),
warm local files, SBCL 2.6.10/software CRC, driver-inclusive direct GET:

| Backend | Page KiB | GET/s | p50 us | p95 us | p99 us | measured Lisp bytes/call |
|---|---:|---:|---:|---:|---:|---:|
| current | 16 | 16,093 | 53 | 90 | 96 | 0 |
| current | 4 | 39,559 | 21 | 33 | 34 | 0 |
| current | 64 | 7,531 | 165 | 325 | 330 | 0 |
| resident | 4 | 134,518 | 7 | 8 | 8 | 0 |

The resident 4 KiB GET reached about 135k calls/s versus 40k through 4 KiB pages
in this profile. No speed advantage is claimed for paging. The full resident
index is still present. Individual zero-us samples are below the 1-us timer
resolution, not zero-cost operations. Zero allocation deltas are observed Lisp
counter differences; short client windows are especially sensitive to allocator
chunking and do not establish allocation-free behavior.

Representative service results in the same profile, one persistent connection:

| Startup mode | spawn-to-READY median ms | GET/s | GET p50 us | GET p99 us |
|---|---:|---:|---:|---:|
| resident | 573.4 | 581 | 1553 | 3089 |
| empty | 565.2 | 587 | 1553 | 3085 |
| current | 574.8 | 578 | 1558 | 3106 |
| stale | 563.6 | 596 | 1551 | 3088 |

The service's 1 ms idle sleep and client polling dominate these serial request
windows; the paging difference is much smaller at the socket boundary. Eight
connections are round-robin serial clients, not eight simultaneous requests.
For current-image startup, strong PUT p50 was 6.10 ms and DELETE 4.58 ms;
GET p50 about 1.56 ms. Point server RSS samples over the 2.6.10 campaign were
151.83–151.86 MiB, not peak memory. Median coarse server CPU delta was 0.23 s per
complete service case; full per-case CPU samples are in resources.csv.

## Runtime/backend comparison and component GET campaigns

The existing throughput and worker-performance campaigns passed on 2.6.10:
[throughput command](component-throughput-command/report.lisp),
[throughput data](component-throughput-run/report.lisp),
[performance command](component-performance-command/report.lisp),
[performance data](component-performance-run/report.lisp).
The throughput sensor detected 4,194,320 positive-allocation bytes and zero
empty-window bytes. The selected backend is explicitly `:LISP`.

The allowlist in `src/io/cpu-build.lisp` qualifies native ARM64 only for SBCL
2.6.9. A [supplementary comparison](component-method.md) repeats the exact focused
matrix and both GET component campaigns on that qualified runtime, without
forcing native code or editing product configuration. This separates reported
profiles, not causal effects: runtime/backend/packaging and campaign time differ.
The supplementary comparison passed in full: [focused command](focused-2.6.9-command/report.lisp),
[focused raw data](focused-2.6.9-run/result.lisp),
[GET throughput command](component-throughput-2.6.9-command/report.lisp),
[GET throughput data](component-throughput-2.6.9-run/report.lisp),
[GET worker command](component-performance-2.6.9-command/report.lisp),
[GET worker data](component-performance-2.6.9-run/report.lisp).
All recorded commands exited 0, status OK, SOURCE-CONSISTENCY STABLE.
Selected GET component backend is `:ARM64-CRC32C` on 2.6.9; `:LISP` on 2.6.10.
No allowlist or other product source was changed for these runs.

Both runtime profiles completed the same 120-case focused matrix: 240 cases,
448 pooled metric groups and 80 startup groups altogether.
[2.6.9 metrics](comparison-2.6.9/metrics.csv),
[startup](comparison-2.6.9/startup.csv),
[resource samples](comparison-2.6.9/resources.csv),
[structured reduction](comparison-2.6.9/summary.lisp).

Each runtime also passed 360 fixed-size throughput benchmark windows plus 72
embedded small self-test windows, and 90 serial + 270 parallel worker benchmark
windows with its self-tests. Thus 1,440 component benchmark windows were run,
plus 144 small throughput self-test windows. Allocation-sensor controls passed
on both runtimes. [Campaign inventory](component-inventory.lisp),
[all 288 component metric groups](component-metrics.csv).

### Runtime profiles, same v2 / 4096-byte payload

| Runtime / default CRC | Engine resident GET/s | Engine 4 KiB paged GET/s | Service paged GET/s | Service paged GET p99 ms | Engine paged startup median ms | Service paged startup median ms |
|---|---:|---:|---:|---:|---:|---:|
| 2.6.10 / Lisp | 134,518 | 39,559 | 578 | 3.11 | 36.95 | 574.82 |
| 2.6.9 / ARM64 native | 360,824 | 71,183 | 585 | 3.09 | 18.98 | 693.96 |

These are observed combined profiles, not a causal compiler comparison or an SLO.
Native 2.6.9 is faster in the direct GET cases, while socket GET stays near
585 calls/s with p50 around 1.55 ms. The service waits/polling dominate that
serial workload. Spawn-to-READY includes process/runtime/library loading and
cannot be substituted for the engine-only startup number. Three samples are
not sufficient to resolve small startup differences reliably.

Point server RSS on 2.6.9 was 108.97–110.52 MiB, versus 151.83–151.86 MiB in the
2.6.10 run. This compares installed runtime/build profiles and point samples,
not paging memory savings or peak RSS; both keep the complete resident index.

Within SBCL 2.6.9 itself, the existing component throughput driver measured a
4096-byte segment GET at about 438k/s with selected native CRC versus 136k/s
with its explicitly rebound software CRC. The 2.6.10 selected/software cases
were both near 145k/s, consistent with the documented fallback. This is the
lower-level throughput driver, excluding transport; it differs from the
full-engine driver and the oracle-heavy worker driver.

In that separate oracle-heavy native component campaign, segment GET scaled
from about 94.5k/s with one worker to 180.7k/s with two and 349.6k/s with four
(4096-byte value, small CSN). Thread setup is inside parallel windows; heap
counts cover the whole process. These are component/shared-fixture worker
measurements, not concurrent M1 service or multiseries qualification.

The practical open item is qualification of native CRC for SBCL 2.6.10 before
changing its safe software fallback. This campaign does not grant that
qualification or change product behavior.

## Limits and retention

Only local measured behavior is in scope. Full resident index remains allocated;
no memory saving, cold-cache NVMe rate, concurrency scaling, production tail SLO,
power-loss or beyond-RAM qualification is inferred. Client/engine driver checks
and per-call timer overhead are included in reported request windows. RSS values
are point samples; allocation counts cover Lisp memory only.

Lossless compaction reduced the two focused sample files from 9,869,736 to
1,401,261 bytes, retaining descriptors and SHA-256 checks. Unique records and
all samples remain; successful temporary datasets were removed by their owner.
Failed driver-fixture data is removed only after its diagnostic record is saved.


[Archive validation](archive-validation.lisp) checks all ten command records,
the two raw matrices, reductions, raw-tick lengths, source consistency and
compressed payload hashes. The retained driver failure is explicitly expected.
[Cleanup receipt](cleanup.lisp) records removal of verified duplicate outputs and
the failed uniquely owned fixture; unique evidence and other worktrees remain.

Normal command snapshots exclude `spikes/results/`; the driver manifest records
SHA-256/Git blob hashes of the benchmark driver and original method, rechecked
after both runtime runs. Postprocessing helper hashes are also retained.
