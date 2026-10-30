<a id="scrittura-dei-valori-semplici-cbor"></a>

# Writing CBOR simple values

`arcdocdb.cbor:scrivi-semplice-cbor-minimo` writes an MT7 wire code
to an exclusive destination. It implements REQ-CBR-003; domain, error
precedence, and tests are in the [preregistered method](cbor-semplici-metodo.md).

```lisp
(scrivi-semplice-cbor-minimo buffer start end value)
;; => NEXT, exactly one value
```

VALUE is an integer 0..23 or 32..255. Codes 20/21/22/23 represent
false/true/null/undefined, without conversion of Common Lisp values;
unassigned codes receive no application semantics. Reserved
codes 24..31 are rejected. Minimal representation uses one byte
for 0..23 and two for 32..255.

BUFFER must be an exclusively owned simple u8 array; START/END
delimit a half-open span, including an empty one. Preflight checks range,
code, and capacity in that order. An invalid argument reports
invalid-argument; an insufficient span resource-exhausted. NIL offset
and entire array intact on every public error. Physical space after
END is unavailable for writing.

After success NEXT=START+size, and only bytes
`[START,NEXT)` change. Prefix, remaining span, and physical tail remain
intact. Internal guards report invariant-violation without rollback;
the owner applies fail-stop. The primitive neither publishes data nor makes
it durable.

Work is bounded to two bytes and local variables. Separate workers
may call it on private destinations, without cross-Serie coordination,
waits, I/O, or ASTs. Overall budget, application profile, floats, and
document composition remain at the higher level.

The [test report](cbor-semplici-risultati.md) preserves corpus,
measurements, mutations, and raw coverage; engine C1 qualification remains open.
