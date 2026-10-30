<a id="metodo-di-verifica-dei-segmenti-compattati"></a>

# Compacted-segment verification method

Scope registered before campaigns: in-memory verification of a CLOSED
prefix of a compaction-origin segment, under [on-disk formats](../formati-su-disco.md)
and [ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md).
No application, I/O, manifest, index rebuild, or resolver.

<a id="contratto-e-oracoli"></a>

## Contract and oracles

Stable buffer starting at file offset zero and containing at least
`valid-bytes` bytes. Serie, segment-id, and valid length come from authoritative
source. Header, version, and compaction origin checked; from offset
64 through valid limit, only ordinary PUT/TOMBSTONE records with complete frame and CRC.
Logical CLOSED limit is not presented as physical EOF to batch
scanner. No TAIL classification: incomplete record in authoritative
prefix is corruption; bytes beyond valid limit not interpreted.

Manual fixtures: ASCII magic, bytewise packing, independent bitwise CRC32C.
Declared record histories feed expected counts without product
decoder. Both versions, different keys and bodies, misaligned records,
extreme u64 CSNs, and contract-versioned flag on ordinary PUTs.

Negative tests: different identity in each byte and both segment-id
halves; altered header and unknown version with valid CRC; writer origin;
intact prepared PUT/TOMBSTONE and OUTCOME/SEAL/EDIT/DECISION records; all content
truncation points, success only at known boundaries;
every bit altered in a small fixture; inconsistent lengths with repaired
CRC; invalid/exact/exhausted inputs and budgets; unchanged buffers, including
ignored physical tail. Results returned only at completion.

<a id="campagne-e-criteri"></a>

## Campaigns and criteria

Build without warnings/style-warnings, lint, links, traceability, and integrated
check. Two C1 readings on format/errors then bounds/ownership/decisions.
Separate instrumented coverage with missing-branch self-test, preserving
full denominator. Mutations in isolated copies, mandatory unchanged
baseline and classifier self-test: origin, allowed types, prepared,
valid limit, byte/record budgets, version from file, and counts. Failed
compilation does not count as detected defect. All attempts preserved.

Serial measurement of successful path: preallocated 64-byte and
256-record fixtures (alternating PUT/TOMBSTONE), both versions; five replicates of
4,096 calls, warmup 128, and full GC before each replicate. Monotonic time,
SBCL heap delta, and observable result. Self-test with zero baseline and
positive control 16 × 1 MiB. Criterion zero measured heap; no promised
throughput threshold or absolute absence of allocations inferred from
counter. One worker, safety 3, uncontrolled external load, no I/O.

Tests concern in-memory verifier. They do not promote engine
requirements or close recovery, transactions, compaction, or release gates.
