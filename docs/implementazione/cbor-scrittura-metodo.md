<a id="scrittura-delle-testate-cbor--contratto-e-metodo"></a>

# Writing CBOR headers — contract and method

C1 increment registered on 2026-10-11 before compilation and
campaigns. REQ-CBR-001 derives from the CBOR encoding chosen in ADR-0014;
REQ-AFF-004/008 govern errors, boundaries, and owners.

<a id="contratto-congelato"></a>

## Frozen contract

`arcdocdb.cbor:scrivi-header-cbor-minimo(buffer,start,end,major,high,low)`
returns exactly NEXT. The destination is a simple u8 array exclusive
to the active call, in half-open range `[start,end)`. MAJOR is an
integer 0..6; HIGH and LOW are unsigned u32 words of the wire argument. For
MT1 the caller supplies nonnegative argument `-1-n`, not the application
negative number. No u64 argument is reassembled.

Nonzero HIGH requires nine bytes (AI27). With HIGH zero, LOW below
24 occupies only the lead; below 256, 65536, and 2^32 it requires respectively
two, three, and five bytes (AI24/25/26). Words are written big-endian.
These rules follow [RFC 8949 §3 and §4.2.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-3).
The function writes only the header; payload, container counts,
text, key order/equivalence, tag semantics, and complete profile
remain at the document level. MT7, float, simple, and indefinite forms
remain outside the API domain.

Preflight order: range (`invalid-argument :cbor-range`), MAJOR
(`:cbor-write-major`), HIGH (`:cbor-write-high`), LOW (`:cbor-write-low`),
capacity (`resource-exhausted :cbor-write-capacity`). Every public error
has offset NIL and leaves the entire destination unchanged, even when a
physical suffix outside the span would suffice. A valid empty span
reaches capacity checking. No implicit 16 MiB limit is
applied to the local argument.

Success modifies exactly `[start,NEXT)`, leaving the prefix,
remaining span, and physical suffix unchanged. This is not atomic
publication: the buffer must stay exclusive until return. No waits,
I/O, mutable global state, or shared writes across Serie; at most
nine bytes written. Active internal guards report `invariant-violation`;
the owner applies fail-stop, without an internal rollback promise.

<a id="verifiche-preregistrate"></a>

## Preregistered verification

Blind tests from an independent arithmetic model, frozen before reading
the product: all seven majors, thresholds 0/23/24/255/256/65535/65536/u32max,
HIGH1, maximum u64, and asymmetric words; LOW0..65535 ×7 and fuzz4096 with
seed fixed in the test. The minimal-reader roundtrip is supplementary:
expected bytes do not depend on the product. Exact arity, sentinels,
capacity 0..size-1, non-simple buffers, competing priorities, and reuse.
Two real workers with private destinations, bounded waits/joins/cleanup,
and checked sinks: functional concurrency, without scaling certification.

Two C1 readings and inventory of all compound decisions. Raw
coverage of only the new product file, complete report and HTML preserved,
no guard removed from the denominator and no MC/DC certification.
Measurement driver with independent cold fixtures for all widths,
five replicates ×4096 calls, warmup128, preallocated buffer; NEXT and bytes
feed a checked sink. Null baseline and positive control16×1MiB.
Local criterion: observed zero heap; no speed threshold.

Eight compilable mutations, targets and replacements frozen before the
campaign in `tools/cbor-write-mutation.lisp`: premature thresholds23/255/65535,
reversed endianness, HIGH replaced with LOW, major shifted by four
bits, capacity computed from the physical suffix, and NEXT decremented.
Private copies/caches, complete baseline, exact smoke and end
markers; failed compilation INVALID, signal/worker failure WORKER-ERROR,
never detection. Every attempt and log is preserved. Warning-free build,
lint, traceability, and full checks before push. Common Lisp tools and audits
(INV-X3); sources stable during every recorded process.
