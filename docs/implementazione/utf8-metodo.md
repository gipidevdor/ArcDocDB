<a id="metodo-di-verifica-della-validazione-utf-8"></a>

# UTF-8 validation verification method

Method registered before campaigns. Block checks a byte span
without decoding into a string, with maximum 16 MiB budget. Supports
future CBOR decoder limits; does not implement parser, depth,
normalization, or schema validation.

<a id="contratto-e-oracoli"></a>

## Contract and oracles

Simple specialized byte buffer, span `[start,end)`, and nonnegative
integer budget within 16 MiB. Span check precedes budget check;
exceeding budget precedes byte inspection. Empty span
is valid too. Result is Unicode scalar-value count, with NUL, BOM,
and noncharacters allowed. No substitution or normalization.

Grammar from [RFC 3629, §4](https://www.rfc-editor.org/rfc/rfc3629#section-4);
[RFC 8949, §3.1](https://www.rfc-editor.org/rfc/rfc8949#section-3.1) requires valid UTF-8
for CBOR text. After recognizing leading byte, entire sequence
must fit span before reading continuations. Continuations
then checked from left, finally overlong, surrogate, and U+10FFFF limit.
Errors report typed reason and absolute offset: leading byte,
span end for truncation, first invalid continuation, second byte
for excluded scalar value. Argument errors have no offset.

Tests frozen before reading product: all 256 one-byte inputs and
65,536 two-byte inputs compared with strict SBCL decoder after
self-check on manual fixtures. Decoder is acceptance and count
oracle; error priority and offsets have manual oracles.
Independent vectors for three/four-byte boundaries, all truncations,
invalid continuations, sentinel spans, budgets, and invalid input.
Differential fuzz: 4096 inputs of 3..8 bytes with seed `3629A11F`, plus
sequence of 521 scalars encoded by oracle with seed `3629` and slices at
character boundaries. No expected result derived from product.

<a id="parallelismo-e-campagne"></a>

## Parallelism and campaigns

Caller keeps span immutable until return. Function writes
neither buffer nor other objects and uses no global mutable state. Two threads
perform validations on separate preallocated buffers; counts,
contents, and overlapping compute intervals outside startup barrier verified.
Two 655,360-byte buffers, 64 calls each; semaphores within 15 seconds
and joins within 20, with worker termination checked during cleanup too.
This test does not measure pool or engine scaling.

Warning-free build, lint, traceability, and two C1 readings. Decision
table with explicit compound conditions. Separate SBCL coverage with
self-test, raw state, and entire denominator; no data excluded
to obtain artificial percentage. Targeted mutants in new copies,
mandatory baseline, failed compilation always invalid, and exact-line
smoke. Failed attempts preserved too.

Successful-path allocations: preallocated ASCII, two/three/four-byte, and mixed
buffers, five replicates per cell, warmup 128, GC outside measurement. Each
cell uses a span within 16 MiB, with independent expected count and observable
sink. Sensor has baseline and positive control 16 × 1 MiB.
Observed zero heap allocation is criterion; no timing threshold. Measurements are
serial, separate from coverage and mutation campaign.

Kernel treated conservatively as C1. Automated readings
do not constitute human approval; do not close MC/DC, complete decoder
requirements, FAULTED controller, or engine release gates.
