# Independent core code review — October 31, 2026

## Scope and method

The review starts at `f3c8350acef6c2ac3c5a94f74a5f1a04f486b5d0`.
The earlier inspection of `deb33f8` applies to unchanged modules in the scope
below. The other active worktree is not edited. Engine compaction and paged-index
optimization work remains outside this review's change ownership.

The static reading precedes the test campaign. It checks version and generation
identity, capacity and overflow rejection, interrupted writes, the distinction
between written/durable/published state, snapshot protection, EBR reclamation,
bounded queue handoff, and error propagation. It is a scoped review, not an
exhaustive reading of every source file or certification of defect absence.

Principal source paths inspected, through whole-file and targeted function reads:

- `src/mvcc/snapshots-{types,core,csn,register,lifecycle,read}.lisp`;
- `src/epochs/{core,read,retire,reclaim}.lisp`;
- `src/csn/registry.lisp`;
- `src/cache/{build,core,clock,read,write}.lisp`;
- `src/execution/{queue,writer,handoff,ready,ready-recycle}.lisp`;
- `src/scheduler/{policy,update,lifecycle-update,pool-claim}.lisp`;
- `src/wal/{builder,frame,group,executor,csn}.lisp`;
- `src/foundation/{record,batch}.lisp`;
- `src/io/{transfer,flush,stabilize,open-relative,create-relative,identity}.lisp`;
- `src/read/task.lisp` and `src/series/io-events.lisp`.

Additional source inspection covers compaction-frame decoding, selected recovery
queries/transitions, full-text normalization/work budgets, UTF-8 and local request
boundaries. These are supporting reads, not complete audits of those modules.
One reviewer performs the review; no independent human second reading is claimed.
Accepted ADRs and product semantics are not changed.

## Registered verification

Registered before the first test execution:

1. Load product and tests under the repository's warning-as-error policy, forcing
   product recompilation. Run the existing foundation, CSN, MVCC, EBR, read, cache,
   execution, scheduler, storage, I/O, WAL and Serie suites in sequence.
2. Preserve exact case IDs, suite counts, stdout/stderr, source blobs before/after,
   process outcome and environment through `tools/record-command.lisp`.
3. Run repository lint, traceability and Markdown links under the same recorder.
4. If a concrete defect is confirmed, retain its failing reproduction before
   implementing a minimal correction and rerun the affected checks. Otherwise do
   not rewrite product code only to create a patch.

Validation uses SBCL and the repository's existing POSIX utilities.
No Node.js, external Lisp dependencies, new native helper,
formal model outside Lisp, benchmark campaign or new parallel agent is introduced.
Allocation checks already present in the selected suites retain their actual
sample and platform limits. Other work may load the machine: elapsed test times
are not performance benchmark results. macOS ARM64 results do not qualify Linux,
power loss, the complete engine or all concurrent schedules.

The follow-up driver is [core-code-review.lisp](../../core-code-review.lisp). Results are
appended after execution; initial failures remain retained and distinct from
successful follow-ups. The initial driver was stored under `spikes/results/`,
which the command recorder excludes from source snapshots. A registered follow-up
runs identical driver bytes from the source path above, after the complete check
ends, to include the driver in both snapshots. The initial run does not establish
that source binding and is retained separately.

During the complete check, a one-second macOS `sample` observation of the owned
SBCL test process was recorded. It observed process spawning and `select` waits
while crash tests advanced. It is a diagnostic observation, not a deadlock proof,
test pass or product performance measurement; the original sample is retained.

## Review result

No reproducible product defect was confirmed in this scope. There is no product
patch: speculative refactoring would not establish a stronger guarantee. This
conclusion applies to the inspected paths and scenarios, not every module or
every possible execution. In particular:

