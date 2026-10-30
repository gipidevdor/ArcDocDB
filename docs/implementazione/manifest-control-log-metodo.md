<a id="metodo-di-verifica-del-manifest"></a>

# Manifest verification method

Method defined before campaign. Scope: in-memory reconstruction
of a Serie manifest, versions 1 and 2; no durable-I/O test.

<a id="fixture-e-oracle"></a>

## Fixtures and oracle

Fixtures pack EDIT, frame, and SEAL with bytewise writing and
harness bitwise CRC. Do not use product EDIT encoders.
Histories declare complete initial state, rotations, and compaction
replacements; a list-based oracle interprets sets without calling
product decoders, hash tables, or folding functions.

Suite compares ACTIVE, lengths, outcomes, CLOSED, removed, unknown,
and next ID. Distinguishes zero CSN from absent outcome. Permutes sections and
duplicates, retains EDIT order, tests u64 boundaries and lengths
from 64 to `#xffffffff`.

Every fixture truncation must preserve only sealed batches:
no usable manifest without initial complete checkpoint. Later witnessed
corruption must take precedence over semantic error or budget
of earlier EDITs. Exact limits, overruns, and physical-duplicate
consumption tested. Buffer unchanged; poisoning after
construction does not change queries.

<a id="esecuzione-parallela"></a>

## Parallel execution

One test uses four SBCL threads, each with eight reconstructions of
an independent Serie, and compares results with oracle. Parent
also builds common manifest; after source-buffer reuse,
all workers query it read-only. Threads have separate input and
workspaces for 32 private reconstructions. Joins have
finite limit and worker failure must fail test. This
is concurrent-correctness testing, without inference of throughput,
scalability, or engine-latency isolation.

Mutation campaign runs intact baseline before modified
copies. Selects only manifest tests, checks startup and
completion markers, and distinguishes runtime detection, survival, compilation
error, pre-test error, and worker error. Nonzero exit
after completion marker does not count as detection. All
mutants copy already-verified intact baseline. Copies may
run in parallel with their own directories, FASL caches, and logs through
`--jobs 4`. Baseline remains serial. Tool self-test
includes interprocess handshake that would fail with serial startup,
nonzero exit, and startup/reaping faults. Campaign subprocess
waits have no automatic timeout; campaign uses only
known mutations preserving loop bounds.

<a id="evidenza"></a>

## Evidence

`tools/record-command.lisp` records command, environment, revision,
before/after hashes, exit code, and original output. Final campaign
starts only when sources, tests, and tool stable. Failures and
preceding attempts remain distinct and preserved.

`recovery` coverage includes scanner and DECISION table; manifest
summary selects only its files, preserving raw
denominator and original `sb-cover` state. Missing forms do not become
approved exclusions. Two C1 readings check invariants, errors,
owners, loops, and compound predicates; coverage and mutations do not
certify MC/DC or engine recovery.
