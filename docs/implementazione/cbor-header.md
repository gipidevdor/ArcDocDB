<a id="lettura-degli-header-cbor"></a>

# Reading CBOR headers

`arcdocdb.cbor:leggi-header-cbor(buffer,start,end)` reads only the header
in the `[start,end)` span of an immutable simple u8 array. It returns six
values: major type, additional information (AI), high u32, low u32, next
offset, form. For AI 0..23, high is zero and low contains AI; AI 24..27
reads 1/2/4/8 unsigned big-endian bytes, respectively. A complete read
consumes at most nine bytes. For eight bytes, the first four compose high.

| Case | Result or condition |
|---|---|
| Not a simple u8 array or invalid span | `invalid-argument :cbor-range`, offset NIL |
| Valid empty span or incomplete header | `corruption-detected :cbor-truncated`, offset `end` |
| AI 28..30 | `corruption-detected :cbor-reserved`, offset `start` |
| AI31 for major 0/1/6 | `corruption-detected :cbor-indefinite`, offset `start` |
| AI31 for major 2..5 | Zero words, `next=start+1`, form `:indefinite` |
| AI31 for major 7 | Zero words, `next=start+1`, form `:break` |
| F8 followed by a value below 32 | `corruption-detected :cbor-simple`, offset `start+1` |
| Other complete headers | Form `:argument`, words and AI preserved |

Range, lead availability, and reserved AI precede argument bytes.
The full width is checked before reading it: a physical suffix beyond
`end` does not complete a truncated header. The F8 check follows availability
of its second byte. Offsets are absolute within the buffer.

This API preserves nonminimal arguments, tags, and float bits, including NaN
and infinity; it materializes neither a float nor a u64 integer. It does not interpret
the payload, validate break context, or traverse containers/text. The
deterministic profile and document budgets (16 MiB and depth 100)
remain tasks for the parser planned in ADR-0014/0048. A successful return
does not establish that the entire item is valid.

The caller keeps the buffer immutable until return. Cursors and words
are local: different workers can read headers in parallel before the
Serie's writer queue. The module creates no threads, does not wait, and
performs no I/O. It supports REQ-AFF-004/008 and an initial step of REQ-LIM-002,
without promoting the complete-decoder requirement.

The [method](cbor-header-metodo.md) records oracles, mutations, and measurements before
the campaigns. The [decision table](cbor-header-decisioni.md)
distinguishes input rejections from internal guards.

<a id="verifica-locale-del-9-ottobre-2026"></a>

## Local verification of October 9, 2026

The first strict build, on base `92d8b0e`, passes with 237 total tests,
including 17 nominal CBOR tests.
The corpus checks all 256 complete and one-byte leads, the 256 F8 second
bytes, 65,536 two-byte arguments, and 152 truncations. Fuzz `8949A11F`
compares 4096 spans: 3437 accepted and 659 rejected with exact reasons/offsets.
Expected values were frozen before reading the product.

Two threads read private buffers: 2,097,152 headers and 18,874,368 bytes,
sinks 2,401,919,800,705,024 and 2,231,683,637,051,392. The first run records
34,732 ticks of overlap of work intervals only, at 1,000,000
ticks/s. Buffers remain unchanged and workers terminate. This is evidence
of concurrent use; it does not establish throughput or scaling of the future pool.

Raw coverage of the two sources is 222/265 expressions and 32/40 branch
outcomes. Packages, declarations, and internal guards remain in the denominator.
The 43 unmarked elements and eight outcomes prevent a claim of full
coverage or MC/DC; no exception has been approved.

The unchanged mutation baseline completes all tests. All nine
mutants compile and are detected after smoke on the exact line; every log
is retained. The nine heap fixtures, each with five replicates of 4096
calls and warmup 128, record zero bytes allocated in all 45 samples.
All six values feed the verified sink. The sensor has a zero
baseline and positive control of 16,777,472 bytes; GC, fixtures, and reports are outside
the measurement. These tests provide no absolute guarantee of no allocations.

The [full catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-header/catalogo.lisp)
preserves wrappers, stdout/stderr, coverage state and HTML, baseline and ten
mutation logs, two C1 readings, and C4 audit. It also preserves the first
collector attempt, invalid due to a compilation error in an unexercised
branch: the 10/10 report is not accepted. After correction and addition
of the coverage-collection test, the self-test passes 11/11 without warnings.
The complete parser and runtime connection remain later developments.

<a id="integrazione-del-manifest-di-recovery"></a>

## Recovery-manifest integration

Base `fd96fb3` incorporates the manifest during development of this block.
Alignment keeps identical the five CBOR product and test blobs
reported in the [second reading](cbor-header-revisione.md). ASDF and the index
retain both modules. Earlier results remain attributed to their
original base; the catalog separately collects full integration
verification. No heap or mutation test is reinterpreted
as a measurement of full recovery or the engine.
