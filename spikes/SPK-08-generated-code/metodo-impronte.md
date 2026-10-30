<a id="spk-08--metodo-preregistrato-per-le-impronte"></a>

# SPK-08 — Preregistered fingerprint method

;;; REQ: REQ-SIM-001 REQ-SIM-002 REQ-BEN-002 REQ-VAL-001 REQ-AFF-003 REQ-AFF-008 REQ-AFF-016

Registered before any compile/CHECK. Phase 0 scope: only the new
`impronte.lisp`, package `ARCDOCDB.SPK08.IMPRONTE`, exports `CHECK` and `BENCH`.
All work takes place in the isolated checkout
`/Users/gpicchiarelli/.codex/worktrees/valutazione-avanzata/ArcDocDB`.
Common Lisp/SBCL, safety 3, no dependencies on other spikes and no index
integration. No commit or push.

<a id="contratto-e-algoritmo"></a>

## Contract and algorithm

A group contains 16 ctrl bytes. Valid fingerprints are 0–127; empty = 128,
deleted = 254. All other bytes with the high bit set are excluded from matching.
The resulting mask has bit i for position i (0–15). Queries outside 0–127,
wrong types, and windows shorter than 16 bytes produce errors.
Input is read-only. Serialization of the two u64 words is explicitly little
endian: byte i in bits 8*i; the result does not depend on machine endianness.
No unaligned memory accesses or VOPs are used.

For x = word XOR repeated query, the exact zero mask is
`NOT (((x AND 0x7f7f7f7f7f7f7f7f) + 0x7f7f7f7f7f7f7f7f) OR x OR
0x7f7f7f7f7f7f7f7f) AND 0x8080808080808080`.
Each lane sum is at most 254: no carry between bytes.
Three folds compress the eight high bits into one byte; two words yield u16.
The mutant `(x - 0x0101010101010101) AND NOT x AND 0x8080808080808080`
retains the borrow limitation, with x = byte 0 followed by byte 1: useful for
testing whether a zero exists, unsuitable as an exact positional mask.
The mutant remains a separate function, never a selectable kernel variant.

Kernels: `scalar16` and `packedmask16` over a byte array and offset;
`scalar-u64` and `typedu64` over two u64s. Specialized types, safety 3, and
direct/inline calls in loops. Compilation/disassembly and bytes-consed samples
allow allocation assessment; an external Lisp call with boxed u64s is not
assumed allocation-free. SWAR is integer-word arithmetic, rather than hardware
SIMD. A separate scalar oracle reads only bytes and sums powers of two,
without reusing packing, compression, or the SWAR formula.

<a id="check-e-budget"></a>

## CHECK and budgets

1. Strict compilation in an SBCL process without init: warnings and
   style-warnings are fatal, as are compile-file warnings/failure values.
   FASLs only in `out/`.
2. All 256 bytes, all 128 queries, and all 16 isolated positions.
3. All byte pairs (256²) in the 15 adjacent pairs, queries 0 and 127;
   includes the word boundary and every position with borrowing.
4. All 16² position pairs, bytes in the small domain
   {0, 1, 126, 127, 128, 129, 254, 255}, queries {0, 1, 126, 127}.
5. All 4^8 words over {0, 1, 128, 254}, each in both halves, queries
   {0, 1, 127}; the small domain is fully enumerated, without sampling.
6. Larger differential test: 20,000 groups from a u32 LCG with fixed seed;
   offsets 0–31, arbitrary bytes, queries 0–127. Golden endianness fixtures
   and empty/full/alternating masks; all u16 masks for compression.
7. Negative mutant checks, invalid arguments through dynamic calls to avoid
   intentional static warnings; full before/after input comparison, including
   rejection. Deterministic CHECK/BENCH budget rejections before any BENCH measure.

CHECK has a maximum of 4,000,000 group comparisons, default equal to the
maximum, 20,000 differential groups (ceiling 100,000), 120 seconds (ceiling 300).
The deadline is checked every 4096 comparisons and at completion, as a
cooperative limit; an exhausted limit is an error, never partial success.
Counts are reported per campaign, with consistency checks. Retain local
disassembly of the four kernels and direct loops. The plist reports :status
:ok only after all campaigns, including limits and the actual platform.

<a id="bench-da-eseguire-soltanto-nel-parent"></a>

