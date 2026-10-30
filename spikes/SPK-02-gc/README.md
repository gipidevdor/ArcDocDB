<a id="spk-02--gc-di-sbcl-sotto-carico"></a>

# SPK-02 — SBCL GC under load

> **Proposed** — Phase-0 experiment, class C4. Synthetic method to evaluate ADR-0024,
> ADR-0043, and ADR-0045; neither production code nor verification of ADR-0028 minima.
> The author confirmed ADR-0028/0030.

<a id="domanda"></a>

## Question

How do collection times vary with live memory in one large specialized array,
256 KiB fragments, replaced fragments, and foreign memory? How do allocation
rate and number of active or semaphore-waiting workers affect them?

<a id="metodo-previsto-prima-dellesecuzione"></a>

## Method planned before execution

- Package `arcdocdb.spk02`, APIs `(check)` and `(benchmark &key ...)`, Common Lisp and
  SBCL facilities only, `safety 3`, no external dependencies.
- Default live payload: 128 MiB, configurable in bytes. Four layouts:
  `:heap-large`, `:heap-fragments`, `:heap-replacement`, and `:foreign`. First three
  use `(unsigned-byte 8)` arrays; foreign comparison uses
  `sb-alien:make-alien`/`free-alien`, always with `unwind-protect`. Pages touched
  before measurement; last fragment may be smaller.
- A controller is the sole intentional allocator: injects 64 KiB transient payloads
  at requested aggregate rates of 0, 4 MiB/s, and 128 MiB/s. Reports actual bytes
  produced and observed rate, without assuming the requested rate was reached.
  A bounded ring retains recent payloads. In replacement cases, the controller
  replaces one fragment per step, with a declared bound. Workers repeat numerical
  work on private buffers or await a semaphore: they are not the ArcDocDB engine
  and do not access payload. No zero-allocation claim for workers: measured process
  allocation in the window is reported, including instrumentation. Requested zero
  rate concerns payload injection; replacements are separate.
- Sequential campaign with 1, 16, and 64 workers; 256 optional. Report also includes
  process thread count when the ready barrier completes. Per layout:
  three rates with active workers and zero rate with waiting workers. Excluded
  configurations are declared: this is not a full factorial matrix.
- Startup with mutex-protected state, ready/start semaphores, and running confirmation;
  cooperative stop, worker wakeup, and join of every thread including error paths.
  Worker errors retained and propagated.
- After warmup, separately measure requested collections with `(sb-ext:gc :gen 0)`
  and `(sb-ext:gc :full t)`, then an automatic-GC window. `:gen 0` may collect older
  generations too. Preserve and restore `sb-ext:bytes-consed-between-gcs`.
- Samples in preallocated vectors, no sample lists on measured path. P50/P99 use
  nearest rank: sorted element at `ceil(p * count)`, counting from 1. Full vectors
  report discarded samples; quantiles describe retained prefix; maximum also
  includes discarded samples. Workers retain 256 latencies/delays each: saturation
  may yield quantiles unrepresentative of the final phase. No samples means `nil`,
  not zero. No P99.9 estimate from this short campaign.

<a id="che-cosa-viene-misurato"></a>

## What is measured

