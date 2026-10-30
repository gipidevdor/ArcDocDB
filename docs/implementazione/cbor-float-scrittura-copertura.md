<a id="float-cbor--lettura-dei-dati-di-coverage-e-audit-benchmark"></a>

# CBOR floats — coverage-data reading and benchmark audit

This page publishes the [archived original reading](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-float-write/raw/readings/coverage-review-draft.md.txt),
frozen as Git blob `7c8d22854d345aafae3c5fe6ba12977d5e0abb0f`.
The following text is preserved in full, without adaptations to paths
or historical references. The [final results](cbor-float-scrittura-risultati.md)
present the campaign's overall outcome and archive preservation.


Reading dated 2026-10-13 of frozen sources, without LOAD of product,
driver, auditor, or data helper. Reports, SB-COVER state, and sources
were read as data with READ-EVAL NIL, standard readtable,
CL-USER, and EOF; sources were not executed. Only an empty package
was created to read qualified condition symbols.
The preceding campaign's helper was studied statically.

This reading has an author distinct from product and corpus. The same
author did, however, write `tools/cbor-float-write-audit.lisp`: reading
that program's result is not independent review of their own
code. The coordinator separately read the complete C4 code.

<a id="identità-e-registri"></a>

## Identity and registers

- Narrow: Git blob `cd5749edc0a757ee3a5b470eda566a6685d32fd8`.
- Write: Git blob `03c6aed61e2c243d8b1a6c4332ce1837c4e9a77c`.
- Benchmark auditor: Git blob `485544868eeadff247968b86c2d5da9b3b610295`.
- Coverage: `spikes/out/4000905717-command-32850-0/report.lisp`, command
  `foundation-coverage --report .../coverage/ cbor-float-write`.
- Benchmark audit: `spikes/out/4000905717-command-32851-0/report.lisp`,
  `--bench` on record `4000905677-command-32530-0/report.lisp`, with
  both product Git blobs passed explicitly.

The two requested registers and original benchmark are OK, exit 0,
source-consistency STABLE; each declares 738 entries in the
before/after snapshot, compared equal. The internal benchmark declares 167
before/after MD5 entries, equal. Inventory completeness or
authenticity is not inferred from these metadata. Git blobs selected in the audit
register match the three values above.

<a id="conteggi-di-coverage"></a>

## Coverage counts

State contains 274 saved files. Exactly one entry
is present for each of the two new absolute paths. Path vectors and
bit-vectors have the same length; expression paths begin with a
number, branch paths with a keyword, and observed bits are 0/1.

| Source | Covered/total expressions | Covered/total branch outcomes | Missing expressions | Missing outcomes |
|---|---:|---:|---:|---:|
| cbor-float-narrow.lisp | 175/220 | 26/36 | 45 | 10 |
| cbor-float-write.lisp | 190/220 | 35/40 | 30 | 5 |
| Total | 365/440 | 61/76 | 75 | 15 |

Counts come from raw bits and match both the HTML index
and the two source HTML summaries. The HTML inventory is exactly
`cover-index.html`, `23a33ec5ac2b59d1b9d7819bf40c11d1.html`, and
`8cf55e316599aaec35dd1fc1f1566797.html`.
The row parser respects SB-COVER's implicit TR closure:
when the next TR precedes a closing tag, it closes the previous
row. It does not merge the header row with the next row.

Classification syntactically maps raw paths to read forms,
reversing SB-COVER paths and removing THEN/ELSE to locate the
predicate. It does not demonstrate unreachability or condition coverage.

| Missing-expression category | Narrow | Write | Total |
|---|---:|---:|---:|
| Top-level declarations | 5 | 6 | 11 |
| Internal ERROR-form nodes | 40 | 24 | 64 |
| Other expressions | 0 | 0 | 0 |

Raw declaration paths are `(0) (1) (2) (4) (6)` in narrow and
`(0) (1) (2) (4) (6) (8)` in write. Each of the sixteen internal ERROR
forms below contributes four missing expression nodes; no
form is subtracted from the denominator.

| File | ERROR-form reason | ERROR line | Directly associated missing outcomes |
|---|---|---:|---:|
| narrow | :cbor-float32-narrow-input | 15 | 1 |
| narrow | :cbor-float32-narrow-exponent | 24 | 0, plus fallback described below |
| narrow | :cbor-float32-narrow-sign | 30 | 1 |
| narrow | :cbor-float64-narrow-significand | 42 | 1 |
| narrow | :cbor-float64-narrow-alignment | 44 | 1 |
| narrow | :cbor-float64-narrow-high | 50 | 1 |
| narrow | :cbor-float64-narrow-low | 54 | 1 |
| narrow | :cbor-float64-narrow-input | 64 | 1 |
| narrow | :cbor-float64-narrow-exponent | 75 | 0, plus fallback described below |
| narrow | :cbor-float64-narrow-sign | 80 | 1 |
| write | :cbor-float-write-span | 21 | 1 |
| write | :cbor-float-write-ai | 39 | 0 |
| write | :cbor-float-selection-input | 52 | 1 |
| write | :cbor-float-selection-output | 60 | 1 |
| write | :cbor-float-write-target-span | 82 | 1 |
| write | :cbor-float-write-progress | 89 | 1 |

Legacy search by REASON substring alone incorrectly places
`:cbor-float64-narrow-sign` at the first occurrence of `...-significand`.
The exact path `(7 5 3 2)` in forward forms and the read source
instead identify line 80. Counts and association with the ERROR form
do not change; the line was corrected by reading the exact site.

