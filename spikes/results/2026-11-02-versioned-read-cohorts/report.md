# Versioned GETs preserve independent write groups

The serial Unix collector now retains its same-turn write prefix across a valid,
negotiated, independent versioned GET. It copies the canonical document and
verified record version into private output, then finishes strong writes before
any socket send. Exact-key reads, rejected requests and explicit groups retain
their barriers. See [ADR-0089](../../../docs/adr/0089-independent-versioned-get-write-groups.md)
and the [author readings/decision table](review.md).

## Frozen-driver comparison

Baseline `31b8bdd862829a3aae9aedbc3e66c0a65c653945`; candidate sources are identified
by the command receipts and final source inventory. Actual engine/collector,
canonical reader, writer and durable I/O, with three complete requests already
ready in slot order. SBCL 2.6.9, local macOS/Apple M4. Across versions 1/2,
legacy/resident/paged and 1/60000-byte documents: 48 cells, three five-turn windows
each, 720 turns per phase. Every write CSN, document and read token was checked.

| Ready cohort | Turns per phase | Baseline durable flushes | Candidate durable flushes |
| --- | ---: | ---: | ---: |
| PUT, independent VERSION GET, PUT | 180 | 360 | 180 |
| PUT, same-key VERSION GET, PUT | 180 | 360 | 360 |
| PUT, independent ordinary GET, PUT | 180 | 180 | 180 |
| PUT, same-key ordinary GET, PUT | 180 | 360 | 360 |

The 180 independent versioned turns took 1342.672 ms of accumulated dispatch
wall time before and 724.203 ms after. These short sequential local windows
support the flush mechanism; they do not establish a general latency improvement,
network throughput, natural-arrival performance or an SLO. No throughput is
inferred from inverse p50. The [comparison](comparison-final.lisp) audits all cells and
rejects an altered driver identity. [Raw baseline](baseline.lisp),
[raw candidate](candidate-final.lisp), [unchanged driver](bench.lisp), [method](method.md).

## Qualification and allocation scope

The focused run passed 50 selected server/client cases, including 12 new
versioned-disjoint cases. Earlier focused attempts exposed test setup errors, not
product regressions: a missing closing parenthesis, then an insufficient cache
grant for 64 KiB frames. Both raw failed command records and exact source variants
are retained; they do not count toward final qualification. A first process
qualification passed the ordinary method, then hit a shared-root fixture name
collision before the versioned method started. Distinct data/runtime paths fixed
that setup error; its source variant, failed receipt and full private fixture
are retained too. Trace matrix generation
followed that focused run. Final runtime qualifications and complete project gates
use the subsequent frozen source inventory.

The classifier witness reports zero allocated bytes for nine 100000-call windows
per runtime (SBCL 2.6.9 and 2.6.10), covering independent versioned/ordinary reads
and an exact-key rejection with seven preceding keys. The allocating control
reports 14348880 bytes per runtime. This is a classifier-only claim, not a claim
that the engine, writer, whole server or process allocates nothing.

Real Unix qualification uses actual product framing, negotiation, sockets,
canonical reads and strong I/O, with a C4-only three-peer readiness/failure gate.
It exercises both ordinary and versioned GET in v1/v2, resident/paged, success,
before-flush fault and after-strong fault, followed by independent service restart
and recovery. No peer response may precede strong completion or escape a failed
turn. This remains serial M1; Linux, concurrent readers and physical power loss
are outside this increment's qualification.

Final measurements were repeated after the fixture-path correction, with the
same frozen driver and identical flush/byte/token oracles. Earlier passing
measurements remain as intermediate evidence, not additional final windows.

Final targeted qualification passed **52 selected cases in two suites per
runtime**. Each runtime's two real Unix methods completed 24 scenarios, 48
service children and 8 intentional SIGKILLs. This is selected affected-case
qualification, not a claim that these invocations ran the entire project suite.
The final ledgers are in `qualification-sbcl9-final/` and
`qualification-sbcl10-final/`; completed raw command records retain their source
snapshots, runtime identity, complete stdout/stderr and actual exit status.

The complete `make check` passed on the frozen final source inventory, including
all product suites, warning-as-error build, legal/static/trace/link checks,
full-text and evidence sensitivity tests, **all 11 spike checks**, and CI
self-tests. `make docs` passed its full rendering, reference/runtime and example
checks. Raw receipts and exact hashes are preserved by the campaign archive;
this does not promote local results to Linux or power-loss qualification.

The first campaign archive stopped safely at residual Unix socket nodes in the
failed fixture; its failed command and exact archiver source variant are retained.
The corrected C4 archiver preserves every regular file byte and records socket
path/mode/owner metadata separately. Socket nodes have no regular file payload;
they are not represented as copied storage records. No product source changed.

The source verifier matched all eight required passing commands to the same
**1767 source files** and checked the failed source variants against their
original Git blob hashes. The first completed archive contains 791 copied files;
lossless closure reverified every original byte hash. The closing archive and
terminal tail receipt retain the archiver's own completed records before cleanup.

Cleanup completed only after the closed archive and tail receipts were verified:
**210978570 logical bytes in 19 owned paths** removed (builds, this worktree's
SBCL caches, spike outputs, archived P3 fixtures and the exact empty failed
preflight directory). This is a regular-file byte count, not a measurement of
physical APFS free space. Other worktrees/branches and shared Git storage were
left untouched.

Late archive compaction preserved six records: 2153981 original bytes in 615331
stored bytes. Its raw stdout prints a count of one because destructive `nreverse`
changed the local list used by the subsequent counter; the complete receipt has
all six verified entries. The raw stdout and exact executed driver are retained
(`variants/late-compaction-01/`). Replaced that presentation-only reversal with
`reverse` for replay; no product source or qualification changed.
