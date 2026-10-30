<a id="ricostruzione-verificata-dei-frammenti-v2"></a>

# Verified rebuilding of v2 fragments

<a id="contratto"></a>

## Contract

`arcdocdb.index.primary:ricostruisci-frammento-indice` completes builder
for [primary-index](indice-primario.md) rebuild and split.
References: ADR-0015, ADR-0032, ADR-0043, ADR-0048, and ADR-0050.
C1 requirements: REQ-IDX-001, REQ-IDX-003, REQ-IDX-005, REQ-IDX-007,
REQ-LIM-003, REQ-AFF-004, REQ-AFF-008. Invariants INV-I3, INV-A8, and INV-P6.

Writer retains exclusive Serie token throughout call.
Source and root stay current and writable until subsequent
`pubblica-directory-indice`. Result is private single-use plan.
Publication uses existing protocol: frozen source, barrier,
root CAS, no restart of retired fragments.

```lisp
(ricostruisci-frammento-indice index source highs lows budget
                             :split-p nil)
;; => plan, source-capacity, copied-key-bytes,
;;    new-directory-references, transient-payload
```

`highs` and `lows` are specialized arrays of C u32 words each, private and
unchanged during call, indexed by **original slot**.
Trusted caller calculates digest with Serie's function and seed.
Free-slot elements ignored. Builder checks each
live key's prefix, fingerprint, and lookup to original slot.
High bits not yet distinguished by directory cannot be derived
from payload: digest consistency and seed management remain caller obligations.
This check does not replace a product hash function.

`calcola-digests-frammento` now produces both maps from physical slots
through [XXH64 and immutable index seed](hash-chiavi.md), checking
complete seed pair before writes and original lookup
for every key. Restart seed management remains controller's responsibility.

<a id="tre-fasi-prima-della-pubblicazione"></a>

## Three phases before publication

1. C-slot scan: Swiss control, stable payload, key range
   within used bytes, original lookup, live count, and required bytes
   for each candidate.
2. Budget and credit preflight; allocate one or two BUILDING
   fragments with arena exactly sufficient for live keys, at least one
   byte in empty candidate; second scan for copying.
3. Third scan: every source key looked up bytewise in destination,
   comparing CSN, location, record length,
   validity end, and key metadata except local arena offset.
   Only then prepare new directory.

Comparison of all keys precedes plan: equal live count
alone insufficient. Removing deleted-key bytes makes
rebuild an arena compaction. Split follows next bit
of digest high half; remaining fragments stay shared.

<a id="budget-interruzioni-e-costi"></a>

## Budgets, interruptions, and costs

Preflight includes current-root payload, new banks/controls/
arenas, and new directory. Also checks individual fragment budgets,
depth, directory size, generation, and revision credit
for all copies and subsequent publication, without wrapping.
Input/budget rejection precedes candidate construction and does not
change revision, root, or source state.

Controller must reserve memory and time before call and
separately account for digests, three fixed five-u64 buffers,
runtime structures, previous roots, garbage, and pending work.
Returned transient payload **is not RSS** or a DB memory ceiling.
No callbacks, threads, I/O, locks, or shared counters between Serie.

Each phase visits C distinct slots: three complete scans, plus internal
probes. Every writer probe visits at most C slots, comparing keys
up to 65,535 bytes long. Hostile case thus bounded but can
cost O(C² × key-length). Directory: O(2^G) references. Copy:
live key bytes. No constant-pause or engine-P99 guarantee.
Maintenance allocates and must be scheduled outside hot path.

Candidate mutations advance local revision: even an earlier
plan becomes conservatively stale. Interruption within mutation
follows its fail-stop protocol and context cleanup.
Between mutations, incomplete private candidates can be discarded by GC;
no root published and source needs no rollback.
Detected inconsistent copy makes index health terminal.

<a id="qualifica"></a>

## Qualification

Method and results preserved in
[campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-index-rebuild/README.md).
Decision review in
[indice-ricostruzione-revisione.md](indice-ricostruzione-revisione.md).
Campaign concerns this in-memory component: hashing, searchable retained
versions, transactional reservations, recovery, storage,
full GET, and x86-64 qualification remain later integrations.
