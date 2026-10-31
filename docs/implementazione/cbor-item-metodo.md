<a id="primo-item-cbor-minimo--contratto-e-metodo"></a>

# First minimal CBOR item — contract and method

This C1 increment was preregistered on 2026-10-15, before the new corpus,
product, and campaigns. REQ-CBR-008 derives from ADR-0014 and
ADR-0048: bounded structural reading without AST or copies.
Reference: [RFC 8949 §3](https://www.rfc-editor.org/rfc/rfc8949.html#section-3).

<a id="contratto-locale"></a>

## Local contract

```lisp
(leggi-item-cbor-minimo buffer start end space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => exactly NODES, PEAK, NEXT
```

The function verifies the first minimal structural item in window [START,END).
NODES includes tags and root; PEAK counts only arrays/maps; NEXT is
the absolute offset after the item, START<NEXT<=END. Tail [NEXT,END)
is not read, validated, or included in statistics. Examples:
00 FF → 1,0,1; 81 00 1C → 2,1,2; C0 81 00 FF → 3,1,3.
Exact scanners retain the EOF and :cbor-trailing obligation.

MAX-BYTES limits the entire authorized window END-START, including
the tail, not only the first item's bytes. A window larger
than the budget is rejected even if it starts with a valid scalar.
Limits are identical to the scanner: bytes 0..16 MiB, nodes 1..16 MiB, depth 0..100.
The caller restricts END to its own budget before calling.

Simple u8 BUFFER remains immutable and can be shared for reading;
SPACE is private to the call/worker, never shared simultaneously.
The preflight order is unchanged: range, workspace, KINDS alias, byte/node/depth
limits, byte-budget; offset NIL and scratch unchanged.
Reset occurs only after preflight. Empty spans and truncated headers/payloads
produce :cbor-truncated at the authorized END. Syntactic header and
minimality precede context and node/depth budgets; UTF8 returns
the existing absolute offsets. After a runtime error, scratch may be
dirty but is reusable at the next reset. No partial result is returned.

Existing preflight, step, and fixed stack are reused. Drain receives
the current cursor to recognize the completed root without
requiring EOF for the entire window. The result checks root,
counts, and end at the current cursor. There are at most SPAN steps, each with
drain bounded to 102 frames and verified progress. No tag semantics,
map ordering/deduplication, normalization, or deterministic document
profile; no waiting, I/O, threads, or global state in the product.

<a id="corpus-indipendente-e-letture"></a>

## Independent corpus and readings

A separate author freezes tests and oracles before the product.
The corpus includes literal MT0..7 vectors with valid/malformed/nonminimal tails,
tags, UTF8, and containers, plus concatenated scanning to derive boundaries.
It covers full precedence, arity three, buffers/scratch unchanged in preflight,
reuse after error, word/length boundaries, bytes 16 MiB/+1,
nodes and depth 0/100/101, and tag chains. The exact scanner and roundtrip
serve only as additional checks; the writer is not the primary oracle.
Fuzzing uses 1024 cases, with the seed and distribution frozen in the corpus plan.

Two real workers are reused for two waves of 2048 calls each:
8192 reads with a shared read-only buffer and private scratch,
READY/GO/DONE, sink, bounded timeout and cleanup. No inference
of scaling or simultaneous execution on cores. Two C1 readings with a 12-point
checklist and decision inventory precede the first compilation.

<a id="campagne-e-conservazione"></a>

## Campaigns and preservation

Six cold benchmark fixtures have unvalidated tails, five replicates
of 1024 calls, and 64 warmup calls. Checks include all three values and the buffer/scratch,
with a zero baseline and a positive control of 16 × 1 MiB. The local criterion is
zero observed heap allocation, with no speed threshold.

Eight compilable mutants with a single replacement: generic scanning,
drain at physical END, NEXT=END, ignored node budget, ignored depth,
ignored byte-budget, skipped START, and extra arity. The catalog is
materialized before campaigns, with private copies/caches and a full
baseline. Detection requires the exact smoke and the frozen nominal test
in the trace, exit 1, and signal NIL. Warnings, compilefail, helpers,
signals, or faults after completion do not count.

Before push, use frozen drivers, self-tests, raw coverage of only the new source
without exclusions, independent DATA readings, and make check.
Tools use Common Lisp and READ-EVAL NIL/EOF; sources/index/HEAD must remain
stable in recorded commands. Originals and preparations are preserved;
collection uses four workers and a verified closed inventory.
REQ-LIM-001/002 and C1/MC/DC qualification remain open.

