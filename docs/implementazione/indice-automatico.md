<a id="selezione-automatica-del-modo-dellindice"></a>

# Automatic index-mode selection

First increment authorized on 2026-10-22: [ADR-0057](../adr/0057-selezione-automatica-indice.md),
REQ-IDX-008, INV-I7, INV-A8, INV-P6. Class C1 for selector, C4 for model.
The overall requirement remains designed: M1 retains the [resident primary index](indice-primario.md)
and integrates paged GET, bounded delta, and [serial renewal](rinnovo-indice-m1.md).
No automatic actuator yet reduces resident memory.

<a id="api-e-stime"></a>

## API and estimates

`arcdocdb.index.mode:crea-politica-indice` builds immutable configuration.
`:rientro-percentuale` is an integer 1..99, default 75. It enables no manual selection.

`valuta-modo-indice(policy, current, budget, resident, paged, migration)` returns
two immediate values: destination `:residente`/`:paginato` and action.
`current` is `:iniziale`, `:residente`, or `:paginato`. Budget in 0..2^60-1 bytes;
estimates in 1..2^60-1. The conservative limit keeps calculations within SBCL64 fixnums.

- `resident` and `paged`: conservative peaks of the next work if admitted
  in the respective mode, including directory, keys, history, metadata, and transients.
- `migration`: total switch peak on current dataset, including still-live
  source, destination, staging, delta, and retained versions. Next
  work stays deferred. To request a switch, it must also cover destination
  peak; it need not cover avoided future resident growth.
- `budget`: quota assigned to this Serie after other component
  reservations. It is not an instantaneous free-memory measurement.

These are trusted, consistent controller-supplied estimates: the function neither
measures OS, reserves RAM, nor demonstrates an estimate is conservative.
Future measurement must include retired pages and objects still retained
by GC. The coordinator must ensure simultaneous quotas fit the
global budget, leaving headroom for OS and other components.

<a id="decisioni"></a>

## Decisions

At startup, prefer resident if it fits the full quota. During operation,
resident remains so until the next peak exceeds quota.
Paged returns to resident when peak falls within
`floor(budget * rientro-percentuale / 100)`. Calculation divides budget first,
without an intermediate multiplication outside fixnum.

| Action | Meaning and caller obligation |
|---|---|
| `:avvia` | Selected mode fits quota; build and verify before exposing it. |
| `:mantieni` | No switch requested; next work fits estimated quota. |
| `:prepara` | Destination and migration peak fit; reserve, then build. Does not mean swap executed. |
| `:budget-insufficiente` | Do not admit over-quota work or publish an incomplete destination. Reduce/redistribute resources or apply explicit backpressure. |

Example in abstract bytes: quota 1000, next resident 1100, paged 200,
current dataset migration 950: `:paginato, :prepara`. With migration
1001: `:paginato, :budget-insufficiente`. Do not wait until growth
beyond quota has already been admitted. The decision does not modify current root.

`invalid-argument` reports invalid domains and transient below
switch destination. `resource-exhausted` reports startup with no mode
that fits. Tests check canonical reasons; no effect precedes
rejection. Operating insufficiency is an explicit result.

The function allocates nothing on valid paths, uses neither locks nor I/O, and is not
called by GET lookup. This does not imply GET lock-freedom.
Immutable configuration may be shared; no quota or counter
is written across Serie. A decision sample is not permanent authorization:
the actuator must reserve and recheck before publication.

<a id="verifica-preregistrata-del-selettore"></a>

## Preregistered selector verification

Method fixed before first execution: strict compilation,
manual numeric boundary oracles, growth/return sequence, changed budget,
same policy for two Serie without shared state, malformed domains,
2^60-1 extreme, and percentages 1/99. Serial window of 10,000 decisions with
checked sink and SBCL GET-BYTES-CONSED counter: expected zero Lisp bytes.
This window measures neither RSS, native allocations, concurrency, nor performance.
Like other allocation windows, the test runs in normal
verification; the catalog excludes it only from instrumented SB-COVER execution,
which changes allocations, requiring normal evidence on the same sources.
CI consumer regressions also check this seventh explicit entry.
[Initial results](indice-automatico-risultati.md) preserve original runs.

| Compound C1 decision (COD-54) | Conditions | Verifiable pairs |
|---|---|---|
| Valid percentage | fixnum; 1 <= p <= 99 | 75; 75.0; 0; 100; extremes 1/99 |
| Valid bytes | fixnum; minimum <= x <= maximum | 0 budget; 1 estimate; -1; 0 estimate; 1/2; max+1; max |
| Valid switch estimate | not initial; different mode; peak < destination | same initial/resident/paged sample, 699/700 for destination 700 |

