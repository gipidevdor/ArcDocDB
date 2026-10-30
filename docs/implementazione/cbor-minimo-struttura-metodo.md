<a id="item-cbor-con-testate-minime--contratto-e-metodo"></a>

# CBOR items with minimal headers — contract and method

C1 increment fixed before campaigns, under requirements REQ-LIM-001,
REQ-LIM-002, REQ-AFF-004, and REQ-AFF-008. Integrates the minimal header reader
with ADR-0048's bounded scanner; ADR-0014 document checks
still require key ordering/equivalence and tag semantics.

<a id="contratto-congelato"></a>

## Frozen contract

`arcdocdb.cbor:verifica-struttura-cbor-minima` accepts an immutable simple u8
buffer, half-open span, exclusive `spazio-cbor`, and the same three budgets
as the generic verifier. It returns exactly nodes, peak array/map
depth, and END for a single complete item. Preallocated space is
reused; it does not retain the buffer and is not shared across active calls.

Preflight, reset, traversal, UTF-8, and counts are common to both APIs.
The minimal reader is used for every header: root, children, keys, values,
and tags. Byte-string payloads are not interpreted as headers.
Checks operate on words and cursors, without ASTs, copies, float/u64
materialization, waits, I/O, or mutable global state. The loop is bounded by the
span, the fixed stack by 102 cells, and drain by 102 steps.

Error order: preflight before bytes and reset; complete header
syntax before minimality; minimality before context, nodes,
depth, and payload. Indefinite forms and break, including a break after a tag,
report `:cbor-nonminimal` at the lead. Drain preserves `:cbor-trailing`
before reading a complete root's tail. Empty spans and incomplete children/tags
retain `:cbor-truncated` at END. Failed preflight leaves
scratch unchanged; runtime errors permit reset on the next call.

The generic scanner retains its API and precedence.
The new API uses an internal Boolean fixed to T, the generic wrapper to NIL;
no new mode parameter is exposed on the generic API.

<a id="verifiche-fissate"></a>

## Fixed verification

Blind corpus frozen before compilation: majors 0–7, width thresholds
and high u64, raw floats/NaNs, nesting, keys, and tags; opaque payloads,
UTF-8, truncations, all leads, and competing precedence. Finite generation
and fuzz with registered seed/counts; byte/node/depth budgets,
exact 16 MiB and beyond, depth 100/101, sentinels, aliases, and reuse.
Two real workers with private buffers and scratch, timeouts, and checked sinks;
overlap timings do not demonstrate scaling or simultaneous core execution.

Two C1 readings with checklist and decision inventory, generic scanner
regressions, and raw coverage of the scanner's two files.
The dedicated report runs both suites; complete state and HTML
preserved, without exclusions or MC/DC certification.

Measurement driver: eight fixtures, five replicates of 4096 scans, warmup
128, three values and sink checked, input/scratch prepared outside measurement.
Null baseline and deliberate allocation verify the counter. Observed
zero heap is a local criterion, without speed or scaling thresholds.
Mutations: eight compilable defects fixed before the campaign, complete
baseline, exact smoke/end markers; compilation INVALID and infrastructure,
OS signals, or post-completion failures WORKER-ERROR, never detections.
Local goal: all detected, survivors analyzed.

Warning-free build, lint, traceability, and full `make check` before
push. Common Lisp tools and audits (INV-X3), records read as data with
read-eval NIL and EOF. Original sources, logs, errors, and results preserved;
complete mutation copies/FASLs also remain in local backup.
