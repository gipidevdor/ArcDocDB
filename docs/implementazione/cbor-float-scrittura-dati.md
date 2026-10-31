This page publishes the frozen runtime reading in full, original blob
`1872e19955ddcec09a83d8e9e78d7c51f8838b12`, preserved in the [reading archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-float-write/raw/readings/runtime-review-draft.md.txt).
For the concluding collection and subsequent checks, refer to the
[final results report](cbor-float-scrittura-risultati.md).

The only editorial adaptation is this introduction with its two links:
the following frozen content is preserved in full, including wording
referring to the draft and the original time of reading.

<a id="scrittura-float-cbor--lettura-dei-dati-runtime"></a>

# CBOR float writing — runtime data reading

Reading on 2026-10-13 in the isolated worktree, completed before
final collection. This reader authored the blind corpus and second
static reading: the results check is not independent of the
corpus. Benchmark recalculation is separate from the driver and auditor,
using cold fixtures examined arithmetically. Neither product,
benchmark driver, mutator, nor suite was loaded or called. Only
the trusted tool `tools/evidence-storage.lisp` and
SBCL's SB-MD5 component were loaded for copy fingerprints. Records are data;
structured stdout is read with READ-EVAL NIL, standard readtable,
CL-USER package, one form and EOF, without evaluating data.

This draft remains excluded from collection until freeze is communicated to the
coordinator. Raw coverage is assigned to another reader. No
C1, MC/DC, engine, or durability qualification is attested by this
reading. No campaign was rerun and no source file,
matrix, Git index, or configuration was modified.

<a id="registri-letti"></a>

## Records read

All eight records report STATUS OK, EXIT-CODE 0, and
SOURCE-CONSISTENCY STABLE. The 738 before/after entries are identical and the
snapshot is equal across campaigns, also verified in final check
`fa5967`. Recorded HEAD `364ac3b8c6dc3877e978ce551dc6e2fbab8ea1f0`,
empty working tree at campaign time.

| Record in `spikes/out/` | Operation | Process seconds |
|---|---|---:|
| `4000905572-command-32032-0/report.lisp` | preliminary test/lint/trace | 25.805550 |
| `4000905572-command-32033-0/report.lisp` | coverage scope self-test | 1.107459 |
| `4000905572-command-32030-0/report.lisp` | mutator self-test | 1.388969 |
| `4000905572-command-32031-0/report.lisp` | benchmark data auditor self-test | 1.203470 |
| `4000905644-command-32361-0/report.lisp` | benchmark self-test | 0.994824 |
| `4000905677-command-32530-0/report.lisp` | benchmark | 1.416727 |
| `4000905717-command-32851-0/report.lisp` | benchmark data audit | 1.323565 |
| `4000905717-command-32852-0/report.lisp` | baseline and eight mutations | 184.386720 |

Snapshot: narrow `cd5749edc0a757ee3a5b470eda566a6685d32fd8`, writer
`03c6aed61e2c243d8b1a6c4332ce1837c4e9a77c`; three corpus files
`6ba7c20701b60789d92ff232fc02b0f476334911`,
`747cd8a72445a3ea638cd1910bc9faa63f4cdc33`,
`f95bf450148fa2aab9bb28c178b986dee049de6e`, equal to the blind freezes.
Method `755b13a91ab72f54383d96faee5780da36e750d6`; first static reading
`0d644768dc2f8efeb86136a8a4c4206c4c464bb6` and second
`134173468ca2bfd538eb1f6bbeda4dda128e800b`.
Benchmark `d992c9f8cf6ff0d748fcb77f871fb77969480bca`, auditor
`485544868eeadff247968b86c2d5da9b3b610295`, mutator
`5d0d6bd46b0286f153ee9c482734c659959396e2`, and coverage scope
`6262967597ab1c0c142ce1a988ec2ecf49543865`.

Recorded environment: SBCL 2.6.9, Darwin 27.0.0 ARM64, Apple M4, memory
17,179,869,184 bytes, and 10 logical CPUs; external load UNCONTROLLED.
These are observed metadata, without inference about frequency or active cores.

<a id="corpus-e-controlli-preliminari"></a>

## Corpus and preliminary checks

