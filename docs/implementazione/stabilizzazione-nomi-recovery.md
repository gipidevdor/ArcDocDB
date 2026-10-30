<a id="stabilizzazione-dei-nomi-recuperati"></a>

# Recovered name stabilization

Implements live segment name completion in ADR-0040 §2–3,
without changing accepted decisions. Requirements REQ-REC-001,
REQ-REC-004, REQ-STO-003, REQ-STO-006, REQ-AFF-001, REQ-AFF-004,
REQ-AFF-008, REQ-AFF-018; invariants INV-A9, INV-A10, INV-A11.

<a id="ingresso-dal-recovery"></a>

## Recovery entry point

```lisp
(arcdocdb.recovery.series:stabilizza-nome-fonte-recuperata
 directory sources position recovered)
;; => T if renamed, NIL if already final; successful parent fsync in both cases.
```

The coordinator maintains authoritative catalog and CONTROL, exclusive
namespace, open [owned source](fonti-recovery.md) set, and immutable semantic
token. It calls this function in the I/O pool after the complete
[Serie](recovery-serie.md)/[Archivio](recovery-archivio.md) gate,
before checkpoint and admission. The local check concerns
**one source**: it does not replace that complete gate.

[Whole-Serie completion](stabilizzazione-serie.md) now applies
all semantic and name preflights first, then this primitive to each
source. It returns complete counts, retaining effects already
successful if a later completion fails.

The token must be the ACTIVE or CLOSED from the selected row. Before
names, exact FD, state, full u64 ID, open CONTROL,
and manifest membership are checked. For ACTIVE, attested EOF must be
identical to the one read; for CLOSED, P must match the manifest
and be within acquired EOF. CLOSED IDs are not restricted:
zero and high bits remain significant. Capabilities are borrowed, without
ownership transfer or implicit closure.

Names are derived from ID, not supplied by the client. The form in the set
remains the acquisition observation, even after promotion: subsequent
calls observe the current namespace and the same FD.

<a id="completamento-io"></a>

## I/O completion

`arcdocdb.io:stabilizza-nome-temporaneo` receives directory, read-only FD,
temporary name, and final name. It is an internal engine primitive: the
caller must already have verified file and authoritative decision.
It checks ASCII leaf names, relation `final + ".tmp"`, modes, identical
backend, and identity callbacks without native fallback. The temporary branch
also checks [exclusive publication](io-pubblicazione.md) capability
before entering the effect boundary. The [preregistered variant](stabilizzazione-esclusiva-metodo.md)
defines this connection and its decisions.

| Current namespace | Outcome before effect |
|---|---|
| Temporary only, same device/inode as FD | Exclusive publication, final verification, parent fsync |
| Final only, same device/inode as FD | Final verification and parent fsync; no rename |
| Both, even hard links to the same file | Rejection; no replacement |
| Neither | Rejection |
| Sole name of another file | Rejection |
| Symlink, wrong type, error other than ENOENT | Condition propagated |

Identities are observed relative to the directory FD with nofollow.
Only IO-FAULT with operation ENTRY-IDENTITY and errno ENOENT equates
to absence. The temporary branch delegates to `pubblica-temporaneo`: it
rechecks source identity and uses the exclusive syscall, without
replacing a target that appeared after observation. The backend must offer
`:rename-exclusive`; `:rename` alone is insufficient. There is no
fallback to ordinary rename.

In the already-final branch, no rename callback is required or called,
nor is its native symbol checked: identity and parent flush
remain necessary. Both branches retain private names and
exclusive namespace until return. The exclusive syscall protects the
target; source stability still requires excluding
other processes and the writer, beyond any local mutex.

The decision is in the already authoritative EDIT. Exclusive rename completes its name;
parent fsync completes namespace persistence. It is not the
atomicity point of the [recovery checkpoint](checkpoint-recovery.md),
which remains the CONTROL swap. Data is not rewritten, truncated, or
synchronized by this primitive; semantic verification is not
confused with new attestation of its durability.

After the selected branch's preflights pass, any incomplete exit makes the directory
FAULTED in the I/O module, retaining the cause. The postcondition rechecks
both names and identity before fsync; the FD must remain open.
Do not retry with the faulted capability. A subsequent recovery acquires
new capabilities, observes temporary or final, and completes the same
decision. In the already-final branch, fsync remains mandatory, even
when the previous attempt was interrupted after rename.

<a id="costi-e-confini"></a>

## Costs and boundaries

O(1) observations per source and private 24/20-byte strings for canonical
names, plus the primitive's private copies. No segment buffer,
body scan, new FD, thread, CSN registry, or lock between Serie.
One parent fsync per successful call, including an idempotent call:
this is cold-path recovery completion, outside the request
path. No RSS, allocation, throughput, or P99 measurement is inferred
from this description.

Coordinated execution of all inventory actions,
proof-based removal of deletable files, indexes, and admission remain.
The function does not reopen old ACTIVE for writing or modify
CLOSED, removed segments, hints, or indexes.

<a id="decisioni-e-qualifica-aperta"></a>

## Decisions and open qualification

| ID | Decision to qualify | Status |
|---|---|---|
| SNR-D01 | Only ENTRY-IDENTITY + ENOENT becomes absence | Open |
| SNR-D02 | Consistent name pair, modes, and backend/callbacks | Open |
| SNR-D03 | Exactly one name; device and inode match FD | Open |
| SNR-D04 | Rename only if temporary; final rechecked | Open |
| SNR-D05 | Every incomplete exit after preflight faults OPEN, never reopens CLOSED | Open |
| SNR-D06 | ACTIVE token: exact row state, ID, FD, and EOF | Open |
| SNR-D07 | ACTIVE token and manifest agree on ID | Open |
| SNR-D08 | CLOSED token: state, ID, FD, and P within EOF | Open |
| SNR-D09 | CLOSED token and manifest agree on state and P | Open |

SNE-D01…D06 add exclusive integration boundaries: callback
required only for temporary branch, no fallback, final branch with
mandatory fsync, and cleanup at both levels. Qualification remains.

Preregistered method and results in the
[local campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-recovery-name-stabilization/README.md).
Compilation and static checks do not verify rename, collisions,
idempotence, or crashes. Dedicated tests, FI, MC/DC, coverage, independent
review, and C1 qualification remain open. The coordinator's general COD-24
boundary remains to be integrated; only directory capability quarantine
during I/O completion is defined here.

The [exclusive integration campaign of 2026-10-22](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-recovery-exclusive/report.md)
retains five OK/STABLE diagnostics on product `e2cb7194`: forced
compilation without warnings, lint on 355 files, traceability, links, and reading of
eight compiled functions. An independent static review found no
defects in the change. Records are retained with lossless gzip,
hashes, and closed inventory; no functional test, FI, or benchmark run.
This outcome adds the integration's independent reading without
qualifying dynamic SNE/SNR/PIO cases or complete recovery.
