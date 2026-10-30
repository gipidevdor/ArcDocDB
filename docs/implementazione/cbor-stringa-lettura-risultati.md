<a id="verifiche-della-lettura-diretta-delle-stringhe-cbor"></a>

# Verification of direct CBOR string reading

Campaign dated 2026-10-15 for REQ-CBR-009. The function returns
MAJOR, PAYLOAD-START, and NEXT of the first minimal MT2/3 item, without copies;
MT3 verifies UTF-8, tail remains ignored, and budget covers the whole
window. The [method](cbor-stringa-lettura-metodo.md) precedes the product.

<a id="freeze-e-revisioni"></a>

## Freeze and revisions

Contract preregistered in `d31d888b`; independent corpus and driver
frozen in `b83a0bda` before kernel. Both C1 readings
([first](cbor-stringa-lettura-prima-revisione.md),
[second](cbor-stringa-lettura-seconda-revisione.md)) precede every
compilation. Qualified freeze `f7c9e0503577b45e2bd20de66c72b6e7232a8c76`.

| Source | Git blob |
|---|---|
| src/codec/cbor-string-read.lisp | d4a4f774c2264c46349e7eda61ee4a2a3118d742 |
| tests/codec/cbor-string-read-support.lisp | cfd55cd47d782673113e67af625c1360195a345c |
| tests/codec/cbor-string-read.lisp | 8437bdcaa4cf308dbf4614e748cdab4be2ae6d62 |
| tests/codec/cbor-string-read-threads.lisp | 8fc4ae5d9214108a6ae6bf26e644db1a42733cdd |
| tools/cbor-string-read-driver.lisp | a6b65bd233dba2a2eec941d96a75b9db948d19f8 |

Two functions of 14/35 lines and 5/10 paths, including AND
short-circuiting. The [complete table](cbor-stringa-lettura-decisioni.md) counts twelve
guards, one AND with two operands, eleven ERRORs, and nine binary comparisons;
no new loop. Internal guard and keyword default remain in denominators.

<a id="corpus-parallelismo-e-misure"></a>

## Corpus, parallelism, and measurements

17 named tests pass: 16 serial and one concurrent. The plan's 9906 calls
comprise 690 non-fuzz, 1024 fuzz, and 8192 concurrent: 9040 successes
and 866 rejections. These are arithmetic denominators, not instrumented counters.
Ranges, budgets, all widths, u64, UTF-8 and precedence, exact arity,
16MiB windows, and physical immutability are checked cold.
Corpus fuzz uses seed `53545239` and final `F8417639`: 512 successes and
512 rejections, in eight families of 64.

Two real reused workers, two waves of 2048 calls per worker. The same
buffer contains an MT2 and MT3 window: results2/8/12 and3/13/16,
tokens 41333/41509 and sinks 84649984/85010432 per worker/wave. Rendezvous
after first verified call, timeout, joins, and cleanup are bounded.
WALL intervals include checks and waits; no measurement of scaling
or simultaneous execution on cores is inferred.

The separate driver passes 36 comparisons and 1024 fuzz pairs with seed `43535239`.
Benchmark: 12 fixtures, 60 samples of 1024 calls, 3840 warmups and 12 cold calls,
65292 total calls; 67376 including diff/fuzz. All three values,
sinks, checksums, and buffers checked. Zero observed heap allocation in all
60 samples; zero baseline and positive sensor 16×1MiB=16777472 bytes.
The 675727360 item bytes are a denominator, not bytes actually
read: MT2 does not traverse payload. Consumer costs included, external
load uncontrolled, no speed threshold or engine throughput.

Eight compilable mutants are detected by the expected named test after all
38 compilations: permissive major, skipped UTF-8, NEXT=END, ignored
budget, START=0, extra arity, skipped minimality, and ignored HIGH.
Six were preregistered; two extensions declared before
campaign. Arity mutant changes two consistent fragments, body and FTYPE,
in the copy only. Baseline 17/17; eight exit1/signalNIL. Warnings, compilefail,
helper errors, signals, and faults after completion do not count as detections.
Independent reading passes 4791 checks: 342 byte comparisons of
38 sources×9 copies, exact fragments, and 424 stable files/metadata.

<a id="copertura-e-integrazione"></a>

## Coverage and integration

Exact new-file scope: **116/155 expressions and 20/26 branches**.
All 45 missing entries remain included: four top-level forms, one
keyword default, 34 expressions, and six branches of six internal guards.
Global raw state of 423 files, HTML, and local-scope index agree.
The 3374141-byte raw state is losslessly compacted after DATA reading;
the supplement reverifies SHA256 and decoded size.

`make check-core` on f7c9e050 passes 1743 unique named tests and two smoke tests;
the 17 new names agree with DATA corpus. Compiler notes are
preserved; no WARNING or STYLE-WARNING. Integration e1bffcae
with CSN recovery passes the same suite, lint on 249 files, and trace with 127 requirements.
The combined command remains FAILED at links: six ignored historical
Markdown copies caused 282 broken relative links. Renamed .md.txt
with unchanged SHA256, the later links check passes with zero broken links.
Failure and correction are both preserved. Subsequent integrations
retain the same reader and corpus pins.

Final build `4af9f054` also integrates the ID proposal and
full-text contract: **1751 unique named tests and two smoke tests**, lint, trace, and
links passed in the same command. The [final register](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-cbor-string-read-integration/catalogo.lisp)
preserves that process and count reading, including the first
failed attempt of the C4 reader alone and its correction.

<a id="conservazione-e-limiti"></a>

## Preservation and limits

The [main archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-cbor-string-read/catalogo.lisp)
contains ten records completed OK, historical snapshot, and preparation
originals, including C4 reader errors. Collection with four
workers and independent closed inventory: **602 indexed files, 604 physical,
6736470 indexed bytes**, without append after checking.
The [supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-cbor-string-read-final/catalogo.lisp)
preserves integration, rename, compaction, independent reading, and
records/observations of main collection; it keeps the FAILED
command distinct. It does not recursively include its own collection.

Private copies/caches and synthetic inputs with symlinks/deep empty
directories remain in ignored support, copied separately at work completion.
Selected files are explicit: closed inventory attests that set,
not every checkout file. REQ-CBR-009 is implemented; REQ-LIM-001/002,
document profile, and C1/MC/DC qualification remain open.
