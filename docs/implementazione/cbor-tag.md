<a id="composizione-dei-tag-cbor"></a>

# Composing CBOR tags

`arcdocdb.cbor:scrivi-tag-cbor-minimo` composes an MT6 header and
one already encoded content item, verifying it before writing.
The [preregistered method](cbor-tag-metodo.md) defines REQ-CBR-007,
precedence, and campaigns; the [verification](cbor-tag-risultati.md) preserves
results and qualification limits.

```lisp
(scrivi-tag-cbor-minimo
 buffer start end source source-start source-end high low space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => NEXT, only one value
```

HIGH/LOW are u32 words of the tag's wire number, without reconstructing
a u64 integer. The minimal header occupies 1/2/3/5/9 bytes; contents
remain identical. HIGH=0, LOW=55799, and SOURCE=`A0` produce `D9 D9 F7 A0`.
SOURCE is a nonempty simple u8 array with exactly one complete minimal
structural item: trailing data, truncations, invalid UTF-8, and nonminimal forms
are rejected with absolute source offsets.

MAX-BYTES includes header and contents. MAX-NODES includes one tag node
plus content nodes: minimum two. MAX-DEPTH counts only arrays/maps;
the tag adds no levels. A tag on a scalar is allowed at depth0;
a tag on an empty array requires depth1. Maximums are 16 MiB,
16 Mi nodes, and 100 levels. Even long tag chains consume nodes
without adding scanner frames.

BUFFER and SPACE are exclusive during the call; SOURCE remains stable
and can be shared for reading among workers with separate destinations and
scratch. Scratch's internal KINDS array cannot be
source or destination. BUFFER=SOURCE is allowed only when the source
span is disjoint from the complete footprint [START,NEXT), including the header;
touching boundaries are allowed.

Range, nonempty source, words, scratch/aliases, limits, bytes, capacity,
overlap, and minimum nodes are checked before parsing or reset.
All public errors preserve the entire physical destination and
source. Preflight also preserves scratch; failed parsing
can dirty it, reusable on the next call. After success, its
statistics describe the contents without the emitted tag. Only the
destination footprint changes; the physical tail beyond END offers no capacity.
Internal invariants are fail-stop, without rollback.

This primitive is structural: it does not interpret dates, bignums, other
application tags or IANA sentinels, and imposes no key ordering/uniqueness.
The deterministic document profile and semantic admission remain
at higher levels. No AST, threads, waits, I/O, or durable
publication in the product; C1/MC/DC qualification still open.
