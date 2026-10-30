<a id="scrittura-dei-valori-semplici-cbor--lettura-indipendente-dei-dati"></a>

# CBOR simple-value writing — independent data reading

This copy publishes the original reading, blob
`19c968cf4aab940c19b8e22e0b1d2c5ef53d1818`. The text preserves verification
status at reading time; later outcomes are in the
[campaign account](cbor-semplici-risultati.md).
The [original](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-simple-write-final/raw/readings/data-review-draft.md.txt)
is preserved unchanged in the final supplement.

Final ignored reading dated 2026-10-11. Compares complete preliminary,
benchmark, self-test, mutation, coverage, and audit records against the
frozen corpus. Local findings are consistent; full MAKE CHECK
after collection remains pending. No tracked file was written
during this reading; product and tests were neither loaded nor called
by data readers.

<a id="metodo-e-provenienza"></a>

## Method and provenance

Records were read in full as data through
`tools/evidence-storage.lisp`, blob
`fa2b5d36dca0837e2ed5e49b282887b2e110b2b7`. The reader accepts a single
plist with keyword keys and READ-EVAL NIL; any descriptor is
verified and expanded through the same tool. Benchmark reports
embedded in STDOUT were read as one form with READ-EVAL
NIL and final EOF. No report data was evaluated.

| Record | Status/exit | Seconds | Original bytes | SHA-256 of original bytes |
|---|---|---:|---:|---|
| `spikes/out/4000713780-command-17360-0/report.lisp` | OK / 0 | 22.106124 | 695896 | d7a184fe1d77302fd0484f43f8e028264d327b2208d22eb7e9d2e7b5ea9e5428 |
| `spikes/out/4000713808-command-19171-0/report.lisp` | OK / 0 | 1.2138 | 183455 | 49e218bbe4a9eee8f137c381755929cab53c4cf298bb7df73a019ea0b7467e02 |
| `spikes/out/4000713806-command-19078-0/report.lisp` | OK / 0 | 0.898278 | 175469 | 9bbfcbbf3c198d87318f5b63db01416d2c2155c64edcf10b0bfae06f22695498 |

All three record commit
`0865b2c3eaca5a0ea8a29b2de0f8e3d283ba2952`, empty working tree,
SBCL 2.6.9, Darwin 27.0.0, ARM64 Apple M4, memory 17,179,869,184 bytes,
10 logical CPUs, and uncontrolled external load. All 685
SOURCE-BLOBS-BEFORE/AFTER elements were compared and are
equal, beyond the SOURCE-CONSISTENCY STABLE field. In benchmark and
self-test, the driver's 152 internal MD5 fingerprints are also equal.
These comparisons prove stability of the declared inventory, without
attesting authenticity or a closed inventory of the entire filesystem.

Both snapshots of each record and current files match:

| Frozen file | Blob |
|---|---|
| `src/codec/cbor-simple-write.lisp` | 58c7a3a040ec814fae2dfe636f569b5623cba8f0 |
| `tests/codec/cbor-simple-write-support.lisp` | 10979b4a89af0b00d48abbc7bf6760afc3b5aa9b |
| `tests/codec/cbor-simple-write.lisp` | efaa31b8ea2d74af162fd00a3b4e923ae5f60cdd |
| `tests/codec/cbor-simple-write-threads.lisp` | a7bee65793fc3a3e0c89c9c73871d7c183669a3e |
| `tests/codec/cbor-string-write-support.lisp`, after wave fix | 5a7f38de22be659787305441b65c689de4bd6dba |
| `tests/codec/cbor-string-write-threads.lisp`, after wave fix | 43c4b1ffe8c3dee1a37e9f7b07f655ec3959896b |

The static document retains blob
`46a0480b0bc29938f8654ce8f59cdaee5b720a4a`. The three new tests retain
hashes communicated before product writing. Before/after
copies and the previous harness diff are preserved in
`worker-protocol-fix/`; old archives were not rewritten.

<a id="preliminare-suite-completa-compilazione-lint-e-trace"></a>

