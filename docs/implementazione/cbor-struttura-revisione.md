<a id="seconda-lettura-della-scansione-strutturale-cbor"></a>

# Second reading of CBOR structural scanning

The oracle author froze the original snapshot of three test files
before reading the six new kernel files. Support was written by a native subordinate
reviewer, also without reading new product or spike; delivery and
model were reread by the main author. Only frozen
contract, RFC 8949, repository documentation, and already-frozen cold header
oracle were used. No product parser is used as expectation.
This local static reading is independent of kernel author and is not
human approval. No campaign was run by reviewer.

After reading, the coordinator authorized only a supplement to the
existing depth test: 100 single-child arrays followed by indefinite
string, empty chunk, and break, both text and bytes. Both expectations
(102 nodes, peak 100, slot 101 use) derive from contract but were
written after reading product. It is therefore not claimed that the whole current
file was frozen before reading. Original file and original data
report were preserved byte for byte before changes:
`/tmp/cbor-structure-tests-original-before-read.lisp` (original blob
`d2f1ee8e57c0d587c7c1a7274ed171c16fb4fb53`) and
`/tmp/cbor-structure-independent-review-before-supplement.lisp`. Oracle,
other expectations, concurrent test, and kernel remained unchanged.

<a id="identità-dello-snapshot"></a>

## Snapshot identity

Git blobs, checked after test freeze and before campaigns:

| File | Blob |
|---|---|
| `src/codec/cbor-package.lisp` | `411212b04f96be32516425aa2a7ac53aac5b921d` |
| `src/codec/cbor-space.lisp` | `a8330e50a77b52a6b9044ebbb48f62bb4b3222a3` |
| `src/codec/cbor-scan-input.lisp` | `57ffc48cc688a4de8ebec5cb14c1e69c4209704a` |
| `src/codec/cbor-scan-stack.lisp` | `c574e87af5e195ddf3f596a4ae527e69c7a3c6a6` |
| `src/codec/cbor-scan-items.lisp` | `70272936e323b3e0cb05173c9fb68cb2b614c355` |
| `src/codec/cbor-scan.lisp` | `1f89112b43a39d98cf25dc6dfb34e412428ba843` |
| `tests/codec/cbor-structure-support.lisp` | `e9cc8a08917903cab7b7f5617225884b7d89e6c4` |
| `tests/codec/cbor-structure.lisp` with supplement | `7e9b7a518bc3a260d721e85d62ff986553bb06de` |
| `tests/codec/cbor-structure-threads.lisp` | `3624e1dde5f5a484a117f4c783d4e6b88027cc89` |

The 24 named tests include manual vectors, 256 ASTs with metadata generated
during construction and a trailing mutation for each, 512 spans over 256 leads,
4096 deterministic random spans of 1..64 bytes (seed `49CBA017`), truncations at
every offset of two mixed fixtures. Independent model is cold recursive,
with 64-byte and 64-call limits; accumulates arguments arithmetically and uses
manual UTF-8 grammar for error priority. SBCL confirms only
text acceptance, without supplying expected offsets.

<a id="riscontri-statici"></a>

## Static findings

Preflight reads no bytes and precedes `azzera-spazio-cbor`. It checks simple
array, index endpoints, and span before scratch access; then
workspace, aliases, configurations, and byte-budget in agreed order. In alias
test, kinds array is made nonzero before rejection to observe an
improper change. This fixture observes kinds, while absence of any
preflight write is checked statically on complete kernel.

Parent is charged once at the start of non-tag terminal. A tag counts
one node and retains pending without adding frame; a tag before a
container consumes arity only when that container starts. Indefinite
maps alternate key/value even for tagged children or containers.
Break checks tag, indefinite frame, and parity, counts no node, and closes
one frame only. Drain pops only definite frames with exhausted arity.

Fixed stack covers root + 100 arrays/maps + one indefinite string: top 101
is the last valid index of 102 slots. Indefinite strings do not nest
between chunks; both supplementary fixtures exercise that combined limit.
Tags occupy no frames. Empty arrays and maps still increase
peak. Node and depth limits precede increment/push; each step
consumes at least one byte, outer loop is span-bounded, and drain bounded to 102
steps. No recursion, wait, or thread creation in product.

u64 arguments remain high/low u32. Guard of zero high and low within room
precedes payload addition; map compares pairs with floor(room/2) before
doubling. No boxed u64 integer needs construction. Truncated
payload precedes UTF-8; each chunk is validated separately with absolute
offsets. Complete root signals trailing before interpreting a second
header. Exactly three values emerge after checking cursor, budget, and
absence of residual frames/depth/tags; no AST or decoded content emerges.

Scratch and buffer belong to caller. Scratch retains no buffer
references; both arrays have read-only references and exclusive contents.
Success shows no explicit constructors; this does not attest zero heap allocation,
which must be measured on successful calls with preallocated fixtures and scratch.
Cold factory and error conditions remain outside measurement.

Concurrent test preallocates two buffers and two separate scratch areas, checks
exactly three values, sinks, and complete copies. 48 scans,
2,359,344 nodes, and 5,505,168 bytes are planned; expected sinks 4,718,784 and 3,145,920.
These counts derive from fixtures, not observed results. The interval
measured with `get-internal-real-time` starts after barrier and ends
after computation; work-interval overlap must be positive.
It does not measure CPU time, simultaneous execution on distinct cores, or core count used.
Wait 15 s, join 20 s, and cleanup 1 s are bounded; cleanup
checks every known worker has terminated. This is not a pool-scaling
measurement or concurrent apply implementation.

No open functional defect detected. Strict build,
lint, traceability, runtime, coverage, heap measurement, and mutations remain pending. Internal defenses
propagate `invariant-violation`; kernel owns neither Serie nor controller
and does not implement `FAULTED` transition. Deterministic profile, tag semantics,
duplicate/ordered keys, writer admission, and engine gates remain
to be implemented or verified by subsequent owners.

<a id="dodici-punti-c1"></a>

## Twelve C1 points

| Item | Reading and limit |
|---|---|
| 1. Requirements/ADRs | LIM-001/002 and AFF-004/008; CON-005 only in concurrent fixture. ADR-0048 for bytes/depth; ADR-0014 limited to structural scope, profile still subsequent. |
| 2. Invariants | Progress, arity, parity, budgets, frame/depth, ownership, immutable input, and reuse have independent fixtures. Internal defenses are not all declared exercised. |
| 3. Errors | Typed hierarchy and public reasons/offsets/precedence checked; future fault-owner handling. Campaigns pending. |
| 4. Limits | Iterative product: span steps, drain 102, depth 100; tests/model/workers with explicit caps. |
| 5. Heap | No constructor on success; factory separate. Heap attestation **pending**. |
| 6. Output | Three counters/offsets only after exact item and postconditions; buffer never modified. |
| 7. Decisions | [Inventory](cbor-struttura-decisioni.md): 20 compound decisions, no denominator exclusion; coverage and MC/DC not attested. |
| 8. Ownership | Immutable buffer, exclusive scratch per call/worker, no retained buffer or mutable global state. |
| 9. Integration | ASDF orders header/UTF-8 before scanner and test support before suite; `make check` and matrix remain to be acquired on snapshot. |
| 10. Standard | Complete FTYPEs, typed slots, safety3, docstrings, and active guards; automatic checks pending, no exception approved. |
| 11. Parallelism | No wait/lock/shared write per operation between Serie in kernel; private two-worker fixture, runtime test still pending. |
| 12. Durability | No I/O, delete, or durable change: not applicable to kernel. |
