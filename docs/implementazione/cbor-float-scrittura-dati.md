This page presents an editorially revised edition of the frozen runtime reading.
The original record, blob `1872e19955ddcec09a83d8e9e78d7c51f8838b12`, remains
preserved in the immutable [reading archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-float-write/raw/readings/runtime-review-draft.md.txt).
This edition corrects the language and numeric presentation without changing
the results or the reading's original scope and date. References to the draft,
its collection status, and the time of the reading retain their historical meaning.
For the final collection and subsequent checks, refer to the
[final results report](cbor-float-scrittura-risultati.md).

<a id="scrittura-float-cbor--lettura-dei-dati-runtime"></a>

# CBOR float writing — runtime data reading

This reading took place on 2026-10-13 in the isolated worktree and was completed
before the final collection. The reviewer authored the blind corpus and the second
static reading, so this results check is not independent of the
corpus. The benchmark recalculation is separate from the driver and auditor
and uses cold fixtures examined arithmetically. Neither the product,
benchmark driver, mutator, nor test suite was loaded or called. Only
the trusted tool `tools/evidence-storage.lisp` and
SBCL's SB-MD5 component were loaded to fingerprint the copies. Records are treated
as data: structured stdout is read with READ-EVAL NIL, the standard readtable,
and the CL-USER package, requiring one form followed by EOF and no data evaluation.

This draft remains excluded from collection until its freeze is communicated to the
coordinator. Raw coverage is assigned to another reader. No
C1, MC/DC, engine, or durability qualification is attested by this
reading. No campaign was rerun and no source file,
matrix, Git index, or configuration was modified.

<a id="registri-letti"></a>

## Records read

All eight records report STATUS OK, EXIT-CODE 0, and
SOURCE-CONSISTENCY STABLE. The 738 before/after entries are identical, and the
snapshot is the same across campaigns, as also verified in the final check,
`fa5967`. The recorded HEAD is `364ac3b8c6dc3877e978ce551dc6e2fbab8ea1f0`,
and the working tree was clean at the time of the campaigns.

| Record in `spikes/out/` | Operation | Process time (seconds) |
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
`f95bf450148fa2aab9bb28c178b986dee049de6e`, matching the blind freezes.
The method is `755b13a91ab72f54383d96faee5780da36e750d6`; the first static reading is
`0d644768dc2f8efeb86136a8a4c4206c4c464bb6` and the second is
`134173468ca2bfd538eb1f6bbeda4dda128e800b`.
Benchmark `d992c9f8cf6ff0d748fcb77f871fb77969480bca`, auditor
`485544868eeadff247968b86c2d5da9b3b610295`, mutator
`5d0d6bd46b0286f153ee9c482734c659959396e2`, and coverage scope
`6262967597ab1c0c142ce1a988ec2ecf49543865`.

Recorded environment: SBCL 2.6.9, Darwin 27.0.0 ARM64, Apple M4,
17,179,869,184 bytes of memory, and 10 logical CPUs; external load UNCONTROLLED.
These are observed metadata; no inference is made about frequency or active cores.

<a id="corpus-e-controlli-preliminari"></a>

## Corpus and preliminary checks

There are 989 distinct `ok` lines: 987 named tests and two explicit
smoke tests for the root package and version string. Among them, 18 are
REQ-CBR-004 tests. Corpus markers confirm:

- All 65,536 half values and 131,072 expansions: 196,608 successes and 196,608
  insufficient-capacity cases, rotating through eight offsets and three configurations.
- Fuzzing: 2,048 cases, seed 464C5434, with 768 successes and rejections for
  capacity (256), AI (128), HIGH (128), LOW (128), word (256), and range/destination (384).
- Two waves of 16,384 aggregate calls, 32,768 in total, with sink values of
  2,115,584/2,148,352 for both. The overlap is 2,576/2,580 ticks at 1,000,000
  ticks/s. The fixture intervals do not attest to scaling across cores.
- Lint: 165 files, 0 violations. Trace: 118 requirements, 65 invariants,
  13 FI scenarios, 52 ADRs, 0 errors.

