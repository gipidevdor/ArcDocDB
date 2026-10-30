<a id="rapporti-ci-nei-processi-isolati"></a>

# CI reports in isolated processes

Method preregistered on 2026-10-17, before correction.
GitHub run 39028943515 has successful ordinary checks, but failed coverage
reading `verify-linux/result.lisp`: fresh process lacks keywords
produced by other modules. Trusted vocabulary must include SKIPPED,
METRICS-STATUS, and EXECUTION without depending on loaded modules.

Correction extends only finite C4 wire keyword list.
Parser retains FIND-SYMBOL, limits, rejection of unknown tokens;
no INTERN on input or product loading as remedy.

Regressions: new SBCL loads only DATA and reads/rewrites representative
canonical report bytewise; another rejects unknown keyword
constructed without INTERN. Both retain argv, exit code,
stdout/stderr, input files, bounded timeout/cleanup. Before correction,
positive regression must fail; afterward, original Linux replay,
CI self-test, and real Linux verification must also pass.

Original run's seal job preserved closed, incomplete,
failed collection: nonzero exit consistent with absent coverage.
Semantics unchanged; no historical-run reclassification.

REQ-VAL-001, REQ-AFF-012. C4 path, no product-code changes.

<a id="budget-del-riepilogo-di-copertura"></a>

## Coverage-summary budget

Second check preregistered before producer correction. Historical
summary measures 26,473 bytes. First fixture with original 349
EXPECTED-FILES rows occupies 68,380 characters including publisher
metadata not belonging to seal. Recalculation of 2026-10-22 removes
metadata and represents successful outcomes: sealed fixture with
expected rows only occupies 68,009 bytes, exceeding allowed 65,536. Both
fixtures preserved; not coverage measurements, do not modify
failed historical run.

Compact summary must contain expected-file count; plan
and raw report retain all original rows. Regression uses
600 files, packs sealed result within limit, rereads compressed raw
and compares with original. Separately verifies missing
ordinary test remains incomplete after compaction. Before correction,
packing case must fail; afterward both must pass.
No budget increase or seal-outcome change.

<a id="risultati-locali-e-conservazione"></a>

## Local results and preservation

Tests of 2026-10-17 on SBCL 2.6.9, macOS ARM64, uncontrolled
external load. No engine-performance inference.

| Revision | Test | Outcome |
|---|---|---|
| `a8226c10` | Self-test before complete vocabulary | 328/329; only fresh-process read fails |
| `fb81a7e7` | Self-test after complete vocabulary | 329/329 |
| `fb81a7e7` | Original Linux report, product-free process | 6/6 ordinary tests recognized |
| `fb81a7e7` | `make check` | OK, sources STABLE |
| `edd4000b` | Self-test before compaction | 330/331; only summary budget fails |
| `8ecfadc4` | Self-test after compaction | 331/331 |
| `8ecfadc4` | Full `make check` | OK, sources STABLE |

600-file fixture retains 118,298-byte original report and
produces 304-byte compact result. Package and compressed raw
reread and compared with input. Incomplete ordinary test
remains incomplete.

The [closed collection](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-ci-wire-processi/catalogo.lisp)
preserves records, original outputs, failures, fixtures, source
variants. Collection dated 2026-10-22; original process dates
remain in respective records. Replay identifies original Linux
report by path and SHA-256, without presenting it as new
Linux campaign. Actual Linux coverage still to verify in same-revision
workflow; no C1/MC/DC promotion.

<a id="disponibilità-del-conteggio"></a>

### Count availability

Additional check preregistered on 2026-10-22: compact result
derives count from TOTALS, already produced by coverage adapter.
If child stops before report, count must remain
NIL; measured empty inventory must remain zero. Two separate
cases distinguish absence from measurement without converting NIL to zero
through LENGTH. Previous collection closed and unchanged.

On `097ad02a`, self-test passes 332/333 cases: only count
incorrectly zero when report absent fails. On `18d761b2`,
333/333 cases and full `make check` pass; all records have
sources STABLE. [Additional collection](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-ci-count-availability/catalogo.lisp)
preserves before/after, sources, full verification. Count needs
no new list scan: reuses already measured value.
