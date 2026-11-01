# Unix actor output scheduling — preregistered method

Base: `904b0e216c19076c120344c896da59ce9dcec127`, 2026-11-01. This base
integrates the completed owner-local histogram component without changing the
service loop. Record the baseline before editing the product scheduler.

Hypothesis: a freshly encoded response waits for another accept/slot scan before
its first send. Measure this residence with the public histogram primitive in a
C4 adapter. If supported, try one bounded output phase after dispatch. A slot
already in WELCOME/RESPONSE at the start of its input visit must not get a second
send attempt. Recheck the original absolute deadline immediately before every
attempt. Preserve FIFO strong publication, write barriers, fairness, error and
nonlocal-exit cleanup, and release of engine pins before peer I/O. No protocol,
persistent format, thread, peer-wait timer or admission change is intended.

Use the same hashed Lisp parent/server drivers before and after. One parent owner
maintains 1/2/4/8 synchronous handles, sends one request on each, then receives each
correlated reply in order. These are closed-loop bursts with one outstanding
request per connection, **not** independent natural arrivals or concurrent engine
readers. No server cohort gate or ninth control connection. Client latency starts
before encoding/sending and ends after correlated decoding; receive order and
burst scheduling are included. Throughput uses actual operations/window wall time
and actual returned document bytes, never reciprocal P50. Canonical CBOR documents
are 64/1,024/60,000 serialized bytes.

Read matrix: formats 1/2 × resident/paged × three sizes × 1/2/4/8 connections
(48 cases). Mixed matrix: format 2, 1,024 bytes, both modes, all connection counts,
95/5 and 50/50 GET/strong PUT (16 cases). Two additional 8-connection 50/50 cases
force small segment/record limits to exercise maintenance. Each case has five
windows of 400 rounds per connection. Eight disjoint keys belong to each client;
the fixed stride-7 schedule spreads writes across peers. Check every document,
every acknowledged CSN as a consecutive global interval, every per-key version
after each window, and the server's strong frontier. Warmup and seed operations
are outside windows. Preserve raw latency and CSN vectors and all child logs.

Use tick histograms, precision 7, explicit runtime tick frequency/domain and a
60-second range. Verify client nearest-rank P50/P95/P99/P99.9 against inclusive
histogram bounds; require complete, unsaturated snapshots. These populations
support empirical quantiles only, not a production tail SLO. Server phases
overlap: dispatch includes engine work; percentiles must not be added or averaged.

Main matrix has detailed profiling disabled. A separate calibration uses format
2, both modes, 1,024/60,000 bytes, 1/8 connections, six windows alternating
profiling off/on in the same engine and sockets. Count-only strong-group observer
and C4 PING control remain in both modes. Arm recording only after the control
reply drains; stop at the next control PING dispatch, before validation queries.
Server CPU/allocation and phase counters include the bounded stop-PING ingress
and boundary polling; detailed snapshots/log serialization happen after capture.
Profile accept, dispatch, engine read, transfer, readiness wait and response queue
residence. Record profiler overhead; main throughput claims use the unprofiled
matrix. External host load and OS cache are uncontrolled, physical disk bandwidth
and power-loss durability are not qualified.

After a justified implementation, run focused deterministic scheduling tests,
the complete existing correctness/spike campaigns on SBCL 2.6.9, strict full
qualification on 2.6.10, and complete docs checks on frozen product sources.
Retain failures and anomalous windows. Verify raw copies and lossless compressed
archives before removing only this worktree's generated files and exact failed
fixtures. Commit/push main without moving or deleting another chat's branches.

## Evidence-driven amendment before product edits

The unchanged-code matrix completed 66 cases/330 windows/512,000 operations;
calibration completed eight cases/48 windows/86,400 operations. In the profiled
60,000-byte single-connection cases, queue-to-drained P50 is 126–132 microseconds,
engine read P50 is 19–26 microseconds, and accept calls approach 18 per completed
request. This residence includes partial sends and backpressure, not just the
first-send delay. The host reports both Unix stream send/receive defaults as
8,192 bytes. The local SDK declares the socket-option ABI and Darwin constants.

Test a finite full-frame kernel-buffer reservation **before** changing actor
scheduling. At socket acquisition/configuration, inspect send and receive grants;
raise only grants below 65,540 bytes (maximum M1 body plus prefix), verify the
effective grant, and preserve larger existing grants. Bound the operation to two
directions, one optional set and one readback each. Keep the existing nonblocking,
single-transfer-per-slot actor, deadlines and cleanup. All new syscalls stay in
the injectable native I/O boundary, with captured errno and no retries. Allocation
or readback failure must close the newly acquired FD exactly once before exposure.
Linux may report doubled grants; kernel accounting is separate from Lisp memory.

First rerun the identical calibration driver on this private candidate. If it
reduces fragmentation/residence, qualify that focused change and repeat the full
identical main matrix. Retain the original scheduling hypothesis as deferred;
avoid adding a second phase without an independent measured need. Record native
positive/error/size/readback/cleanup boundaries and the complete existing native,
actor, framing, strong-commit and real-process campaigns on both Lisp runtimes.

## Integration of the concurrently completed remote main

The increment completed full 2.6.9 check-core, strict full 2.6.10, documentation,
focused tests and exact source identity before merging remote main `2acefea`.
That committed main adds the offline backup component, optional I/O backend
callbacks, capability-relative directory operations and a borrowed-directory
verification boundary. It does not edit the Unix native transport or actor.

Preserve both independent histories. Merge only that committed state in this
worktree; leave other worktrees/branches intact. Reconcile the catalog to sixty
suites (including metrics and backup), and update the existing backup integration
spike to the combined catalog. Reuse its warning-as-error forced product build
and affected backup, verifier, metrics, native/wire/actor/client and actual Unix
process suites on both runtimes. Repeat the identical 66-case unprofiled matrix
on the integrated tree. Rebuild/verify all docs and run the CI/source audits.
Retain the earlier full-suite identity and the exact combined-source integration
identity separately; do not relabel affected-suite integration as a second
whole-repository full run. The server retains one transfer per slot/turn.

During publication the other completed work advanced main again. Preserve the
closed scope, merge committed `5c0a5a1` metrics/counter aggregation, and rerun the
affected integration spike on both runtimes, docs, CI and static audits. Reuse
the original trusted benchmark definitions without its all-case entry point for
four 60,000-byte format-2 resident/paged 1/8-connection controls (five windows,
400 rounds): unchanged original driver/server/common hashes, independent latency,
CSN/version/server oracles and an explicitly hashed selection adapter. This is
a selected final control, not another 66-case campaign.

Then reconcile `dc8e3fc`'s offline-only exact-buffer comparison. Its seven
changed non-result paths are explicit in the final identity; compare earlier
sources outside exactly that set, and force fresh product builds plus the
affected offline suites on both runtimes. Repeat final docs/CI/static audits.
The final product difference against that upstream is only the already fully
qualified Unix native file. Retain late command bytes and failed loader variant
in their own closure, then clean only the newly regenerated owned paths.