## BENCH to be run only by the parent

Planned API: `(bench &key (rows 1024) (passes 64) (warmup-passes 2)
(seconds 60) (byte-budget 16777216))`. Five mandatory replicates.
Two datasets, mixed and adversarial (borrows, full hit, miss, special values,
high bit, 0/127, word boundary); preallocated byte and word matrices, same
queries and oracle for both kernels in each comparison. Offsets 0–15 in
32-byte rows. Packing/preparation/validation/oracle/warmup excluded from
measurements. Comparisons: scalar16/packedmask16 and scalar-u64/typedu64.
Alternating AB/BA order per replicate and matrix cell, explicitly reported.
Numeric accumulator checked against the oracle and published.

Each sample measures ticks and bytes-consed only around the direct loop;
it reports actual operations, calculated ns/op, total and per-operation bytes,
checksum, order, and replicate. No estimated overhead is subtracted and no
times are invented; ticks = 0 makes a measurement unresolved and produces an
error. GC and scheduling during the loop remain included. Report and fixture
allocations excluded; bytes-consed is not RSS. The loop reads preallocated
data and produces a fixnum checksum; it creates no structures per call.
Limits are rows 16–8192, passes 1–1024, warmup 1–64, seconds >0 and ≤300,
payload byte-budget ≤64 MiB, and total operations ≤200,000,000.
The deadline is cooperative between blocks of at most 4096 operations, with
the same checks in both loops; exhaustion signals an error without an :ok
plist. BENCH returns :status :ok, :measurements, limits, and raw samples only
after five complete replicates for every cell. It is not run in this work,
even for warmup or a smoke test.

<a id="evidenze-e-limiti-dellinferenza"></a>

## Evidence and inference limits

Every compile/CHECK attempt, including failures, will have new ignored files
in `out/` with schema-version 1, explicit argv and stdin, environment,
before/after hashes/contents, decoded result, full stdout/stderr, and limits.
The existing wrapper `tools/record-command.lisp` can record the command;
a new driver in `out/` adds module result, warnings, unchanged source, and
untruncated logs. Driver and stdin are included in the evidence.
No existing core/run/suite/tools/docs/ADR/REQ file is changed.
All attempts, paths, and actual counts are listed at delivery.

Initially observed platform: Darwin 27.0.0, arm64, SBCL from
`/opt/homebrew/bin/sbcl`. SBCL version, CPU, clock resolution, and endianness
features are collected by recorded processes. The check concerns this platform;
it does not qualify x86-64, hardware SIMD, the index, or the engine.
No performance superiority before the parent's samples.

<a id="api-per-il-parent"></a>

## API for the parent

The only exported symbols are `ARCDOCDB.SPK08.IMPRONTE:CHECK` and
`ARCDOCDB.SPK08.IMPRONTE:BENCH`: both accept calls without arguments.
Kernels remain internal symbols (`ARCDOCDB.SPK08.IMPRONTE::...`).

| Internal symbol | Arguments | Result |
|---|---|---|
| `SCALAR16` | ctrl simple-array u8, start fixnum, h7 | scalar mask16 |
| `PACKEDMASK16` | same arguments | SWAR mask16, including LE packing |
| `SCALAR-U64` | low u64, high u64, h7 | scalar mask16 over prepared words |
| `TYPEDU64` | same arguments | SWAR mask16 over prepared words |

Bit i corresponds to byte i. The two words represent bytes 0–7 and 8–15 of
the window respectively. Bytes with the high bit set never match a valid query.
No query is truncated to seven bits.

Calling BENCH without arguments prepares 1024 rows per dataset, 64 passes
per sample, and two warmup passes. The plan includes 40 raw samples,
2,621,440 measured operations and 16,384 warmup operations, 106,496 bytes of
payload, and a cooperative deadline of 60 seconds. These are planned
parameters and counts, rather than completed measurements. The parent may
choose more passes through `:passes`, retaining declared limits and recording
the full call. No BENCH was run during this work.

<a id="esiti-successivi-alla-preregistrazione"></a>

## Outcomes after preregistration

Recorded process environment: SBCL 2.6.9, Darwin 27.0.0, ARM64, Apple M4,
16 GiB RAM, 10 logical CPUs; little-endian host, clock with 1,000,000 units/s.
External load uncontrolled. Safety 3 unchanged in every attempt.

