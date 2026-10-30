<a id="spk-10--metodo-cbor"></a>

# SPK-10 — CBOR method

Registered before compilation and execution of module `cbor.lisp`.
Scope: this method and the experimental module, outside `src/`.
Requirements exercised: REQ-LIM-002, REQ-AFF-008, REQ-SIM-002.

<a id="domanda-e-fonti"></a>

## Question and sources

Can the validator enforce ADR-0048 limits without native stack recursion,
without allocations proportional to lengths declared in the input, and while
traversing both map keys and values?

Repository sources: [CONTRIBUTING.md](../../CONTRIBUTING.md), ADR-0014, ADR-0027, ADR-0048,
`docs/invarianti.md`, `docs/affidabilita/standard-di-codifica.md`, and the
requirements register. ADR-0014 requires deterministic CBOR but does not
explicitly choose between the two orderings described by RFC 8949.

> **Proposed** — this experiment uses the core deterministic profile from
> [RFC 8949 §4.2.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.2.1):
> minimal arguments, definite lengths, keys in lexicographic order of their
> encoded bytes. The alternative length-first ordering (§4.2.3) is not used.
> Duplicate keys are rejected (§5.6.1). Comparing encodings is sufficient in
> the admitted subset, in which every value has a unique encoding; array and
> map keys are also admitted, validated before comparison.

> **Proposed** — the subset includes positive and negative integers up to the
> limits of major types 0/1, binary strings, UTF-8 text, arrays, maps, booleans,
> and null. Floating point, all tags, and other simple values produce
> `:unsupported`. Complete validation of ADR-0014 CBOR is not claimed.
> A tag consumes one node, rather than a container level, before rejection;
> its content is not traversed and its semantics are not inferred to be valid.

<a id="algoritmo-e-risorse"></a>

## Algorithm and resources

An iterative machine maintains a local container stack, with remaining counts,
encoding offsets, and previous-key offsets. A map counts two children per
pair. A root array/map is level 1; scalars are level 0. Ancestors are completed
iteratively when their children are exhausted. Strings are neither copied nor
decoded into Lisp objects. UTF-8 is checked bytewise, including overlong
encodings, surrogates, continuations, and the U+10FFFF limit.

Before creating the stack or reading input, the validator checks type,
configuration, actual buffer size, document limit, and byte budget. Lengths
and counts are checked against remaining bytes and the node budget; they do
not determine allocations. The header reads at most eight argument bytes.
The stack is O(limite-profondita), at most 100 frames. Frame allocation is
lazy, as described in the revision below. No shared state, locks, I/O, or
durable writes: the only serial sequence is the path through one document.
The caller must keep the buffer immutable during validation.

The byte budget limits encoded input bytes, separately from the document
limit and node budget. Key comparison may reread bytes: its work is bounded
by the sizes of the two spans, repeated at most for every adjacent key pair
and every container (depth ceiling 100). It is not a budget on total memory
accesses.

<a id="api-prevista"></a>

## Planned API

Independent package `arcdocdb.spk10.cbor`; Common Lisp/SBCL dependencies only.
`valida-documento` receives a `simple-array (unsigned-byte 8) (*)` and keywords
`:limite-documento` (default 16,777,216), `:limite-profondita` (100),
`:budget-nodi` (16,777,216), `:budget-byte` (16,777,216).
Limits may be reduced; zero budgets reject the relevant work, negative/
noninteger budgets are configuration errors. Depth zero admits only scalars.
The function returns a plist with `:status :ok`, counts, applied limits, and
scope `:partial`. Errors are `errore-cbor`, with a keyword reason, position,
and publicly accessible counters.

`check` returns a plist with `:status :ok`, fixture and mutation counts, and
actual limits. `benchmark` returns a plist; parameter `:seconds`, default
2.5 seconds, allowed range 0–3 seconds, six windows, and at most 100,000
iterations per window. Fixtures are built before the windows; the clock is
checked before each call, so a call that has started may finish after the
deadline. Time is not a correctness guarantee. The benchmark measures
validation, rather than decoding into objects; binary string payload is
skipped after checking length. Throughput is calculated over encoded bytes,
rather than payload bytes actually read. The six cases are 1 KiB binary,
1 KiB text, 16 MiB binary, 64 KiB text, 100 levels, and an array with 4096
children. No local benchmark has been run.