For branches, direct mapping gives eight internal narrow guards and
five write guards. The two remaining narrow raw paths are:

- `(:ELSE 0 4 1 3 1 5 3)` → `(3 5 1 3 1 4 0)`, false outcome of the final
  predicate `(<= 103 exponent 112)` at line 22, followed by fallback
  `:cbor-float32-narrow-exponent` at line 24.
- `(:ELSE 0 4 1 3 1 5 7)` → `(7 5 1 3 1 4 0)`, false outcome of the final
  predicate `(<= 874 exponent 896)` at line 72, followed by fallback
  `:cbor-float64-narrow-exponent` at line 75.

These two outcomes are `:other` for the ERROR-parent prefix
matcher: the preceding predicate is not a child of the `t` branch.
The site is explicitly identified, without reinterpreting the two
outcomes as covered or removing them. In total, thirteen directly associated guard
outcomes and two numeric fallbacks remain, fifteen missing.
No MC/DC claim, C1 gate, or unreachability demonstration.

<a id="log-della-campagna-di-coverage"></a>

## Coverage-campaign log

Register 32850 preserves complete stdout with 18 successful tests, including:
65,536 half values and 131,072 expansions, 196,608 successes and as many capacity
rejections; fuzz 2,048 cases with 768 successes, 256 capacity, 128 AI,
128 HIGH, 128 LOW, 256 words, and 384 ranges/destinations; two waves
of 16,384 items each on two reused workers. Observed sinks per wave
2,115,584/2,148,352; overlap 2,733/2,719 ticks with 1,000,000 ticks/s.
These intervals do not prove scaling or simultaneous execution on cores.

<a id="risultato-dellaudit-benchmark"></a>

## Benchmark-audit result

The auditor's data report states OK and 55,824 checks, six fixtures,
thirty samples with zero observed heap allocation and cold arity one. The original
benchmark's before/after observation is equal and matches bytes/hash
of the file observed in this reading: 198,507 bytes, SHA256 `1154975a…`.
It is not a signature or attestation of the declared execution.

The original benchmark was also read: six fixtures in frozen
order, five replicates each, 4,096 calls and warmup 128,
expected bytes and cold-values consistent with preregistered vectors.

| Fixture | NEXT | Token |
|---|---:|---:|
| half-identity | 5 | 6,445 |
| double-to-half | 5 | 6,445 |
| double-to-single | 7 | 8,421 |
| double-only | 11 | 11,632 |
| double-to-half-subnormal | 5 | 6,202 |
| double-nan-payload | 11 | 12,440 |

The thirty sample times sum to 0.033414 seconds; the benchmark
process has wall time 1.416727 seconds. The auditor's report states
0.000068 seconds for the two checks, zero heap-allocation baseline, and positive
control 16,777,472 bytes. These are not performance thresholds, absolute proof
of nonallocation, engine throughput, or a scaling measurement.
Internal MD5 and external Git blobs remain separate declared metadata,
without an authenticated link between them. The auditor's graph check
traverses conses, not general vectors with further conses/cycles.

<a id="osservazioni-dei-byte-primadopo"></a>

## Before/after byte observations

Nine files were observed before and after the HTML/raw comparison:
identical name, size, and SHA256. Values concern current physical
bytes, before any later lossless compression.

| File | Bytes | SHA256 |
|---|---:|---|
| 32850/report.lisp | 155106 | `183c3eb8273d8ad4f3348df9dfd3d6d09afeab74c7bc097e56119297c2d5ae24` |
| 32851/report.lisp | 154777 | `a648824ca0f0ec2c3520cfa885dc6a9f6909f723fafc0e6e0b364b7a4d9cce61` |
| 32530/report.lisp | 198507 | `1154975a7c27c433d402c7b7549a62fb321b1e43fb806f5def86dd8825bfceb6` |
| coverage-state.lisp | 1991414 | `e6d67d0e7c452205c2531375b68ec584740e47d6e45302ebdaef1f5d730a54f4` |
| cover-index.html | 1956 | `0fd3fda477a1b039a03ce29a359c15b65fe2ad188b1c7a598068317294cc58bd` |
| 23a33ec5ac2b59d1b9d7819bf40c11d1.html | 30109 | `287ed54697c0e8f92596c28f3678cce462fad6ca82aedfec4f4ac8a95392b64a` |
| 8cf55e316599aaec35dd1fc1f1566797.html | 31681 | `c85c97a0932b23fc93d328958117d6b45ca160ba8ac47e9d8168f584b5b6d7e8` |
| cbor-float-narrow.lisp | 4546 | `479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb` |
| cbor-float-write.lisp | 5083 | `28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442` |

Before/after does not mean an atomic observation of the whole set.
Sealing the archive and its verification remain coordinator activities.

<a id="tentativi-del-lettore-analitico"></a>

## Analytical-reader attempts

Three ad hoc stdin reading-code attempts failed:
the first had a missing parenthesis and GETF used with an IF-based
SETF place; the second reversed arguments of the
UIOP suffix predicate; a later benchmark check had
a missing parenthesis. They were corrected. Reading raw paths,
complete HTML/raw comparison with nine unchanged observations, and
reading benchmark/audit then finished with exit 0.
Messages are observations from this session, not complete preserved
command registers or product-campaign results. Campaigns
read here remain OK/0/STABLE; no input data was
rewritten and no tracked file was changed for this reading.
