<a id="control-metodo-del-benchmark-nativo-c4"></a>

# CONTROL: native C4 benchmark method

> **Decided (author request, 2026-10-14)** — sidecar in the shared
> `control-verifica` checkout; writing is limited to this method and
> `tools/control-checkpoint-bench.lisp`. Compilation, runs, tests, coverage,
> and commits belong to central runtime after source freeze.

<a id="domanda-e-campione"></a>

## Question and sample

What is the combined cost of `prepara-checkpoint-control` and
`pubblica-control-recuperato` on local native files, with one, two, or four
workers and independent Serie? The measured path includes preflight and
the preparation step's internal reread, verified rename onto
`control.log`, and fsyncs required by both APIs. The ACTIVE and CONTROL plan
come from real factories and are constructed before the clock starts.

Fixed sample: versions 1 and 2, workers 1/2/4, five replicates per
combination, thirty windows. Every worker publishes eight distinct checkpoints
per window: `2 × 5 × (1 + 2 + 4) × 8 = 560` requested publications.
No warmup, adaptive counts, or performance thresholds.
Order: version, worker count, replicate; windows run serially.

<a id="fixture-e-separazione"></a>

## Fixtures and separation

Every window creates a new directory; each worker has a private 0700
root with eight 0700 case directories. Every case owns its files, FDs, scratch,
registries, GET view, index, ACTIVE, plan, and preparation result.
Serie identity differs across workers and windows; the eight cases of the same
worker are isolated instances of the same initial logical history, without
mutable-object sharing. No replicate reuses fixtures or tokens.

Setup uses `prepara-segmento-attivo`, `scrivi-valore-edit`, and
`crea-checkpoint-control`, without loading `arcdocdb/tests` or `tests/control`.
Old ACTIVE 1 has a durable canonical header. The previous CONTROL
contains a complete EDIT, ACTIVE 1, next-id 2, and a valid SEAL. It is written to an exclusive
temporary file, synchronized, installed as `control.log`, and then reread and rebuilt after the parent
directory is synchronized. The read-only FD for the old
CONTROL stays open during the swap.

New ACTIVE 2 is header-only and durable. The new complete EDIT declares
ACTIVE 2, next-id 3, and CLOSED 1 with valid-bytes 64 and zero closure outcomes;
it declares no REMOVED. The old header-only ACTIVE is therefore closed in
the manifest, with its entire durable 64-byte prefix preserved. The workload
performs no reclamation.
`control.log.tmp` starts empty with separate append and read-only FDs of the same
physical identity. The new plan has a CONTROL header, complete EDIT, and SEAL
constructed and validated by the product. `previous-control.bytes` and
`planned-control.bytes` preserve canonical inputs outside the clock.

The benchmark uses `pubblica-control-recuperato`, the generic entry present
in the checkout. The caller attests fixture authority and ADR-0040-consistent
transition: previous ACTIVE 1, header and frontier 64, CLOSED 1/64
without outcomes, new ACTIVE 2, next-id 3, no removals. The generic call
is not presented as independent proof of authority. The future API
`pubblica-control-validato` will be integrated by the coordinator after delivery;
sidecar does not depend on it or modify ASDF.

The CLI accepts only `spikes/out/control-checkpoint-bench-X/`, X with
1..64 ASCII alphanumeric, hyphen, or underscore characters. No equivalent
path with `..`, additional slashes, or a different prefix is accepted.
LSTAT checks ancestors from the root without following symlinks; root mkdir is
exclusive, and EEXIST fails. Stat checks distinguish directories,
new/old ACTIVE, and new/old CONTROL, without inode aliases between cases.
LSTAT does not protect against an external actor changing ancestors between
check and use: the namespace must stay reserved during the campaign.

<a id="clock-heap-e-deadline"></a>

## Clock, heap allocation, and deadlines

Excluded: product loading/compilation, fixture construction,
ACTIVE preparation, plan encoding, setup/evidence byte
writes, explicit GC, and final oracles. One `sb-ext:gc :full t`
precedes every window, in the same position for all variants.
CONTROL writes by `prepara-checkpoint-control` are included.

The wall clock uses `get-internal-real-time`. The one-worker case directly
executes eight call pairs; in parallel cases, the clock includes
thread startup, ready gate, start gate, and joins. Counters and cooperative
checks are included. This is not an isolated syscall measurement.

`sb-ext:get-bytes-consed` measures bytes allocated by the entire process in
the window, including coordination and workers. It measures neither live heap, RSS, nor
single-worker memory. No zero-heap-allocation criterion or inference
of DB throughput, percentile, or universal nonallocation.

Each window has a cooperative 60-second deadline; the campaign has
600 seconds including setup, loading, hashing, oracles, and persistence. Gate and
join waits are bounded by the same window deadline. A blocked syscall
is not interrupted: the central recorder must impose an external
process-lifetime limit. No terminate-thread, asynchronous
timeouts, retries, or rollback.

Timeouts, represented by C4 `bench-deadline` conditions, are classified as `:incomplete`;
errors and failed oracles are classified as `:failed`. Retain attempted,
prepared, and actually-returned publications, even for partial
prefixes. Capabilities are closed only after global quiescence. If
a worker remains live, no fixture FD is closed and no new report
checkpoint is opened: resources remain until OS exit.
All files remain in the namespace as evidence, including on failure.

