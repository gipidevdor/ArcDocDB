<a id="radice-active-vuota-con-fonti-recuperate"></a>

# Empty ACTIVE root with recovered sources

Bootstrap publishes GET sources before the first document. It completes the
[ACTIVE/CLOSED](get-fonti-serie.md) bridge and uses the header prepared by the
[opening module](inizializzazione-active.md). The durable EDIT decision
and request admission remain the external controller's responsibility.

<a id="protocollo"></a>

## Protocol

1. Prepare the new writer segment: 64-byte header, file and directory
   synchronized, read-only physically bound to append.
2. Complete the EDIT decision opening the segment in the manifest.
3. Create only one controller for that log, root NIL and next-offset 64.
   Acquire the lease and create the GET source, preferably through
   `crea-sorgente-get-preparata`.
4. Build `fonti-get-serie` from recovered CLOSED segments and call
   `inizializza-fonti-get-attive(source, lease, sources)`.
5. After return, admit requests. Recovered locations are
   resolvable from the same root; the new ACTIVE contains no documents.
6. Register the first batch with `previous = radice-vuota`. Publish it
   through normal WAL protocol before exposing its locations in the primary index.

Bootstrap creates no WAL record, increments neither CSN nor event generation,
and modifies neither frontiers, ring, nor last CSN. CAS publishes memory in the
Serie's canonical slot. It certifies neither EDIT decision nor document commit.
The initial legacy NIL controller may still register the first batch directly.

<a id="api-e-struttura"></a>

## API and structure

| API | Contract |
|---|---|
| `series:inizializza-radice-serie(controller, lease, root)` | One initialization with opaque non-NIL root, never-used controller |
| `get.resolver:inizializza-radice-get-attiva(source, lease, :content)` | Header still at 64; empty root published and planned |
| `get.directory:inizializza-fonti-get-attive(source, lease, sources)` | Same canonical view and ACTIVE ID absent from CLOSED; content = sources |

The empty root contains only source, content, and scalar metadata:
directory NIL, count/puts/nodes zero, end 64. It allocates neither pages nor row
vectors. Page/row payload is zero; the Lisp root object
and existing sources still have a cost. The first delta inserts
the rank-zero page and four nodes, keeping the empty root immutable.

An ACTIVE candidate before the first batch is impossible: no offset
belongs to [64,64). The resolver signals candidate failure
and releases the EBR pin; it does not return absence from an inconsistent published location.
CLOSED segments follow the existing path with one root acquisition.

<a id="rifiuti-e-interruzioni"></a>

## Rejections and interruptions

Lease and health precede source verification. Owner/duplicate, NIL root,
already started controller, unopened read-only/append, and advanced file are ordinary rejections
before the effect. A controller that has used and retired events remains
started even with an empty ring: event-generation must be zero.

During the effect, planned-root is set before CAS NIL → root.
The writer is exclusive and admission stays closed until return. A CAS/root/ring
invariant or incomplete exit makes the Archivio FAULTED, propagating
the original cause; no rollback, retry, close, or unlink. The published
result is not proof of quiescence.

Cleanup is installed before local effect acquisition:
an interruption during that acquisition does not leave the controller HEALTHY
with an orphaned effect. Reentrancy is rejected before cleanup, which
must not release a resource belonging to the effect already in progress.

The content graph and capabilities are borrowed. The owner guarantees
immutability and lifetime; subsequent publications retain
locations still observable by admitted readers. No shared state across Serie
or write on the GET path is introduced.

<a id="decisioni-da-verificare"></a>

## Decisions to verify

| ID | Decision | Cases |
|---|---|---|
| AEV-D01 | Non-NIL root | NIL and canonical value |
| AEV-D02 | root NIL, planned NIL, event-generation zero, count zero | Every condition separately, empty ring after use, repeated startup |
| AEV-D03 | CAS returns NIL | Success and mismatching CAS via FI; precedes EQ postcondition |
| AEV-D03b | Published and planned roots EQ to result | Both true in protocol; mutant omitting planned-root detects second false leaf |
| AEV-D04 | Read-only and append open | Both open; each capability not open separately |
| AEV-D05 | next-offset, written and durable all at 64 | Each different frontier separately |
| AEV-D06 | CLOSED view EQ to ACTIVE owner | Other view, canonical |
| AEV-D07 | ACTIVE ID absent from CLOSED | Absent, present, impossible geometry |
| AEV-D08 | No local effect already owned | Normal startup and reentrancy, without releasing previous effect |

Independent review, functional tests, mutations, and local
measurements are recorded in the increment's campaign. They do not qualify
complete engine opening, recovery, rotation, or reclamation.

AEV-D03b is a defensive postcondition. With an exclusive lease, the just-successful
CAS sets root to result and the writer has already set planned-root:
false leaves are unreachable through a conforming transition. A mismatching
CAS fails at D03 and does not cover D03b. The planned-root mutant
demonstrates sensitivity to the structural defect without certifying MC/DC coverage
of those leaves in the conforming product.
