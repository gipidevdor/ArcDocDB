<a id="metodo-di-verifica-dei-metadati-storage"></a>

# Storage-metadata verification method

Scope: segment headers, EDIT/DECISION payloads and records. Excludes I/O,
manifest application, ID uniqueness, multiseries protocol, or durability.

<a id="correttezza"></a>

## Correctness

Oracles build bytes with independent packing and the foundation tests'
bitwise CRC32C. All bytes compared, including 64-bit fields with high bit
set, versions 1/2, and sentinels before/after output. Checks include every
truncation point, byte alterations, invalid fields with recalculated CRCs, huge
counts in small buffers, exact and lower budgets, cumulative outcomes, exact
consumption, and encoder rejections without partial changes.

Command: `make test lint`. Warnings and style warnings stop compilation.
Instrumented coverage collected in a process/cache separate from measurement.
Percentages are execution evidence, not correctness certification.

<a id="prestazioni"></a>

## Performance

Commands: `sbcl --noinform --no-userinit --script tools/storage-bench.lisp --self-test`
and the same with `--bench`. Record tool `tools/record-command.lisp` preserves
arguments, environment, revision, Git source hashes, raw output, and outcome.

Five samples per campaign, one worker, safety 3, preallocated fixtures, warmup
up to 1,024 calls and full GC before each sample. Monotonic time
and heap bytes measured through SBCL; a self-test also checks deliberate
allocation. Call result feeds an observable accumulator.

Campaigns: 64-byte header; EDIT with 2 or 1,024 closures and one outcome per closure;
DECISION with 2 or 65,535 participants. Record verifiers include CRC
over the entire record. Payload encoders include preflight and copying but no
frame CRC. IDs in payloads remain opaque: duplicate checking
or catalog state is not measured. Stamp/CSN/segment-id u64 values are high.

Criteria: no warnings, all assertions passed, zero heap bytes measured
in successful campaign paths. Timings are local observations, without a
promised throughput threshold. External load uncontrolled; these
measurements are not database performance and do not close architectural spikes.

Method registered before the performance campaign; initial test-compilation
attempts precede it. Failed outcomes are preserved as such.
