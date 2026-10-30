<a id="pagine-dellindice--verifiche-iniziali-i2"></a>

# Index pages — initial I2 verification

Campaign started on 2026-10-22, updates of 2026-10-23; SBCL 2.6.9,
macOS ARM64. Method preregistered in
[codec contract](pagine-indice.md#metodo-preregistrato-e-decisioni-c1).
Functional tests measure neither performance, RSS, nor capacity beyond RAM.

The [command archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-index-pages-targeted/catalogo.lisp)
preserves full output, current sources, and test versions preceding
corrections. Records retain original status, never reinterpreted.

| Run | Outcome | Interpretation |
|---|---|---|
| targeted-01 | FAILED, stable sources | Helper name IDENTITY conflicted with COMMON-LISP; renamed in test package. |
| targeted-02 | FAILED, stable sources | Fixture home group did not conform to primary's aligned mask; manual digest construction corrected. |
| targeted-03 | OK, exit 0, stable sources | Strict compilation and 18 tests completed. |
| targeted-04 | OK, exit 0, stable sources | Same tests after adding private-contract and header-writing assertions. |
| lint-01 | OK, exit 0, stable sources | Static checks before final assertions; global check distinct. |
| collection-01 | FAILED, stable sources | Collector preflight: absolute path inserted in relative destination path. Manifest corrected, original and rejection preserved. |
| full-check-01 | FAILED, stable sources | Build/tests, lint, traceability, links, and full-text checks passed. Two preexisting session-cleanup cases in evidence tool prevent global-check closure; no codec test failed. |
| session-replay-01 | OK, exit 0, stable sources | Two original cases repeated without modifying tool; both passed, original conditions recorded. No definitive cause attributed to previous failure. |
| full-check-02 | FAILED, stable sources | Build/tests, lint, and traceability passed; links in preserved Markdown copies under out interpreted relative to copy directory. Extension renamed to .md.txt without changing bytes. |

Independent fixtures verify header and body bytewise with bitwise
CRC, three sizes and three types. Tests cover 7/8 saturation and next byte,
identical collisions, boundary v2 records, foreign/copied identities, inline
keys with exact arena, external keys, and 65535-byte fragmentation across
17/5/2 pages. Rejected guards, sources, and buffers remain unchanged.

One test individually alters all 4096 page bytes without updating
CRCs and requires rejection. Separate cases recalculate correct CRCs for inconsistent
fields, PageRefs, controls, packing, padding, and geometries. Thus checksum
verification and local structural validation distinguished.

Representation of a split directory verifies only pages and
references: implements neither writer split nor publication. In review
following targeted runs, both synthetic digests were also placed
in corresponding child prefixes 0/1; updated version passed
build/test phase of first global check. Still not an
engine-split differential test. Diagnostics and global-check
repetition remain separately recorded from first targeted archive.

Two readings by same author: contract/layout and error flow with
no effects before preflight. Independent review, complete MC/DC,
file container, graph tests, cache, snapshots, commit,
recovery, and automatic runtime changes remain open. No lock-free property or
zero allocation attributed to codec from these executions.

<a id="chiusura-della-verifica-integrata--2026-10-23"></a>

## Closing integrated verification — 2026-10-23

`full-check-03` completed `make check` with OK status, exit 0, stable
sources: warning-free compilation, full suites (18 codec tests),
lint, trace, links, full-text checks, evidence tools, 307 catalogs,
11 spikes, and CI self-check. Both C4 session cases also passed in
full suite: 48 cases and 756 checks for that tool.

The [verified final archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-index-pages-final/catalogo.lisp)
preserves successful command, both failed global runs, diagnostic
repetition, affected fixtures, and document versions before
updates. No historical outcome promoted or overwritten.
This annotation follows global run: code unchanged, only final
metadata separately subjected to link and trace checks.
