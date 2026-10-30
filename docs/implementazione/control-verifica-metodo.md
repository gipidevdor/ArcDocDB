<a id="control-metodo-del-benchmark-nativo-c4"></a>

# CONTROL: native C4 benchmark method

> **Decided (author request, 2026-10-14)** — sidecar in shared
> `control-verifica` checkout; writing limited to this method and
> `tools/control-checkpoint-bench.lisp`. Compilation, runs, tests, coverage,
> and commits belong to central runtime after source freeze.

<a id="domanda-e-campione"></a>

## Question and sample

What is combined cost of `prepara-checkpoint-control` and
`pubblica-control-recuperato` on local native files, with one, two, or four
workers and independent Serie? Measured path includes preflight and
preparation's internal reread, verified rename onto
`control.log`, and fsyncs required by both APIs. ACTIVE and CONTROL plan
come from real factories, constructed before clock.

Fixed sample: versions 1 and 2, workers 1/2/4, five replicates per
combination, thirty windows. Every worker publishes eight distinct checkpoints
per window: `2 × 5 × (1 + 2 + 4) × 8 = 560` requested publications.
No warmup, adaptive counts, or performance thresholds.
Order: version, worker count, replicate; windows serial.

<a id="fixture-e-separazione"></a>

## Fixtures and separation

Every window creates new directory; each worker has private 0700
root with eight 0700 case directories. Every case owns its files, FDs, scratch,
registries, GET view, index, ACTIVE, plan, and preparation result.
Serie identity differs across workers and windows; eight cases of same
worker are isolated instances of same initial logical history, without
mutable-object sharing. No replicate reuses fixtures or tokens.

Setup uses `prepara-segmento-attivo`, `scrivi-valore-edit`, and
`crea-checkpoint-control`, without loading `arcdocdb/tests` or `tests/control`.
Old ACTIVE 1 has durable canonical header. Previous CONTROL
contains complete EDIT, ACTIVE 1, next-id 2, and valid SEAL: written to exclusive
temporary, synchronized, installed as `control.log`, parent
synchronized, reread, and rebuilt. Read-only FD for old
CONTROL stays open during swap.

New ACTIVE 2 header-only and durable. New complete EDIT declares
ACTIVE 2, next-id 3, and CLOSED 1 with valid-bytes 64 and zero closure outcomes;
declares no REMOVED. Old header-only ACTIVE therefore closed in
manifest, with entire durable 64-byte prefix preserved. Workload
performs no reclamation.
`control.log.tmp` starts empty with separate append and read-only FDs of same
physical identity. New plan has CONTROL header, complete EDIT, and SEAL
constructed and validated by product. `previous-control.bytes` and
`planned-control.bytes` preserve canonical inputs outside clock.

Benchmark uses `pubblica-control-recuperato`, generic entry present
in checkout. Caller attests fixture authority and ADR-0040-consistent
transition: previous ACTIVE 1, header and frontier 64, CLOSED 1/64
without outcomes, new ACTIVE 2, next-id 3, no removals. Generic call
not presented as independent proof of authority. Future API
`pubblica-control-validato` will be integrated by coordinator after delivery;
sidecar does not depend on it or modify ASDF.

CLI accepts only `spikes/out/control-checkpoint-bench-X/`, X with
1..64 ASCII alphanumeric, hyphen, or underscore characters. No equivalent
path with `..`, additional slashes, or different prefix accepted.
LSTAT checks ancestors from root without following symlinks; root mkdir
exclusive, EEXIST fails. Stat checks distinguish directories,
new/old ACTIVE, and new/old CONTROL, without inode aliases between cases.
LSTAT does not protect against external actor changing ancestors between
check and use: namespace must stay reserved during campaign.

<a id="clock-heap-e-deadline"></a>

## Clock, heap allocation, and deadlines

Excluded: product loading/compilation, fixture construction,
ACTIVE preparation, plan encoding, setup/evidence byte
writes, explicit GC, and final oracles. One `sb-ext:gc :full t`
precedes every window, same position for all variants.
CONTROL writes by `prepara-checkpoint-control` included.

Wall clock uses `get-internal-real-time`. One-worker case directly
executes eight call pairs; in parallel cases, clock includes
thread startup, ready gate, start gate, and joins. Counters and cooperative
checks included. Not isolated syscall measurement.

`sb-ext:get-bytes-consed` measures bytes allocated by entire process in
window, including coordination and workers. Measures neither live heap, RSS, nor
single-worker memory. No zero-heap-allocation criterion or inference
of DB throughput, percentile, or universal nonallocation.

Each window has cooperative 60-second deadline; campaign
600 seconds including setup, loading, hashing, oracles, and persistence. Gate and
join waits bounded by same window deadline. Blocked syscall
not interrupted: central recorder must impose external
process-lifetime limit. No terminate-thread, asynchronous
timeouts, retries, or rollback.

Timeouts C4 `bench-deadline` conditions classified `:incomplete`;
errors and failed oracles `:failed`. Retain attempted,
prepared, and actually-returned publications, even for partial
prefixes. Capabilities closed only after global quiescence. If
worker remains live, no fixture FD closed and no new report
checkpoint opened: resources remain until OS exit.
All files remain in namespace as evidence, including on failure.