<a id="oracoli-fuori-clock"></a>

<a id="oracles-outside-clock"></a>

## Oracles outside the clock

For every returned publication after quiescence:

- `control.log` is a regular file without hardlinks, EOF and bytes identical
  to the plan; LSTAT before and after the read attests the same identity;
- the CONTROL header is verified and the recovery manifest is rebuilt from installed-file
  bytes: complete prefix, expected version, ACTIVE 2,
  next-id 3, CLOSED 1 with valid-bytes 64 and zero outcomes, no REMOVED;
- the installed name points to the new CONTROL inode, different from
  the previous one; `control.log.tmp` is absent;
- the old FD remains readable, with bytes equal to the previous CONTROL, recovery
  still valid for ACTIVE 1;
- new and previous ACTIVE retain header, bytes, version, origin,
  identity, and size 64; the directory is identical and has mode 0700;
- open capabilities, modes, FDs, inodes, offsets, and frontiers are compared with
  baseline; only new CONTROL advances to exact plan length;
- `:published` state with observed rename, the result is bound to the same
  ACTIVE and open canonical log of the same writer.

Native verification with stat/fstat is independent of product identity
APIs. Readback also checks worker-root identity and 0700
mode; roots have independent inodes. The parent directory's size is not
treated as a log frontier: rename changes directory
entries. Old CONTROL inode must have zero link count,
remaining readable through kept-open FDs. No global function is replaced to construct an
oracle or fault. The test attests to observed final conditions; it neither
observes every intermediate state nor demonstrates power-loss resistance.

<a id="report-ed-evidenza-canonica"></a>

## Report and canonical evidence

`report.lisp` is a schema-1 data plist, readable with `*read-eval* nil`.
The root retains versions, readers, replicates, count, seconds, heap-bytes,
windows, workers, results, limits, and readback. Every window has the same
fields: version/readers/replicate, counts, duration, heap allocation, worker records,
diagnostics, limits, oracle state. Each worker record retains
attempted/prepared/count prefix, termination, error-kind, results, and
readback. Zero root counts before load mean progress is still
zero; they are not a product zero-heap-allocation measurement.

The report is written to a temporary file, renamed, and reread as data before
acceptance. `report.sha256` identifies canonical report bytes;
every successful result includes SHA-256 of installed CONTROL. Hashes
use the common `tools/evidence-storage.lisp` reader outside the clock. Source
inputs have before/after SHA-256 snapshots, with a conservative inventory
of recursive `src/*.lisp`, ASD, driver, method, and evidence helper.
Comparison does not continuously monitor source opens. The external
recorder must preserve revision, Git state, argv, environment,
original stdout/stderr, and the process's actual exit.
The SHA descriptor is also regenerated when a late state requires new
persistence; its readback checks bytes. Before SHA-helper
loading, failure may leave only report and recorder
output without final hash. A persistence fault is explicit:
stdout and the actual exit are still needed to read the latest outcome.

Loading uses a private FASL cache inside the run and ASDF `:force t`;
no test-op. Warnings and style-warnings are fatal; only
`SB-KERNEL:REDEFINITION-WARNING` is caught, recorded, and muffled as
a loading exception. The deadline is rechecked after persistence and
stdout: nonzero actual exit overrides text emitted just before budget
exhaustion. No report durability through fsync is claimed;
readback attests to content available in the local filesystem.

<a id="comandi-previsti-dopo-freeze"></a>

## Planned commands after freeze

From the frozen checkout, in separate processes recorded by central runtime:

```sh
sbcl --no-userinit --no-sysinit --script tools/control-checkpoint-bench.lisp --self-test
sbcl --no-userinit --no-sysinit --script tools/control-checkpoint-bench.lisp --bench spikes/out/control-checkpoint-bench-X/
```

The self-test is a pure classifier: complete and partial examples, duplicate
cell, duplicate worker, valid prefix, over-limit counts, typed
timeouts, worker errors, failed readback, late window and exit,
error precedence over timeouts, literal namespace, inode aliases, and
serialization. It produces one stdout record without the product, child
processes, threads, or native fixtures. It certifies neither product compilation nor
syscalls and is not run inside the benchmark process.

<a id="dati-aperti-limiti-e-consegna"></a>

## Open data, limits, and delivery

No compilation, tests, benchmark, coverage, or commits were performed
during drafting. No measured rates or performance results
to publish. Forced-load warnings, factory arities and
types in frozen checkout, SHA-tool availability, and actual
macOS/Linux durations remain to be observed. New-module ASDF/coverage
integration remains the coordinator's responsibility.
The four-worker workload retains up to 288 simultaneous fixture FDs,
besides runtime and recorder FDs: the process limit must
allow it. Common hashing also starts child processes outside the clock;
any blocking falls under recorder's external limit. After a deadline
already declared failed, finalization may complete hashes and persistence
with final actual-exit checks; 600 seconds is not a hard limit.

The data remain open: no invented threshold, no imputation for missing
windows, no promotion of partial prefixes to a complete
campaign. Native files, canonical evidence, private cache, and reports
remain inspectable in the exclusive namespace. The local filesystem and
OS cache are hot; external load is uncontrolled. Eight cases per
worker represent neither a latency distribution nor engine-rotation
history. Catalog, CLOSED inventory, multiseries decisions,
server adoption, client admission, and reclamation are outside the workload.
