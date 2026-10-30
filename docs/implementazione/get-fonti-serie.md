<a id="fonti-get-nella-radice-del-controller-serie"></a>

# GET sources in the Serie controller root

This increment connects the CLOSED directory and ACTIVE resolver to the
root already published by the Serie controller. The protocol uses the existing
CAS and the candidate's same EBR task. Review is in
[get-fonti-serie-revisione.md](get-fonti-serie-revisione.md); the centralized
execution plan is in the
[campaign README](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-fonti-serie/README.md).

Compaction, rotation, complete primary-index relocation, and reclamation are not
implemented by this bridge. It introduces no additional CAS,
lifetime registry, FD closure, or file removal. The
container certifies neither concrete-index consistency nor C1 qualification.

<a id="grafo-e-proprietà"></a>

## Graph and ownership

`fonti-get-serie` contains exactly two read-only references:
`directory`, an already verified CLOSED `directory-get-serie`, and `content`,
the caller's opaque content. `crea-fonti-get-serie(directory, :content C)`
creates only the container; `contenuto-fonti-get-serie` returns C.
It copies neither directory, maps, FDs, nor C. C's graph is borrowed:
the owner keeps it immutable and valid until the last reader.
`read-only` prevents slot replacement without making an external
mutable object immutable.

The published root permits two forms:

| Root form | CLOSED sources | ACTIVE source | Caller content |
|---|---|---|---|
| `fonti-get-serie` | Container's `directory` | None | `contenuto-fonti-get-serie(root)` |
| `radice-get-attiva` | Container's `directory` in ACTIVE root's `content` | Page directory of that same ACTIVE root | `contenuto-fonti-get-serie(contenuto-radice-get-attiva(root))` |

The worker accepts only published forms. Directory and ACTIVE
segment must belong by EQ identity to the request's canonical
view. The ACTIVE source must identify the same controller from which
the root was acquired; its storage ID has a zero high word and
positive u32 low word. That ID must be absent from the CLOSED
directory. The reader also checks an impossible already published duplicate,
which is an internal failure rather than an arbitrary choice between two sources.

<a id="preparazione-adozione-e-pubblicazione"></a>

## Preparation, adoption, and publication

The writer builds the CLOSED directory through existing APIs, then prepares
the immutable container. A read-only CLOSED Serie may receive
the container as the controller's initial root, with log/view/Archivio
binding verified by the caller before admitting workers.
This increment adds no rotation transition to that
form.

For a new ACTIVE, the controller starts under the existing ACTIVE
protocol, with planned root NIL and initial header offset.
Preflight `verifica-capienza-get-attiva` precedes CSN assignment;
sealing and content preparation follow the WAL protocol.
`registra-lotto-fonti-get-attivo(source, lease, batch, previous, sources, level)`:

1. checks current lease and controller health before source
   guards and any fault effect;
2. checks that the directory in `sources` belongs to the ACTIVE
   segment's view;
3. searches for the ACTIVE ID in the CLOSED directory with at most seventeen pivots
   and rejects a duplicate;
4. delegates to `registra-lotto-get-attivo` with `sources` as the new
   ACTIVE root's content; retains lease, token, FIFO, budget, and WAL checks;
5. returns event, generation, and planned root. The caller retains
   the latest planned root for the next adoption.

Owner and duplicate are rejected with `invalid-argument` before adoption,
without mutating the ring or consuming the event. Because the batch is already SEALED/CSN,
the caller must retain batch and token and handle rejection through the
existing WAL protocol; it cannot discard them as though the CSN did not exist.
The wrapper does not automatically check that new sources cover those
needed by readers: this is a writer obligation.

Only normal `pubblica-commit-serie`, after the coverage required by
`:async`, `:group`, or `:strong`, exposes the root through existing CAS.
SEAL retains the WAL atomicity point; CAS publishes memory.
A prepared event and the registration return value are not
proof of publication. Primary-index locations become observable
only after corresponding sources are published.

<a id="bootstrap-con-active-vuoto"></a>

## Bootstrap with empty ACTIVE

[Empty-root initialization](get-active-vuoto.md) makes recovered CLOSED
segments queryable before the first batch. After header preparation
and EDIT decision, the writer creates the controller with root NIL and offset 64,
creates the ACTIVE source, and calls
`inizializza-fonti-get-attive(source, lease, sources)` before admission.
The returned root has zero pages, PUTs, and nodes, NIL directory, and end 64.
The first batch uses it as `previous`; subsequent batches use the latest planned
root. No dummy batch, event, or CSN is assigned at startup.

Startup uses the same atomic Serie slot; every batch continues to
publish through ordinary CAS and WAL coverage. The legacy path with
initial NIL controller and first batch without bootstrap remains available.
An initial CLOSED-only root is readable but is not an ACTIVE root:
it cannot be passed to the builder or transformed in place. The caller chooses
the empty ACTIVE form during controller construction.

The EDIT opening executor, complete rotation, and reclamation
remain open. Individual factories prove neither controller uniqueness, FD lifetime,
nor completion of the catalog decision.

<a id="copertura-delle-location-e-reader-già-ammessi"></a>

## Location coverage and already admitted readers

Let `R` be the root acquired after lookup, `S(R)` the set of locations
resolvable by its CLOSED maps and ACTIVE pages, and `L` the set of
locations already admitted readers can still observe or may have copied
from the primary index. The obligation is **`L ⊆ S(R)`** for every admitted acquisition.
Presence of a segment ID alone is insufficient: the offset's row,
CSN, size, frontier, and candidate proof must remain available.