## Preliminary run: full suite, compilation, lint, and trace

The recorded command is `make test lint trace`. STDOUT contains 149,884
characters, STDERR 403,878. Lines beginning exactly with `ok    `
number **854**, all distinct without duplicates: **852 named tests and two
smoke tests**, `package ARCDOCDB presente` and `ARCDOCDB:*VERSION* è una stringa`.
The independent sum of counts across 23 suites is 852:

| Suite | Named tests |
|---|---:|
| XXH64 | 28 |
| Foundations | 28 |
| UTF-8 | 17 |
| CBOR headers | 17 |
| Minimal headers | 15 |
| CBOR structure | 24 |
| Minimal structure | 22 |
| Header writer | 17 |
| String writer | 21 |
| Simple writer | 16 |
| CSN registry | 20 |
| MVCC snapshot/CSN | 43 |
| Epochs/reclamation | 34 |
| Read tasks | 30 |
| GET benchmark contract | 19 |
| Writer queues/execution | 89 |
| Storage metadata | 44 |
| I/O | 18 |
| Recovery | 95 |
| WAL | 48 |
| Serie controller | 70 |
| Index slots v2 | 64 |
| Primary index | 73 |

The 16 frozen test names were compared with OK lines:
all present once. This includes literals, exhaustive domain,
all capacities, reserved values, types/ranges, nonsimple and displaced backing,
empty cases, physical endpoint, reuse, concatenation, arity, fuzz, supplementary
reader/scanner checks, and two workers. Internal counts of 5,952 exhaustive comparisons,
3,776 insufficient capacities, and 256 reserved values are asserted by frozen
tests that report OK; they are not counts reconstructed from the number of
log lines. Fuzz explicitly records seed 53494D43 and 2,048 cases:
768 successes, 512 invalid values, 256 insufficient capacities, and 512
invalid destinations/ranges, as preregistered.

The build forces product recompilation with fatal WARNING and STYLE-WARNING;
the handler's only exception is ASDF redefinition
warnings. The record contains no `caught WARNING`, `caught STYLE-WARNING`,
`WARNING:`, `STYLE-WARNING:`, or `Unhandled` in STDERR. It records
180 product compilation notes and 612 test notes, distinct from
warnings. Final marker reports warning-free build/tests. Lint: **150
files, zero violations**. Trace: **117 requirements, 65 invariants, 13 FI
scenarios, 52 ADRs, zero errors**. Full MAKE CHECK remains separate and pending.

<a id="due-ondate-e-controllo-del-precedente-harness"></a>

## Two waves and checking the previous harness

The frozen test uses two real reused workers, private destinations, and
eight-item plans prepared before startup. There are 8,192 calls per
worker/wave: 16,384 per wave and **32,768 overall**. Every call
restores cold sentinels and compares arity one, fixnum NEXT, and
complete physical array. The parent also compares plan, sentinels,
final array, sink, intervals, and joins; separate semaphores per wave,
15 s waits, 20 s joins, and bounded cleanup with verified termination.

The sink comes from actual bytes and NEXT; the plan's cold result
is 3,715/3,747 per eight-item round, multiplied by 1,024. The log
records **3,804,160 / 3,836,928** in both waves, with overlap
**2,098 and 2,077 ticks**, frequency 1,000,000 ticks/s. These are fixture
intervals, including restoration and comparisons; they do not prove
simultaneous execution on cores, scaling, or isolated primitive time.

The corrected old string corpus also passes in the same suite:
two waves of 16,384 items, sinks **9,707,520 / 9,969,664** per wave,
overlap **48,278 and 48,460 ticks**. Support/thread blobs match the
semaphore-only fix before and after the command. Previous results
remain historical; these are findings from the corrected protocol.

<a id="benchmark-seriale-e-sensori"></a>

## Serial benchmark and sensors