| Boundary | Checked property | Evidence limit |
|---|---|---|
| CSN/snapshots | Assignment versus resolution; announced retention before capture; stale generations and expiration rejected | Component protocols, not integrated historical MVCC in M1 |
| EBR/read task | Logical snapshot expiration does not free an admitted reader's resources; final validation precedes delivery | Exercised schedules, not all weak-memory executions |
| WAL/Serie | Written, durable, published and resolved states remain distinct; stale completion cannot release a reused token | Fault fixtures and native tests, not physical power loss |
| Queues/pool | Finite admission, exclusive writer lease, retained scheduling obligations on busy/full, generation exhaustion without wrap | Component tests, not sustained mixed-load qualification |
| Cache | Private verified copy before use; rejection/disabled state and bounded CLOCK selection | No end-to-end cache throughput claim |
| Format/I/O | Header and body checks, transfer bounds, short I/O progress and fail-stop after incomplete append/flush | Existing formats and filesystem assumptions only |

## Initial verification results

`initial/report.lisp` records SBCL **2.6.10**, macOS ARM64, source revision
`f3c8350acef6c2ac3c5a94f74a5f1a04f486b5d0`, exit **0**, `:OK`,
`:STABLE` source snapshots and empty stderr. The source-snapshot exclusion above
applies to its initial driver. Product recompilation and loading the test system
completed with warnings treated as errors.

| Suite | Passing test cases |
|---|---:|
| Foundation | 35 |
| CSN | 20 |
| Snapshot/MVCC | 43 |
| Epochs/reclaim | 34 |
| Read task | 30 |
| Cache | 14 |
| Writer execution | 89 |
| Pool scheduler | 129 |
| Storage metadata | 44 |
| I/O | 160 |
| WAL | 48 |
| Serie controller | 109 |
| **Total** | **755** |

These are existing test cases executed again, not 755 newly discovered defects
or independent proofs. The raw output retains per-case identifiers and any
allocation windows reported by the cases. No throughput, latency or allocation
guarantee for the whole engine is inferred from these counts.

## Complete check and driver binding

The recorded `make check-core` command completed with exit **0**, `:OK` and
`:STABLE` source snapshots. This is the same complete target that `make check`
runs through the recorder. It includes the full product test catalog, crash and
reopen scenarios, legal checks, lint, traceability, links, full-text qualification,
evidence checks, all **11** spike checks and CI-tool self-tests. Lint examined
**494** product files with **0** violations; the link checker examined **781**
Markdown files and **3,741** references with **0** broken links.

Compiler optimization notes and deliberately rejected negative-oracle scenarios
are retained in the original stdout/stderr. They are not suppressed or reclassified
as product failures, and empty stderr is not claimed for the complete check.

The complete check ended before the driver move. The `qualified` follow-up then
passed the same **755** cases with exit **0**, `:OK`, empty stderr and `:STABLE`
source snapshots. Both snapshots include `spikes/core-code-review.lisp` with Git
blob `894a03026e1d4c55f8bde65ba79d64e2775d1826`. Only its path changed; product and
test-library bytes were unchanged between these runs.

The [closed original archive](../2026-10-31-core-code-review-originals/archive-index.lisp)
retains the initial run, complete check, diagnostic command and qualified follow-up,
their retention sidecars, the driver and the original sampler output. It is a
bounded collection of those command records, not a transitive backup of every
temporary child fixture or nested local report. Generated local fixtures remain
under ignored `spikes/out/`; no new benchmark numbers are inferred from them.

The collector used four workers; its independent check found **14 indexed files**,
**16 actual files**, four command records and a closed inventory. The collection
process, report and closure observation are retained separately, with byte
comparisons, before/after SHA256 checks and the literal retention helper.

`final-metadata-process.lisp` records a subsequent successful
`make lint trace links evidence`: **494** product files with no lint violations;
**141** requirements, **71** invariants, **13** FI scenarios and **78** ADRs with
no traceability errors; **783** Markdown files and **3,743** references with no
broken links; **8** evidence catalogs and **27** artifact references checked.
Its exit code is **0**, source consistency is `:STABLE`, and stderr is empty.
That record and its sidecar were copied after checking, as documented by
`final-retention-audit.lisp`; the earlier check does not attest to its own later
retention record. The closed original archive remains unchanged.
