<a id="pubblicazione-e-sostituzione-della-cache"></a>

# Cache publication and replacement

This C4 suite extends concurrent reads in the [GET fixture](../get-performance/README.md)
with insertions and replacements in the same partition. Product `src/cache/` remains
reference to verify. Requirements: REQ-CCH-001/002/004, REQ-AFF-002/008, REQ-CON-004.

<a id="metodo-fissato-prima-dellesecuzione"></a>

## Method fixed before execution

One 8192-byte class, one eight-slot set, and at least 32 distinct records force
replacement independently of hash function. V1/v2 frames and CRCs are built with
the independent oracle already used by GET fixture. Keys, values, CSNs, and locations
differ; high words are not always zero. Values have 16 or 4096 bytes.

Each worker owns its destination buffer. Records and waits prepared before launch;
shared inputs remain immutable. Every HIT must match **the entire expected record**
and value, with sentinels before/after authorized range. MISS returns two zero
frontiers; VERIFY-FAILED with only valid records fails test.
BUSY and UNAVAILABLE insertion outcomes are legal but do not prove successful publication.

Deterministic cases check odd sequence, exhausted credit, and disabled slot.
Corrupt copy must be discarded; corrupt input must propagate error before mutating
any cache array. Contention test holds stripe mutex from another thread with bounded
rendezvous: insertion must return BUSY before release. Four-worker tests mix inserts
and lookups over more records than available slots. HITs and evictions must be
explicitly observed; a test consisting only of MISS/BUSY is insufficient.

Every wait/join is bounded. Every serious worker condition returns to controller as
test error; cleanup terminates/joins still-live workers before accessing results.
Inputs rechecked after all joins.

<a id="ambito-delle-conclusioni"></a>

## Scope of conclusions

Deterministic tests verify declared states; stress exercises scheduler-selected
interleavings. Rendezvous start alone proves neither simultaneous execution on cores
nor every internal seqlock window. Suite measures neither speed, allocation, nor
MC/DC, and closes neither C1 qualification, weak memory, nor engine gates.

<a id="risultato-locale-del-2026-10-17"></a>

## Local result of 2026-10-17

**14 cases** passed: eight deterministic, four four-worker scenarios, two controlled
contention tests. Integrated verification compiled without warnings and passed all
product tests, lint, traceability, and links: OK/exit0, STABLE sources,
106.660 seconds for whole command, without attributing that time to cache.

Table counts only mixed worker load; each scenario separately adds worker-zero
initial check.

| Format / value | Attempts | INSERTED | PRESENT | BUSY | HIT | MISS | Evictions |
|---|---:|---:|---:|---:|---:|---:|---:|
| v1 / 16 bytes | 2048 | 1398 | 430 | 220 | 2109 | 1987 | 1398 |
| v2 / 16 bytes | 2048 | 1498 | 325 | 225 | 2138 | 1958 | 1498 |
| v1 / 4096 bytes | 2048 | 1606 | 424 | 18 | 2152 | 1944 | 1606 |
| v2 / 4096 bytes | 2048 | 1466 | 546 | 36 | 2219 | 1877 | 1466 |

UNAVAILABLE was not observed in stress; deterministic cases require it for entirely
disabled slots or no credit. VERIFY-FAILED occurs only in corrupt-copy fault injection,
as expected. In both formats, mutex test returned BUSY before release, followed by
INSERTED and HIT from same worker. Unchanged inputs and disjoint destinations verified
after all joins.

The [test catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-cache-concurrency/catalogo.lisp)
retains command, environment, source fingerprints, logs, and copies of suite's three
files. Collection verifies closed inventory and compressed-record copies without
altering originals.
