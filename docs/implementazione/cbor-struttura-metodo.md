<a id="metodo-di-verifica-della-struttura-cbor"></a>

# CBOR structure verification method

Method registered before campaigns. The block traverses one complete item
with a preallocated iterative stack and verifies structure, UTF-8 text, and budgets.
ADR-0014's deterministic profile and tag semantics remain subsequent:
duplicate or unordered keys, nonminimal integers, and all float bits
are accepted by scanning alone. No document is materialized.

<a id="contratto-congelato"></a>

## Frozen contract

`crea-spazio-cbor()` cold-creates a caller-exclusive `spazio-cbor`.
`verifica-struttura-cbor(buffer,start,end,spazio,&key max-bytes,max-nodes,max-depth)`
returns exactly three values: item-header count, maximum array/map
depth, and offset `end`. Span is `[start,end)` in a simple u8 array
immutable during the call. Defaults: 16 MiB, 16 Mi headers, 100 levels.
Node cap is an API choice derived from maximum header count
in that span; ADR-0048 requires the budget but does not set its value.

Nodes include tags, containers, and definite chunks, including empty ones; exclude
break. Only arrays and maps increment depth, including empty ones;
root container has level 1. Zero cap permits scalars, tags, and strings.
A tag chain uses no frame and charges a single child to its parent when
the next item begins. The 102 cells cover root, 100 containers, and one
indefinite string. The latter allows only definite chunks of the
same major type, with complete UTF-8 separately in each text chunk.

Break syntax and context follow [RFC 8949, §3.2](https://www.rfc-editor.org/rfc/rfc8949#section-3.2).
Scanning also verifies UTF-8 but attests neither full semantic validity
nor a document's deterministic profile. Unknown tags, tag 0 with generic
content, duplicate keys, and NaNs remain distinguishable from a structural
error and will belong to profile checking.

Preflight, in order: range, workspace type, EQ alias between buffer and private
kind array, byte/node/depth configurations, span beyond byte budget.
Initial errors are `invalid-argument`, reasons `:cbor-range`, `:cbor-workspace`,
`:cbor-alias`, `:cbor-byte-limit`, `:cbor-node-limit`, `:cbor-depth-limit`;
excessive span is `resource-exhausted :cbor-byte-budget`. All without offset.
Invalid preflight does not modify workspace; a valid scan resets it.
An error during scanning may dirty workspace, reusable on the next
call. Buffer is never modified or retained in workspace.

Scanner reads header first, preserving reasons and offsets of the
already-verified primitive. Incorrect chunk type precedes node budget.
A break follows order pending tag, non-indefinite context, map with key
without value. Reasons: `:cbor-tag-break`, `:cbor-break`, `:cbor-map-value`.
For an item, node budget is checked before incrementing; for a
container, depth before arity and payload. Node/depth budgets are
`resource-exhausted`, lead offset. Impossible length or arity is
`corruption-detected :cbor-truncated`, offset `end`; u64 words remain split
into high/low and pair count is compared before doubling.
Root completion followed by other bytes gives `:cbor-trailing` at the
first remaining byte. UTF-8 errors retain reasons and absolute offsets.

<a id="oracoli-e-letture"></a>

## Oracles and readings

Three independent test files are frozen before their author reads new
product. Known fixtures and cold recursive model
separate from iterative scanning; the model may use boxed integers, with
explicit input and recursion caps. Finite differential fuzz: 4096 spans
up to 64 bytes. Expected nodes, depth, and end are derived without
calling new product. Range, budget, arity, truncation, tag,
chunk, and UTF-8 boundaries; containers at levels 100/101, exact 16 MiB document,
sentinels beyond span, immutability, and reuse after error. After static
reading, a targeted fixture is added and declared separately: 100
arrays followed by an indefinite string with empty chunk, to observe
the last stack slot. Previous corpus retains original freeze.

Two real workers use separate buffers and scratch, checking all three
values and entire input. Overlapping wall-time work intervals are observed outside the
startup barrier; the clock does not prove simultaneous execution on distinct cores. Waits, iterations, joins, and cleanup have explicit caps.
The test proves isolation and concurrent API use; it does not measure scaling.

Conservative class C1: two independent product readings, compound-decision
inventory, complete FTYPEs, and safety 3. Readings are
attributed to their respective performers; they do not represent human approval.
Strict compilation, lint, and traceability checks on snapshot.

<a id="campagne-e-conservazione"></a>

## Campaigns and preservation

Focal coverage `cbor-structure`: package, workspace, and four scan files; unchanged
header and UTF-8 modules are excluded from filter, while complete raw ASDF
state is preserved. Filter self-test on all six files and
false suffixes, plus a deliberately missing branch. All HTML and raw
outcomes remain present; no guard excluded from denominator,
no MC/DC or overall engine-gate attestation.

Serial measurements, separate from coverage and mutation: six preallocated fixtures
(maximum u64, 32 KiB ASCII text, 100 arrays, mixed item with tag/map/chunk,
array with 4096 scalars, 4096 tags followed by scalar), five replicates of 32
calls, warmup 128. All three values feed an observable sink,
with independent constants. Workspace and input, GC and report are outside
measurement. Sensor with zero baseline and positive control 16 × 1 MiB kept
alive; zero observed heap allocation criterion, no throughput threshold. Errors and
cold factory remain outside measured path.

Mutants selected only after kernel freeze, compilable in exclusive
copies with separate cache. Full baseline mandatory. Smoke and completion
markers must be exact lines; failed compilation and zero exit
without completion are INVALID. A runtime failure after actual startup is
DETECTED, a complete zero-exit run is SURVIVED. All logs, including invalid
attempts, remain preserved with before/after source identity.

Commands and campaigns record whole snapshot, stdout, stderr, exit, and stable
state. Catalog is closed with actual results and reading
references. Any necessary compression is lossless and retains
original bytes, checksum, descriptor, and rereading proof.