Example: a reader enters EBR and `avvia-get` copies the location in segment
7. The writer publishes a new directory for segment 8 and updates the
primary index. When the reader acquires the new root, it must still
resolve the location in segment 7. Merely keeping the old root
in memory or leaving the old FD open is insufficient: the bridge searches the
sources of the root it just acquired. A missing map causes failure
of an already published candidate, never `:absent`.

The “sources before locations” order handles introduction of new sources;
the superset handles retention of sources that may still be needed.
EBR protects lifetime of capabilities acquired within the task; it does not add
a source removed from the directory or make sources a snapshot view
of the primary index. Future rotation/reclamation must demonstrate both
obligations before reducing that superset or closing a resource.

The [integrated lifetime verification method](get-lifetime.md) exercises
these obligations with real FDs, ordinary publications, and EBR retirement.
The test distinguishes the FD captured by a reader from sources a
new lookup may acquire; the durable catalog remains a precondition.

<a id="lettura-nel-compito-get"></a>

## Reading within the GET task

The caller installs external cleanup before `avvia-get`. If the outcome is
`:candidate`, it uses one of the Serie APIs in the same task:

| API | Outcome and responsibility |
|---|---|
| `risolvi-candidato-serie-get(context, controller)` | One root acquisition; read-only capability, authoritative end, storage flags and OUTCOME/NIL proof |
| `sonda-cache-serie-get(context, controller)` | Probe without I/O; `:hit`, `:miss`, `:verify-failed`, `:disabled`, `:proof-required` or `:buffer-required` |
| `leggi-record-serie-get(context, controller)` | In I/O worker, five core GET outcomes; prepared records retain authoritative OUTCOME reread |

Every resolution invocation acquires the root once, after
CANDIDATE/EBR checking. Internal function `acquisisci-fonti-serie-get`
derives sources and ACTIVE from the same controller acquire read.
The location's segment selects ACTIVE only if it matches that ID;
other candidates go to the CLOSED resolver. Row checks, both
CSN words, size, flags, FD, and frontier delegate to the common resolver.
GET still verifies record/cache, CRC, key, and proof before response.

The ACTIVE branch calls `risolvi-candidato-radice-attiva-get(context, root)`
with the just-captured root. This API does not reread the controller. Its
precondition requires an already published root acquired after the pin
within the same EBR; type `radice-get-attiva` does not distinguish a
prepared root. The explicit adapter entrusts this proof to the caller. The Serie
bridge satisfies it by reading only `leggi-radice-serie`. The legacy wrapper
`risolvi-candidato-attivo-get(context, source)` retains single
acquisition and delegates to the same adapter.

The value stays private until `copia-valore-get` and `concludi-get` with fresh
time. For cache miss, insufficient buffer, or prepared records, handoff
to the I/O pool transfers the original request: the new worker performs
a new `avvia-get`, new epoch, and new acquisition. Pin, root, location,
and FD do not cross the queue.

<a id="errori-invarianti-e-limiti-della-prova"></a>

## Errors, invariants, and limits of evidence

Wrong-state is rejected before assuming cleanup. A foreign owner is
`invalid-argument`. Impossible root/content shape, inconsistent
ACTIVE/controller binding, invalid ACTIVE ID, or published duplicate
produce `guasto-get` and `invariant-violation`. Missing sources/rows are not
logical absence. Errors after admission release EBR; the worker
boundary must isolate Serie/Archivio according to cause. Context
FAULTED alone does not prove the controller has already been isolated.

Duplicate lookup first checks equal ID/map cardinalities
and a maximum of 65,536 entries. After seventeen pivots it requires
convergence `left = right` before returning absence. Impossible geometry or
convergence reports `invariant-violation` with reason
`:directory-shape` or `:directory-search-bound`. On the reader, the handler
preserves reason through `guasto-get`, makes GET FAULTED, and resolver cleanup
releases EBR. On the writer, after lease/health checking,
the handler marks the controller `:archive-faulted` and repropagates the same
condition; it neither adopts the batch nor implicitly resolves the token.

Relevant invariants are INV-A2, INV-A3, INV-A4, INV-A8, INV-R1,
INV-M1, INV-M4, INV-P1, INV-P5, INV-P6, and INV-V4. Local traceability
uses REQ-IDX-001, REQ-WAL-006, REQ-CMP-007, REQ-CCH-002, REQ-FOR-004,
REQ-CON-004, REQ-AFF-002, and REQ-AFF-008. References:
[standard](../affidabilita/standard-di-codifica.md),
[ADR-0033](../adr/0033-fail-stop-e-integrita-end-to-end.md),
[ADR-0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md),
[ADR-0036](../adr/0036-leggi-di-progetto.md),
[ADR-0037](../adr/0037-lotto-sigillato.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md),
[CLOSED directory](get-directory.md), and [ACTIVE resolver](get-active.md).

The owned container has two references; Lisp objects/headers, opaque graph,
directory, maps, FDs, retained roots, and EBR are distinct costs.
Duplicate lookup uses canonical directory limits
(0–65,536 segments; seventeen pivots). The new lookup contains
no explicit allocations, locks, waits, or I/O; COD-30, latency, boxing, and RSS
require centralized measurements. The two static readings certify neither
compilation, test outcomes, coverage, nor C1 qualification.
