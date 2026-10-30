<a id="lettura-c4-degli-strumenti-per-la-struttura-cbor"></a>

# C4 reading of CBOR structure tools

Static reading completed on 2026-10-09, before product campaigns. The reader is the new kernel's author: this report concerns C4 tools and is neither an independent C1 reading of the product nor human approval. No product, tests, compilations, coverage, or collector were run during this reading. The benchmark and mutator remain in the reading assigned to the integration lead.

`tools/foundation-coverage.lisp`, the preregistered method, and the two external tools `/tmp/collect-cbor-structure-evidence.lisp` and `/tmp/cbor-structure-collector-guard-test.lisp` were read. No concrete defects remain open within the examined scope; the static outcome permits freezing the tools without anticipating campaign outcomes.

<a id="copertura-e-metodo"></a>

## Coverage and method

The `cbor-structure` filter allows only the exact suffixes of the six files `cbor-package`, `cbor-space`, `cbor-scan-input`, `cbor-scan-stack`, `cbor-scan-items`, and `cbor-scan`. Static self-test review includes the six allowed cases and rejects the old header, UTF-8, tests, and added suffixes. The `codec` suite runs UTF-8, header, and structure; the dedicated scope runs only the structure suite. The driver saves complete SB-COVER state before the filtered HTML report and retains declarations and guards from selected files in the denominator. Self-test evidence and actual numerators await the recorded campaign; MC/DC is not certified.

The method matches the frozen contract: one exact item, separate byte/node/depth limits, nodes for tags and chunks but not BREAK, depth only for maps and arrays, preallocated stack, and UTF-8 for each text chunk. It preserves nonminimal inputs, float bits, tags, and duplicate keys without assigning semantic validity or canonicality. The targeted last-slot fixture, added after static reading, is declared separately, and the previous corpus retains its original freeze. The two-worker description was corrected before campaigns: overlapping work intervals use wall time and do not prove simultaneous execution on separate cores. Allocations, timings, sinks, and source stability remain results to be acquired. The caller must assign a new directory to the coverage driver; the driver alone does not guarantee directory exclusivity.

<a id="raccolta-e-provenienza"></a>

## Collection and provenance

The collector reads evidence as data with `*read-eval* NIL` and an EOF guard. It preserves originals byte for byte, all wrapper states, and all mutation logs; embedded channels are strings with explicit provenance, while NIL or absent channels do not become invented strings. Coverage scope is a quoted list of six files and the test prefix is `tests/codec/cbor-structure*.lisp`. State and every HTML file, including the index, have original copies and declared associations. Metadata uses `:formats NIL` and accepts aliases `:schema` and `:schema-version`; primary artifacts are schema 1 data with basenames, and raw files are separate associations.

Creation rejects existing destinations. Append reads one capture of the previous catalog's bytes, checks correspondence with data before writing, preserves original history, and publishes staging only after rereading. These static checks do not replace bytewise auditing of the future real dataset and final catalog.

<a id="tentativi-conservati"></a>

## Preserved attempts

The collector's first guard actually failed with **10/11**: the fixture still expected the two old filenames. Code, report, and `-first` log are preserved; this is not a product outcome. Only the guard expectation was updated to the correct six names. The next attempt toward the same report was refused without overwriting: record `cbor-structure-collector-rejected-attempt.lisp` is a transcription of a truncated tool result, not a complete original stream. The new `-v2` guard, run by the integration lead, reports **11/11 PASS**; this reading checked reports as data and the identity of embedded stdout with respective logs, without rerunning the guard.

Fingerprints, attempt paths, and limits are also recorded in `/tmp/cbor-structure-tools-audit.lisp`. Product campaigns, coverage self-test, and integrity of the real evidence catalog remain to be acquired.
