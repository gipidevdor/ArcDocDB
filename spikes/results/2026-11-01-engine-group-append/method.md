# Bounded group append integration method

Base: `8a808a3c098cd7766b5aa53013de414fd8998ca1`. SPK-03 distinguishes
append from canonical strong-flush cost; SPK-07 and the existing M1 group
crash matrix supply publication and independent-SEAL boundaries. The preceding
ACTIVE integration leaves 88.5–98.4% of observed write wall time in flush, so
this increment makes no prior throughput promise.

First run a C4 same-code experiment comparing existing per-batch append with
bounded byte concatenation of small groups. Keep each canonical record, CSN,
SEAL, source buffer, flush, and FIFO publication unchanged. Use an exclusive
64 KiB scratch outside timing; single writes and oversized groups retain the
existing path. Verify every final value, returned CSN, complete bytes at append,
flush count and append-entry counts. Compare 128/2,048/60,000-byte values,
widths 1/8, five repetitions of 128 writes with setup/GC outside timing.
Measure append CPU, whole-process CPU and total wall separately; host load and
device state are uncontrolled. A result does not qualify the C4 candidate for
production or establish statistical non-regression.

Only integrate if the small-group append measurement supports removing repeated
I/O calls. Reuse M1's existing exclusive scratch rather than allocate a second
staging arena. Make the generic WAL option explicit and retain its sequential
default. Buffer geometry/aliasing/capacity must be validated before acquiring
the group or changing state; fallback choice must precede I/O. Once append
begins, no fallback/retry of the operation after an unknown outcome. Partial
positive writes retain the existing I/O policy. EINTR, like every syscall
error, faults rather than retries; nonlocal exits retain uncertainty and fault admission.

Before final qualification, model every byte cut through mixed individually
sealed batches, and exercise exact capacity, one-byte-short buffer, single
batch, zero buffer, aliasing, short writes, hard error, nonlocal exit, flush
failure and reused buffers. Re-run the real M1 crash matrix at every prefix,
SEAL, flush and publication boundary for v1/v2 and all primary profiles.
Preserve failed diagnostics verbatim.

Freeze product/test/tool/docs sources before warning-as-error builds/tests on
SBCL 2.6.9 and 2.6.10 and complete `make check`. Then measure ordinary strong
engine and Unix groups serially with byte-identical baseline/after drivers.
Retain source identities, exact append-entry counts, values, CSNs, raw samples
and limits; do not claim zero allocation, power-loss safety, full C1/MC/DC,
Linux qualification or whole-engine throughput from a local experiment.

The first C4 self-test rejects a zero native counter: `native-write` is inlined
into the already compiled I/O path, so replacing its function definition cannot
observe those calls. Retain that failed driver and record. Count the non-inlined
`append-esatto` entry instead; injected writer tests will separately prove actual
call counts and partial completion. Do not label append-entry counts as measured
native syscalls. Check the retained bytes using workspace sizes plus SEAL length,
because the engine deliberately resets each batch's used counter after reuse.

The completed C4 candidate supports integration: append CPU medians for eight
small records fall from 71.56 to 33.94 µs/group (128 bytes) and 69.38 to 30.81
(2,048 bytes), with 8→1 append entries and unchanged strong flush counts. Wall
ratios vary in both directions. Retain the candidate as an experiment on the
base revision; it is not a replacement production implementation.

The final same-code executor comparison selects only the public WAL buffer
option, enabling/disabling M1's existing scratch; it does not replace the
executor. Before collecting final performance samples, extend the candidate's
matrix with 6,144/8,192-byte values on either side of the coalescing boundary:
20 cells, 100 samples, with exact append counts. The independent expected span
is eight times value bytes plus 96 (24-byte frame header, 16-byte key and
56-byte SEAL). Keep the product cap fixed; this is not threshold tuning.
Reuse the preceding ACTIVE campaign's historical engine/Unix/allocation
measurements as baseline only after complete source-identity and byte-identical
driver checks: those final sources are exactly this increment's unchanged base.
This avoids duplicating a fresh baseline without new information. The final
campaign runs all 48 engine and 8 Unix cases serially after qualification,
with its own private output directory; report the historical/paired distinction.

Post-result diagnostic, with no replacement of any original sample: the primary
executor comparison has large CPU variation even in identical single-write
paths (notably the 2,048-byte control). On the same final sources, alternate
the buffer option on one live engine/file, reversing first method by repetition.
Use seven 512-write windows per method for eight-operation groups with
128/2,048/6,144-byte values and a 2,048-byte single-write control: 56 windows,
28,672 strong writes. Reserve 8,192 records and 64 MiB file capacity outside
timing, so every case fits without rotation. Keep full GC before each window,
existing append/flush/CSN/byte/value checks, fresh reopen, and all original
samples. This follow-up reduces between-handle/order drift; it does not prove
isolation from host scheduling, significance or general non-regression.
