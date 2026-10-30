<a id="resolver-get-del-nuovo-segmento-active"></a>

# GET resolver for the new ACTIVE segment

`arcdocdb.get.resolver` connects the writer's **ordinary batches** to the root
published by `arcdocdb.series`. It completes this part of the ACTIVE path
without changing decisions in [ADR-0037](../adr/0037-lotto-sigillato.md) and
[ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md). ACTIVE
prepared/OUTCOME proofs remain to be integrated: the wrapper explicitly
rejects them without interpreting them as aborts or format corruption.

The directory introduced here contains **pages of a single ACTIVE**. The
[Serie directory](get-fonti-serie.md) selects between ACTIVE and CLOSED.
Concrete index, rotation/reclamation, and server remain separate integrations.

<a id="autorità-e-ordine-di-pubblicazione"></a>

## Authority and publication order

The frontier is neither file size, WAL written position, H,
nor an offset supplied by the reader. The reader acquires the actual root
through `leggi-radice-serie`, with the existing acquire barrier, **after**
`avvia-get` under EBR. A merely planned root cannot be acquired
through the reader's ACTIVE APIs.

1. In the I/O pool, build `segmento-get` with the header read from the read-only FD.
   In the I/O pool, use [associa-file](associazione-file.md) to prove that this
   FD and the append FD belong to the **same physical file**, and keep them
   open until reclamation. Identity/version/header
   alone do not prove physical identity of the two FDs.
2. Create a local controller for the new ACTIVE, with root `nil` and
   `:next-offset 64`, and acquire its lease. With this lease,
   `crea-sorgente-get-attiva` checks writer origin, positive u32 ID,
   log version, and configuration. Passing `:associazione-file prova`
   also checks both actual capabilities without I/O. Omitting proof retains
   the caller's original obligation; the header alone does not discharge it.
   The [new writer preparer](inizializzazione-active.md) provides a
   factory requiring proof after the durable header and readback verification.
   Before admission, [empty startup](get-active-vuoto.md) may publish
   recovered sources with zero pages and no event or CSN.
3. On the OPEN batch, call `verifica-capienza-get-attiva` **before** the
   WAL–CSN bridge. Preflight checks ring, contiguity, supported shape,
   segment space, and budget; it returns PUT count without assigning a CSN
   or reserving resources. Keep lease, content, and the previous **planned**
   root, initially `nil` or the published empty root,
   stable until sealing/adoption.
   Then seal and prepare the caller's immutable payload. Preflight
   does not certify value CRCs: full verification follows sealing.
4. `registra-lotto-get-attivo` checks lease, ring, token, log, and order;
   it verifies **only the new batch** in memory, including CRCs, SEAL, absolute
   position, count, and CSN. It copies ordinary PUT metadata into a
   private page. Tombstones occupy log and frontier without a PUT row.
5. The wrapper adopts batch and new root with normal
   `registra-commit-serie`, before I/O dispatch. It returns event,
   captured generation, and new planned root. It neither publishes nor
   acknowledges the client.
6. Normal `pubblica-commit-serie` checks coverage and FIFO before
   CAS: `:async` after write, `:group`/`:strong` after durable coverage.
   CSN resolution follows CAS; `:pendente` retains the obligation and does not
   republish. I/O completion, retirement, and reuse remain with the existing protocol.

The persisted SEAL is the WAL atomicity point; preparing a page
does not certify write/fsync. CAS publishes memory. Caller payload
is readable with `contenuto-radice-get-attiva`, but the wrapper neither
builds nor verifies a concrete index's contents. A location
must become observable **after** its corresponding page; mutating an
index reachable from published roots violates the contract. Atomic
connection to the primary index remains to be completed.

<a id="directory-persistente-e-limiti-di-lavoro"></a>

## Persistent directory and work limits

The directory has four levels, each with sixteen references, indexed
by the four binary digits of a u16 rank. Pages follow physical batch
order. An append copies four vectors and shares only immutable
subgraphs. It does not recopy previous PUTs, reread the ACTIVE file, or
retain a chain of previous roots. Old roots remain valid.

| Path | Limit |
|---|---|
| Preflight before CSN | OPEN batch header; no body copy, array, or reservation |
| New batch verification | Batch bytes and records, configured before adoption |
| Metadata count and copy | Two passes over new-batch headers; no value copying |
| Directory append | Four vectors × sixteen references; recursion bounded to four levels |
| Page lookup by offset | At most 17 comparisons and one final access, four levels per access |
| PUT lookup within page | Common resolver: at most 33 steps |
| GET | No I/O in resolution/probe; I/O only in dedicated pool |

A maximum-case search may use all seventeen comparisons:
convergence is also checked after the loop without requiring an
eighteenth comparison. Offsets in header/SEAL/tombstone, outside frontier,
or without a matching row **do not** mean document absent. They are failures
of an already published location.

<a id="memoria"></a>

## Memory

Default per-source budgets: 65,536 pages, 1,048,576 PUTs, 65,536 records
per batch, 64 MiB per batch, 64 MiB resolver payload. These are resource
budgets, not new document-size limits. Saturation requires
controller backpressure/rotation; it produces neither wrap nor implicit growth.

