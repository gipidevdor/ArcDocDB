<a id="primo-item-cbor-minimo--contratto-e-metodo"></a>

# First minimal CBOR item — contract and method

C1 increment preregistered on 2026-10-15, before the new corpus,
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

Verifies the first minimal structural item in window [START,END).
NODES includes tags and root; PEAK counts only arrays/maps; NEXT is
the absolute offset after the item, START<NEXT<=END. Tail [NEXT,END)
is not read, validated, or included in statistics. Examples:
00 FF → 1,0,1; 81 00 1C → 2,1,2; C0 81 00 FF → 3,1,3.
Exact scanners retain the EOF and :cbor-trailing obligation.

MAX-BYTES limits the entire authorized window END-START, including
the tail, not only the first item's bytes. A window larger
than the budget is rejected even if it starts with a valid scalar.
Limits identical to the scanner: bytes0..16MiB, nodes1..16MiB, depth0..100.
The caller restricts END to its own budget before calling.

Simple u8 BUFFER remains immutable and can be shared for reading;
SPACE is private to the call/worker, never shared simultaneously.
Preflight order unchanged: range, workspace, KINDS alias, byte/node/depth
limits, byte-budget; offset NIL and scratch unchanged.
Reset only after preflight. Empty spans and truncated headers/payloads
produce :cbor-truncated at the authorized END. Syntactic header and
minimality precede context and node/depth budgets; UTF8 returns
the existing absolute offsets. After a runtime error, scratch may be
dirty but is reusable at the next reset. No partial result.

Existing preflight, step, and fixed stack are reused. Drain receives
the current cursor to recognize the completed root without
requiring EOF for the entire window. The result checks root,
counts, and end at the current cursor. At most SPAN steps, each with
drain bounded to102frames; verified progress. No tag semantics,
map ordering/deduplication, normalization, or deterministic document
profile; no waiting, I/O, threads, or global state in the product.

<a id="corpus-indipendente-e-letture"></a>

## Independent corpus and readings

A separate author freezes tests and oracles before the product.
Literal MT0..7 vectors with valid/malformed/nonminimal tails,
tags, UTF8, and containers; concatenated scanning to derive boundaries.
Full precedence, arity three, buffers/scratch unchanged in preflight,
reuse after error, word/length boundaries, bytes16MiB/+1,
nodes and depth0/100/101, tag chains. Exact scanner and roundtrip
only as additional checks; no writer as the primary oracle.
Fuzz1024 with seed and distribution frozen in the corpus plan.

Two real workers reused, two waves of2048 calls each:
8192 reads with a shared read-only buffer and private scratch,
READY/GO/DONE, sink, bounded timeout and cleanup. No inference
of scaling or simultaneous execution on cores. Two C1 readings with a 12-point
checklist and decision inventory precede first compilation.

<a id="campagne-e-conservazione"></a>

## Campaigns and preservation

Six cold benchmark fixtures with unvalidated tails, five replicates
of1024 calls and warmup64. All three values and buffer/scratch
in the check; zero baseline and positive16x1MiB. Local criterion:
zero observed heap, no speed threshold.

Eight compilable mutants with a single replacement: generic scanning,
drain at physical END, NEXT=END, ignored node budget, ignored depth,
ignored byte-budget, skipped START, and extra arity. Catalog
materialized before campaigns, private copies/caches, and full
baseline. Detection only with exact smoke and the frozen nominal test
in the trace, exit1 and signal NIL. Warnings, compilefail, helpers,
signals, or faults after completion do not count.

Frozen drivers, self-tests, raw coverage of only the new source
without exclusions, independent DATA readings, and make check before
push. Common Lisp tools, READ-EVAL NIL/EOF; sources/index/HEAD
stable in recorded commands. Originals and preparations preserved;
collection with four workers and a verified closed inventory.
REQ-LIM-001/002 and C1/MC/DC qualification remain open.

