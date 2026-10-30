<a id="lettura-del-primo-item-cbor-minimo"></a>

# Reading the first minimal CBOR item

`arcdocdb.cbor:leggi-item-cbor-minimo` verifies the first item in the
authorized window and returns three values: node count,
peak array/map levels, and absolute frontier NEXT.
The [preregistered method](cbor-item-metodo.md) fixes precedence and tests;
the [verification](cbor-item-risultati.md) preserves results and limits.

```lisp
(leggi-item-cbor-minimo buffer start end space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => NODES, PEAK, NEXT
```

For bytes `C0 81 00 FF`, START=0 and END=4, the result is
3, 1, 3. The tag counts as a node and adds no depth.
The tail's FF byte is neither read nor verified. To verify
the entire span, use
`verifica-struttura-cbor-minima`, which rejects the tail with
`:cbor-trailing`.

MAX-BYTES bounds **the entire END-START window**, including the tail,
before reset or reading. It is not a budget only for consumed bytes.
Maximums remain 16 MiB, 16 Mi nodes, and 100 array/map levels.
The caller chooses END according to the window it authorizes.
Every success has START<NEXT<=END; the next call may use
NEXT as START to derive concatenated-item boundaries.

The simple u8 BUFFER remains immutable and shareable for reading.
Each worker uses an exclusive preallocated SPACE, reusable even
after a parsing error. Rejected preflight preserves scratch;
after success counts describe only the first item.

Minimal headers and valid UTF-8 text are required, with absolute
offsets in rejections. The primitive does not build ASTs, interpret
application tags, or impose key order/uniqueness. No
waits, I/O, or thread management in the product. The deterministic
document profile and C1/MC/DC qualification remain open.

