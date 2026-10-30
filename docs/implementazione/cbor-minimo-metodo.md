<a id="testate-cbor-minime--contratto-e-metodo"></a>

# Minimal CBOR headers — contract and method

Scope fixed before campaigns: local completion of headers under
ADR-0014 and ADR-0048, class C1. Does not change the document profile: map
ordering, key equivalence, and tag semantics remain separate.

<a id="contratto"></a>

## Contract

`arcdocdb.cbor:leggi-header-cbor-minimo(buffer, start, end)` returns
exactly the syntactic reader's six values: major, AI, high u32, low u32,
next, `:argument`. The simple u8 buffer remains immutable; span is half-open.
It reads neither payload nor children. u64 arguments and floats remain words, without
materializing u64 integers, floats, AST, or copies. No state, scratch, lock,
wait, or I/O; independent calls usable by compute workers.

`leggi-header-cbor` runs first: range, reserved values, truncation, illegal
simple values, and illegal AI31 retain type, reason, offset, and precedence.
Only after a syntactically complete header does the new check signal
`corruption-detected :cbor-nonminimal` at offset START:

- indefinite length or break, even without body;
- major 0–6 with argument representable in fewer bytes: AI24 requires at least
  24; AI25 at least 256; AI26 at least 65536; AI27 nonzero high;
- binary32 exactly representable in binary16, binary64 exactly
  representable in binary32. Every binary16 is already minimum width.

Syntactically permitted simple values are accepted. Floats and integers remain
distinct types. Signs of zero and infinity are preserved; NaNs are compared
by significand with right zero-padding, preserving sign and payload,
without imposing a single NaN encoding. This is the local rule of
[RFC 8949 §4.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.1),
also used by core deterministic encoding in
[§4.2.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.2.1).
The check attests neither whole-item determinism nor tag validity.

<a id="prove-fissate"></a>

## Fixed tests

Independent arithmetic oracle on integers/rationals in tests, without product
helpers. RFC vectors, all 65536 binary16 values and their exact
binary32/binary64 expansions; all major 0–6 width thresholds; zero with
both signs, infinity, NaNs with shortenable and nonshortenable payloads;
normal/subnormal minima, maxima, and neighbors; all leads, truncations,
ranges, and precedence, sentinels, and six exact values. Finite fuzz with recorded seed and
counts. Two actual workers with private input and timeout:
no inference of scaling or simultaneous execution on cores from wall time.

Two C1 readings of the diff with 12-point checklist, compound-decision
inventory, and raw `sb-cover` coverage on new files, preserving state and
HTML. Gaps declared, without turning coverage into MC/DC proof.
Mutations: at least eight compilable defects, count fixed in the driver
before the campaign; full baseline and exact smoke/end markers;
compilation or infrastructure failures do not count as detection.
Local target: all detected, survivors analyzed.

Allocations measured in a separate serial process, preallocated inputs,
safety 3, warmup 128, five replicates of 4096 calls per minimal integer,
finite float, subnormal, and NaN fixture. Six values checked in sink;
zero baseline and positive control 16 × 1 MiB. Zero observed heap allocation is a
local criterion, without speed threshold or absolute proof of nonallocation.
Full `make check` required before integration and push.

Registers, stdout/stderr, tool code, mutation copies, and raw
data are preserved even on error. Tools and readers
treat reports as data with read-eval NIL, without external load/eval.