There are 989 distinct `ok` lines: 987 named tests and two explicit
smoke tests, root package and version string. Among them, 18 are
REQ-CBR-004 tests. Corpus markers confirm:

- All 65,536 half values and 131,072 expansions: 196,608 successes and 196,608
  insufficient-capacity cases, rotating eight offsets and three configurations.
- Fuzz 2.048, seed 464C5434: 768 successes, 256 capacity, 128 AI, 128 HIGH,
  128 LOW, 256 word, and 384 range/destination rejections.
- Two waves of 16,384 aggregate calls, 32,768 total, sink
  2,115,584/2,148,352 for both. Overlap 2,576/2,580 ticks at 1,000,000
  ticks/s. Fixture intervals do not attest to scaling across cores.
- Lint: 165 files, 0 violations. Trace: 118 requirements, 65 invariants,
  13 FI scenarios, 52 ADRs, 0 errors.

The compiler transcript contains no WARNING, STYLE-WARNING, or
Unhandled. There are 200 product notes and 743 test notes:
optimization/type notes, distinct from fatal warnings. The subsequent
check is a log reading, not a new compilation.

<a id="self-test-degli-strumenti"></a>

## Tool self-tests

The scope self-test reports detection of the missing branch. The
mutator self-test preserves a process actually signaled with signal 9/exit 137
and one that completes markers but ends with exit 7. Both are
WORKER-ERROR, DETECTED NIL: two expected worker faults, no falsely
detected mutation. It also preserves baseline-copy and
baseline-transport fixtures in their respective records. These are synthetic scenarios,
separate from the actual baseline.

The benchmark auditor self-test records 167,234 checks, four positive
reports, and 70 negative fixtures with 70 distinct names and specific reasons.
It includes bytes/subnormal, raw words, span/NEXT/arity, sink/heap/timer,
metadata, fingerprints, inventory, and reader-eval/trailing/improper/cyclic data.
The cold reference includes six catalog cases and seven additional
zero/infinity/NaN cases, with integer/rational arithmetic and no native
floats.

Benchmark self-test and benchmark include a null baseline of 4,096
calls, warmup 128, heap 0, and sink 8.386.560. The 16×1 MiB positive control
records 16,777,472 bytes, at least 16,777,216 deliberate, and sink 16.777.336.
Eight output alterations, two shape and six byte changes, four arity/NEXT cases, wrong
sink, and nonzero heap are rejected for the expected reason.

<a id="benchmark-ricalcolo-freddo"></a>

## Benchmark: cold recalculation

1.5 is half 3E00, binary64 3FF80000/00000000. Binary64
3FF00000/20000000 represents 1+2^-23 and is single 3F800001, without an exact
half form. LOW 1 in 3FF00000/00000001 prevents reduction from 64.
3E700000/00000000 represents 2^-24, minimum half subnormal 0001.
FFF80000/00000001 retains negative sign, quiet NaN, and payload not
aligned toward 32, so it remains 64. These observations do not use the codec.

| Fixture | Cold bytes | NEXT | Token | Sink per 4,096 |
|---|---|---:|---:|---:|
| half identity | 249 62 0 | 5 | 6445 | 34785280 |
| double→half | 249 62 0 | 5 | 6445 | 34785280 |
| double→single | 250 63 128 0 1 | 7 | 8421 | 42878976 |
| double only | 251 63 240 0 0 0 0 0 1 | 11 | 11632 | 56031232 |
| double→half subnormal | 249 0 1 | 5 | 6202 | 33789952 |
| double NaN payload | 251 255 248 0 0 0 0 0 1 | 11 | 12440 | 59340800 |

START 2, END=NEXT+2, SIZE+6 buffer with sentinel 165: two prefix bytes,
two remaining bytes, and two beyond END. The complete array, raw words,
size, NEXT, a single cold-value, token NEXT+Σ(i+1)×byte[i], and sink
4,096×TOKEN+4,096×4,095/2 were recalculated. For all 30 samples: 4,096 calls,
warmup 128, heap 0, exact token/sink, seconds=RAW-TICKS/1.000.000, and
rate=4,096/seconds. Total 33,414 ticks=0.033414 seconds of samples;
benchmark process 1.416727 seconds. Measurement includes complete
fixture checks and does not represent engine throughput, scaling,
or absolute proof of no allocation.

