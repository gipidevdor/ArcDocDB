<a id="scrittura-delle-stringhe-cbor--contratto-e-metodo"></a>

# Writing CBOR strings — contract and method

C1 increment preregistered on 2026-10-11, before writing the product and
compiling new tests. REQ-CBR-002 derives from ADR-0014 and ADR-0048.

<a id="contratto"></a>

## Contract

```lisp
(scrivi-stringa-cbor-minima buffer start end major source source-start source-end
                          :max-bytes 16777216)
;; => exactly NEXT
```

BUFFER and SOURCE are simple u8 arrays; both spans are half-open,
including empty ones. MAJOR is only 2 or 3. The function writes a minimal header
followed by an exact copy of source bytes: text length is in
bytes, not scalars. MT2 accepts any byte; MT3 requires valid UTF-8.
NUL, BOM, and noncharacters remain allowed, without Lisp string conversion,
escaping, normalization, or replacement. Definite-length encoding under
[RFC 8949 §3.1 and §4.2.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-3.1).

MAX-BYTES is an index 0..16 MiB, default 16 MiB. Budget includes header and
payload; at the maximum, payload reaches 16,777,211 bytes. It does not replace
Serie configuration or the remaining budget of a composite document.
It uses the limit already defined in the codec without expanding the UTF-8 domain.

Preflight order: destination range (`invalid-argument :cbor-range`),
major (`:cbor-string-major`), source range (`:cbor-string-source-range`),
budget type/limit (`:cbor-string-budget`), payload then item budget
(`resource-exhausted :cbor-string-byte-budget`), capacity
(`:cbor-string-capacity`), overlap (`invalid-argument :cbor-string-overlap`),
UTF-8. The first errors have NIL offsets; UTF-8 errors propagate class,
reason, and absolute source offset. Every public error leaves
both arrays intact, before any write.

BUFFER is exclusive and SOURCE bytes remain stable until return.
The same array is allowed when `[source-start,source-end)` is disjoint
from `[start,NEXT)`, header included. Touching intervals and an empty
source are allowed. Physical capacity after END does not count; the rest of the
buffer, including the remaining span, stays unchanged.

Copying is bounded by budget; no threads, waits, I/O, ASTs, mutable
global state, or shared writes across Serie. This is neither atomic nor durable
publication. Internal guards report invariant-violation:
the owner applies fail-stop, without internal rollback.

<a id="prove-congelate-prima-del-prodotto"></a>

## Tests frozen before the product

Blind corpus with arithmetically calculated header and independent payload:
empty and thresholds 23/24, 255/256, 65535/65536; arbitrary MT2 payloads and MT3
ASCII, multibyte scalars, NUL/BOM/noncharacters. All lengths 0..4096
for both majors and fuzz 2048 with a fixed seed. Argument errors,
precedence, capacity 0..size-1, budget including header, maximum
16 MiB and maximum+1, aliases in both orders, touching boundaries,
header-only overlap, and malformed UTF-8 inputs with source offsets.
Exact arity, sentinels, and reuse; minimal scanner only as a supplementary
roundtrip, never as a byte oracle.

Two reused workers with private destinations, shared immutable source,
bounded semaphores/joins/cleanup, and checked sinks. Functional concurrency
is checked, without conclusions on scaling or simultaneous core execution.

Separate serial measurements: independent MT2/3 fixtures, four thresholds and
multibyte UTF-8, five replicates, 4096 calls, warmup 128. Null baseline,
positive control 16×1 MiB, NEXT and all-byte verification included
in calls; local observed-zero-heap criterion, no speed
threshold. Eight single-substitution mutations in private copies/caches:
wrong major; scalar rather than byte length; off-by-one copy; wrong copy
origin; budget without header; physical capacity; overlap ignoring header;
skipped UTF-8 verification. Complete baseline, exact markers; compilation/worker
errors do not count as detections. Every attempt preserved.

Two C1 readings, compound decision inventory, raw coverage of the
new file without exclusions or MC/DC/100% certification. Drivers with self-tests
and data audits; full `make check` before push. Common Lisp tools
(INV-X3), sources stable during every recorded process. Original logs
and dependency campaigns are preserved without promoting
qualification of the complete document or engine.
