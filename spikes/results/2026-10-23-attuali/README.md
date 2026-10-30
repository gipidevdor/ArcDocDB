<a id="campagne-recenti-rilevanti"></a>

# Recent relevant campaigns

The [structured summary](risultati.lisp) retains revision, original catalog hashes,
and external-archive reference. This selection is not a new execution and does
not change test outcomes.

| Campaign | Result and current documentation |
|---|---|
| CRC32C, unrolling, and GET | [16/32-byte comparison](../../../docs/implementazione/crc32c-unroll32.md): retained 16-byte kernel; warm 4 KiB GET at 1.647 µs without oracle in window and 9.813 µs with oracle, on the measured M4. |
| CRC32C portability | [Loading and fallback](../../../docs/adr/0060-crc32c-caricamento-portabile.md): hardware and software tests, runtime selection, and qualified-platform limits. |
| GET costs | [Campaign originals](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-get-costs). |
| Index pages | [Final-verification originals](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-index-pages-final). |
| Automatic index selection | [Verification originals](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-index-auto-final). |
| Unix socket M1 | [Qualification and limits](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-production-unix-m1/report.md). |
| Full text | [Final verification](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-fulltext-rows-final-check) and [coverage](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-fulltext-rows-final-coverage). |

Measurements remain specific to the campaign and machine identified in originals.
Complete originals are recovered from the [historical archive](../../evidence/README.md).

<a id="verifica-della-pulizia-e-dei-pacchetti-ci"></a>

## Cleanup and CI-package verification

The [CI suite](ci-selftest.lisp) passes 364 checks in seven modules; the
[native command](report.lisp) retains stable sources, stdout, stderr, and zero exit status.
The stderr timeout message belongs to an expected negative control.

[Recompression](ci-repack.lisp) of the six original packages from run
`40010510208` reduces 2,128,803 to 2,028,608 bytes, below the unchanged
2,097,152-byte limit. Raw copies are hash-verified. The
[C4 comparison source](ci-repack-source.txt) and its SHA-256 are retained in the result.
This is a packaging comparison: it does not rerun the old run's tests or attest a
new GitHub execution. To repeat it, download the run's assets into
`spikes/out/evidence-cleanup/ci-input/` and execute the source from the repository
root with SBCL, using a new output directory.