Internal fingerprints: 167 equal before/after MD5 entries. The runtime audit
records 55,824 checks, six cells/thirty samples, heap 0, arity 1, and the
same total of 0.033414 seconds. The benchmark wrapper observed before/after
has 198,507 bytes and SHA256
`1154975a7c27c433d402c7b7549a62fb321b1e43fb806f5def86dd8825bfceb6`.
The auditor checks data consistency and declared inventory; it does not prove
authenticity/execution, closure of the entire tree, or intrinsic
MD5/Git correspondence without explicit caller expectations.

<a id="baseline-e-otto-mutazioni-log-completi"></a>

## Baseline and eight mutations: complete logs

`spikes/out/cbor-float-write-20261013/mutations/report.lisp` was read and,
through the trusted tool, every line of the nine logs through EOF. The
baseline has 1,067 lines, 989 distinct `ok` lines, exit 0, RESULT OK, and SIGNAL NIL.
The version smoke line is exactly line 2; the complete marker
`build e test: nessun avviso, tutti i controlli superati` is exactly
line 1.067. It has no Unhandled or invalidating compiler diagnostics.

All eight mutants have 208 distinct `ok` lines, exact version smoke at
line 2, and `Unhandled ` at the start of line 250, thus in the required
order. The complete marker is absent. All have exit 1, SIGNAL NIL,
RESULT DETECTED, DETECTED T, and DIAGNOSTIC NIL. Final count: eight
detected, zero survivors, zero invalid, and zero worker errors. The
final compact check is tool transcript `4934bf`.

The numbered frame below contains both namespace
`ARCDOCDB.CBOR.FLOAT.WRITE.TESTS::` and REQ-CBR-004 in the same frame. For all, it is
test `TEST-REQ-CBR-004-FLOAT-WRITE-LITERAL-ZERO-INFINITY-FINITE-AND-NAN-VECTORS`.
These are not merely marker quotations in a backtrace string.

| Mutant / log under `mutations/` | EOF lines | REQ frame | Observed runtime origin |
|---|---:|---:|---|
| omit-single-reduction / `0/test.log` | 320 | 7 | Capacity rejected for AI 26, LOW 3FC00000, END 3; writer frame 4 and CFW-ACCEPT frame 5. |
| omit-double-reduction / `1/test.log` | 320 | 7 | Capacity rejected for AI 27, HIGH 3FF80000, LOW 0, END 3; writer frame 4 and CFW-ACCEPT frame 5. |
| half-sign-lost / `2/test.log` | 322 | 9 | Invariant CBOR-FLOAT32-NARROW-SIGN, input 80000000 in reducer frame 4; writer frame 6. |
| half-normal-fraction / `3/test.log` | 320 | 6 | Buffer EQUALP fails: 249 61 0 versus 249 62 0, CFW-ACCEPT frame 4, single input 3FC00000. |
| single-subnormal / `4/test.log` | 323 | 10 | Invariant CBOR-FLOAT64-NARROW-HIGH, shifter frame 4 with HIGH 1048576, LOW 0, shift 52; writer frame 7, input 36A00000/0. |
| physical-capacity / `5/test.log` | 319 | 6 | Condition TYPEP fails in CFW-REJECT frame 4; half input 3E00, START=END=0, expected RESOURCE-EXHAUSTED/CBOR-FLOAT-CAPACITY. |
| wrong-float-lead / `6/test.log` | 320 | 6 | Buffer EQUALP fails: 217 62 0 versus 249 62 0, CFW-ACCEPT frame 4, half input 3E00. |
| extra-return-value / `7/test.log` | 319 | 6 | Arity (= 1 LENGTH ACTUAL) fails in CFW-ACCEPT frame 4, half input 3E00. |

When the check fails after the writer returns, its frame
is no longer present. In physical-capacity, the corpus has already caught
the condition: the log proves the TYPEP mismatch, and does not directly retain
the caught condition's reason. Static inspection of the replacement alone
shows that capacity is also compared against the physical
tail; with a zero span, the target's subsequent guard acts before
writing. This is an inference from the copy, distinct from the log's
text. The test is not masked by a subsequent error about
buffer preservation.