<a id="oracoli-fuori-clock"></a>

## Oracles outside clock

For every returned publication after quiescence:

- `control.log` regular file without hardlinks, EOF and bytes identical
  to plan; LSTAT before and after read attests same identity;
- CONTROL header verified and recovery manifest rebuilt from installed-file
  bytes: complete prefix, expected version, ACTIVE 2,
  next-id 3, CLOSED 1 with valid-bytes 64 and zero outcomes, no REMOVED;
- installed name points to new CONTROL inode, different from
  previous; `control.log.tmp` absent;
- old FD still readable, bytes equal previous CONTROL, recovery
  still valid for ACTIVE 1;
- new and previous ACTIVE retain header, bytes, version, origin,
  identity, and size 64; directory identical and 0700;
- open capabilities, modes, FDs, inodes, offsets, and frontiers compared with
  baseline; only new CONTROL advances to exact plan length;
- `:published` state with observed rename, result bound to same
  ACTIVE and open canonical log of same writer.

Native verification with stat/fstat independent of product identity
APIs. Readback also checks worker-root identity and 0700
mode; roots have independent inodes. Parent size not
treated as log frontier: rename changes directory
entries. Old CONTROL inode must have zero link count,
remaining readable through kept-open FDs. No global function replaced to construct
oracle or fault. Test attests observed final conditions; neither
observes every intermediate state nor demonstrates power-loss resistance.

<a id="report-ed-evidenza-canonica"></a>

## Report and canonical evidence

`report.lisp` is schema-1 data plist, readable with `*read-eval* nil`.
Root retains versions, readers, replicates, count, seconds, heap-bytes,
windows, workers, results, limits, and readback. Every window has same
fields: version/readers/replicate, counts, duration, heap allocation, worker records,
diagnostics, limits, oracle state. Worker record retains
attempted/prepared/count prefix, termination, error-kind, results, and
readback. Zero root counts before load mean progress still
zero; not product zero-heap-allocation measurement.

Report written to temporary, renamed, and reread as data before
acceptance. `report.sha256` identifies canonical report bytes;
every successful result includes SHA-256 of installed CONTROL. Hashes
use common `tools/evidence-storage.lisp` reader outside clock. Source
inputs have before/after SHA-256 snapshots, with conservative inventory
of recursive `src/*.lisp`, ASD, driver, method, and evidence helper.
Comparison does not continuously monitor source opens. External
recorder must preserve revision, Git state, argv, environment,
original stdout/stderr, and process actual exit.
SHA descriptor regenerated when late state requires new
persistence too; its readback checks bytes. Before SHA-helper
loading, failure may leave only report and recorder
output without final hash. Persistence fault explicit:
stdout and actual exit still needed to read latest outcome.

Loading uses private FASL cache inside run and ASDF `:force t`;
no test-op. Warnings and style-warnings fatal; only
`SB-KERNEL:REDEFINITION-WARNING` caught, recorded, and muffled as
loading exception. Deadline rechecked after persistence and
stdout: nonzero actual exit overrides text emitted just before budget
exhaustion. No report durability through fsync claimed;
readback attests content available in local filesystem.

<a id="comandi-previsti-dopo-freeze"></a>

## Planned commands after freeze

From frozen checkout, in separate processes recorded by central runtime:

```sh
sbcl --no-userinit --no-sysinit --script tools/control-checkpoint-bench.lisp --self-test
sbcl --no-userinit --no-sysinit --script tools/control-checkpoint-bench.lisp --bench spikes/out/control-checkpoint-bench-X/
```

Self-test pure classifier: complete and partial examples, duplicate
cell, duplicate worker, valid prefix, over-limit counts, typed
timeouts, worker errors, failed readback, late window and exit,
error precedence over timeouts, literal namespace, inode aliases, and
serialization. Produces one stdout record without product, child
processes, threads, or native fixtures. Certifies neither product compilation nor
syscalls, and not run inside benchmark process.

<a id="dati-aperti-limiti-e-consegna"></a>

## Open data, limits, and delivery

No compilation, tests, benchmark, coverage, or commits performed
during drafting. No measured rates or performance results
to publish. Forced-load warnings, factory arities and
types in frozen checkout, SHA-tool availability, and actual
macOS/Linux durations remain to observe. New-module ASDF/coverage
integration remains coordinator's.
Four-worker workload retains up to 288 simultaneous fixture FDs,
besides runtime and recorder FDs: process limit must
allow it. Common hashing also starts child processes outside clock;
any blocking falls under recorder's external limit. After a deadline
already declared failed, finalization may complete hashes and persistence
with final actual-exit checks; 600 seconds is not hard limit.

Data open: no invented threshold, no imputation for missing
windows, no promotion of partial prefixes to complete
campaign. Native files, canonical evidence, private cache, and reports
remain inspectable in exclusive namespace. Local filesystem and
OS cache hot; external load uncontrolled. Eight cases per
worker represent neither latency distribution nor engine-rotation
history. Catalog, CLOSED inventory, multiseries decisions,
server adoption, client admission, and reclamation outside workload.
