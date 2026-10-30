<a id="scrittura-delle-stringhe-cbor"></a>

# Writing CBOR strings

`arcdocdb.cbor:scrivi-stringa-cbor-minima` writes one complete MT2/3 item,
reusing the minimal header and UTF-8 validator. It implements REQ-CBR-002;
contract and verification are in the [preregistered method](cbor-stringhe-metodo.md).

```lisp
(scrivi-stringa-cbor-minima buffer start end major source source-start source-end
                          :max-bytes 16777216)
;; => NEXT, only one value
```

MAJOR2 copies arbitrary bytes; MAJOR3 first verifies UTF-8, then copies the
same bytes. Encoded length counts bytes, including for multibyte
characters. Empty strings, NUL, BOM, and noncharacters are allowed; there is
no Lisp string conversion, escaping, or normalization. The header is
definite-length and minimal. This primitive neither composes maps/arrays/tags nor
validates the complete document profile.

Both half-open spans must fit in simple u8 arrays. MAX-BYTES 0..16 MiB
includes header and payload, as does the written footprint `[start,NEXT)`.
The caller may set the remaining budget; Serie configuration
and the entire document remain at the higher level. The physical
suffix beyond END is not available capacity.

The caller owns the destination exclusively and keeps source
bytes stable. The same array is allowed if the source span is disjoint
from the written footprint, header included; touching boundaries and an empty source
are allowed. After success, source payload and every byte outside
`[start,NEXT)` stay unchanged, including the destination remainder.

Preflight checks destination, major, source, budget, capacity,
overlap, and UTF-8 before the first write. Invalid types/ranges/budgets/aliases
report invalid-argument; insufficient budget or capacity reports
resource-exhausted. Reasons and precedence are in the method, with
NIL offsets. UTF-8 errors preserve corruption-detected, reason, and absolute
source offset. Every public error leaves both arrays
intact. Internal guards report invariant-violation without rollback:
the owner applies fail-stop.

The function neither publishes data nor makes changes durable. Copying has
an explicit bound, uses local cursors, and creates no threads, waits, I/O, or state
shared across Serie. Separate workers may read a stable shared
source and use private destinations. The primitive is a codec foundation,
without implicit engine qualification.

The [test report](cbor-stringhe-risultati.md) preserves corpus,
measurements, mutations, and coverage, with the C1 gate still open.
