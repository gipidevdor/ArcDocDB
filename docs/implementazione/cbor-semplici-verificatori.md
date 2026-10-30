<a id="scrittura-semplici-cbor--lettura-c4-di-strumenti-e-dati"></a>

# CBOR simple-value writing — C4 reading of tools and data

This copy publishes the original reading, blob
`a42a47b5651378d71b760642057e2b2538490849`, preserved
[in the archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-simple-write/raw/readings/c4-review-draft.md.txt).
Statements about writing to an ignored file below describe that reading.

Client-declared date: 2026-10-11. This reading concerns frozen tools and already-produced records; it retains runtime universal times without converting them to the client's date. It loaded neither product, suite, driver, nor auditors, and repeated no self-tests or campaigns. Records were read as data with `tools/evidence-storage.lisp`; the only additional operations were reading sources and fingerprints of five files. The only write is this ignored document.

<a id="perimetro-e-impronte-verificate"></a>

## Scope and verified fingerprints

| File | Git blob |
| --- | --- |
| `spikes/out/cbor-simple-write-20261011/data-audit.lisp` | `4ca865ddfca6da36a73c81fb5041df4df60d79ab` |
| `tools/cbor-simple-write-mutation.lisp` | `ec2fe6b3235591ec5b3bb82b32046e906b045bf6` |
| `tools/cbor-simple-write-audit.lisp` | `6acfcc656bfed5f8b4c59e487cffb5325d30d790` |
| `tools/cbor-simple-write-bench.lisp` | `07e5b0b7773f95ddae9458267b285c0ccb24dba9` |
| `src/codec/cbor-simple-write.lisp` | `58c7a3a040ec814fae2dfe636f569b5623cba8f0` |

The author of this reading also authored the benchmark auditor: no independence is attributed to review of their own tool. The coordinator performed the independent reading of that code. Its data check nevertheless derives bytes, NEXT, token, and sink from VALUE, without loading product or driver or reusing their builders and oracles.

<a id="lettura-statica"></a>

## Static reading

- **Reader:** helper lines 101–116 and auditor lines 61–72 use `*read-eval* NIL`, standard readtable, CL-USER package, and one form followed by EOF. Plists require proper form and unique keyword keys. The mutation preamble is distinct from the final plist and must match the known preamble. No reading evaluates record code. This checks the expected format, not a general sandbox against every reader cost or behavior on hostile data.
- **Benchmark data:** auditor lines 208–303 check schema, six fixtures, thirty samples, exact cold arity, complete array, weighted token, modular sink, heap allocation, and sensors; verify metadata, safety 3, workers 1, selected fingerprints, and declared before/after snapshots. Environment date may precede STARTED by one tick, consistent with recorder order. Times must be consistent, without a speed threshold. Expected product fingerprints are explicit CLI arguments.
- **Copies and mutations:** eight-target catalog, unique replacement, and full mutated-file comparison. The physical-capacity mutation uses `(max span (- (length bytes) begin))`; extra-return-value changes FTYPE and DEFUN together in the copy, avoiding classifying a compilation error as detection. Original product is excluded from writes. Mutator lines 323–361 create new directories, runner, and local FASL caches, preserving complete logs, exit, and signal; lines 185–189 and 215–225 separate compilation, survival, and worker error.
- **Snapshots:** helper lines 131–145 and auditor verify before/after equality and STABLE state, with frozen product blob. Helper lines 467–473 also recheck bytes and SHA256 of observed inputs. These are local comparisons on declared inventories; they demonstrate neither authenticity, execution of the attested process, nor absence of transient changes between observations.
- **Coverage:** helper lines 322–355 compare single-source scope, raw state, and two exact HTML files, with all denominators. Parser retains the SB-COVER case of implicit first-TR closure. Gap mapping syntactically associates raw paths and source: it does not prove unreachability, exclude guards, or attest MC/DC.
- **Output:** helper lines 357–363 write only a new output within ignored scope, rejecting existing files; the mutator preserves copies and reports even on failure. Lexical path checking does not prove absence of symlinks or canonical containment of an arbitrary tree.

<a id="fragilità-concrete-e-limiti-da-conservare"></a>

## Concrete weaknesses and limits to preserve

1. **Runtime-rejection classification:** helper lines 188–198 seek exact smoke and any `Unhandled `; they verify neither smoke → rejection order nor condition origin. Mutator lines 215–225 classify nonzero exit with smoke present without requiring rejection or its cause. An unrelated runtime fault after smoke, or an artificial log with reversed order, can therefore satisfy the classifier. The coordinator communicated the separate reading's outcome for all eight logs: exact smoke before Unhandled, REQ-CBR-003 suite callsite, no warning, compilation failure, or signal, and eight exact replacements detected. This outcome is attributed to the second reader; this review did not duplicate their complete log reading.
2. **Copy inventory:** helper lines 206–231 prove the sole difference for declared fingerprints, not completeness of the copied tree. A catalog omitting a file is not discovered by this comparison. The report correctly declares `NO-CLOSED-COPY-TREE-CLAIM`; runner and cache are checked for existence and configuration, not through a closed inventory of the entire copy.
3. **Helper negatives:** lines 380–381 accept any ERROR in negative fixtures. PASS therefore does not prove every rejection comes from the expected guard and reason: a programming error could also satisfy it. The benchmark auditor instead requires its own audit-rejection condition and expected reason. That guarantee is not extended to the helper.
4. **Authenticity and stability:** expected CLI fingerprints and declared snapshots require trust in recorder and caller. Equality of local observations is not a signature, proof of OS isolation, or atomic proof against intermediate changes and restorations. MD5 checks on copies are not all included in final SHA256 observations.

