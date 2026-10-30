<a id="spk-07--metodo-della-pubblicazione-registrato-prima-delle-prove"></a>

# SPK-07 — Publication method (recorded before tests)

Scope: `pubblicazione.lisp` only, package `arcdocdb.spk07.pubblicazione`,
Common Lisp/SBCL with safety 3. Existing core loaded before module.
References read: ADR0043, ADR0050, INV-I1, INV-I3, INV-A8, INV-P1,
REQ-IDX-003/007. No production component, benchmark, or new decision.

SC model enumerates interleavings of one writer, one lookup, one retirement.
Two keys, one source fragment, one write, one serial maintenance (rebuild/split)
suffice to distinguish updated hit, miss becoming hit, hit becoming miss.
Split routes keys to different fragments; rebuild retains alias between both
entries. Root/generation are immutable pair published in one indivisible step
after private construction. Old fragment may change under seqlock before retirement,
then freezes. Version, location, live flag, control are separate writer steps.
Reader protects before probe, reads fields separately, validates seqlock, crosses
abstract SC barrier, rechecks root/generation including misses. Two attempts
share budget; fallback is atomic lookup by writer after its finite work.
Fallback scheduling/implementation outside this test.

Two lifetime abstractions: strong root reference (retaining fragments), epoch
announcement before root load. Reclaim requires retirement and no relevant
protection. ADR0043 assigns heap fragments to GC and external resources to EBR:
epoch variant verifies lifetime abstraction only, changes no decision, simulates
no product shared counter.

Oracles separate from transitions: (1) every hit is complete specification-allowed
tuple; (2) no access uses reclaimed fragment; (3) generation contract compares
captured pair with pair at acceptance, not later response; (4) independent enumerator
seeks serialization of finite invocation/response history respecting real-time
precedence. Maintenance is identity on abstract map. Pending operations may be
omitted/completed; oracle uses neither root, fields, nor protocol linearization
point. Old-root read is not rejected for that fact alone. Structural oracle also
checks both new-root keys, rebuild/split routing, completeness of published fragments.

Negative controls: omit recheck for all responses or misses only; release protection
before probe; omit field/seqlock validation on hit. Every mutant must produce
targeted witness. Generation mutants also explored with data/history oracle alone:
if no linearizability violation in finite domain, explicitly report it.
Positive reachability queries must witness hit/miss retry, fallback, consistent
updated old-root read after replacement. Six histories directly check independent
oracle: overlapping old hit/miss allowed; hit from pending write allowed;
old hit/miss after write response and torn tuple rejected.

Budget: at most 200000 states per exploration and whole CHECK, 64 steps per
execution, two reader attempts, three history operations, 128 serialization-search
nodes. Exhausted budget signals error; no cutoff interpreted as success.
State/transition, acceptance, result, terminal counts are actual; not all traces
counted. Every complete execution requires completed writer/reader and reclaim.

Every compile/check attempt starts SBCL child with initialization disabled and
fatal warnings including style-warnings. Common Lisp recorder over stdin retains
fresh `:schema-version 1` plist record in `out/`: exact argv/stdin, environment,
full source blobs and before/after MD5 digests, decoded result, limits, raw stdout/
stderr, exit code, failures. Initial record written before child; sources must
remain stable. Git not consulted: Git commit/blobs declared uncollected.
FASLs/records get new names. No engine throughput/latency measured.

Declared limits: weak memory, real disassembly/barriers, snapshot expiry,
crashes/persistence, directory/key costs, wrap, allocator, runtime scheduling
excluded. Generations/seqlock do not wrap, no ABA or identity reuse.
Full Swiss probing, collisions, actual capacity abstracted into two directory
positions and one control per key. SC makes barrier an explicit ordering step,
without validating its code.

Normative tension to report: literal INV-I1 (‘indexes immutable for readers’) is
stronger than ADR0043's seqlock slot updates. Here root/directory and retired
fragments are immutable; a published slot may update before retirement.
ADR0050 also corrects ADR0043's old proposed linearization instant.
No normative text or gate changed.

<a id="registro-dei-tentativi-intermedi"></a>

## Intermediate-attempt record

- `out/pubblicazione-4000478729-91239-record.lisp`: startup failed before compilation
  due to misplaced SBCL runtime option. Exit 1 and original stderr retained;
  argv corrected in later attempts.
- `out/pubblicazione-4000478744-91419-record.lisp`: successful compilation/check,
  64316 states, 110401 transitions, maximum 39 steps. Summary `:explorations 1`
  incorrect due to destructive list reversal: all 25 full reports present.
  Count corrected before final test; intermediate record is not final summary.
- `out/pubblicazione-4000478955-1496-record.lisp`: warning-free compilation,
  then CHECK with `:state-limit 1` interrupted as required. Exit 1;
  `:expected-failure-matched t`, full stdout/stderr retained.
- `out/pubblicazione-4000478956-1639-record.lisp`: warning-free compilation,
  then CHECK with `:step-limit 1` interrupted by `model-budget-exhausted`.
  Exit 1; `:expected-failure-matched t`. Failures do not become model successes
  or contribute to positive-campaign count.

<a id="prova-finale-predisposta"></a>

## Prepared final test

Record `out/pubblicazione-finale-20261008-1791490231173-record.lisp` retains actual
final compilation/CHECK outcome. Written before startup, completed afterward;
only `:status :ok` with `:source-stability :stable` attests success.
`:result` contains 12 correct models, 6 negative controls, 3 full data/history
explorations of generation mutants, 4 reachability witnesses, 6 independent
oracle histories. Reachability witnesses use generic BFS `:violation` field as
expected goal; `:role` distinguishes them from protocol defects.
Observed hit/miss/fallback counts count distinct states (including acceptance
before response), not requests/all traces. State sum includes discovered but
unvisited states when witness ends exploration early.

Read exact reproduction command/stdin as data from record (`:argv`, `:stdin`,
`*read-eval* nil`); never load record as code. Core/module FASLs have same prefix
as record and remain in `out/`. Tests change neither core, runner, normative
documents, nor Git. General gate remains open due to method limits and other tasks.

<a id="evidenza-conservata-nel-repository"></a>

## Evidence retained in repository

The [final record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-pubblicazione-final.lisp)
is retained with initial failure, incorrect-counter attempt, and two budget-exhaustion
controls in the [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/catalogo.lisp).
Original records not rewritten; integration adds source REQ marker and verifies
new blob with complete suite.
