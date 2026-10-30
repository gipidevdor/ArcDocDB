<a id="fondazioni-binarie"></a>

# Binary foundations

Record framing, CRC32C, and batch verification. Common Lisp code, specialized vectors,
no external dependency. References: [on-disk formats](../formati-su-disco.md),
[ADR-0039](../adr/0039-cornice-unica-dei-record.md),
[ADR-0048](../adr/0048-limiti-documentali-e-formato-v2.md),
[coding standard](../affidabilita/standard-di-codifica.md).

<a id="ambito"></a>

## Scope

In-memory primitives are implemented. The module prepares and verifies bytes; the segment
owner governs I/O, commit, visibility, and transition to `FAULTED`. No file writes,
synchronization, deletion, waits, or index changes are performed here.

`EDIT` and `DECISION` structures are checked only for framing and minimum
length. Their contents, CBOR, and document depth belong to dedicated
decoders. An intact record may be uncommitted; an intact SEAL alone does not attest
that an `fsync` occurred.

<a id="contratti"></a>

## Contracts

All buffers are `simple-array (unsigned-byte 8)`. Ranges are `[start,end)`;
buffer version and origin are explicit. Declared Lisp types are preconditions;
with `safety 3`, a type violation is detected by the runtime. Framing and budget errors
belong to the `arcdocdb-error` hierarchy.

| Operation | Guarantees | Returns |
|---|---|---|
| `crc32c` | Incremental CRC32C, without copies | finalized checksum |
| `scrivi-record` | checks before first mutation; header/body CRC; v1/v2 frame | record end |
| `verifica-record` | header CRC before lengths; bounds, type, flags, and body CRC | end, type, flags, stamp, key and value ranges |
| `verifica-put` | frame checks and match against index key, CSN, and flags | value range |
| `verifica-lotto` | records allowed by log type, applicable stamp, SEAL, file, offset, count, batch CRC, and budget | end, SEAL stamp, declared frontier, count |

`scrivi-record` requires an exclusive buffer and inputs that do not alias the destination
buffer. Validation rejection leaves the destination unchanged. Readers require
stable buffers throughout the call **and while using returned ranges**: the owner
retains the pin or reference until the read is complete.

For a prepared PUT, the resolver must supply an OUTCOME **in the same segment and in a
committed batch**. The codec checks proof bytes, TXID, and CSN; provenance and commit
remain resolver preconditions. A number passed as proof is not accepted.

Within a batch, ordinary PUT and TOMBSTONE and EDIT must have the SEAL stamp. Prepared
PUT/TOMBSTONE, OUTCOME, and DECISION carry a TXID: it is not compared with the SEAL CSN.
This distinction follows the [format](../formati-su-disco.md) fields.

<a id="memoria-e-parallelismo"></a>

## Memory and parallelism

CRC32C tables are private: built at startup, read-only after publication.
The [ARM64 backend](crc32c-arm64.md), when qualified and available,
is selected at startup through the I/O module's CPU detection. Checksum
kernels remain in memory; they perform no OS probing during service.
Other data belongs to the caller. There are no locks, queues, counters, or
shared writes per operation between Serie. The module serializes only access to the
exclusive buffer entrusted to an individual call.

The codec uses buffer ranges and multiple values; it creates no document copies or
per-entry objects. All scans are bounded by verified sizes. Batch verification
has separate byte and record budgets and checks size before scanning the
next body. Exceeding budget is distinct from corruption.

> **Proposal** — The GET path compares 64-bit integers as two 32-bit words,
> after frame verification. It avoids materializing a bignum while retaining the full
> comparison. The inspection API `verifica-record` and integer reads through `leggi-u64`
> may instead allocate for values beyond fixnum. They are not declared allocation-free.

<a id="verifica-riproducibile"></a>

## Reproducible verification

```sh
make test lint
sbcl --noinform --no-userinit --script tools/foundation-bench.lisp --self-test
sbcl --noinform --no-userinit --script tools/foundation-bench.lisp --bench
sbcl --noinform --no-userinit --script tools/foundation-coverage.lisp --self-test /tmp/foundation-cover-probe/
sbcl --noinform --no-userinit --script tools/foundation-coverage.lisp --report /tmp/foundation-cover/
sbcl --noinform --no-userinit --script tools/foundation-mutation.lisp --self-test
sbcl --noinform --no-userinit --script tools/foundation-mutation.lisp --run /tmp/foundation-mutants-new/
```

