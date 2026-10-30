<a id="scoperta-delle-immagini-m1-allo-startup"></a>

# Discovering M1 images at startup

> **Decided (authorized incremental integration → ADR-0070)** — C1;
> REQ-IDX-010, REQ-REC-001, INV-I8, INV-A8, INV-P6.

```lisp
(defparameter discovery
  (arcdocdb.engine:crea-opzione-scoperta-indice
    :page-size 4096 :frames 2 :max-visits 16777216 :max-bytes 268435456
    :max-names 4096 :max-candidates 64 :max-discovery-payload 16777216))
(arcdocdb.engine:apri-motore directory archive-id series-id
  :clock monotonic-clock :index-discovery discovery)
```

Factory validates profile with same rules as explicit option.
Limits: 1..65536 names, 1..1024 candidates, candidates <= names, payload 0..512 MiB.
Insufficient budgets rejected by factory before I/O. Profile
placeholder name selects no file. Options `:index-image`
and `:index-discovery` exclusive, neither allowed with `:create t`.

After canonical replay and checkpoint, engine stays RECOVERING. Search
derives candidate only from complete bounded inventory. Foreign
names not opened. Name quota includes every directory
entry, including foreign ones; existing canonical startup limits remain
applicable (including `max-files` derived from `max-segments`). Checkpoint
may already be complete when candidate or quota rejected:
no rollback of canonical effects promised.

<a id="sonda-scelta-e-verifica"></a>

## Probe, selection, and verification

Every canonical name opened read-only with exact EOF and profile
I/O limits. Out-of-format geometry, footer without valid CRC, incompatible page
code, and mismatched source/seed make file ineligible.
Ineligible candidate closed, remains on disk, not adopted.
Complete image with footer bit rot may be discarded like incomplete
one: search does not certify integrity of abandoned derivatives.

With eligible CRC and profile, magic, version, reserved-field, or root errors
propagate; intact unknown version produces UNSUPPORTED-FORMAT. I/O
errors, symlinks, wrong file type, over-budget file, or failed close not
converted to absence. Source mismatch alone causes ordinary
hint rejection because stale derivatives expected.

Maximum hex name among eligible footers selected independently
of enumeration order and file date. Source precedes
name: high stale label does not beat low current one. Name
need not prove chronology, internal identity, or commit: reopened file must
pass existing full verifier, including prefix, pages,
keys, membership, uniqueness, and canonical-resident coverage.
If verification fails, startup fails even with another healthy file.
Without eligible footer, remains resident. Explicit selection continues
rejecting missing/invalid file and does not use search as fallback.

Observer: `:before-index-discovery`, one `:index-image-candidate` per canonical
name, `:index-image-discovered`, then existing adoption phases.
No public READY request admitted in callbacks. Resident state, source,
and revision reconfirmed after search. One local FD at a
time, closed on return, error, or nonlocal exit; final adoption uses
engine-owned slot and cleanup even if startup does not finish.
Exclusive directory keeps namespace stable; reopened file
still reverified without trusting preceding probe.

<a id="budget-e-limiti"></a>

## Budgets and limits

Conservative reservation: `2*N*(4*255+16) + 1024*C + 65536 + 65535 + S*(F+6)`,
N maximum names, C maximum candidates, S page size, F cache frames.
Covers two string inventories at up to four bytes per character, references,
candidate transients/copies, and probe/verification buffers. No GC assumption between
probes. Quota concerns payloads, not total RSS: objects, headers,
GC, canonical scratch, and resident require separate controller reservation.

Loops bounded to N names, 16 characters per label, C probes with at most
one footer read, then one complete verification within max-visits/max-bytes.
Zero I/O calls for foreign names; no global sort, dataset bitmap,
scan of entire ineligible files, rename, or deletion. Selection
changes neither WAL, CONTROL, CSN, nor derivative files; durable data point
remains SEAL. Chosen root is no new durable catalog decision.

<a id="decisioni-e-revisione-c1"></a>

## C1 decisions and review

| Compound decision | Coverage |
|---|---|
| Valid name/candidate/payload limits | each domain false separately, inclusive limits, candidates > names |
| Name: string, 32 characters, prefix, suffix, hex | separate false cases, valid name, zeroes and hex endpoint |
| Geometry: minimum, alignment, maximum | empty, unaligned EOF above minimum, sparse over-maximum file; valid image |
| Priority: no selection or greater name | first selection, greater/lower labels, current selection below stale name |
| Source: RECOVERING, controller health, revision, exact identity | each separately mutated after search |
| CREATE/discovery and explicit/discovery | valid and exclusive combinations; errors before open |

Other choices single branches or verifiers already covered in reused
modules. Two C1 readings: source, filter, and full verification; then quotas, FDs,
callbacks, failure boundary, and Serie isolation. Twelve dedicated cases,
six v1/v2 SIGKILLs, and GET windows; [register and limits](../../spikes/results/2026-10-30-engine-image-discovery/report.md).

Not autonomous paged writer or beyond-RAM index. Delta not implicitly
enabled; first admitted write retires file. No catalog,
scheduler, RAM-based mode selection, automatic deletion, or concurrent
snapshot. SIGKILL does not qualify power loss.

Source/revision confirmation, RECOVERING state, and healthy controller
also checked before publication, after image-ready callback,
and after `:before-admission`, including explicit and resident paths.
Detected mutations prevent returning READY handle.
