<a id="scrittura-dei-float-cbor--contratto-e-metodo"></a>

# Writing CBOR floats — contract and method

C1 increment preregistered on 2026-10-13, before the new corpus,
product, and campaigns. REQ-CBR-004 derives from ADR-0014;
ADR-0048 keeps the document budget at the higher level.

<a id="contratto-locale"></a>

## Local contract

```lisp
(scrivi-float-cbor-minimo buffer start end ai high low)
;; => exactly NEXT
```

Exclusive simple u8 BUFFER; START/END indices delimit a half-open
span, valid even when empty. AI 25/26/27 describes IEEE binary16/32/64 bits;
HIGH/LOW u32 are raw words. HIGH must be zero for AI25/26;
LOW must be u16 for AI25. These are not native Common Lisp floats.

All IEEE encodings are accepted, including those that can be shortened.
The shortest exact width is selected, including going from 64 to 32 and 16:
no rounding, u64 reconstruction, AST, or application conversion.
Sign, zero, infinity, and the right-padded NaN significand are
preserved, including signaling/quiet. This is the local preference of the
[current contract](cbor-minimo-metodo.md), consistent with
[RFC 8949 §4.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.1).
Document profile, application equivalences, and NaN normalization
remain at higher levels; whole-document determinism is not established.

Output: F9/FA/FB, big-endian words, 3/5/9 bytes. NEXT=START+size;
only [START,NEXT) changes, with the span remainder and physical tail
unchanged. At most nine bytes, immediate variables, no shared write,
wait, I/O, or durable/atomic publication.

Preflight: range (:cbor-range), AI (:cbor-float-ai), HIGH
(:cbor-float-high), LOW (:cbor-float-low), word consistency
(:cbor-float-words), selected-form capacity (:cbor-float-capacity).
The first five signal INVALID-ARGUMENT, the last RESOURCE-EXHAUSTED;
offset NIL and the entire physical array intact. END is the limit, not the physical
tail. Internal invariant errors have no rollback: the owner applies fail-stop.
The new exact raw conversions are the increment's main risk.

<a id="corpus-congelato-prima-del-prodotto"></a>

## Corpus frozen before the product

A separate author prepares the corpus without reading the new sources,
then reports its hashes. Only then is the product written;
build and campaigns follow two static C1 readings.

Cold integer/rational arithmetic oracle, independent of product
helpers. Literal bytes for 1.5 at all three widths, zero with both
signs, infinity, finite only32/only64 values, and NaNs. All 65,536 binary16 values and
exact32/64 expansions; normal/subnormal thresholds, neighbors, and aligned/unaligned
NaN payloads. Multiple offsets, exact/residual capacity and
every insufficient capacity, types/ranges, error precedence, non-simple/displaced
destinations, exact arity, sentinels, reuse, and concatenation.
Fuzz 2,048 cases seed464C5434 and frozen counts. Decoder and scanner are
only supplementary checks after the cold byte comparison.

Two real workers reused, two waves of 8,192 calls per worker,
private destinations and immutable plans: 32,768 writes. Separate READY/GO/DONE
for each wave, sink and full buffer verified, bounded timeout/join/cleanup.
Observed intervals without inference of scaling or simultaneous execution
on cores. Parallelism between independent calls.

<a id="misure-difetti-e-conservazione"></a>

## Measurements, defects, and preservation

Separate serial benchmark: six fixtures frozen before the product,
including reduction64→16,64→32,64 retained, subnormal, and NaN.
Five replicates ×4,096 calls, warmup128; NEXT and all bytes in the sink,
exact cold arity. Zero baseline, positive control16×1MiB; local criterion
of zero observed heap, without a speed threshold or absolute proof.

Eight compilable, unique mutations: omitted reduction32; omitted reduction64;
lost sign16; wrong normal16 fraction; wrong subnormal32;
physical capacity; wrong float lead; extra arity. Catalog frozen before
the campaign, private copies/caches, full baseline, exact smoke/final markers.
Compilation failures, signals, and worker faults do not count as detection;
the order and origin of runtime rejection are checked in the complete logs.

Raw coverage of only the new sources, full compound-decision
inventory, without excluding guards/declarations or establishing
MC/DC. Two C1 readings with a 12-point checklist, driver self-tests, independent
readings of data, full make check before push.

Common Lisp tools (INV-X3), READ-EVAL NIL and EOF for data;
sources, index, and HEAD stable during every recorded command.
Sources, stdout/stderr, mutant copies, failures, measurements, and coverage
preserved with hashes and verified copies. No promotion of the C1 gate
or whole engine from these local tests.