The public condition is `errore-cbor`; exported accessors are `ragione`,
`posizione`, `nodi`, `profondita`, `tag-letti`. Reasons: `:invalid-buffer`,
`:invalid-limit`, `:invalid-budget`, `:document-limit`, `:byte-budget`,
`:node-budget`, `:depth-limit`, `:truncated`, `:trailing-data`, `:nonminimal`,
`:indefinite`, `:reserved`, `:utf8`, `:duplicate-key`, `:key-order`,
`:malformed-simple`, `:unsupported`, `:internal-invariant`. The benchmark
rejects parameters outside the contract with `:invalid-benchmark-budget`.
The first defect encountered is reported: a duplicate in an already unordered
map may produce `:key-order`. All rejections before reading have position,
node count, and depth zero.

<a id="controlli-pianificati"></a>

## Planned checks

Isolated compilation with `safety 3`, fatal warnings and style-warnings,
checking the three `compile-file` values, loading the FASL, and calling `check`.
Temporary FASL outside the repository. No long benchmark: comparative module
measurements are run by the integrated runner, which loads them in order
codec, index, cbor, migration after the SPK-09 CRC.

Fixtures with expectations independent of the parser:

- root array/map, nesting 100 accepted and 101 rejected, including in map
  keys and values; completion of siblings and ancestors;
- binary encoding of exactly 16 MiB accepted and 16 MiB + 1 rejected before
  traversing input, observable through condition counters;
- huge array/map counts and lengths with a small buffer, truncated headers
  and payloads, empty input, extra bytes, indefinite forms;
- minimal integers/lengths, core ordering distinguished from length-first,
  scalar and compound duplicates, valid and invalid UTF-8;
- exact, insufficient, zero, and negative budgets; invalid parameters;
- fixed-seed, finite mutations: fixture transformations that preserve validity
  or introduce a known defect, with expected outcome declared without using
  the parser as oracle.

Local targets: `check` within 5 seconds and live arrays below 128 MiB.
These are experimental budgets, rather than engine timing guarantees.
The check does not prove safe acceptance of arbitrary input and does not
complete the v2 gate. Requirements remain those cited in the experiment scope.

<a id="ambiente-e-risultato"></a>

## Environment and result

Preparation environment: SBCL 2.6.9, macOS, executable
`/opt/homebrew/bin/sbcl`.

Local strict compilation: `safety 3`, zero warnings/style-warnings,
`compile-file` warning/failure values both `nil`, FASL loaded.
Only SBCL optimization notes are silenced: their count is recorded in the
artifact; warnings and style-warnings remain fatal.

Local `check`: **614 cases**, including 68 explicit fixtures (21 valid,
47 rejected), 12 depth cases, 19 budget/configuration cases, 3 size cases,
and 512 mutations (128 valid, 384 rejected). Map-only chains check nesting in
keys and values. Both boundary buffers are CBOR binary strings with definite
lengths and minimal headers: 16,777,216 bytes (payload 16,777,211) and
16,777,217 bytes (payload 16,777,212). The second is rejected before the parser,
with zero counters. Together, the two large buffers occupy 33,554,433 bytes
of elements; no other experimental array exceeds 100 frames or a few KiB
during `check`. Preliminary local check time was about 0.011 s; the exact
recorded run value and actual environment are in the artifact.

The structured evidence is [v2-cbor-check.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-cbor-check.lisp),
an unchanged copy of local report `out/cbor-check.lisp`. It is one schema 1
plist, with `:command` (argv and stdin source), `:environment`, `:source-blobs`
(module and method Git blobs), `:compile-status`, `:result`, `:limits`,
`:time`, `:stdout`, `:stderr`, and `:failures`. A runner-boundary failure is
also recorded. The runner checks rereading with `*read-eval* nil`.
The full reproducible command is retained in the artifact; the FASL is at
`/tmp/arcdocdb-spk10-cbor.fasl`. Earlier checks during development are neither
benchmarks nor evidence of gate completion.

Remaining limits: floating point, tag semantics/canonicalization, any key
equivalences defined by the application, and integration before the writer.
The core profile selected here is a local proposal: the project must confirm
it for the complete codec. The local check neither closes the v2 gate nor
promotes engine requirements to verified. Integrated evidence is versioned
separately from the local report.

