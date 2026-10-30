<a id="adr-0032--seqlock-a-64-bit-con-tentativi-limitati-e-ripiego-sul-writer"></a>

# ADR-0032 — 64-bit seqlock with bounded retries and writer fallback

- **Status:** Accepted; **item 2 (slot layout) superseded by [ADR-0043](0043-primary-index-a-frammenti.md)**: four-word slots; when the counter reaches its threshold, the fragment is rebuilt instead of stopping the Serie. Protocol, 64 bits, and bounded retries remain.
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; **partly supersedes**
  [ADR-0015](0015-primary-index-swiss-table-swmr.md) (seqlock details and slot
  layout). The rest of ADR-0015 remains valid.
- **References:** [architecture](../architettura.md#primary-index), INV-I1, INV-A8

<a id="contesto"></a>

## Context

[ADR-0015](0015-primary-index-swiss-table-swmr.md) used an 8-bit seqlock counter,
justified as follows: a false “equal” would require 256 writes to the same slot during
an approximately 100 ns read. This is an argument about **relative thread speed**, not a
guarantee: a reader suspended midway through a read (preemption, GC pause, operating
system scheduler) can observe 256 writes and see the same counter with inconsistent fields.
In a critical system, correctness cannot depend on timing (ADR-0031, priority 2).

An unbounded retry loop is also prohibited (INV-A8): a writer continually modifying
the same slot would starve a reader.

<a id="decisione"></a>

## Decision

1. **64-bit counter per slot**, in an `(unsigned-byte 64)` array parallel to the others.
   Each write increments it twice. Returning to an already observed value would require 2⁶³
   changes to the same slot: over 290 years at 10⁹ changes per second. This assumption is
   declared and checked by a guard that makes exceeding 2⁶² fatal (fail-stop)
   (ADR-0033).
2. **Slot: six 64-bit words + one control byte = 49 bytes**; at a 7/8 load factor,
   approximately **56 bytes per entry**. The CSN returns to a full 64 bits.

   | Word | Contents |
   |---|---|
   | 0 | key hash64 |
   | 1 | key-off (40 bits) · key-len (8) · type (8) · flags (8) |
   | 2 | segment-id (32) · offset (32) |
   | 3 | length (24) · version (40) |
   | 4 | csn (64) |
   | 5 | seqlock counter (64) |

3. **Protocol.** Writer: `s ← seq`; `seq ← s+1` (odd); write barrier; write
   fields; write barrier; `seq ← s+2`. Reader: `s1 ← seq`; if odd, retry;
   read barrier; read fields; read barrier; `s2 ← seq`; if
   `s1 ≠ s2`, retry. Barriers use `sb-thread:barrier`.
4. **Bounded retries: at most 8.** When exhausted, the reader forwards the read to the
   **Serie's logical writer** as a serialized request: always consistent by construction,
   never unbounded. This rare case is tracked by a metric (`seqlock-fallback`).
5. The **key arena** is append-only and immutable after publication: published with a write
   barrier followed by the slot update; no seqlock is needed. The
   **retained-version table** uses the protocol from item 3.
6. **Verification.** (a) The protocol is a model explored exhaustively (1 writer, 2
   readers, 2 slots, every interleaving, every suspension) in SPK-07. (b) Stress test with a writer
   writing self-consistent patterns (all fields derived from one value) and readers
   checking consistency, with artificial suspensions through the injectable scheduler
   ([ADR-0035](0035-strategia-di-verifica-e-tracciabilita.md)).

Pattern: seqlock (Linux kernel) with a full-width counter; optimistic read with
blocking fallback (Linux `seqlock_t` SeqLock, Folly SeqLock).

<a id="conseguenze"></a>

## Consequences

- +8 bytes per entry (48 → 56 B): [limits](../limiti.md) and [estimates](../valutazione/stime-ordine-di-grandezza.md)
  updated.
- No correctness argument depends on timing.
- No unbounded loop on the read path.

<a id="alternative-considerate"></a>

## Alternatives considered

- *8- or 16-bit counter:* probabilistic correctness; rejected.
- *Reader/writer lock per slot or table:* contention between readers and writers on the
  hot path.
- *A new entry copy on every change (RCU per entry):* one object per entry, against
  ADR-0024.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-02 (performance portion, SPK-01).
- Revisit if: the frequency of `seqlock-fallback` is significant under load (SPK-01).