Other choices are single comparisons or ordered branches: startup, destination
capacity, mode equality, transient capacity. Tests cover
equality and adjacent byte; requirements are not marked qualified.

<a id="m0-lifetime-dei-frame-e-progresso"></a>

## M0: frame lifetime and progress

The [executable model](../../spikes/SPK-07-protocols/page-lifetime.lisp) follows
the [preregistered method](../../spikes/SPK-07-protocols/metodo-page-lifetime.md).
A hazard slot belongs to a worker in the Serie cache; no global
per-request write. In the SC model:

```text
reader: token = read READY(frame)
        announce private hazard = token
        if READY(frame) != token: clear hazard; MISS
        copy field A; copy field B
        clear hazard; HIT with private copy

reclaimer: close READY -> RETIRING
           scan every hazard
           if current token present: defer reuse
           otherwise BUILDING; new generation without wrap
           write A; write B; publish READY
```

Safety: an announcement before closure, followed by successful revalidation,
must be seen by every scan that would authorize reuse; protection
lasts until copying ends. An announcement after scanning does not
allow content access because revalidation fails. These orders
require documented primitives and barriers in future SBCL translation.
Under SC, an accepted attempt acquires at the second READY comparison; the page
remains usable during RETIRING. This is the acquisition point,
not the transaction or GET linearization point.

Liveness: every reader completes an attempt in at most six own steps;
it does not wait for the writer. A MISS attempt does not necessarily complete the
requested search. A suspended thread may prevent frame reuse;
all frames protected may block a miss with I/O. A complete lock-free
resident-index lookup is not demonstrated: directory, frame selection,
SBCL primitives, and their proof under the actual memory model are missing.
Runtime/GC pauses are not excluded by implicit assumption.

The ABA test deliberately recycles the token after two reuses, while the
incarnation oracle remains distinct. In the product, complete
PageRef/frame/generation comparison, unreused persistent identities, exhaustion
without wrap, and long-lived frame arrays are obligations still to be decided.
This model authorizes no snapshot-content reclamation.

<a id="incrementi-successivi-e-completamento"></a>

## Subsequent increments and completion

| Increment | Modules and interfaces | Completion criterion |
|---|---|---|
| I1, introduced | `index.mode`, pure contract; separate C4 M0 | Reproducible tests and model, CI integration, traceability; actuator still absent. |
| I2, current | [ADR-0058](../adr/0058-pagine-indice-primario.md), [C1 page codec](pagine-indice.md), PageRef, checksums | Independent 4/16/64 KiB fixtures, collisions and long keys, full pages, corruption and split image; no log changes. |
| I3, started | [Serial cache with copies and verified PREAD](cache-pagine.md); concurrent acquire/release protocol and complete budget remain | Safety/progress proof with SBCL primitives; fault injection, reader suspension, saturation, ABA; separate declared blocking miss. |
| I4, started | [Serial multilevel directory and bucket reader](lettura-indice-paginato.md); [incremental page construction](costruzione-indice-paginato.md); [sealed images and serial read-only adoption](immagini-indice-paginato.md); [M1 startup/GET and retirement before writing](indice-paginato-m1.md); [M1 producer with radix partitioning](costruzione-indice-m1.md); [serial activation on open engine](attivazione-indice-m1.md); [bounded serial delta on resident index](delta-indice-m1.md); [renewal with single admission](rinnovo-indice-m1.md); [delta threshold maintenance](manutenzione-indice-m1.md); [startup candidate discovery](scoperta-indice-m1.md); independent paged writer, catalog, and automatic selection remain | Differential comparisons with resident index for PUT/GET/DELETE, snapshots, prepared/outcome, restart and crash at every boundary; index larger than RAM without swapping. |
| I5 | Per-Serie controller/actuator and injectable measurer | Automatic startup and switches both ways, RSS/peak limits, delta without gaps, consistent swap, concurrent writer and snapshots. |
| I6 | Operational migration and qualification | Failpoints before/after every swap, controlled return, warm/cold benchmarks and write amplification; Linux x86-64 and macOS ARM64 gates. |

I2 adds a derived format not yet connected to runtime: through I4,
rollback removes components without migrating user data. After I4, primary index remains
derived from existing segments, manifest, and decisions: an incomplete new index
never becomes authoritative. Rollback must rebuild a view compatible
with available memory without presuming the paged dataset fits RAM.
Commits, SEAL, snapshots, WAL, and recovery retain their decision points;
the integration ADR must specify index publication boundaries.