Every attempt uses the same argv, with empty stdin from `/dev/null`:

```text
/opt/homebrew/bin/sbcl --noinform --no-sysinit --no-userinit --script spikes/SPK-08-generated-code/out/record-impronte.lisp compile-check
```

| Attempt | Schema 1 record relative to this module | Outcome |
|---|---|---|
| 1 | `out/4000480808-impronte-86996-0/report.lisp` | Compilation succeeded, zero warnings; loading stopped by a DEFMACRO redefinition style-warning. CHECK not run. |
| 2 | `out/4000480868-impronte-87419-0/report.lisp` | Macro made local with MACROLET. Compile, load, and CHECK :ok, zero warnings/style-warnings. |
| 3 | `out/4000481031-impronte-88302-0/report.lisp` | Helpers renamed in Italian. Compile, load, and CHECK :ok, zero warnings/style-warnings. |
| 4 | `out/4000481114-impronte-88523-0/report.lisp` | Final revision of Italian comments. Compile, load, and CHECK :ok, zero warnings/style-warnings. |

Four successful compilations, one rejected load, three complete CHECKs.
Every record preserves full stdout/stderr, argv/stdin, environment, contents,
and before/after Git blobs of module, method, and driver. All snapshots of
every attempt are stable. Subsequent intentional changes are documented by
later attempts; this section is a documentation addition after the last run
and does not change the compiled module. Other agents' modules, being worked
on in parallel, are not captured.

The three successful CHECKs have the same counts:

| Campaign | Groups | Comparisons of the four kernels |
|---|---:|---:|
| All bytes/queries/positions | 524,288 | 2,097,152 |
| All adjacent byte pairs, queries 0/127 | 1,966,080 | 7,864,320 |
| All position pairs, small domain | 65,536 | 262,144 |
| All 4^8 words, two halves, three queries | 393,216 | 1,572,864 |
| All u16 masks | 65,536 | 262,144 |
| Offsets, endianness, and boundaries | 518 | 2,072 |
| Deterministic differential | 20,000 | 80,000 |
| Mutant witnesses and word boundary | 29 | 116 |
| Main CHECK total | 3,035,203 | 12,140,812 |

In addition, 77 negative checks per CHECK: 34 for byte inputs, 26 for words/
queries, five for CHECK/time limits, 12 for BENCH preflight (no BENCH call).
A nested CHECK with a one-group budget rejects the next operation; its group
belongs to the negative check, rather than the main CHECK count. The mutant
is refuted by 28 witnesses, for both queries and all pairs within the same
word. The 7/8 boundary check confirms that borrowing does not cross the two
words. Buffers are compared in full before/after, including rejection.

Actual CHECK limits: 4,000,000 groups, 20,000 differential cases, 120 seconds,
checkpoint every 4096 groups. Every rejection is a condition; no exhausted
limit returns :ok. The three complete runs remain within these limits.
CHECK times in records are not benchmarks.

The final directory retains `check-data.lisp`, the FASL, `stdout.txt`,
`stderr.txt`, and eight `disassembly-*.txt` files for the four kernels and
four loops. Observed arithmetic uses ARM64 integer registers (MUL/EOR/AND/ADD/
ORR and shifts), with safety 3 checks and error branches. No allocation calls
are observed in normal SWAR kernel paths; loops also contain cold error paths.
The absence of bytes-consed in the loop and any performance advantage remain
to be measured by the parent.

<a id="integrazione-e-lettura-autonoma-dei-report"></a>

## Integration and standalone report reading

Before the integrated CHECK, the runner converts only experimental package
identifiers to qualified strings. Numbers, bytes, output, and results remain
unchanged. The report can then be read with `*read-eval*=nil` without loading
the module. The four original records are retained in full in the
`:raw-original` field of portable evidence in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/catalogo.lisp); the
`:decoded-record` field declares the same representation conversion.
Measured kernels do not change.

The parent subsequently ran BENCH with all default parameters in the
[integrated runner](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/spk08-benchmark.lisp):
40 complete scalar/SWAR samples, five replicates/cell, consistent checksums,
zero consed bytes observed in the loops. The same process then runs the native
module, sequentially. The [report](../../docs/valutazione/risultati-SPK-07-08-2026-10-08.md)
distinguishes the two matrices and the limits of the conclusions.
