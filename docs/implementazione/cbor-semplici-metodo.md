<a id="scrittura-dei-valori-semplici-cbor--contratto-e-metodo"></a>

# Writing CBOR simple values — contract and method

C1 increment preregistered on 2026-10-11, before the corpus, product,
and campaigns. REQ-CBR-003 derives from ADR-0014; ADR-0048 keeps
the document budget at the higher level.

<a id="contratto-locale"></a>

## Local contract

```lisp
(scrivi-semplice-cbor-minimo buffer start end value)
;; => exactly NEXT
```

BUFFER is an exclusive simple u8 array; START/END are indices delimiting
a half-open span, valid even when empty. VALUE is the simple value's
wire code: integer 0..23 or 32..255. Codes 24..31 are reserved and
rejected. This does not convert Common Lisp numbers, booleans, or NIL.
Codes 20/21/22/23 identify false/true/null/undefined; unassigned
codes receive no application semantics.
This domain and the unique representation are defined by
[RFC 8949 §3.3, tables 3/4](https://www.rfc-editor.org/rfc/rfc8949.html#section-3.3).
The application profile, any floats, and document composition
remain at the higher level.

0..23 uses one byte E0+VALUE; 32..255 uses F8 and VALUE. No F8 followed
by a code below 32, float, AI28..30, or break is emitted. At most
two bytes are written, without payload, AST, shared state, waits, or I/O.

Preflight order: destination/range (`invalid-argument :cbor-range`),
VALUE (`invalid-argument :cbor-simple-value`), span capacity
(`resource-exhausted :cbor-simple-capacity`). All have offset NIL
and leave the entire physical array intact. The suffix after END is not
available capacity. After success NEXT=START+size and only
`[START,NEXT)` changes; prefix, suffix, and span remainder stay intact.
Internal guards signal invariant-violation without rollback; the
owner applies fail-stop. This is not atomic or durable publication.

<a id="corpus-e-misure-congelati-prima-del-prodotto"></a>

## Corpus and measurements frozen before the product

A separate author prepares and freezes the tests without reading the new
product; only then is the product written. First compilation and
campaigns follow both static readings and freezing of all files.

Literal vectors 0/19/20/21/22/23/32/255 and cold arithmetic comparison
over all 248 allowed codes, with multiple offsets, exact and residual capacity.
All eight reserved codes, invalid external types/ranges, destinations
that are not simple u8, empty spans, capacities 0..size-1, error priorities,
exact arity, sentinels, reuse, and concatenation. Fuzz 2,048 cases seed
53494D43, without a decoder-dependent oracle; the minimal reader and scanner
are supplementary checks after byte comparison.

Two real workers reused, two waves of 8,192 items per worker: 32,768
writes with private destinations, immutable plans, verified sinks and full
arrays. Bounded waits, joins, and cleanup. Observed intervals, without
inferring scaling or simultaneous execution on cores.

Serial benchmark on six fixtures 0/20/22/23/32/255, five replicates,
4,096 calls, warmup 128. Every invocation verifies NEXT and all bytes,
including external bytes. Zero baseline, positive control 16×1 MiB,
local criterion of zero observed heap; no speed threshold.

Eight single-replacement mutations: reserved codes allowed; wrong threshold23;
wrong major; wrong extended lead; physical capacity; zeroed second
byte; wrong NEXT; extra return value. Private copies and caches,
full baseline and unambiguous markers; compilation/worker failures
do not count as detection. All attempts and copies are preserved.

Raw coverage of only the new file, compound-decision inventory
without exclusions or MC/DC/100% attestations, two C1 readings, driver
self-tests, data audit, and full `make check` before push. Common Lisp
tools (INV-X3), sources and index stable during every recorded
command. Local tests do not promote engine qualification.
