<a id="composizione-degli-array-cbor"></a>

# CBOR array composition

`arcdocdb.cbor:scrivi-array-cbor-minimo` composes an array from already
encoded CBOR items, checking every part before writing. The
[preregistered method](cbor-array-metodo.md) defines REQ-CBR-005 and
error precedence.
The [preserved verification](cbor-array-risultati.md) documents corpus,
measurements, mutations, coverage, and observation limits.

```lisp
(scrivi-array-cbor-minimo
 buffer start end source source-start source-end item-ends count space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => NEXT, only one value
```

SOURCE contains consecutive items in a half-open span of a
simple u8 array. The first COUNT cells of the simple u32 ITEM-ENDS table
contain ends relative to SOURCE-START: increasing, with the last equal
to span length. Subsequent cells are ignored. COUNT0
requires an empty source and produces `80`.

For example, SOURCE=`00 38 18 61 41 F5 F9 3E 00` and ends `#(1 3 5 6 9)`
describe five elements. The result is `85` followed by the same
nine bytes. Each segment must contain exactly one minimal item;
truncations, trailing data, nonminimal headers, and invalid UTF-8 text are
rejected before the first write.

MAX-BYTES includes the complete array's header and payload. MAX-NODES
includes the root and all child nodes, including tags. MAX-DEPTH counts
array/map, with root at level1; scalar children add no
levels. Maximums are16MiB,16Mi nodes, and100 levels. An empty array
requires one byte, one node, and one level. The remaining node budget is applied
to each child's scanner; exhausting it before the next child
raises a resource error at that child's absolute source offset.

BUFFER and SPACE belong exclusively to the caller during the
call. SOURCE and ITEM-ENDS must remain stable; several workers may
share them for reading, using separate destinations and scratch areas.
The same source/destination array is allowed with spans disjoint from the
complete footprint `[START,NEXT)`, header included. Touching boundaries and
empty sources are allowed. Scratch arrays cannot be
used as destination, source, or table.
When BUFFER and SOURCE are the same array, success preserves the
source span and changes only the destination footprint; public
errors preserve the entire physical array.

Ranges, types, configured limits, capacity, overlap, and table are
checked before reset or parsing. Every public error preserves
the entire physical destination, source, and table. Failed parsing
may leave scratch dirty, reusable on the next call;
after success its contents describe the last child. With an empty
array, scratch remains intact. Internal invariant errors are
fail-stop, without rollback.

Only `[START,NEXT)` changes; the physical tail beyond END provides no additional
capacity. Scanning, table verification, and copying are
bounded by budgets; no threads or ASTs are created and no durable
data is published. Map ordering, application tags, and the document
profile remain the responsibility of higher layers.