Driver examined read-only, blob
`07e5b0b7773f95ddae9458267b285c0ccb24dba9`. The report contains six fixtures
0/20/22/23/32/255, each with **five samples**, 4,096 calls and
warmup 128: **30 samples, 122,880 measured calls**. Observed heap allocation
**zero in all 30 samples**. Status OK in both wrapper and
internal report. Benchmark and self-test STDERR is empty.

Expectations were rechecked without calling the product:
wire 224+VALUE or 248/VALUE; START=2; NEXT=2+size;
END=NEXT+2; two 165 sentinels before and four after wire, including
two beyond END. The entire expected array, not just wire, matches in
reports. COLD-VALUES is exactly the list of the single NEXT for each
fixture. Independent token = NEXT + sum BYTE[i]×(i+1) over the entire
array. Sink = 4,096×TOKEN + 4,096×4,095/2. All 30 sinks, tokens,
counts, heap values, RAW-TICKS/SECONDS, and CALLS-PER-SECOND are consistent.

| VALUE | Wire | NEXT | Complete token | Sink per sample |
|---:|---|---:|---:|---:|
| 0 | E0 | 3 | 4800 | 28047360 |
| 20 | F4 | 3 | 4860 | 28293120 |
| 22 | F6 | 3 | 4866 | 28317696 |
| 23 | F7 | 3 | 4869 | 28329984 |
| 32 | F8 20 | 4 | 5661 | 31574016 |
| 255 | F8 FF | 4 | 6553 | 35227648 |

Measured times sum to **22,090 ticks = 0.02209 s**, less than the
wrapper duration of 1.2138 s. Every time is positive and related to the
1,000,000 ticks/s frequency. No speed threshold is applied.

The separate self-test and the one included in the benchmark report:

- Baseline 4,096 calls, warmup 128: heap allocation 0, token 0,
  sink 8,386,560 consistent with the sum of indices.
- Positive sensor 16 allocations of 1 MiB, warmup 0: observed heap allocation
  16,777,472 bytes, at least 16 MiB; token 1,048,576 and sink 16,777,336.
- Output checker: positive token 5,661, altered NEXT and five
  distinct prefix/lead/value/remainder/tail alterations rejected.
- Arity checker: one value accepted, four incorrect arity
  or NEXT cases rejected; sensor checker rejects incorrect sink and nonzero
  heap allocation, both with status OK.

Driver reading confirms preallocated buffer/expected, comparison
of the entire buffer per call, warmup and GC outside measurement, observable
sink, and baseline/positive sensor. Exact benchmark arity
is checked on the cold call; the hot loop uses the primary
value, while functional corpus checks arity on every success.
Time includes the checker; these are serial measurements of success only with
uncontrolled external load, without pool/device throughput,
scaling, or absolute proof of nonallocation.

<a id="audit-del-benchmark-e-verificatore-dei-dati"></a>

## Benchmark audit and data verifier

The recorded benchmark audit
`spikes/out/4000714388-command-46985-0/report.lisp` is OK/exit 0/STABLE,
1.009074 s, **20,409 checks**. Benchmark-wrapper bytes before and
after auditing are identical, 183,455 bytes and SHA-256
`49e218bbe4a9eee8f137c381755929cab53c4cf298bb7df73a019ea0b7467e02`.
Result confirms six cells, 30 samples, zero heap allocation, cold arity
one, zero baseline, positive control 16,777,472 bytes, 152 internal
fingerprints, 0.022090000000000002 s of samples, and 0.000064 s of checks.
Difference from 0.02209 s is floating-point summation.
The verifier checks data consistency; it loads neither product nor
driver and proves neither authenticity nor execution. Expected product
fingerprints are supplied by the caller and here match the blind freeze.

The separate mutation/coverage helper is
`spikes/out/cbor-simple-write-20261011/data-audit.lisp`, blob
`4ca865ddfca6da36a73c81fb5041df4df60d79ab`. Its recorded self-test
`spikes/out/4000714391-command-47195-0/report.lisp` is OK/exit 0/STABLE,
1.073152 s, **529 checks over 27 synthetic cases**. It includes processes,
mutation catalog and results, reader/preamble, coverage,
implicit HTML-row closure, gap mapping, and
unique/ambiguous replacement. Report
`audit-self-test/report.lisp` preserves one identical before/after product
observation; no campaign or product is run by the
verifier self-test.

