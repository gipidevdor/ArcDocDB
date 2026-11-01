# Offline comparison optimization: registered method

Base `2acefea` (product identical to `8d4349a`). Scope: the exact byte comparison
used by backup, restore readback and source/backup comparison. No change to WAL,
source locking, file reads, EOF handling, CRC authority, publication or cleanup.

Replace only the per-byte inner LOOP with Common Lisp MISMATCH on the two typed
octet buffers, explicitly bounded by the actual chunk count. Keep safety 3,
existing ftype, exact short-read checks, sequential bounded I/O and two buffers.
No new dependency, FFI or architecture-specific application code.

Before editing the product, run the source-eligible driver
`spikes/backup-compare-bench.lisp --self-test` and its native-read benchmark.
Its scalar reference copies the original function body, with the same declaration
and optimization policy. Before optimization both measured variants are scalar;
this control exposes compiler/host variation. Preserve the original product file.

After the change rerun the same immutable driver and retain every observation.
Native fixture: two identical files, 16 MiB + 37 bytes each; buffers 4 KiB, 64 KiB
and 1 MiB. Warm both variants; five ABBA rounds, eight complete comparisons per
window. Record useful bytes (one file), read bytes (twice useful), wall/CPU time
and managed allocation. Compare medians, retain individual windows and reverse
the starting order in a repeat if the first results warrant a performance claim.
No threshold is substituted for an observed result. No filesystem-cache eviction,
NVMe, whole-backup throughput or other-chat benchmark inference is intended.

Independent correctness oracle: EQUALP over fixture images. Test empty, one-byte,
word-edge, exact chunk and partial chunk lengths, differences at the beginning,
word/chunk edges and end, plus deliberately unequal stale buffer suffixes.
Add permanent native-file regressions at those boundaries and short reads;
rerun all backup and verifier cases, including actual SIGKILL and fault injection.
Compile without warnings and run lint/trace/links/evidence. Two static readings
cover the changed bounds/return value and the unchanged I/O/error boundary.

Only retain the optimization if exact semantics remain and measurements show a
repeatable benefit. This is local scoped evidence, not C1/MC/DC, physical power
loss, zero allocation for the whole database, or a product performance target.

## Amendment after the first candidate

Both `MISMATCH` runs are slower (roughly 0.09..0.11 times scalar throughput).
That candidate is rejected. The next candidate uses standard `EQUALP` on complete
buffers, with the original scalar loop on a final short prefix. Prepared jobs
own equal-length simple octet vectors, whose numeric element equality is exact.
There is no slice allocation, unchecked raw access, SBCL private API or new FFI.
The added full/partial decision is exercised by native known-content regressions.
The same benchmark driver and pinned scalar body remain unchanged across runs.
