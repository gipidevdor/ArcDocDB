# Local index/service benchmark method — 2026-10-31

Prerecorded scope: all eleven existing Phase-0 benchmark entries, plus a focused
engine/service campaign for the new startup-discovery integration. Use installed
SBCL 2.6.10, safety 3, local macOS ARM64. Run campaigns serially. Other desktop
load is uncontrolled; no comparison with a different DB or reference hardware.

Focused matrix: canonical versions 1/2, CBOR byte-string payloads 1024/4096 B,
512 live keys, three replicas. Seed canonical storage through durable product
PUT, build 4/16/64 KiB images through the engine API, close it, then copy the
closed fixture for each case. Modes: resident, discovery without images,
discovery current images, discovery stale images (one extra committed PUT).
Engine current-image cases also exercise all three page sizes. Rotate mode
order between replicas. No image, source or live directory belonging to another
chat is read or modified.

Engine: time canonical open/recovery (wall, process CPU, Lisp bytes), verify
actual selected backend, then 1000 warmups and 10000 GETs each for hit/miss.
Measure batch wall/CPU, Lisp allocations and GC. Buffers/keys exist before the
window; successful-path status/length checks are inside it. Full document
oracle before/after. This is driver-inclusive engine throughput, not raw-kernel
latency. Record individual GET latencies separately via a preallocated vector.

Service: a real CLI server in a distinct process, persistent product client(s)
in the driver process. Time spawn-to-READY separately from connection setup and request
windows; it includes Lisp/process loading and polling, not just engine recovery.
Measure PING, GET hit/miss with 1/4/8 connections (round-robin serial requests,
one overall in-flight request; this is not concurrent scaling). 50 warmups,
300 samples per read window. Measure 25 PUT updates and 25 DELETEs after reads;
acknowledgments retain the product's strong-durability contract. Check every
response/CSN, including full GET content inside each timed driver call. Thus
request percentiles include the driver oracle as well as product client/server. Report p50/p95/p99,
batch throughput including driver/oracles, client CPU/Lisp allocations/GC.
Take server CPU/RSS snapshots before and after measured requests; CPU is a
coarse OS counter, RSS is a point sample, neither a peak nor a RAM bound.

All windows have bounded iteration counts; the focused run has a 900 s timeout.
Create files only in uniquely owned fixtures; retain failed diagnostics and
remove successful datasets after saving results. Store all raw sample vectors.
Self-test uses smaller counts and demonstrates bad-response detection plus
percentile arithmetic before timing. No successful performance claim before run.

Limitations: recently written files and uncontrolled OS cache, complete resident
index still allocated, small datasets fit RAM, allocation excludes native memory,
external load/scheduling not controlled. No cold-NVMe, beyond-RAM, multiseries,
concurrent-client scaling, power-loss, production percentile SLO or remote-CI
qualification. The unimplemented SPK-11 benchmark must be reported as unsupported;
its correctness runner is not a substitute for a performance result.
