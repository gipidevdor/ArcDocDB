<a id="testate-cbor-minime"></a>

# Minimal CBOR headers

The `arcdocdb.cbor:leggi-header-cbor-minimo` reader supplements syntactic
reading with minimal-width checks: integers, lengths,
tags, and floating point. It is a local component for ADR-0014's subsequent
document profile.

```lisp
(arcdocdb.cbor:leggi-header-cbor-minimo buffer start end)
;; => major, AI, high-u32, low-u32, next, :argument
```

The buffer remains immutable. Checks operate on bits and u32 words,
including float64 and NaN, without creating a floating-point number or u64
integer. Both signs of zero, infinities, and NaN payloads are preserved.
A shorter NaN representation is required only when padding
its significand reproduces the original payload, under
[RFC 8949 §4.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.1).

Syntax checking precedes minimality checking: it preserves the base reader's
conditions and offsets. A complete header with a narrowable argument or float,
an indefinite length, or a break reports
`corruption-detected :cbor-nonminimal` at the start offset.

Each call uses only local variables; workers and Serie may
read independent buffers without locks, shared state, or scratch.
Work has a fixed nine-byte limit. It does not traverse the body,
verify UTF-8, map ordering/duplicates, or tag semantics.
A positive result does not certify determinism of the entire item.
The generic structural scanner retains its API and scope.

[Contract and campaigns](cbor-minimo-metodo.md),
[results and original data](cbor-minimo-risultati.md).
