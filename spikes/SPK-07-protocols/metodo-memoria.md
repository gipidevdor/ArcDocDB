<a id="spk-07--ordini-di-osservazione-e-barriere"></a>

# SPK-07 — Observation orders and barriers

> **Proposed** — Common Lisp model recorded before execution, `safety 3`.
> References: REQ-IDX-003, REQ-AFF-017,
> [ADR-0032](../../docs/adr/0032-seqlock-a-64-bit.md).

<a id="domanda-e-metodo"></a>

## Question and method

Do two writer barriers and two reader barriers in seqlock prevent accepting fields
from a generation different from the counter read?

One writer, one reader, nonwrapping counter, two fields. Enumerate orders of eight
events: four writes **observed by reader**, four reads. Reads see last observed
write at that position; odd counter precedes even counter. Barriers add precedence
edges: odd → fields → even; first counter read → fields → second read.
Fields may be observed in either order relative to each other.

Model admits reordering when one edge removed: four mutants, one per barrier.
Oracle compares **both fields with accepted counter's generation**, not merely
field-to-field consistency. Every mutant must produce witness order; complete
model must have zero violations. Ceiling 8! orders per configuration, 5 configurations.
Result retains counts and deterministic witnesses.

Barrier contract and forms in body preceding barrier come from
[SBCL 2.6.9 manual, §13.7](https://www.sbcl.org/manual/#Barriers), consulted 2026-10-08.
Model is an **abstraction** of that contract, not full ARM64/x86-64 memory-model implementation.

<a id="controllo-del-compilatore-e-limiti"></a>

## Compiler check and limits

Two small `safety 3` u64-array kernels use real primitives. Check compares response,
retains local-runtime disassembly, without inferring hardware correctness from
instruction presence alone.

Excluded: two readers/two slots, tearing, memory reuse, GC effects, other compilers,
multiple observers and nonatomic propagation between them, complete architectural
semantics, Linux x86-64 tests. No throughput or thread-duration-dependent guarantee.
Gate's required hardware coverage remains open.

<a id="risultato-locale-del-2026-10-08"></a>

## Local result of 2026-10-08

Apple M4, macOS ARM64, SBCL 2.6.9. Recorded command:

```bash
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script \
  spikes/SPK-07-protocols/run-module.lisp memoria
```

| Variant | Complete orders | Accepted reads | Violations |
|---|---:|---:|---:|
| Four barriers | 280 | 8 | 0 |
| Without initial writer barrier | 840 | 96 | 54 |
| Without final writer barrier | 840 | 96 | 54 |
| Without initial reader barrier | 840 | 96 | 54 |
| Without final reader barrier | 840 | 96 | 54 |

The [structured record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-memoria-check.lisp)
retains command, source hashes, environment, original stdout, witnesses.
Retained disassembly compiles kernel barriers to `DMB ISHST` for writes and
`DMB ISHLD` for reads. Result proves neither concurrent-engine correctness nor
absence of reorderings excluded by model.
