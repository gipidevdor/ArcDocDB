<a id="lettura-c4-dei-driver-della-struttura-cbor"></a>

# C4 reading of CBOR structure drivers

Coordinator reading of frozen drivers before campaigns. The
coordinator wrote neither kernel, tests, nor drivers. Static outcome: no
open defect; mutant compilability and measurements remain to be acquired.

The benchmark has six fixtures, five replicates of 32 calls, and warmup128.
Every call compares nodes, depth, and end with three independent constants
and calculates nodes + 65536·depth + 16777216·next. Tokens rechecked using only
arithmetic: 184549377, 549839699969, 1717829732, 386007052, 68803432449,
68769812481. Expected sum N·token + N(N−1)/2, modulo most-positive-fixnum;
even the maximum cell ×32 remains an SBCL64 fixnum. Input, copies, closures, space,
warmup, GC, and report precede or follow the measured section. Cost includes
comparisons and sink. Zero baseline and 16 live allocations of 1MiB are required;
a zero tick produces rate NIL, not invented throughput.

The mutator acquires every ASDF file actually copied, uses exclusive mkdir
and separate caches for baseline and mutants. Ten anchors are unique
in the frozen kernel: node/depth budgets, header/payload spans, trailing,
map parity, tagged-child consumption, chunk major/UTF8, and map arity. This is not
an exhaustive search for every possible defect. Baseline requires exit0,
smoke, and completion on exact lines. A backtrace quote, indented
prefix, or suffix is insufficient. Failed compilation is INVALID; exit0 without
completion is INVALID even for a mutant. After real smoke, a runtime
error is DETECTED; relevance of each error must be read in logs.

Tools record identity before/after, save a report even on
failure, and preserve logs/copies of INVALID outcomes. The coordinator's
runner assigns new directories and keeps measurements serial, outside
coverage and mutations. No speed threshold or scaling claim.

| File | Git blob read |
|---|---|
| tools/cbor-structure-bench.lisp | `a0a676c0107dee9429f27d3fdcdc78bb3d7f2957` |
| tools/cbor-structure-mutation.lisp | `dd6e9fb1f3655b78eb64285bee0de35474e12eba` |

Coverage and collector reading is separately attributed in the C4
tool report. No reading amounts to human approval or qualification
of the CBOR semantic profile or complete engine.