The compiler transcript contains no WARNING, STYLE-WARNING, or
Unhandled. There are 200 notes for the product and 743 for the tests:
optimization/type notes, distinct from fatal warnings. The subsequent
check consists of reading the logs, not performing a new compilation.

<a id="self-test-degli-strumenti"></a>

## Tool self-tests

The scope self-test reports detection of the missing branch. The
mutator self-test preserves the record of a process terminated by signal 9/exit 137
and one that emits all required markers but ends with exit 7. Both are
WORKER-ERROR, DETECTED NIL: two expected worker faults, with no falsely
detected mutation. It also preserves baseline-copy and
baseline-transport fixtures in their respective records. These are synthetic scenarios,
separate from the actual baseline.

The benchmark auditor self-test records 167,234 checks, four positive
reports, and 70 negative fixtures with 70 distinct names and specific reasons.
It includes bytes/subnormal, raw words, span/NEXT/arity, sink/heap/timer,
metadata, fingerprints, inventory, and reader-eval/trailing/improper/cyclic data.
The cold reference includes six catalog cases and seven additional
zero/infinity/NaN cases, using integer/rational arithmetic and no native
floats.

The benchmark self-test and benchmark include a null baseline of 4,096
calls, a warmup of 128 calls, heap 0, and sink 8,386,560. The 16×1 MiB positive control
records 16,777,472 bytes, of which at least 16,777,216 are deliberately allocated,
and sink 16,777,336. Eight output alterations (two shape changes and six byte changes),
four arity/NEXT cases, an incorrect sink, and a nonzero heap are rejected for the
expected reasons.

<a id="benchmark-ricalcolo-freddo"></a>

## Benchmark: cold recalculation

The value 1.5 is represented by half 3E00 and binary64 3FF80000/00000000. Binary64
3FF00000/20000000 represents 1+2^-23 and is represented by single 3F800001, with no
exact half form. LOW 1 in 3FF00000/00000001 prevents reduction from 64 bits.
3E700000/00000000 represents 2^-24, the minimum half subnormal, 0001.
FFF80000/00000001 retains its negative sign, quiet NaN status, and a payload that is not
aligned for 32-bit representation, so it remains 64 bits. These observations do not use the codec.

| Fixture | Cold bytes | NEXT | Token | Sink per 4,096 |
|---|---|---:|---:|---:|
| half identity | 249 62 0 | 5 | 6445 | 34785280 |
| double→half | 249 62 0 | 5 | 6445 | 34785280 |
| double→single | 250 63 128 0 1 | 7 | 8421 | 42878976 |
| double only | 251 63 240 0 0 0 0 0 1 | 11 | 11632 | 56031232 |
| double→half subnormal | 249 0 1 | 5 | 6202 | 33789952 |
| double NaN payload | 251 255 248 0 0 0 0 0 1 | 11 | 12440 | 59340800 |

The setup uses START 2, END=NEXT+2, and a SIZE+6 buffer with sentinel 165: two prefix
bytes, two remaining bytes, and two bytes beyond END. The complete array, raw words,
size, NEXT, a single cold value, token NEXT+Σ(i+1)×byte[i], and sink
4,096×TOKEN+4,096×4,095/2 were recalculated. All 30 samples use 4,096 calls,
a warmup of 128 calls, heap 0, exact token/sink values, seconds=RAW-TICKS/1,000,000,
and rate=4,096/seconds. The samples total 33,414 ticks=0.033414 seconds;
the benchmark process takes 1.416727 seconds. The measurement includes complete
fixture checks and does not establish engine throughput or scaling, or provide
absolute proof of no allocation.

Internal fingerprints comprise 167 matching before/after MD5 entries. The runtime audit
records 55,824 checks, six cells and thirty samples, heap 0, arity 1, and the
same total of 0.033414 seconds. The benchmark wrapper observed before and after
has 198,507 bytes and SHA256
`1154975a7c27c433d402c7b7549a62fb321b1e43fb806f5def86dd8825bfceb6`.
The auditor checks data consistency and the declared inventory; it does not prove
authenticity or execution, closure of the entire tree, or an intrinsic
MD5/Git correspondence without explicit caller expectations.

