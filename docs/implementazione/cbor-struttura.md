<a id="scansione-della-struttura-cbor"></a>

# Scanning CBOR structure

The codec traverses a complete item with a preallocated stack and verifies
structure, UTF-8, and budgets without creating a decoded document.
The API prepares a foundation for worker validation planned by ADR-0029;
connection to operation admission remains subsequent work.

```lisp
(let ((spazio (arcdocdb.cbor:crea-spazio-cbor))) ; before the hot path
  (arcdocdb.cbor:verifica-struttura-cbor
   buffer start end spazio
   :max-bytes 16777216 :max-nodes 16777216 :max-depth 100))
;; => nodes, maximum array/map depth, end
```

Span `[start,end)` belongs to the caller and remains immutable.
Each worker owns a separate workspace, used by only one call at a
time and reusable after error. The factory creates a structure and two fixed
102-cell arrays; the workspace does not retain the buffer. Budgets below
defaults are available, including zero depth for scalars/strings.

Each item header, including tags and empty chunks, counts as a node; break does
not count. Only arrays/maps increase depth, including empty containers,
keys, and values. A tag does not consume a child of its parent before the following
item. Indefinite-string chunks are definite and of the same type;
each text chunk must contain complete UTF-8 sequences. Success
requires the exact span end, without a second item or remaining bytes.

Invalid ranges, workspaces, aliases with the private kind array, and configurations
are `invalid-argument`. Spans over budget, nodes, or depth are
`resource-exhausted`. Incorrect syntax, truncation, break/chunks, and UTF-8 are
`corruption-detected`; reasons and absolute offsets distinguish the rejection
point. Complete precedence is recorded in the
[method](cbor-struttura-metodo.md). Rejected preflight leaves the workspace
unchanged; runtime errors permit reset on the next call.

ADR-0014 document-profile checks remain to be implemented:
tag semantics, duplicate keys and key ordering, minimal representations,
and float rules. The scanner accepts these cases as generic
structure. The result certifies neither full semantic validity nor deterministic
encoding.

Verification includes independent oracles, generated corpus, finite fuzz,
16MiB and 100-level boundaries, and two threads with private buffers/workspaces.
[First reading](cbor-struttura-lettura.md),
[second reading](cbor-struttura-revisione.md),
[decision inventory](cbor-struttura-decisioni.md), and
[driver reading](cbor-struttura-driver-review.md) distinguish static
findings from runtime campaigns. [Results and raw data](cbor-struttura-risultati.md).
Module tests do not qualify the engine,
durability, or pool scaling.