`sb-ext:*gc-real-time*` is runtime cumulative collection wall time.
Measure deltas, without resetting or dynamically binding the counter.
Reads repeat if the epoch changes between first and final read; 32 attempts
without a consistent snapshot signal an error. Wall time around `gc` includes
call, coordination, and other runtime work; it is not the duration of all-thread
stoppage. SBCL 2.6.9 updates the counter in the collection phase after stopping
the world: deltas do **not** measure the complete stop/resume protocol.
Reports explicitly distinguish `:forced-gc` and `:automatic-gc`, with
`:exact-stop-world-time nil`.
[SBCL manual](https://www.sbcl.org/manual/#Introspection-and-Tuning),
[SBCL 2.6.9 implementation](https://github.com/sbcl/sbcl/blob/sbcl-2.6.9/src/code/gc.lisp).

To detect collections with zero delta too, introspect `SB-KERNEL::*GC-EPOCH*`.
This is an internal interface: the spike declares detected capability and rejects
measurement if absent. An identity change between observations detects **one or more**
collections, not their exact count. Automatic quantiles are therefore **cumulative
deltas per window with collection**, not a guaranteed distribution of individual
pauses. Collections during thread exit and preparation are excluded from campaign windows.

Worker inter-request delays and latencies include scheduling and CPU contention;
they are not attributed entirely to GC. Clock, counter-read, and recording costs
are measured separately as benchmark overhead, not subtracted from GC samples.
Also report total collection time in window and minimum observed-window frequency,
without inventing collection counts.

<a id="limiti-e-risorse"></a>

## Limits and resources

> **Proposed** — Defaults: cooperative 12-second campaign budget, 80 ms automatic
> windows, three samples per forced GC, requested 4 MiB nursery. Aim for roughly
> 15 seconds including preparation/check, with live payload below 1 GiB.
> Stop starting cases at budget; an ongoing collection or join may exceed it.
> Actual duration, omitted cases, and truncated cases are reported, not time-guaranteed.

Configurable payload is limited to 512 MiB. Samples, transient ring, and replacement
count are bounded. This limits spike data, not RSS: runtime, stacks, collector pages,
and foreign allocator need extra memory. Controller serializes load injection and
measurement. Group mutex serializes state transitions, error reads, and worker stop
polling between batches: it may affect scheduling delays and is not fully included
in controller-only baseline. This harness protocol introduces no inter-Serie product
locks (INV-P6).

Small sizes do not represent the tens-of-GB heaps in the original plan.
Semaphore waiting does not reproduce every I/O call. Three forced samples and short
windows diagnose instrumentation; dedicated campaigns are needed for distribution
tails. No macOS conclusion transfers to reference Linux hardware.

<a id="ambiente-e-comandi"></a>

## Environment and commands

Output records SBCL version, operating system, machine, collector features,
clock resolution, dynamic space, and actual nursery. For reproducibility,
also record hardware, RAM, external load, and command; run measurements serially.

```sh
# Only a small, fast deterministic check.
sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-02-gc/run.lisp --check

# Default campaign: includes check; run serially.
sbcl --noinform --no-userinit --no-sysinit --dynamic-space-size 768 \
  --script spikes/SPK-02-gc/run.lisp --bench

# Short diagnostic, small payload, one worker.
sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-02-gc/run.lisp \
  --bench --live-mib=2 --threads=1 --budget-ms=1000 --case-ms=10 --forced-samples=1

# Example Lisp customization after loading core.fasl.
# (arcdocdb.spk02:benchmark :live-bytes (* 256 1024 1024)
#   :thread-counts '(1 16 64 256) :budget-seconds 12 :case-seconds 0.08d0)
```

`run.lisp` resolves `core.lisp` relative to `*load-truename*`, compiles
`out/core.fasl` with fatal warning/style-warning, and writes one readable
s-expression plist. Errors: `:status :error` plist and nonzero exit code.
Local `out/` artifacts are Git-ignored.

<a id="risultato"></a>

## Result

README written before execution. On 2026-10-08, SBCL 2.6.9, Darwin/ARM64,
`--check` passed with warning/style-warning-free compilation. Fixtures verify
quantiles/overflow, array contents and replacement, retention across GC, foreign
release on error, barriers, stop/join, worker-error propagation, and counter
distinctions. Runner also executed from `/tmp` with absolute path.

Only the short diagnostic ran with `--bench --live-mib=2
--threads=1 --budget-ms=1000 --case-ms=10 --forced-samples=1`:
16 completed cases across four layouts, every worker joined, one readable plist
on stdout. Internal campaign counter `:actual-wall-ms` measured **265.231 ms**;
this includes campaign preparation and measurement, excludes compilation,
check, and final printing. Four automatic-GC windows were observed:
exact collection count cannot be inferred. Local output: `out/diagnostic.sexp`.
This verifies the harness path with small inputs, not reference-hardware performance.

The default 128 MiB campaign, 16/64-worker profiles, and optional 256-worker profile
were not measured in this diagnostic. Measurements run serially. Actual default
duration and memory are therefore unverified; budgets and limits above are parameters.

No architectural bug was demonstrated. Verification of ADR-0024/0045 remains limited:
collection-counter deltas and `:forced-gc` duration cannot certify full stop/resume
pause or ADR-0028's P99.9 criterion. Further measurements in the intended environment
are required.

Related requirements: REQ-SIM-001, REQ-SIM-002, REQ-OBS-001, REQ-BEN-001,
REQ-BEN-002, REQ-AFF-003, REQ-AFF-008, and REQ-AFF-016. No requirement changes
or changes to `docs/`; traceability and evaluation updates belong to integration.