No mandatory defect preventing reading of current data emerged. The weaknesses above prevent claims stronger than those declared; they do not require changing frozen sources during collection.

<a id="record-effettivamente-letti"></a>

## Records actually read

The four complete wrappers report schema 1, KIND COMMAND-VERIFICATION, STATUS OK, exit 0, empty STDERR, SOURCE-CONSISTENCY STABLE, and 685 identical before/after SOURCE-BLOBS entries. Benchmark-auditor stdout is a plist; helper stdout is a textual summary, checked alongside its Lisp artifact.

| Wrapper | Runtime universal interval | Wall seconds | Data outcome |
| --- | --- | --- | --- |
| `spikes/out/4000714388-command-46985-0/report.lisp` | 4000714389–4000714390 | 1.009074 | benchmark audit OK, 20409 checks |
| `spikes/out/4000714391-command-47195-0/report.lisp` | 4000714391–4000714392 | 1.073152 | helper self-test OK, 529 checks, 27 cases |
| `spikes/out/4000714393-command-47353-0/report.lisp` | 4000714394–4000714400 | 6.516856 | mutation audit OK, 15320 checks |
| `spikes/out/4000714401-command-47888-0/report.lisp` | 4000714402–4000714403 | 1.613452 | coverage audit OK, 1178 checks |

### Benchmark

The first wrapper invokes `tools/cbor-simple-write-audit.lisp --bench` on record `spikes/out/4000713808-command-19171-0/report.lisp`, supplying product blob `58c7a3a040ec814fae2dfe636f569b5623cba8f0` and MD5 `200373402e6e082dd8c7afde305302bb`. The report attests six cells and thirty samples, observed heap allocation 0, cold arity 1, heap-allocation baseline 0, and positive control 16777472 bytes for the 16 MiB budget. Timer 1000000 ticks/s; sample-time sum 0.022090000000000002 s and checks 0.000064 s. The benchmark record preserves STARTED 4000713809, FINISHED 4000713810, and RECORDED-AT 4000713809. Local observation of the 183455-byte record has SHA256 `49e218bbe4a9eee8f137c381755929cab53c4cf298bb7df73a019ea0b7467e02`, identical before/after. These are data-consistency outcomes, without claims of speed, parallelism, authenticity, or proven execution.

<a id="helper-e-mutazioni"></a>

### Helper and mutations

`audit-self-test/report.lisp` read in full: STATUS OK, 529 checks, 27 synthetic cases, product not loaded, and no campaign performed by self-test; one equal before/after input observation. The negative-test limit described above remains applicable.

`audit-mutations.lisp` read in full: STATUS OK, 15320 checks, and 36 identical before/after input observations. The campaign record reports eight detected, zero survived, zero invalid, and zero worker errors. Baseline exit 0, smoke line 2, and completion line 925; eight copies exit 1 without signal or completion, smoke line 2, and a rejection present in their respective logs. The helper checks 254 declared files for each of nine copies: no baseline difference, only `src/codec/cbor-simple-write.lisp` different in each mutant, and exact replacements. This outcome is not turned into a closed inventory or independent proof of runtime-rejection origin.

<a id="copertura"></a>

### Coverage

`audit-coverage.lisp` read in full: STATUS OK, 1178 checks, and five identical before/after input observations. Saved state includes 248 files, but HTML scope is exactly one source and two HTML files: `cover-index.html` and `9ae2ab0021850480ee0bbfa07aef40ba.html`. Raw/index/source counts agree: **95/111 expressions, 20/24 branch outcomes**. 16 expressions are missing, associated with four declarations and twelve nodes of the three internal error branches; four internal-guard outcomes are missing. Other categories: zero. Reasons and lines are `cbor-simple-span` line 22, `cbor-simple-target-span` line 46, and `cbor-simple-progress` line 52. All raw paths remain in report and denominator.

The helper's raw-state observation reports 1762263 bytes and SHA256 `370f3694f1361132877df4dca8140e24160f338318d69dc108783f76585da6c8`. Later compression of ignored outputs occurs after audits and must be preserved through evidence-storage without changing these values observed on decoded bytes. This document does not requalify MC/DC, full coverage, a gate, or release.

<a id="chiusura"></a>

## Closure

C4 reading completed, with results and limits separate. The document is frozen after this write; no other file falls within this activity's responsibility. The coordinator also communicated completion of the separate log check; the classifier's general weakness remains documented.
