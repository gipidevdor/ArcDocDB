# Preregistered serial M1 group integration

One ordinary frame, independent CSN and SEAL per operation; at most eight
operations in one physical flush. No group transaction or weaker durability.
Cumulative resident membership/live peaks/arena use/revision/slot credits, delta
membership and worst-case paged append bounds precede data CSNs. Only complete
already-ready Unix commands are collected in slot order; reads/rejections drain
prior writes, expired requests are removed before admission. There is no timer
waiting to fill a group. Only a known pre-admission group refusal may split into
individual admissions; an admitted fault never retries.

SPK-03 motivates amortizing strong flush, SPK-07 motivates independent sealed
prefixes/FIFO publication. The independent finite reservation model enumerates
6,561 initial EMPTY/DELETED/LIVE layouts over two four-slot probe groups and
2,624,400 two-operation sequences, plus a damaged-credit negative control. This
checks the free-prefix selection argument at reduced geometry; it is not a
proof for the complete product or a weak-memory concurrency claim.

The native SIGKILL matrix crosses both formats, legacy/automatic RAM/paged
storage, and six stages: token preparation, three complete appends, a fourth
partial SEAL, completed flush, three memory publications, and completed commit
before response. Each scenario has a kill/recovery/second-kill/third-opening
cycle and exact independent value/CSN checks. 36 scenarios, 108 child lifetimes,
72 deliberate kills per full suite; SIGKILL is not physical power loss.

After frozen warning-as-error qualification on SBCL 2.6.9 and 2.6.10 and the full
spike correctness suite, benchmark serially on 2.6.10/macOS ARM64: identical
strong writes with group sizes 1/2/4/8, both formats, three primary profiles and
2,048/60,000-byte values. Each configuration has five 128-operation repetitions,
eight hot keys, no live rotation inside timed windows, exact CSNs/results and
counted strong flushes. Group size 1 uses the existing single-write API. Report
throughput, API-call latency samples, per-operation amortization and allocations
without calling group-call latency individual request latency. Startup/recovery,
GC and reporting are outside timed intervals. A follow-up Unix campaign uses
independent simultaneous clients and compares the same-turn collector at limits
1 and 8 on the same final code. No loaded tail, RSS or device qualification is
inferred from local results. Preserve all failures and raw bytes losslessly.
