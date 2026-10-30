<a id="validazione-utf-8-limitata"></a>

# Bounded UTF-8 validation

`arcdocdb.utf8:verifica-utf8` fully verifies a span `[start,end)` of
an immutable `arcdocdb.binary:octets` and returns Unicode scalar-value
count. Buffer must be simple byte array. Parameter
`:max-bytes` defaults to 16 MiB and accepts integers from 0 to 16 MiB.
Empty span returns zero, including with zero budget.

| Rejection | Condition, reason, and offset |
|---|---|
| Invalid buffer or span | `invalid-argument`, `:utf8-range`, no offset. |
| Invalid budget | `invalid-argument`, `:utf8-budget`, no offset. |
| Span over budget | `resource-exhausted`, `:utf8-byte-budget`, no offset; precedes any read. |
| Invalid leading byte | `corruption-detected`, `:utf8-leading`, leading-byte offset. |
| Sequence outside span | `corruption-detected`, `:utf8-truncated`, offset `end`. |
| Continuation outside 80..BF | `corruption-detected`, `:utf8-continuation`, first incorrect-byte offset. |
| Overlong, surrogate, or value beyond U+10FFFF | `corruption-detected`, `:utf8-scalar`, second-byte offset. |
| Inconsistency between helpers | `invariant-violation`; future worker boundary applies fail-stop. |

Offsets are absolute within buffer. Range checked first, then
budget; after recognizing lead, whole-sequence availability
checked, then all continuations, finally scalar restrictions. Valid
bytes outside span do not complete a truncated sequence.

NUL, BOM, and noncharacters allowed. Count concerns scalar values,
not graphemes: a letter followed by combining accent counts two. Module
produces no strings, normalizes nothing, and replaces no invalid sequences.
Checks [RFC 3629](https://www.rfc-editor.org/rfc/rfc3629) grammar
used for [CBOR](https://www.rfc-editor.org/rfc/rfc8949#section-3.1) text.
Does not interpret CBOR structure, chunks, or depth.

Caller keeps buffer immutable until return. Each call
uses only local cursor and count; writes no shared state, creates no
thread, and does not wait. Different workers may validate documents in parallel
before sending them to Serie writer queue. Parser and runtime
connection will be a subsequent component.

The [registered method](utf8-metodo.md) and
[decision table](utf8-decisioni.md) distinguish malformed inputs
from internal guards. This kernel supports REQ-LIM-001/002 and REQ-AFF-004/008;
no complete-decoder or engine requirement promoted.

<a id="verifica-locale-del-9-ottobre-2026"></a>

## Local verification dated October 9, 2026

Seventeen UTF-8 tests pass in strict build: all 256 single bytes
and 65,536 pairs (18,304 valid, 47,232 rejected), boundaries and error
priority, maximum 16 MiB, and input immutability. Fuzz with seed
`3629A11F` compares 4096 spans of 3..8 bytes: 234 valid and 3862 rejected.
Separate oracle encodes 521 scalars and verifies slices at their boundaries.

Two workers validate separate 655,360-byte buffers, 64 times each:
83,886,080 total bytes, expected sink 16,777,216 per worker and unchanged
contents. First run observes 265,891 ticks of overlap, with
1,000,000 ticks/s timer, outside semaphores. Work intervals on real
threads; do not attest pool scalability or database throughput.

SBCL coverage retains full denominator: 231/301 expressions
and 49/60 branch outcomes. Unmarked forms are one package form, eight
declarations, one default, and sixty in ten defensive errors. Eleven
unmarked outcomes belong to internal guards. Public default
is exercised by tests but remains unmarked by tool. No operational
or input outcome appears uncovered in this instrumentation; MC/DC and
full defensive-guard falsification remain open.

Full mutation baseline passes; all nine mutants compile and
are detected after smoke. Five allocation fixtures have
five replicates of 64 calls each, warmup 128, and exact counts/sinks:
zero observed heap bytes in all 25 samples. Sensor records
zero baseline and positive control of 16,777,472 bytes. No timing
threshold or absolute proof of nonallocation inferred from these data.

The [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-utf8/catalogo.lisp) preserves
before/after sources, full output, coverage state/HTML, baseline and mutant
logs, C1 readings, and tool checks. Also preserves first
benchmark self-test failed due to typo in hash FORMAT string
and successful test after correction. Automated readings
do not replace human approval or engine release gates.