The six records following the initial ones record commit
`7bfd3bf01c753fe6cdf228cdc74533c127e32bad`, empty working tree, 685
equal before/after snapshots, and SOURCE-CONSISTENCY STABLE. Method, product,
three blind files, and corrected previous harness match the freeze
in records and current files. The commit change preserves product/corpus
freeze and includes mutation-catalog revision
before the campaign; it is not a change during commands.

| Record under `spikes/out/` | Seconds | Original bytes | SHA-256 of original bytes |
|---|---:|---:|---|
| `4000714190-command-35834-0/report.lisp` | 165.36714 | 205648 | 940cb518692cea9c32dd1f372cb20dcb06a96c211447c0ef7a5aef92c264d649 |
| `4000714357-command-44709-0/report.lisp` | 10.309638 | 143512 | e0a78c97970b94febf0881a047cb4249d581cf118d022c829825b614d8dc4a79 |
| `4000714388-command-46985-0/report.lisp` | 1.009074 | 143614 | 8a5877d924feafb5fd573bc920661a30ac425d295487b04098df3366e332c015 |
| `4000714391-command-47195-0/report.lisp` | 1.073152 | 141867 | ad88bc22762608e2dfd911f910d8f1867ba6a030c4fbf0eeca3b2fda7991100d |
| `4000714393-command-47353-0/report.lisp` | 6.516856 | 141997 | 1ab2161173596210de8240858fb56da56f1fccbc2ea8a23b840130a0efef67ef |
| `4000714401-command-47888-0/report.lisp` | 1.613452 | 141993 | be5d11d83c9d70d71db8205dd5c4cbf4de4c46e9adf96741eabfc08cfbe40b5e |

All are OK/exit 0; STDERR is empty. The recorded benchmark audit uses
`tools/cbor-simple-write-audit.lisp`, also examined read-only,
current blob `6acfcc656bfed5f8b4c59e487cffb5325d30d790`.

<a id="mutazioni-copie-baseline-e-tutti-gli-otto-log"></a>

## Mutations: copies, baseline, and all eight logs

Campaign `4000714190-command-35834-0` and report
`mutations/report.lisp` are OK. The final on-disk report matches
the final STDOUT form in full after the single exact worker
self-test preamble. All 255 internal before/after fingerprints are
equal; catalog ALIGNED on frozen product blob and eight preregistered
names. There are **eight detected, zero survived/invalid/worker
errors**. All mutants have exit 1 and SIGNAL NIL.

The mutator frozen for the campaign is
`ec2fe6b3235591ec5b3bb82b32046e906b045bf6`. The physical-capacity target
uses `(max span (- (length bytes) begin))`, retaining SPAN use:
the defect is runtime capacity, without introducing an unused-variable
warning. For extra-return-value, unique public-fragment
replacement also updates FTYPE in the copy to declare the second NIL;
the runtime defect is extra arity, without turning it into a compilation error.
Previous versions and diffs remain separately preserved by the
coordinator in `physical-capacity-revision/`.

Recorded audit `4000714393-command-47353-0` reports **15,320 checks**,
OK, `audit-mutations.lisp` with 36 identical before/after byte/SHA
observations. Baseline and eight copies each contain **254 files
in the declared inventory**: baseline identical and each mutation
changes only `src/codec/cbor-simple-write.lisp`, exactly according
to the declared unique replacement. Private runner and FASL cache verified;
the read baseline runner uses ASDF output translations toward its own
FASL directory, IGNORE-INHERITED-CONFIGURATION, and the original strict
build. This is not a closed inventory of copy directories.

Baseline was read in full: **854 distinct OK**, exact smoke
at line 2, exact completion at line **925**, exit 0, SIGNAL NIL,
no Unhandled, warning/style-warning, or compilation error. For
each of eight logs, exact smoke at line 2 was separately verified
to precede Unhandled and the REQ-CBR-003 test backtrace:

