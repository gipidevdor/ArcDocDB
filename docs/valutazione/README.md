<a id="valutazione"></a>

# Evaluation

[Documentation](../README.md) · [Implementation](../implementazione/README.md)

Every result applies to the stated command, data, machine and scope.
A microbenchmark or component test does not qualify the complete engine.

<a id="leggere-le-prove"></a>
## Reading the evidence

| To | Reference |
|---|---|
| Browse selected recent campaigns | [Results](../../spikes/results/README.md) |
| Repeat the experiments | [Spikes](../../spikes/README.md) and [plan](piano-spike.md) |
| Preserve or verify evidence | [Evidence register](registro-delle-prove.md) and [historical archive](../../spikes/evidence/README.md) |
| Assess risks and costs | [Risk register](registro-rischi.md), [critical analysis](analisi-critica.md), [estimates](stime-ordine-di-grandezza.md) |
| Understand the first application | [NNTP use case](caso-duso-nntp.md) |

<a id="stato-della-verifica"></a>
## Verification status

M1 composes startup, recovery and the Unix service. Its tests and limits are
described in the [implementation guide](../implementazione/README.md).
Whole-engine performance, sustained load, scales beyond RAM and release gates
require their respective campaigns.

The [benchmark rules](../13-benchmark.md) distinguish measurements, targets and estimates.
The [evaluation history](cronologia.md) retains the initial assessments,
counterexamples and dated campaigns without presenting them as the current status.
