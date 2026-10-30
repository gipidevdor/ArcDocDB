<a id="integrazione-crc32c-sulle-piattaforme"></a>

# CRC32C integration across platforms

[ADR-0060](../adr/0060-crc32c-caricamento-portabile.md) clarifies the
[measured backend](crc32c-arm64.md). No database-format change.

| Environment | Automatic backend | Performance qualification |
|---|---|---|
| macOS ARM64, SBCL 2.6.9, OS CRC and NEON present | ARM64 CRC32C | Local M4: 4 KiB cache-hit GET 1.684 µs, software 6.758 µs |
| Same environment with missing CRC/NEON or failed probing | Lisp slicing-by-8 | Correctness fallback |
| Linux x86-64, reference platform | Lisp slicing-by-8 | No hardware measurement transferred from M4 |
| Linux ARM64, macOS x86-64, other SBCL versions | Lisp slicing-by-8 | No acceleration enabled without qualification |

Checksum portability does not extend POSIX-engine support to
Windows or other systems. Existing CI covers Linux x86-64 and macOS ARM64.
Performance results are medians of hot-data windows, not P99.

<a id="bootstrap-e-rollback"></a>

## Bootstrap and rollback

ASDF and CI measurement loader share `src/io/cpu-build.lisp`.
Only the qualified combination requires SB-SIMD and reads VOP
definitions or NEON references. Subsequent kernel choice requires
OS/CPU confirmation. Public function `backend-crc32c` reports outcome.
Both native ASDF components also have `:if-feature`: fallback does not
load old cached ARM FASLs. Comparing three fresh processes
without `:force` checks native → software → native on the same
compilation cache.

To force software, before loading ASDF/product in a fresh process:

```lisp
(pushnew :arcdocdb-crc32c-software *features*)
```

Feature changes neither format, data, nor API. Avoid reloading during
service: selection and compilation features belong to startup.

<a id="metodo-di-verifica-prima-delle-prove"></a>

## Verification method, before tests

Three new tests (foundations: 34) exercise every compiler condition,
unknown versions, Linux x86/ARM, macOS Intel, Windows, explicit disablement,
obsolete native features, OS responses, and all eight backend selections.
Compiler MC/DC table is the positive case with each of five
features individually removed, different version, and added disablement.
For OS report: `(0 4 1)` versus `(-1 4 1)`, `(0 8 1)`, `(0 4 0)`;
for selection: all combinations of three booleans. These test pure
decisions; they do not simulate ABI or execution on another OS kernel.

Two fresh processes run strict build and full suites, one normal
and one forced software. In the second, ARM kernel and emitter must
not be defined, nor SB-SIMD required by ArcDocDB. A separate reader test
loads foundations without SIMD packages on synthetic feature combinations:
checks dependency isolation, not equivalent to executing Linux/x86.
Full `make check` remains mandatory. Earlier benchmarks retain
their sources; regression checked with unchanged A/B driver.

Two author readings: dependencies/features and fallback, then ABI/decisions,
seed/range/incremental contracts and immutable kernel during service.
No implicit independent review or overall C1 qualification.

<a id="risultati-dellintegrazione"></a>

## Integration results

Global check equivalent to `make check` (recorded `check-core`)
passed with exit 0 and stable sources: build and suites, lint, traceability
(137 requirements, 71 invariants, 60 ADRs), links, full text, test tools,
audit of 316 catalogs, eleven spikes, and CI self-tests. Strict forced-software
build also passed with all suites and no warnings.
Three ASDF processes without `:force` and reader isolation passed.

Unchanged A/B campaign confirms result on Apple M4/SBCL 2.6.9:
4 KiB cache-hit GET, CSN 7, **1.664 µs hardware versus 6.752 µs software**;
hot segment: 2.377 versus 7.484 µs. Medians of five windows;
360 performance windows, 14.4 million GETs, all complete with
zero heap delta. The 72 bounded windows precede measurement. Driver,
fixtures, and scope follow previous method; no P99.

The [previous CI run](https://github.com/gpicchiarelli/ArcDocDB/actions/runs/39998228176)
failed on Linux while loading child tests due to warning
`reading an ignored variable: STREAM`. Correction `ignore` → `ignorable`
is included and checked by local strict build. This observation of the
previous run is not a CI outcome for the new revision.

[Integration sources, tests, and raw results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-crc32c-platforms/catalogo.lisp).
Appendices and concluding links are metadata added after global
verification; executable code does not change after that check.