| Copy / mutation | First Unhandled, line | Origin observed in frozen test |
|---|---:|---|
| 0 / reserved-codes-accepted | 232 | CSW-REJECT, ALL-EIGHT-RESERVED-BEFORE-CAPACITY, VALUE24 and capacity0: condition class different from invalid-argument |
| 1 / one-byte-threshold-22 | 229 | CSW-ACCEPT, LITERAL-VECTORS, VALUE23: NEXT differs from expected; observed wire F8 17 instead of F7 |
| 2 / wrong-major | 229 | CSW-ACCEPT, LITERAL-VECTORS, VALUE0: different array, C0 instead of E0 |
| 3 / wrong-extended-lead | 229 | CSW-ACCEPT, LITERAL-VECTORS, VALUE32: different array, F9 20 instead of F8 20 |
| 4 / physical-capacity | 231 | CSW-REJECT, EVERY-INSUFFICIENT-CAPACITY-AND-PHYSICAL-SUFFIX, VALUE0 and capacity0: class different from resource-exhausted |
| 5 / extended-value-zeroed | 229 | CSW-ACCEPT, LITERAL-VECTORS, VALUE32: different array, F8 00 instead of F8 20 |
| 6 / next-one-too-far | 229 | CSW-ACCEPT, LITERAL-VECTORS, VALUE0: different NEXT, byte E0 present |
| 7 / extra-return-value | 229 | CSW-ACCEPT, LITERAL-VECTORS, VALUE0: LENGTH ACTUAL differs from1, byte E0 present |

Every log contains its test's assertion and frame
`ARCDOCDB.CBOR.SIMPLE.WRITE.TESTS::TEST-REQ-CBR-003-...`, without completion
marker. There are no `caught WARNING`, `caught STYLE-WARNING`,
`WARNING:`, `STYLE-WARNING:`, `COMPILE-FILE-ERROR`, `COMPILE-FILE-WARNED`,
or `compilation aborted`. No OS signal or worker fault is counted
as detection. Both preflight mutations fail on the caught condition's
class: reading just the defect with the backtrace input
explains the later capacity check or internal guard,
without inferring an out-of-span write from the log.

The mutated public function is not an active frame when the helper's
assertion fails: it has already returned, or its error was caught.
Attribution to the primitive comes from the frozen direct
CSW-ACCEPT/REJECT callsite, the sole changed product file, and observed
effects consistent with replacement. No product frame absent from
the backtrace is invented.

The automatic classifier and inherited audit log-check verify
marker presence and absence of compilation errors, but do not prove
smoke→rejection order or rejection causality. These properties of the nine
actual logs were checked separately here; automatic PASS
is not promoted to a general verifier capability.

| Log under `mutations/` | Original bytes | SHA-256 |
|---|---:|---|
| `baseline/test.log` | 59871 | b45fa4fe6652976ecbc941033db5576fce22c821b4c7982e1f200f5e13314c89 |
| `0/test.log` | 25594 | 2c69ddc9ace30a4c0df6d50279e37c8381f22bd155f632c1d2769923c0d3a3e9 |
| `1/test.log` | 25430 | db6dc67bb2371f77cedfe891f75ab1614825cf74e4f45c1f3ebafa176fd88bea |
| `2/test.log` | 25435 | 1c8fa126dadf4474048a460a568d3aa2ef6e108ab528510a0e44536de5f8b07c |
| `3/test.log` | 25441 | 2c7493a39069a9df9f9e6c7fade52ad7d4cfb42ec847a96ed941c2a67c65009c |
| `4/test.log` | 25534 | ad65161fb400dec9d8df06795591e7e1746a37b8aa98edfc28f69007dd3cca00 |
| `5/test.log` | 25438 | 28f1bd17d9d16b27c21cd827386198c07850cbd26c0e9ad27701f2d3f59577b1 |
| `6/test.log` | 25429 | e6fca97134acb741cd5271679cd4d5b785e4d84fa8675922d98ced9461026183 |
| `7/test.log` | 25332 | aacbaff8c0915f8b5c75dd1976323d9d874fceeab92e96220d6871de848de7b0 |