<a id="baseline-e-otto-mutazioni-log-completi"></a>

## Baseline and eight mutations: complete logs

The reviewer read `spikes/out/cbor-float-write-20261013/mutations/report.lisp` and,
through the trusted tool, every line of the nine logs through EOF. The
baseline has 1,067 lines, 989 distinct `ok` lines, exit 0, RESULT OK, and SIGNAL NIL.
The version smoke line is exactly line 2; the complete marker
`build e test: nessun avviso, tutti i controlli superati` is exactly
line 1,067. The log contains no Unhandled or invalidating compiler diagnostics.

All eight mutants have 208 distinct `ok` lines, the exact version smoke marker at
line 2, and `Unhandled ` at the start of line 250, in the required
order. The complete marker is absent. All have exit 1, SIGNAL NIL,
RESULT DETECTED, DETECTED T, and DIAGNOSTIC NIL. Final count: eight
detected, zero survivors, zero invalid, and zero worker errors. The
final compact check is tool transcript `4934bf`.

The numbered frame identified below contains both the namespace
`ARCDOCDB.CBOR.FLOAT.WRITE.TESTS::` and REQ-CBR-004 in the same frame. In every case,
it identifies the test `TEST-REQ-CBR-004-FLOAT-WRITE-LITERAL-ZERO-INFINITY-FINITE-AND-NAN-VECTORS`.
These are not merely marker quotations in a backtrace string.

| Mutant / log under `mutations/` | EOF lines | REQ frame | Observed runtime origin |
|---|---:|---:|---|
| omit-single-reduction / `0/test.log` | 320 | 7 | Capacity rejected for AI 26, LOW 3FC00000, END 3; writer frame 4 and CFW-ACCEPT frame 5. |
| omit-double-reduction / `1/test.log` | 320 | 7 | Capacity rejected for AI 27, HIGH 3FF80000, LOW 0, END 3; writer frame 4 and CFW-ACCEPT frame 5. |
| half-sign-lost / `2/test.log` | 322 | 9 | Invariant CBOR-FLOAT32-NARROW-SIGN, input 80000000 in reducer frame 4; writer frame 6. |
| half-normal-fraction / `3/test.log` | 320 | 6 | The EQUALP buffer check fails: 249 61 0 versus 249 62 0, CFW-ACCEPT frame 4, single input 3FC00000. |
| single-subnormal / `4/test.log` | 323 | 10 | Invariant CBOR-FLOAT64-NARROW-HIGH, shifter frame 4 with HIGH 1048576, LOW 0, shift 52; writer frame 7, input 36A00000/0. |
| physical-capacity / `5/test.log` | 319 | 6 | The TYPEP check on the condition fails in CFW-REJECT frame 4; half input 3E00, START=END=0, expected RESOURCE-EXHAUSTED/CBOR-FLOAT-CAPACITY. |
| wrong-float-lead / `6/test.log` | 320 | 6 | The EQUALP buffer check fails: 217 62 0 versus 249 62 0, CFW-ACCEPT frame 4, half input 3E00. |
| extra-return-value / `7/test.log` | 319 | 6 | Arity (= 1 LENGTH ACTUAL) fails in CFW-ACCEPT frame 4, half input 3E00. |

When the check fails after the writer returns, its frame
is no longer present. In physical-capacity, the corpus has already caught
the condition: the log proves the TYPEP mismatch and does not directly retain
the caught condition's reason. Static inspection of the replacement alone
shows that capacity is also compared against the physical
tail; with a zero span, the target's subsequent guard acts before
writing. This is an inference from the copy, distinct from the log's
text. The test is not masked by a subsequent error involving
buffer preservation.

