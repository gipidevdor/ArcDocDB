<a id="indice-paginato-nello-startup-e-nel-get-m1"></a>

# Paged index in M1 startup and GET

> **Decided (2026-10-29 → [ADR-0064](../adr/0064-adozione-indice-paginato-m1.md))** —
> Serial connection of verified derivatives to engine; durable catalog and
> automatic selection remain to be implemented.

`arcdocdb.engine:crea-opzione-indice-paginato` receives a leaf name
`primary-<16 cifre esadecimali minuscole>.idx.tmp` and explicit budgets:
`:page-size` (4096/16384/65536), `:frames` (1..64), `:max-visits`
(1..2^60-1), and `:max-bytes` (at least three pages, maximum 65538*65536).
Defaults are 4096, 2, 16777216, and 268435456. Name is copied.
Derivative budgets are separate from data-segment budgets.
`:create t` and `:index-image` are incompatible, rejected before any I/O.

```lisp
(arcdocdb.engine:apri-motore directory archive-id series-id
  :clock clock
  :index-image
  (arcdocdb.engine:crea-opzione-indice-paginato
    "primary-0000000000000001.idx.tmp" :page-size 4096 :frames 2))
```

The option refers to a file already built/sealed through
[page primitives](costruzione-indice-paginato.md) and the
[ARCIRF01 container](immagini-indice-paginato.md). It does not build the dataset,
assign IDs or canonical names, or create a catalog record. An ID in
the name confers no authority. Complete resident export is now available in the
[M1 producer](costruzione-indice-m1.md), with verification before success.

The engine reads canonical sources and completes ordinary checkpoint,
rebuilds resident index, and derives exact cardinality and candidates. The
source token contains data version and position of the last committed
record, including tombstones: four little-endian u64s, no digest.
CSN and UUIDs are checked separately. A new empty ACTIVE does not change
the token. A first record with CSN zero is distinguished from a recordless source
by nonzero segment ID. No resident compaction/split plan
is allowed by this adapter.

`fonte-indice-motore` returns an owned copy of current source
only to the READY owner with no request in flight. A new write
makes it stale; it is not a reservation. During recovery, the validator
compares all five words with resident index, zeroing only the resident arena
offset in comparison. Container verifier still
checks hash, root, uniqueness, routing, count, and cumulative budget.

[Hot activation](attivazione-indice-m1.md) also permits switching
to paged on the same handle after a new complete verification.

File and EOF come from the same verified relative read-only open,
under the existing directory lock. FD is owned
in a separate slot before verification and closed even on incomplete
startup. The subsequent [activation and retirement protocol](attivazione-indice-m1.md)
closes the FD when root is replaced or retired, before final
handle close. No concurrent GET may retain that capability.

READY admission follows complete verification. Missing selected file,
incompatible EOF or source, exhausted budget, and read failures reject
opening without using resident index as fallback. Canonical recovery
may already have completed checkpoint and names; derivative is not modified.
Absence of the option selects the existing resident path.

The GET view retains a read-only `:lookup` callback trusted by the controller,
with signature `(key start end probe output)` and result `:live`, `:absent`, or
`:retry-limit`. Contract requires finite limits, no hot-path allocation,
output intact on miss, same source/Serie, and ownership consistent
with EBR. M1 installs the actor's callback: no concurrent use of
serial cache. Standard GET path without callback is unchanged.

`modo-indice-motore` exposes `:paged` or `:resident` to the READY owner. With a
paged root, absence also comes from that root; failures trigger
no second lookup. Resolver, frame/value verification, and GET completion
remain canonical. Before an admitted write, the paged
reference is retired without allocation. Input/capacity rejections before
admission instead preserve root and frontiers. PUT, DELETE, and
DELETE of an absent key advance source before ACK.

<a id="verifica-e-decisioni"></a>

## Verification and decisions

Tests in [tests/engine/images.lisp](../../tests/engine/images.lisp) cover
data formats v1/v2 and all three sizes, one-frame cache, overflow,
GET live/miss, update/delete after retirement, repeated checkpoints without writes,
empty source and tombstones only, stale image, falsified payload with
exact source, budgets/configuration, and release after nonlocal exit.
A deliberately faulty resident index shows selected GET uses
the paged index. Existing resolver and container tests stay active.
Six SIGKILL tests (three boundaries in v1/v2) restart independent processes before
verification, after adoption, and after first-write flush; they verify
reuse or rejection of the old image and preservation of its bytes.
These are local process tests, not power loss or Linux qualification.

| Compound C1 decision (COD-54) | Coverage |
|---|---|
| Name: type, length, prefix, suffix, hex | NIL, reserved/external names, nonhex characters; valid name |
| CREATE and selected image | Init without image, recovery with image, combination rejected before I/O |
| Budget: size, frames, visits, bytes, three-page minimum | Every invalid component separately, three valid sizes |
| Source: positive segment/length, first position or increasing CSN | Normal replay/write, empty source and tombstones; targeted rejection test |
| M1 resident: depth=0 and single reference | Normal root; targeted test of geometry outside M1 |
| Candidate: CSN, location, key flags/length, record length, END | Valid image; independent alterations; direct validator test |
| Recovery: recovering state and absent private root | Normal startup; targeted out-of-phase call test |

Two C1 readings: first on canonical-prefix binding, count, and candidate
comparison; second on FD lifetime, retirement before commit, fail-stop,
budgets, and no shared state across Serie. Loops inherit resident-lookup
and paged-verifier bounds; no dataset loop is added.
Reproducible evidence is collected in
[spikes/results/2026-10-29-engine-index-images/](../../spikes/results/2026-10-29-engine-index-images/).

Resident index remains allocated and still limits PUT and replay. This does not measure
capacity beyond RAM, throughput, RSS, automatic migration, snapshots, or
durable catalog publication. This increment closes only the
serial startup/GET/retirement connection for the M1 profile.

<a id="ricerca-opzionale-allo-startup"></a>

## Optional startup discovery

[ADR-0070](../adr/0070-scoperta-readonly-immagini-m1.md) adds
`:index-discovery`, an alternative to explicit selection described here:
[bounded scan and complete verification](scoperta-indice-m1.md). Canonical
source is always rebuilt before discovery; no new catalog.
