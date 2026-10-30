<a id="spk-08-confronto-crc32c-a-blocchi-di-16-e-32-byte"></a>

# SPK-08: CRC32C comparison with 16- and 32-byte blocks

Preregistration of 2026-10-23, before new measurements. Follows
[ADR-0059](../../docs/adr/0059-crc32c-arm64-sbcl.md) and
[ADR-0060](../../docs/adr/0060-crc32c-caricamento-portabile.md).
Current 16 B implementation remains product reference.
Software slicing-by-8 and independent bitwise oracle remain separate.

<a id="varianti-e-criterio"></a>

## Variants and criterion

Compare software, product 16 B kernel, 32 B variant with byte tail, and 32 B
variant with 4 B CRC32CW / 1 B CRC32CB tail. One CRC chain; no PMULL, pinning,
disabled GC, or lowered safety 3. Variants use product CX/CB VOPs; only CW is new
and remains in spike. SIMD loads retain bounds checks. Neither infer M4 ceiling
nor attribute all residual cost to loop from one throughput measurement.

Prefer simplest kernel already below 1 µs on 4112 B body.
Consider promoting 32 B only if it reduces median 4112 B CRC by at least 15%,
without regressions above 5% at 64/256 B in both measured offsets, and remains
short and verifiable. Before promotion, complete GET must show repeatable benefit:
at least 5% in median path without oracle, no integrity/heap regressions.
Otherwise retain results and current product.

<a id="correttezza-e-disponibilità"></a>

## Correctness and availability

Every variant must produce `E3069283` for ASCII `123456789`, independently of
software. Also compare bitwise/software over lengths 0..128, 255/256/257,
4095/4096/4097, 4111/4112/4113, 65535/65536/65537; offsets 0..31,
zero/maximum/arbitrary seeds, all small splits and 4/16/32 boundaries on large
buffers. Verify immutability, corruption, exclusion of out-of-range bytes,
and invalid-range rejection. Public checksum retains seed/finalization.
Disassembly retained, no warnings allowed.

Run only if product backend is actually qualified ARM64 CRC32C and selected
at runtime; otherwise `:unsupported` without loading new VOP or native instructions.
Unqualified Cortex/emulators remain on software. No engine/ISA support extension.

<a id="finestre-crc"></a>

## CRC windows

Sizes 16/64/256/4096/4112/65536 B; offsets 0 and 24, latter matching record-frame
body. Five replications, four-method order rotated per replication and reversed
on odd replications: 240 windows. Calls per window: 1,048,576 through 256 B,
262,144 through 4112 B, 65,536 at 65536 B; 1024 warmups.
One thread, no concurrent campaigns. Wall/CPU timers, global heap counter,
checked completions/sink; oracle computed before timing. Full GC and persistence
outside window. 4 MiB positive sensor and empty baseline; no subtraction/discard.
Timeout 60 s/window, 900 s/process, report saved on failure too.
Retain five samples and medians of window means, not P99.

<a id="get-completo"></a>

## Complete GET

Rerun unchanged [GET A/B](../../tools/get-throughput-bench.lisp) driver:
16/256/4096 B, cache hit/warm segment/absent, CSN 7/maximum u64,
five replications, `:exact`/`:throughput` paths, software/selected.
Oracle stays in `:exact` timing; throughput checks all keys before/after windows.
If candidate passes CRC filter, measure as selected through private C4 binding in
a separate campaign, without product changes. Kernel comparison uses same driver.

Primary CW source: [Arm ISA, CRC32C](https://documentation-service.arm.com/static/67e40f3398aa3c3b6eea6a85)
(CW: sf=0, sz=10; base opcode `#x1ac05800`). No M4 latency/bandwidth estimate
assumed to be a measurement of local CPU.

<a id="precisazione-prima-della-seconda-campagna"></a>

## Clarification before second campaign

First complete campaign retained. Reading code before deriving medians finds
C4 variants check ranges but omit product's two explicit assertions (precondition
and tail). Second campaign adds those assertions to variants: same criteria,
matrix, order, counters. This is the comparison basis for possible promotion;
first source and all its numbers remain separate. No check removed to improve result.
