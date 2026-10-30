<a id="metodo-di-verifica-degli-header-dei-log"></a>

# Log-header verification method

Scope: in-memory encoder and verifier for `control.log` and
`multiserie.log` headers, layout fixed by [ADR-0052](../adr/0052-header-dei-log-di-controllo.md).
Method precedes campaigns. Files and contents are not modified
by codec; returned version selects decoder for subsequent records.

<a id="correttezza"></a>

## Correctness

Separate oracle: magic written as ASCII characters, manual little-endian
packing, and bitwise CRC32C from foundation tests. Full comparison of
64 bytes for both types and versions 1/2, with unaligned prefix,
outside sentinels, and identities with high bytes. Verification without input mutation.

For each type: all 64 truncations; all 512 altered bits; every nonzero reserved
byte with recalculated CRC; differences in all 16 expected-identity
bytes; incorrect magic in each half and swapped type with valid CRC; versions
0, 3, and 65535 with valid CRC. Incorrect CRC precedes version interpretation.
Encoder rejections (range, identity, version, type, and alias) do not modify
destination. No semantic header error is classified as record
tail.

Strict build, tests, lint, links, and traceability. Instrumented coverage
in separate process/cache, with missing-branch detection self-test.
Targeted mutations in isolated copies: CRC, each magic half, identity,
each reserved area, and truncation bound. Campaign has replacement
and classification self-test; failed compilation does not count as
detected mutant. All outcomes, including failures, preserved.

<a id="allocazioni-e-tempo"></a>

## Allocations and time

Preallocated fixtures, one worker, safety 3; both types and versions 1/2.
Encoder and verifier: five replicates of 262,144 calls each, warmup
1,024 calls and full GC before every replicate. Observable result,
monotonic time, and SBCL heap-byte counter. Positive control allocates
1 MiB per call for 16 calls; baseline and self-test before campaign.

Criteria: no warnings, successful tests, compilable mutants detected, no
measured heap allocation on successful paths. Counter does not demonstrate
absolute nonallocation; local times without performance threshold, external
load uncontrolled. Serial in-memory codecs, without I/O, concurrency,
or durable commit. No engine requirement promoted by these tests.

Two C1 readings: format/boundaries/error classification, then buffer
ownership, loop limits, compound decisions, and integration. Findings and
resolution recorded in implementation note.