Embedded worker self-test preserves report
`spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/report.lisp`,
PASSED. The two deliberate infrastructure defects are worker-error with
DETECTED NIL: SIGKILL exit137/signal9 and failure after completion
exit7/signalNIL. Baseline-copy and baseline-transport fixtures are
PASSED, each with one worker-error, exit/signal NIL, and diagnosis
INFRASTRUCTURE-ERROR. These four deliberate faults belong to
self-tests, not the eight product mutations. Dispatcher records
two valid entries and six rejections before directory creation;
missing/ambiguous target, compilation, and markers quoted in backtrace
remain INVALID.

<a id="coverage-raw-html-e-associazione-delle-lacune"></a>

## Coverage: raw, HTML, and gap mapping

Campaign `4000714357-command-44709-0` is OK/exit 0/STABLE, 10.309638 s.
The independent data reviewer read raw state as one form with
READ-EVAL NIL through evidence-storage, without product LOAD:
**248 saved files**, a single exact target,
`src/codec/cbor-simple-write.lisp`, frozen blob. The target's **135 paths/bits**
are 111 expressions and 24 branch outcomes: **95/111 expressions
covered (85.6%) and 20/24 branch outcomes (83.3%)**. HTML index and source
report the same counts; all 53 source-HTML lines
match the frozen file after decoding entities/NBSP and presentation
spacing. The 248 saved files are not confused with the single new
source targeted by the campaign.

Recorded audit `4000714401-command-47888-0` is OK/exit 0/STABLE,
1.613452 s and **1,178 checks**, `audit-coverage.lisp`. The five
before/after byte/SHA observations are identical and match the files
read. Independent raw/HTML/AST comparison confirms every gap:

- **16 expressions**: four top-level declarations at paths (0), (1),
  (2), (4), and twelve forms in three internal ERRORs :cbor-simple-span
  (line 22), :cbor-simple-target-span (46), :cbor-simple-progress (52).
- **Four branch outcomes**: span guard at line 21, two outcomes
  in target-span AND at line 45, and progress guard at line 51.
- **OTHER=0**: no uncovered default or parameter to reclassify.

Mappings are syntactic and verifiable on the frozen product,
without excluding declarations/internal errors from denominators. They do not
prove unreachability, predicate independence,
MC/DC, or functional completeness; guards remain active and visible.

| Artifact under `spikes/out/cbor-simple-write-20261011/` | SHA-256 of original bytes |
|---|---|
| `coverage/coverage-state.lisp` | 370f3694f1361132877df4dca8140e24160f338318d69dc108783f76585da6c8 |
| `coverage/cover-index.html` | f5bbcc1b6dfe30392a712c320ca2fd3b55836cad907d3b61bee00db21b477d58 |
| `coverage/9ae2ab0021850480ee0bbfa07aef40ba.html` | 469e9a0b9e88da57ccbe5cd6a9e20fa4629205324da252d811e61af535f2bfa7 |
| `audit-coverage.lisp` | 28b53b238befbfde84d51ba1fb915a3c68c9e1d28c8285e4a4fc520d1a4228a5 |
| `audit-mutations.lisp` | e0dc3942dedefbe00024317bdd8c76244e5666a1960667c9bf62e7fdf7e9c58d |
| `audit-self-test/report.lisp` | bd8bc14f3e01f854191c4cc2615b60500514cf00a687fd5628ac39c883d0a32d |

The coordinator also preserves large ignored files as descriptor
plus lossless gzip. Fingerprints above concern original bytes:
changing physical representation does not change logical
content read with evidence-storage or rewrite historical campaigns.

<a id="tentativi-errati-dei-lettori-ad-hoc"></a>

## Incorrect ad hoc reader attempts