No WARNING:, STYLE-WARNING:, COMPILE-FILE-ERROR,
COMPILE-FILE-WARNED, or `compilation aborted` appears in the nine logs. Mutant logs
end with `compilation unit aborted`, with one fatal ERROR condition,
after the runtime Unhandled and corpus backtrace: this is the unwinding of the outer
ASDF unit. The origin of the eight detections is the runtime check
identified above, not a compilation warning.

<a id="coerenza-delle-copie-e-sostituzioni"></a>

## Copy consistency and replacements

The mutator distinguishes source-files, which copies ASD/build/src/tests,
from fingerprints, which adds the driver without copying it. The 281 actual
before/after fingerprints match: 280 copied files and the driver.
The declared copies contain 165 source files, 113 tests, ASD, and tools/build.lisp.
The target source-files catalog contains only two source files,
narrow and writer; it is not the copy inventory.

All 280 files in each of the nine copies were compared
against the original fingerprints: 2,520 comparisons. The baseline has no differences;
each mutant differs only in its declared SOURCE-FILE. For
each, the BEFORE fragment occurs exactly once in the original and
the copy's entire text is exactly prefix+AFTER+suffix. All eight
exact replacements were confirmed in tool transcript `7c73e0`.

Extra-return-value consistently replaces the DECLAIM+DEFUN fragment:
only the copy includes the second NIL in the declaration and returns NEXT,NIL. No
configurations, corpus sources, or warning policies were altered.
This check concerns the declared ASD/build/src/tests inventory;
the generated runner, FASLs, and logs are separate. It does not attest that no
other file exists in the trees or provide atomic or authentic proof of execution.

<a id="errori-del-lettore-ad-hoc-separati-dalle-campagne"></a>

## Ad hoc reader errors, separate from campaigns

Six extractor failures are reported here as partial observations
of tool transcripts. None loaded or called the product
or reran a campaign. These are neither new complete stdout/stderr archives
nor outcomes of the OK process records listed above.

| Failed transcript, exit 1 | Extractor error | Correction and result |
|---|---|---|
| `c4785a` | A snapshot plist entry was treated as a pair: FIRST returns :PATH and SEARCH signals TYPE-ERROR because :PATH is not a SEQUENCE. Earlier counts had already been extracted. | Use GETF :PATH; the reading was completed in `629503`. |
| `bbee86` | An inline rational oracle attempt had a missing parenthesis: INPUT-ERROR-IN-LOAD, EOF in DEFUN from line 1/column 36; no recalculation was performed. | A cold literal catalog and arithmetic recalculation of all 30 samples are recorded in `569ad7`; the assessment of the six values is shown above. |
| `d794b5` | SUBSEQ through 4 on `catalogue-source-files` of length 2 caused BOUNDING-INDICES-BAD-ERROR before the logs were read. | Inspect the structure; `f9379c` reads all nine logs to EOF, but its tool output is truncated, and `5c7274` prints compact origins for all eight mutants. |
| `a4be07` | An extra closing parenthesis in an inline form caused SIMPLE-READER-ERROR before the logs were read. | Use a balanced heredoc; the compact reading is in `5c7274`. |
| `096bad` | The fingerprint inventory was confused with the copied inventory: FILE-DOES-NOT-EXIST for the driver intentionally absent from the baseline copy. | Read the source-files/fingerprints definitions; all 2,520 comparisons and eight exact replacements were completed in `7c73e0`. |
| `464495` | :EXIT was used instead of :EXIT-CODE: NIL was passed to a numeric comparison after the baseline was read. | Inspect the fields in `ec0d0f`; reading to EOF and checks of all nine logs were completed in `4934bf`. |

<a id="esito-circoscritto"></a>

## Bounded outcome

The record data, cold benchmark recalculation, eight runtime
errors, and copies are consistent with the declared expectations. No defects
emerge from this reading. The corpus author checks their own results;
separation from the benchmark driver and auditor applies to data
recalculation and does not make the corpus reading independent. Coverage and
the final collection have their own reviewers. The eight mutations exercise
the eight declared defects; they do not measure general exhaustiveness, MC/DC,
scaling, or whole-engine qualification.
