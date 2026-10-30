<a id="decisioni-del-controllore-del-pool"></a>

# Pool-controller decisions

The component is C3 ([ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md));
minimum coverage is 95% of statements and branches across all six files in
[`src/scheduler/`](../../src/scheduler/), including generated accessors.
MC/DC is not inferred from branch coverage. Compound decisions are
listed anyway to facilitate both readings.

| Decision | Conditions, in order | Planned test |
|---|---|---|
| `%pool-range` | fixnum; lower ≤ value ≤ upper | noninteger type, bignum, valid and out-of-range minimum/maximum |
| `%pool-direction` shrink | P99 ≥1200; or queue <1 and CPU ≤300 | degraded P99 with high queue; empty queue with low/high CPU; busy queue with low CPU |
| `%pool-direction` grow | queue ≥queue-high; CPU <700; P99 ≤1000 | inclusive/exclusive thresholds and blocking by each signal |
| reset update | first sample; or gap >2×period | first tick zero/nonzero, gap equal to limit and one tick beyond |

All compared signals are EWMAs scaled by 256. Thresholds are an
explicit initial policy, configurable only for queue pressure;
they are not tuned to database workloads. Individual conditions include
owner, sample interval, target bounds, internal clock, pending,
direction, dwell, and clamp. Fault injection is limited to the two
checked invariants and unexpected private direction.
