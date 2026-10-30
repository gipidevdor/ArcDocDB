<a id="spk-08-crc32c-arm64-con-estensioni-sbcl"></a>

# SPK-08: ARM64 CRC32C with SBCL extensions

Preregistration of 2026-10-23. Question: obtain checksums compatible with product
slicing-by-8 CRC32C through ARM64 instructions generated from Common Lisp, retaining
safety 3 and zero observed hot-path allocations. No foreign library, pinning,
retained SAP, or disabled GC. Spike sources are not promoted into product.

<a id="protocollo"></a>

## Protocol

First verify installed SBCL assembler/backend and retain upstream reference source.
Castagnoli instruction uses CRC32C, not IEEE CRC32. Internal accumulator is not
finalized; public seed/result must preserve product convention (XOR with #xffffffff).
Byte loading must retain active range checks and a valid GC reference, including
unaligned offsets. No native instruction executed without CPU-feature detection.

Correctness: independent bitwise oracle and current software implementation;
standard 123456789 vector; sizes 0..128, 255/256/257, 4095/4096/4097,
65535/65536/65537, offsets 0..15, seeds 0/#xffffffff/#x12345678.
Incremental comparison at every split on small buffers, plus block boundaries on
large ones; unchanged input, excluded out-of-range bytes, invalid-range rejection.
Checks are not replaced by measurements.

Measurements: 16/256/4096/65536 B, five replications, 1024 warmups, 65,536 calls
per replication, one thread. Alternate two-method order per replication,
no calibration/discard. Explicit GC outside window, monotonic timer, global heap
counter, verified sink. Every call result compared to oracle computed before timing.
Positive sensor and null baseline. Retain ticks, allocations, disassembly, failures.
Overall timeout 900 s, window 60 s; unsupported outcomes separate from successes.

0.4–0.6 microsecond target over 4 KiB is an experimental hypothesis.
Complete GET must be remeasured: CRC improvement alone does not prove its cost.
Product integration requires accepted ADR before C1 code, software fallback,
differential/corruption tests, compilation checks, two readings, and full repository
verification.

Primary references: [Arm CRC32C ISA](https://support.arm.com/documentation/100069/0609/A64-General-Instructions/CRC32CB--CRC32CH--CRC32CW--CRC32CX?lang=en),
[SBCL ARM64 backend](https://github.com/sbcl/sbcl/tree/master/src/compiler/arm64).
