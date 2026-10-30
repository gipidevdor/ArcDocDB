<a id="scrittura-dei-float-cbor"></a>

# Writing CBOR floats

The `arcdocdb.cbor:scrivi-float-cbor-minimo` primitive receives
`BUFFER START END AI HIGH LOW` and returns a single NEXT.
Words contain IEEE bits, with AI25/26/27 for binary16/32/64;
HIGH is zero for the first two widths and LOW is u16 for binary16.
The simple u8 destination belongs exclusively to the caller.

Reduction chooses a shorter exact form, without rounding
or materializing a Lisp float. It preserves sign, zero, infinity, and NaN
payload, including the signaling/quiet bit, according to the local preference of the
[minimal reader](cbor-minimo-metodo.md). Equivalent application encodings
and NaN normalization require a higher-level profile.

Output contains F9/FA/FB and big-endian words, totaling 3/5/9 bytes.
NEXT=START+size; the rest of the physical array is unchanged.
Before writing, range, AI, HIGH, LOW, word consistency,
and selected-form capacity are checked, in that order. Public
errors have offset NIL and leave every byte intact:

| Check | Condition | Reason |
|---|---|---|
| Destination/range | invalid-argument | :cbor-range |
| AI25/26/27 | invalid-argument | :cbor-float-ai |
| HIGH u32 | invalid-argument | :cbor-float-high |
| LOW u32 | invalid-argument | :cbor-float-low |
| Word consistency | invalid-argument | :cbor-float-words |
| Capacity up to END | resource-exhausted | :cbor-float-capacity |

Internal guards require fail-stop without rollback. They are not
atomic or durable publication; composition and document
budget remain higher-level. There are no waits, I/O, or shared writes
per operation; calls on private buffers can run
in parallel.

The [preregistered method](cbor-float-scrittura-metodo.md) fixes corpus,
measurements, defects, and preservation. C1 qualification and engine gate
remain open until the evidence required by ADR-0035.

The [verification results](cbor-float-scrittura-risultati.md) report
parallel tests, mutations, measurements, and limits of observed coverage.
