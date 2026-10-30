<a id="lettura-delle-stringhe-cbor--contratto-e-metodo"></a>

# Reading CBOR strings — contract and method

C1 increment preregistered on 2026-10-15 before the new product.
REQ-CBR-009 derives from ADR-0014 and ADR-0048. The corpus and driver
are prepared by separate authors and frozen before the kernel.

<a id="contratto"></a>

## Contract

```lisp
(leggi-stringa-cbor-minima buffer start end :max-bytes 16777216)
;; => exactly MAJOR, PAYLOAD-START, NEXT
```

Reads only the first definite-length MT2/3 string with a minimal
header. Returns three fixnums: type and absolute payload range
`[PAYLOAD-START,NEXT)`, without allocating a string or copying bytes.
`START < PAYLOAD-START <= NEXT <= END` holds; an empty payload is allowed.
MT2 accepts arbitrary bytes; MT3 checks UTF-8 with the existing validator's
reasons and absolute offsets, without normalization.

Tail `[NEXT,END)` is not interpreted. MAX-BYTES nevertheless limits the entire
authorized window END-START, including tail and header, as in the
first-item reader. Valid limits are 0..16MiB. For example,
`40 FF` with budget 1 is rejected before reading the empty string.
BUFFER is a stable simple u8 array, shareable read-only;
no scratch, global state, wait, or I/O belongs to the product.

Frozen precedence:

1. Range: INVALID-ARGUMENT, `:cbor-range`, offset NIL.
2. Budget outside type/range: INVALID-ARGUMENT, `:cbor-byte-limit`, NIL.
3. Window over budget: RESOURCE-EXHAUSTED, `:cbor-byte-budget`, NIL.
4. Header and minimality: existing minimal-reader errors.
5. Major other than 2/3: CORRUPTION-DETECTED, `:cbor-string-type`, START.
6. Nonzero HIGH or payload not fully present: `:cbor-truncated`, END.
7. UTF-8 of MT3 payload only, after full-length verification.

A malformed/nonminimal header precedes a wrong major. An incomplete
payload precedes any invalid UTF-8 bytes already available. No
partial result, mutation, or out-of-window access, even on error.
Limits are checked before addition; work bounded by the nine-byte
header and UTF-8 payload within 16MiB. MT2 does not scan
the payload. Span check, minimal reader, and UTF-8 validator are reused.

<a id="verifica-preregistrata"></a>

## Preregistered verification

Independent corpus: literal vectors and arithmetically derived headers,
never the product writer as primary oracle. Includes widths,
lengths 23/24,255/256,65535/65536, byte limits, valid and invalid UTF-8,
nonzero offsets, invalid tails, precedence, arity, and physical immutability.
Two real workers share read-only buffers in two waves, with rendezvous
after the first checked call, timeouts, and cleanup. No inference
of scaling from fixture timings.

Fixture correction of 2026-10-16: the clock must be monotonic,
without strictly positive advancement per wave. START, FIRST, and END
can coincide in the same tick; duration and overlap must be
nonnegative. Rendezvous after the first verified read, exact sinks,
counts, immutability, timeouts, and joins remain fixture checks.
No artificial waits or calls are added to advance the clock.
The [original Linux failure](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-archive-csn-plan/README.md)
and its cause are preserved separately from CSN product checks.

Two C1 readings and an inventory of all decisions precede first
compilation. Functions within 60 lines and ten paths, active invariants,
complete FTYPE, and safety 3. No exclusion from raw coverage of the
new source; SB-COVER is not presented as MC/DC evidence.

Separate driver with cold fixtures, at least 1024 deterministic cases, and
benchmark with warmup, replicates, physical checksum, and three results. Zero
heap is a local observed criterion, without a speed threshold. Single-replacement
mutations: permissive major, skipped UTF-8, NEXT=END,
ignored budget, skipped initial offset, and added arity. Baseline and
mutants in private processes/caches; only nominal tests failed
after successful compilation count, never warnings or tool errors.

Commands recorded with sources/index/HEAD stable. Originals, errors,
tool corrections, and results remain preserved; collection with an
explicit manifest, four workers, and closed-inventory checking.
REQ-LIM-001/002, document profile, and C1/MC/DC qualification remain open.