| Data on 64-bit SBCL | Payload |
|---|---|
| PUT row | Six u32s, 24 bytes; absolute offset, size, flags, two CSN words and zero proof |
| Directory node | Sixteen references, 128 bytes excluding Lisp header |
| View with all 65,536 pages | 4,369 nodes, 559,232 bytes for directory |
| Append preflight peak | Previous payload + `24 × nuovi PUT` + 512 bytes |

`payload-radice-get-attiva` counts rows and nodes reachable from a single
view. The peak includes the previous view during construction and
four new vectors, even when some replace existing nodes.
Arrays and pages are not exposed to the caller, who cannot mutate them through
the public API. The reusable batch/event does not remain in the root graph.

Lisp objects/headers, calling-index payload, FDs, batch buffers,
roots retained by events/readers, and GC delays are excluded. The controller
must impose an overall budget for live views and backlog. The
builder allocates per batch; absence of explicit heap in lookup is not an
allocation, latency, RSS, or throughput measurement. COD-30 is not claimed.

<a id="lettura-guasti-e-lifetime"></a>

## Reading, failures, and lifetime

| API | Result |
|---|---|
| `risolvi-candidato-attivo-get(context, source)` | Read-only capability, candidate page end, storage flags, `nil` proof |
| `sonda-cache-attiva-get(context, source)` | Ordinary GET probe outcome with published frontier |
| `leggi-record-attivo-get(context, source)` | Five core GET outcomes in I/O pool |

The three source-bound APIs accept neither caller-supplied root nor
frontier. The [Serie-source bridge](get-fonti-serie.md)
instead uses the resolver for the root already captured under EBR, with
publication and lifetime obligations declared in that contract.
It checks source/root identity, directory geometry, and candidate through the
common resolver. GET still checks record/cache CRC/key/CSN; the
page does not replace physical data. Response stays private until copying and
`concludi-get` with fresh time; external cleanup remains mandatory.
Migration requires a new `avvia-get`, new epoch, and new acquisition.

Configuration, capacity, and unsupported-feature rejections precede
adoption. With mandatory OPEN preflight in the protocol, no CSN is assigned
to a batch already exceeding these budgets. Subsequent adoption
rechecks limits; a direct caller retains batch/token on rejection
and must handle them through the existing WAL protocol without discarding them.
Preflight guarantees neither successful allocation nor availability of the shared
CSN registry. Corruption of a sealed buffer
owned by the writer or an impossible invariant during preparation/
adoption marks the controller Archivio FAULTED and propagates the cause.
An adoption interruption follows existing fail-stop. The coordinator
must stop the Archivio, not merely release the request context.
On the reader, propagated faulty health and inconsistencies make GET FAULTED;
errors and nonlocal exits release EBR without authorizing the value.

FDs and external resources require EBR protection until the last reference;
a GC reference does not authorize closure. Rotation, segment selection,
index publication, and reclamation must respect this order.

<a id="decisioni-c1-e-qualifica-aperta"></a>

## C1 decisions and open qualification

Every introduced compound decision is recorded here; condition-by-condition
coverage **was not performed** in this increment.

| ID | Decision | Cases to qualify |
|---|---|---|
| GSA-D01 | Node NIL or width sixteen | NIL, valid, impossible geometry |
| GSA-D02 | Reader node is a vector with sixteen children | Wrong type/shape separately |
| GSA-D03 | Final convergence and rank in view | 65,536 pages, extremes, missing rank |
| GSA-D04 | SEAL at exact position/count | Mismatching count, end, and order |
| GSA-D05 | Batch: source ID and version | Each mismatch |
| GSA-D06 | Batch result: end, count, durable ≤ start | Each impossible result separately |
| GSA-D07 | SEAL high and low CSN | Each mismatching word |
| GSA-D08 | Copy: exact end and row count | Mismatching end/count, zero PUTs |
| GSA-D09 | Configuration: pages, PUTs, records, bytes, payload | All extremes and saturations |
| GSA-D10 | Source: high zero, low positive, origin, ID and version | Every mismatching identity |
| GSA-D11 | Read-only and open FD | Wrong mode/state/lifetime |
| GSA-D12 | New controller: root NIL, count zero, offset 64 | Already started controller/other prefix |
| GSA-D13 | Reader root has correct type and same source | Merely planned root, foreign root |
| GSA-D14 | OPEN preflight: source ID and version | Each mismatch before CSN |

The [static evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-active/README.md)
preserves compilation and product/documentation checks. Both readings
are local author readings, not independent review. No new test,
benchmark, fault injection, model, or self-test was added/run
locally in the initial increment. Subsequent [dedicated functional
verification](get-active-verifica.md), under the [preregistered method](get-active-metodo.md),
adds 28 ordinary tests, diagnostic coverage, and independent audits.
The [OPEN rejection method](get-active-preflight-metodo.md) records
subsequent deeper checks before CSN, with identity, state, and
capacity cases and selected mutations, keeping attribution separate.
[OPEN rejection verification](get-active-preflight-verifica.md) preserves
42 ACTIVE tests, four targeted mutants, and complete evidence audits.
Real-thread stress, interruptions in every phase, condition
coverage, heap/performance measurements, multiseries ACTIVE proofs, Serie
directory/rotation/reclamation, concrete index, and C1 qualification remain open.