No WARNING:, STYLE-WARNING:, COMPILE-FILE-ERROR,
COMPILE-FILE-WARNED, or `compilation aborted` appears in the nine logs. Mutant logs
end with `compilation unit aborted`, with one fatal ERROR condition,
after the runtime Unhandled and corpus backtrace: this is unwinding of the outer
ASDF unit. The origin of the eight detections is the runtime check
identified above, not a compilation warning.

<a id="coerenza-delle-copie-e-sostituzioni"></a>

## Copy consistency and replacements

The mutator distinguishes source-files, which copies ASD/build/src/tests,
from fingerprints, which adds the driver without copying it. Actual
before/after fingerprints number 281 and are equal: 280 copied files and the driver.
Declared copies have 165 sources, 113 tests, ASD, and tools/build.lisp.
The target source-files catalog instead contains only two sources,
narrow and writer: it is not the copy inventory.

All 280 files in each of the nine copies were compared
against original fingerprints: 2,520 comparisons. The baseline has no differences;
each mutant differs only in its declared SOURCE-FILE. For
each, the BEFORE fragment occurs exactly once in the original and
the copy's entire text is exactly prefix+AFTER+suffix. Eight
exact replacements confirmed in tool transcript `7c73e0`.

Extra-return-value consistently replaces the DECLAIM+DEFUN fragment:
only the copy declares the second NIL and returns NEXT,NIL. No
configurations, corpus sources, or warning policies were altered.
This check concerns the declared ASD/build/src/tests inventory;
generated runner, FASLs, and logs are separate. It does not attest that no
other file exists in the trees or provide atomic/authentic proof of execution.

<a id="errori-del-lettore-ad-hoc-separati-dalle-campagne"></a>

## Ad hoc reader errors, separate from campaigns

Six extractor failures are declared here as partial observations
of tool transcripts. None loaded or called the product
or reran a campaign. These are neither new complete stdout/stderr archives
nor outcomes of the OK process records listed above.

| Failed transcript, exit 1 | Extractor error | Correction and result |
|---|---|---|
| `c4785a` | Snapshot plist entry treated as a pair: FIRST returns :PATH and SEARCH signals TYPE-ERROR, :PATH not SEQUENCE. Earlier counts had already been extracted. | GETF :PATH; reading completed `629503`. |
| `bbee86` | Inline rational oracle attempt with missing parenthesis: INPUT-ERROR-IN-LOAD, EOF in DEFUN from line 1/column 36; no recalculation performed. | Cold literal catalog and arithmetic recalculation of all 30 samples `569ad7`; assessment of the six values shown above. |
| `d794b5` | SUBSEQ through 4 on `catalogue-source-files` of length 2: BOUNDING-INDICES-BAD-ERROR before reading logs. | Structure inspection; `f9379c` reads all nine logs to EOF, tool output truncated, and `5c7274` prints compact origins for the eight. |
| `a4be07` | Extra closing parenthesis in inline form: SIMPLE-READER-ERROR before reading logs. | Balanced heredoc; compact reading `5c7274`. |
| `096bad` | Fingerprint inventory confused with copied inventory: FILE-DOES-NOT-EXIST for the driver intentionally absent from the baseline copy. | Read source-files/fingerprints definitions; all 2,520 comparisons and eight exact replacements completed `7c73e0`. |
| `464495` | Used :EXIT instead of :EXIT-CODE: NIL passed to numeric comparison after reading baseline. | Field inspection `ec0d0f`; reading to EOF and checks of all nine logs completed `4934bf`. |

<a id="esito-circoscritto"></a>

## Bounded outcome

Record data, cold benchmark recalculation, eight runtime
errors, and copies are consistent with declared expectations. No defects
emerge from this reading. The corpus author checks their own results;
separation from the benchmark driver and auditor applies to data
recalculation, and does not make corpus reading independent. Coverage and
final collection have their own reviewers. The eight mutations exercise
the eight declared defects; they do not measure general exhaustiveness, MC/DC,
scaling, or whole-engine qualification.