<a id="revisione-delle-allocazioni--metodo-registrato-prima-dei-controlli"></a>

## Allocation revision — method registered before checks

The initial campaign `spikes/out/4000475258-bench-54418-0/report.lisp` records
774,262,736 bytes allocated for 100,000 validations of the 1 KiB binary:
about 7742.63 bytes/call. This is a measurement of the first variant and the
recorded runtime; the report remains the source for the historical measurement.

> **Proposed** — replace initial creation of 100 structures with an empty stack
> in local state. The first **nonempty** container, after depth, remaining-byte,
> and node checks, creates a reference vector sized by the configured limit
> (at most 100), initialized to `nil`. Each frame is created only the first
> time its position is needed; sibling containers reuse the frame and
> reinitialize all its fields. A scalar or empty container creates neither
> vector nor frame. The vector is created at most once per validation;
> frames are bounded by the simultaneous depth of nonempty containers,
> and never exceed 100.

Document depth remains distinct from the number of allocated frames: even an
empty container counts as one level and is rejected at level 101. API,
condition reasons, check precedence, and configured budgets remain as
described above; `:stack-frames` in limits indicates the ceiling, rather than
the number of structures created. No global state or shared pool.
State, result plists, and any numeric arguments still allocate: this change
does not promise zero allocations.

Planned checks: preserve all 614 cases of the previous oracle and add
deterministic stack-state fixtures for scalars, empty containers, reduced
depths, siblings with maps/arrays, previous-key reuse, actual depth 100/101,
and rejections before frame creation. Checks examine objects and limits;
they are neither allocated-byte measurements nor benchmarks. Compilation
with `safety 3`, fatal warnings and style-warnings; `check` after FASL loading.

Every compilation/check attempt is retained in one schema 1 plist in
`out/cbor-allocation-check.lisp`, a new exclusive artifact, with a chronological
`:attempts` list. Each entry preserves command/stdin, environment, source
blobs, compilation status, decoded result, limits, times, stdout/stderr, and
failures. Earlier entries, including failures, are not replaced. Read with
`*read-eval* nil` and verify the single plist after writing. The revision's
benchmark is run by the integrated harness; no numeric reduction is inferred
from the change alone.

Revision result: attempt 1 compiled and loaded the module with `safety 3`,
zero warnings/style-warnings, and warning/failure values `nil`.
`check` returns `:status :ok` for **629 cases**: all 614 earlier cases plus
15 additional stack fixtures. Recorded local check time is 0.005228 s.
New fixtures verify zero frames and zero capacity for scalars/empty containers,
one frame for a shallow nonempty container, and two frames reused across a
map, array, and map. The chain of 100 nonempty containers creates 100 frames;
a chain ending with an empty container remains at depth 100 with 99 frames.
Level 101 still produces `:depth-limit` before creating a frame beyond the
ceiling. Truncations and insufficient node budgets at the first container
create no stack.

The schema 1 record in `out/cbor-allocation-check.lisp` retains the method
registered before execution, the checked module blob, and stdout/stderr;
rereading the single plist with `*read-eval* nil` passed. No compilation/check
failure in the first attempt. The structural count proves removal of unused
frames, rather than measuring bytes allocated by the new variant. The new
benchmark and integrated evidence remain to be run in the harness; the v2
gate and partial CBOR scope remain as described above.

<a id="campagne-successive-del-parent"></a>

### Subsequent parent campaigns

The integrated harness ran two on-demand-stack campaigns sequentially,
also compiling the other modules and completing maximum-document integration.
The [retained results](../../docs/valutazione/risultati-2026-10-08.md#cbor-con-pila-creata-su-richiesta)
compare initial data and the two replicates, with original sources and output.
For the encoded 1 KiB binary, 100,000 calls: 774,262,736 bytes initially
allocated, 52,852,304 in both replicates, about 7,742.63 → 528.52 B/op.
At depth 100, the cost of necessary frames remains. Text measurements vary,
including one slower replicate; no general throughput increase is inferred
with uncontrolled external load. This validator measures neither scanning
binary bytes nor CRC verification.