The mutation destination must be new. Each mutant compiles and runs tests
in a separate copy; a failure before tests start does not count as detection.
Coverage uses a separate ASDF cache. Benchmarks run after checks, in a
process without coverage instrumentation, with no other concurrent measurement campaigns.

The **26 tests** include known CRC vectors, a bitwise CRC oracle, comparison of over 2,000
ranges/alignments, independent packing, v1/v2, extreme u64 values, a 16 MiB document,
a 65,535-byte key, every fixture truncation, a bit flip in every byte, malformed fields with
valid CRCs, index mismatch, OUTCOME proof, and batch budget. Fixtures do not verify
CBOR semantics or durable protocols.

The [nine targeted mutations](risultati/2026-10-08-mutazioni.lisp) check polynomial, CRC comparisons, key threshold, identity `and`/`or`,
prepared flag, SEAL checksum, stamp, and budget. The result is relative to
this declared family: **9/9 detected**, not a measure of all possible mutants.

<a id="prestazioni"></a>

## Performance

The [raw measurements](risultati/2026-10-08-benchmark.lisp) record environment, source
fingerprints, iterations, duration, and heap bytes for each of the five samples. These are serial
in-memory microbenchmarks on Apple M4, ARM64, SBCL 2.6.9, `safety 3`, with preallocated buffers and warm
cache. They do not measure NVMe, network latency, `fsync`, concurrency, request P95/P99, or
database throughput. MD5 fingerprints identify sources; they do not attest authenticity.

Campaigns include ordinary and maximum u64 CSN, encoding with maximum u64, and prepared
verification with high TXID and CSN. The counter self-test checks both absence of allocations
in the control fixture and detection of deliberate allocations. Zero detected bytes
applies to the measured inputs and successful path; errors may allocate conditions.

Median of five samples, 2026-10-08:

| Campaign | Operations/s | MiB/s | Heap bytes detected in each sample |
|---|---:|---:|---:|
| CRC32C, 2 KiB | 342,139 | 668.2 | 0 |
| CRC32C, 16 MiB | 41.4 | 662.9 | 0 |
| PUT verification, 2 KiB value | 310,462 | 618.2 | 0 |
| PUT encoding, 2 KiB value | 308,547 | 614.4 | 0 |
| PUT verification, maximum u64 | 310,247 | 617.8 | 0 |
| PUT encoding, maximum u64 | 306,183 | 609.7 | 0 |
| Prepared verification, high TXID/CSN | 290,175 | 586.7 | 0 |

For CRC32C, byte count is the buffer's size; for records it includes key and header;
for prepared it also includes OUTCOME. The 2 KiB document has a 16-byte key.

<a id="decisioni-e-revisione"></a>

## Decisions and review

The [decision table](fondazioni-decisioni.md) connects predicates to tests. Two
readings checked format and boundaries, then buffer ownership, budgets, stamps, and
allocations. Build without `warning` or `style-warning`; linter without violations.

Linked requirements: REQ-FOR-002, REQ-FOR-003, REQ-FOR-004, REQ-LIM-001, REQ-LIM-003,
REQ-AFF-002, REQ-AFF-004, REQ-VAL-001. Affected invariants: INV-A2, INV-A3, INV-A4,
INV-A8, INV-P6, and INV-X3. Status of complete requirements remains distinct from evidence for
these primitives: no engine requirement is automatically promoted to verified.

<a id="criteri-ancora-da-chiudere"></a>

### Criteria still to close

The [raw `sb-cover` data](risultati/2026-10-08-copertura.lisp) does not equate to MC/DC.
Coverage includes definition forms and
inline function bodies; raw data must be examined without removing unexecuted
forms from the denominator. C1 qualification requires closure of coverage and exceptions
under the [verification plan](../affidabilita/piano-di-verifica.md), independent review,
and subsequent verification of integration with I/O, resolver, and `FAULTED` transitions.

Remaining limits include CRC32C collisions, concurrent buffer mutation if the
owner violates the contract, incomplete control payload decoders, and
absence of crash tests on the integrated engine. CRC32C is not authentication. This module
does not close the database release criteria.
