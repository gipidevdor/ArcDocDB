<a id="item-cbor-con-testate-minime"></a>

# CBOR items with minimal headers

The codec verifies a complete item, applying the
[minimal-header](cbor-minimo.md) check during the same traversal that
checks structure, UTF-8, and budgets. Each worker uses private scratch.

```lisp
(let ((spazio (arcdocdb.cbor:crea-spazio-cbor))) ; preparation outside the hot path
  (arcdocdb.cbor:verifica-struttura-cbor-minima
   buffer start end spazio
   :max-bytes 16777216 :max-nodes 16777216 :max-depth 100))
;; => nodes, peak array/map depth, end
```

The buffer remains immutable. Preallocated 102-cell scratch is
reusable, including after error, and belongs to only one active call.
Root, children, keys, values, and tags go through the minimal reader; binary
payloads remain opaque. The check constructs no AST, float, or u64
integer, copies no document, and introduces no lock, wait, or I/O.

Header syntax errors precede minimality errors.
A complete shortenable, indefinite, or break header signals
`corruption-detected :cbor-nonminimal` at the lead, before nodes,
depth, and payload. The tail after a complete root remains
`:cbor-trailing`; an incomplete child remains `:cbor-truncated` at END.
Range, aliases, and configured limits are checked before reset.

The generic scanner retains signature and behavior. Key order/equivalence
and tag semantics require the later document
profile: this API's result attests structure, UTF-8,
budget, and local header preference.

[Contract and method](cbor-minimo-struttura-metodo.md),
[first reading](cbor-minimo-struttura-lettura.md), and
[decision inventory](cbor-minimo-struttura-decisioni.md).

[Results, coverage, and original archives](cbor-minimo-struttura-risultati.md).