Available diagnostics of one incorrect inline attempt are preserved
here, separate from recorded product and verifier commands.
The fragment attempted to combine freeze/benchmark/count checks
in one DOLIST on STDIN and lacked a closing parenthesis.
Product/tests were neither loaded nor executed; the error belongs to the ad hoc
reader. No missing output is reconstructed.

Tool chunk `b6c9c7`, exit 1, wall 0.178726959 s, original excerpt:

```text
Unhandled SB-C::INPUT-ERROR-IN-LOAD in thread #<SB-THREAD:THREAD tid=259 "main thread" RUNNING
                                                 {80086A0423}>:
  READ error during LOAD:

    end of file on #<SB-SYS:FD-STREAM for "file /dev/stdin" {8008680043}>

    (in form starting at line: 13, column: 96, file-position: 813)
```

The correction split checks into two shorter readings:
chunk `f12a33`, exit 0, snapshot/freeze checks, 854 distinct OK,
852 named, and all 16 names; chunk `a43a7b`, exit 0, cold bytes,
30 samples, times, and sensors. These are data checks, not new
runtime campaigns or recorded driver self-tests.

During mutation reading, another inline attempt had
an incorrect path constant, written with `\u002f` as though it were
a JSON escape inside a Common Lisp string. Available excerpt,
chunk `621acd`, exit 1, wall 0.200004583 s:

```text
The assertion
(EQUAL (GETF (GETF DATA :SELF-TEST) :SIGNAL-FIXTURE-REPORT)
       "u002fUsers/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/report.lisp")
failed with (GETF (GETF DATA :SELF-TEST) :SIGNAL-FIXTURE-REPORT) =
"/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000714191-cbor-simple-write-worker-self-test-35886/report.lisp".
```

The incorrect fragment compared the path with constant
`"\u002fUsers/..."`. Retry `c76a28`, exit0, compares the preamble
directly with the path actually contained in the report: equal
STDOUT/final report form, 255 equal fingerprints, and correctly classified baseline
fault fixtures. No data was modified.

The coverage reviewer also communicated three incorrect attempts of their own
reader, with original fragments/diagnostics available:

| Chunk / exit / wall | Reader error and actual fragment | Successful correction |
|---|---|---|
| `fab4e0` / 1 / 0.379981959 s | `READ error during LOAD: unmatched close parenthesis. Line: 17, Column: 140, File-Position: 1428.` The LET's final FORMAT had an extra close: `(format t "~&HELPER PATH ~A ~D bytes SHA ~A~%~S~%" path (arcdocdb.evidence:file-bytes path) (arcdocdb.evidence:file-sha256 path) data)))`. Wrapper and helper had already been read and printed. | Later separate readings completed; no repetition of failure. |
| `18cee0` / 1 / 0.30530525 s | `The value #*000 is not of type LIST`. The reader used `(subseq (first data) 0 (min 5 (length (first data))))` on a dotted SB-COVER entry; available frame `(LENGTH ("/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/src/package.lisp" #((0) (1) (2)) . #*000))`. | `abe41d`, exit0: CAR/CADR/CDDR, without assuming a proper list. |
| `94014c` / 1 / 0.564907917 s | `The assertion (EQUAL SOURCE-LINES HTML-LINES) failed`. Fragment `(assert (equal source-lines html-lines))`; HTML text used NBSP U+00A0, absent from source. | `109a71`, exit0: presentation-only normalization and 53 equal lines. |

AST/raw reader `9fe8ab` and final HTML/hash reader `109a71` finish
exit0. These are ad hoc reader errors, separate from recorded
results and product. Excerpts are partial and do not reconstruct
missing output; no new fault was deliberately rerun
to produce a substitute log.

<a id="pendenti-e-limiti"></a>

## Pending work and limits

Available data is consistent with the blind corpus and local
contract. Full MAKE CHECK after collection remains pending. Fingerprint
stability, syntactic gap mapping, declared copy inventory,
and automatic classification retain the limits above.
This reading does not close C1 gates, renew dependency qualifications,
attest MC/DC or report authenticity, or constitute human approval.
