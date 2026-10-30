<a id="spk-10--limiti-formati-e-migrazione-v2"></a>

# SPK-10 — V2 limits, formats, and migration

> **Proposed** — Phase-0 experiment recorded before execution.
> Common Lisp/SBCL only, no engine code. Evaluates updated limits from
> [ADR-0048](../../docs/adr/0048-limiti-documentali-e-formato-v2.md).

<a id="domanda"></a>

## Question

Does v2 represent and check effective 16 MiB CBOR documents, 100 container levels,
and binary keys of 1–65,535 bytes? Do arenas and conversion respect explicit
budgets without losing sources or publishing unverified results?

<a id="metodo-e-ambiti"></a>

## Method and scopes

Four independent modules, compiled without warning/style-warning, `safety 3`:

| Module | Question | Method declared before tests |
|---|---|---|
| Codec | lengths, versions, CRCs, and hints | [metodo-codec.md](metodo-codec.md) |
| Index | v2 slots, extended keys, bounded arenas | [metodo-indice.md](metodo-indice.md) |
| CBOR | depth, bytes, nodes, nonrecursive parsing | [metodo-cbor.md](metodo-cbor.md) |
| Migration | file version, EDIT, preservation, repeatability | [metodo-migrazione.md](metodo-migrazione.md) |

Codec uses CRC32C kernel already verified by SPK-09; results remain separate
from v1 results. Other modules declare dependencies and unimplemented parts.
Migration is a **finite model**, not a filesystem converter. Independent checks
do not replace a complete slice with real storage, manifest, snapshots, and fault injection.

Mandatory boundaries: documents 16 MiB/16 MiB+1, depth 100/101,
keys 1/255/256/65,535/65,536, versions v1/v2/unknown, truncation, altered lengths,
and saturated budgets. Methods specify coverage, CBOR subset, fixtures, quantities,
and oracles. No performance number predicted; no engine requirement automatically promoted.

<a id="esecuzione"></a>

## Execution

<a id="metodo-dellintegrazione-registrato-prima-dellesecuzione"></a>

### Integration method, recorded before execution

`core.lisp` connects modules with in-memory fixtures: verified file header →
version-selected parser → ordinary record and two CRCs → CBOR document → hint →
index insertion and lookup. Sixteen positive combinations: maps of 4 bytes/depth 2
and 102 bytes/depth 100, keys 1/255 bytes for v1 and 1/255/256/65,535 for v2;
map of **an actual encoded 16 MiB** with four v2 keys. Maximum document size cannot
fit the v1 u24 record, which includes header and key. High u64 CSN and nonzero offset.

Independent oracles compare version, callback, ranges, CSN, depth, hint metadata,
and fields read from slot. A negative fixture has both CRCs valid but nonminimal
CBOR: codec verifies it and validator must reject. Result exposes cases,
assertions, and maximum record size.

Validator accepts a whole vector: integration explicitly copies value range in
harness only. Maximum fixture uses under 128 MiB simultaneous array payload per
case, excluding garbage, Lisp headers, and runtime. No throughput derived from
these checks. Hint-section CRCs, prepared records, storage, and durable commit excluded.

`run.lisp` resolves all files relative to its path, loads SPK-09 kernel, and compiles
four modules into `out/`. Checks and measurements remain separate.
Runner integrated into serial harness:

```sh
sbcl --dynamic-space-size 4096 --noinform --no-userinit --no-sysinit \
  --script spikes/SPK-10-v2-limits/run.lisp --check
sbcl --dynamic-space-size 4096 --noinform --no-userinit --no-sysinit \
  --script tools/run-spikes.lisp --bench SPK-10
```

Experiments declare live memory, transient allocations, and cooperative budgets;
a time budget neither interrupts syscalls nor guarantees latency.
Explicit errors, one plist on stdout, raw output, and identified sources in harness.

<a id="risultato-e-limiti"></a>

## Result and limits

The first [integrated suite and local campaign](../../docs/valutazione/risultati-2026-10-08.md#spk-10--limiti-v2-e-integrazione)
is complete: 416 codec cases, 614 CBOR cases, eight index groups, 208 crashes and
4,160 recovery interruptions on model, 16 positive and one negative cross-module
combinations. Maximum 16,842,775-byte record built, verified, and represented in slot.
Separate check/measurement reports, with sources identified before/after.
Full gate remains open.
On-demand-stack CBOR variant passes 629 cases (614 previous and 15 new) and has two
separate benchmarks, retaining the slower measurement too. ADR-0049's beyond-RAM
path remains a separate proposal: this experiment does not implement it.
Before engine, weak memory, missing models, I/O and interrupted real conversion,
complete decoder, and Linux reference-platform campaign are also required.

Related requirements: REQ-LIM-001, REQ-LIM-002, REQ-LIM-003,
REQ-IDX-007, REQ-FOR-002, REQ-AFF-007, REQ-AFF-008, REQ-AFF-019,
REQ-VAL-001. Experimental modules change neither identifiers nor sources.
