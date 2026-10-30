<a id="scrittura-delle-testate-cbor-minime"></a>

# Writing minimal CBOR headers

The codec foundation exposes `arcdocdb.cbor:scrivi-header-cbor-minimo` to
write an MT0..6 argument header to a preallocated destination.
It implements REQ-CBR-001, derived from ADR-0014; the [method](cbor-scrittura-metodo.md)
freezes the contract and checks.

```lisp
(scrivi-header-cbor-minimo buffer start end major high low)
;; => NEXT, only one value
```

The span is `[start,end)` within a simple u8 array. MAJOR is 0..6, HIGH and LOW
are u32 words of the wire argument. For negative major MT1, `n` is represented
by argument `-1-n`: for example, `major=1, high=0, low=24` writes `38 18`
(hexadecimal bytes), representing -25. Strings, maps, arrays, and tags
receive only their header, without payload or children.

Width is always minimal: 1/2/3/5/9 bytes according to the argument.
Words are written big-endian without constructing a u64 or document.
Success modifies `[start,NEXT)`; the rest of the buffer remains unchanged.
A length or tag header can have any u64 wire argument;
full-document budgets remain at the higher level.

Preflight checks range, major, high, low, and capacity, in that order.
Invalid arguments signal `invalid-argument` with reason
`:cbor-range`, `:cbor-write-major`, `:cbor-write-high`, or `:cbor-write-low`.
Insufficient space signals `resource-exhausted :cbor-write-capacity`.
All have offset NIL and leave the destination intact. Internal guards
signal `invariant-violation`, without rollback; the owner applies
fail-stop under the project's general contract.

The caller owns the destination exclusively until return.
The function creates no threads or waits, performs no I/O, and publishes no data:
separate workers operate on private buffers. The code retains no mutable global
state and introduces no shared write between Serie.

This primitive complements the [minimal reader](cbor-minimo.md) for MT0..6
headers only. MT7 floats/simple values, payloads, UTF-8, structure, and the
deterministic document profile belong to other components.
The [preserved results](cbor-scrittura-risultati.md) document tests,
concurrency, heap, mutations, and coverage limits.
