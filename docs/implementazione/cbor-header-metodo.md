<a id="metodo-di-verifica-degli-header-cbor"></a>

# CBOR header verification method

Method registered before the campaigns. The primitive reads a header of
at most nine bytes from the caller's immutable span. The document
profile in ADR-0014/0048 remains for the later parser: this block does not
traverse payloads, containers, tags, or text and does not apply the 100-level
limit or the full document budget.

<a id="contratto-e-oracoli"></a>

## Contract and oracles

`arcdocdb.cbor:leggi-header-cbor(buffer,start,end)` returns six values:
major type, additional information, argument high and low words,
next offset, and form (`:argument`, `:indefinite`, `:break`). The argument
stays in two u32 words, including every bit of a float64; the planned implementation
creates neither a boxed u64 integer nor a float object; the campaign
will verify the successful path on 64-bit SBCL.

The span is `[start,end)`, within a simple byte array. Invalid range:
`invalid-argument :cbor-range`, without offset. Empty span or incomplete header:
`corruption-detected :cbor-truncated`, absolute offset `end`. The
full width is checked before argument bytes; a physical suffix outside
the span does not complete the header. AI 28..30 are reserved; AI 31 is allowed
as an indefinite form for major 2..5 and as break for major 7, rejected
for 0/1/6. A simple value with lead F8 and second byte below 32 is malformed.
Other arguments are unsigned big-endian: widths 0/1/2/4/8 bytes.

Syntax follows [RFC 8949, §3 and §3.3](https://www.rfc-editor.org/rfc/rfc8949#section-3).
The API preserves AI and original bits: it does not reject a nonminimal integer
representation, interpret floats/tags, or establish break context.
The deterministic document profile must apply these checks
later. Success does not validate the entire CBOR item.

Independent tests frozen before reading the product: all 256 lead bytes,
all F8 second bytes, all 65,536 two-byte arguments, and asymmetric
fixtures for endianness and high/low separation. u32/u64 boundaries,
raw floats (zero, infinity, NaN), indefinite forms, nonminimal forms, and
priority/truncation tests with sentinels. Finite differential fuzz of 4096 spans
of 1..9 bytes with a local arithmetic model, which may use cold bignums.
No expected value is calculated by calling the product primitive.

<a id="concorrenza-e-strumenti"></a>

## Concurrency and tools

Two real threads traverse headers on private immutable buffers, verify
all six values, full contents, and overlapping work intervals
outside the initial barrier. Waits, iterations, joins, and cleanup have explicit
bounds. This is not a measurement of pool scaling.

Strict build, lint, traceability, two C1 readings, and compound-decision
inventory. Coverage explicitly scoped to the two CBOR sources,
raw state and all HTML; no guard is removed from the denominator.
Filter and missing-branch self-tests. Compilable mutants in exclusive
copies: full baseline required, smoke on exact line,
failed compilation always invalid. Every attempt and log is retained.

Allocations: preallocated fixtures for all widths, maximum u64
argument, simple, raw float, indefinite, and break; five replicates per cell,
4096 calls per replicate, warmup 128, and GC outside measurement. All six values feed an
observable sink compared with independent constants. Sensor with zero
baseline and positive control 16 × 1 MiB. Criterion: zero observed heap,
no throughput threshold. Measurements are serial and separate from
coverage/mutation campaigns; they do not qualify the whole engine.
