<a id="composizione-delle-mappe-cbor"></a>

# CBOR map composition

`arcdocdb.cbor:scrivi-mappa-cbor-minima` composes a map from already-encoded
keys and values, verifying them before the first write.
The [preregistered method](cbor-map-metodo.md) defines REQ-CBR-006,
error precedence, and planned campaigns.
The [preserved verification](cbor-map-risultati.md) reports corpus,
parallelism, mutations, raw coverage, and qualification limits.

```lisp
(scrivi-mappa-cbor-minima
 buffer start end source source-start source-end item-ends count space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => NEXT, only one value
```

COUNT counts pairs. SOURCE is a simple u8 containing key,
value, key, value in a half-open span. The first 2*COUNT cells
of simple u32 table ITEM-ENDS delimit individual items with ends
relative to SOURCE-START, increasing, last equal to span. Subsequent
cells are ignored, even if the physical table is much longer.
COUNT0 requires empty source and produces `A0` without reading entries.

For example, `61 61 01 61 62 82 F4 F5`, ends `#(2 3 5 8)`, and COUNT2
produce `A2 61 61 01 61 62 82 F4 F5`. The header uses pair
count; payload preserves source order and bytes exactly.
Every segment must be one complete minimal structural item:
truncations, trailing data, nonminimal headers, and invalid UTF-8 are
rejected even in a key or the last value.

MAX-BYTES includes header and payload of the complete map. MAX-NODES
includes root, all keys, all values, and tags. MAX-DEPTH
counts array/map with root at level1; scalars and tags add no
levels. Maximums are 16MiB,16Mi nodes, and 100 levels. An empty map
requires one byte, one node, and one level; a scalar pair requires three nodes.
Exhaustion of the remainder before the next item is reported at
its absolute source offset, before scanner reset.

BUFFER and SPACE belong exclusively to the caller during the
call. SOURCE and ITEM-ENDS remain stable and may be shared
for reading among workers with separate destinations and scratch. Internal
scratch arrays cannot be destination, source, or table.
The same source/destination array is allowed with spans disjoint from
the complete footprint [START,NEXT), including header. Touching boundaries and
empty source are allowed. Success preserves the source span,
while changing only the destination footprint in the same physical array.

Types, ranges, limits, capacity, overlap, and table are checked
before parsing or reset. Every public error preserves the entire
physical destination, source, and table. Preflight also preserves
already-dirty scratch; failed parsing may modify it, and it is reusable
on the next call. After success it describes the last value;
with an empty map it remains intact. Internal invariants are fail-stop,
without rollback. The physical tail beyond END offers no additional capacity.

The primitive preserves received order and imposes neither uniqueness nor
key types. ADR-0014's deterministic document profile,
ordering, and application tags remain higher-level.
Scanning and copying are budget-bounded, without AST, threads,
waits, I/O, or durable publication.
