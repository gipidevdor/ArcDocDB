<a id="adr-0030--scope-della-v1"></a>

# ADR-0030 — v1 scope

- **Status:** Accepted by the author on 2026-10-08, including backup, verified restore, offline verifier, and scrubbing from the 2026-10-03 revision.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-23
- **References:** RSK-14

> **Extension approved on 2026-10-15:** [ADR-0053](0053-ricerca-full-text-indici-invertiti.md)
> adds full-text search to the v1 scope. The initial decision
> remains dated 2026-10-03; the extension is designed, to be implemented and qualified in phase 8.

<a id="decisione"></a>

## Decision

**In v1:** everything the specification describes — one process, one device, multiple
Archivi, Serie, local and multiseries transactions, snapshots, compaction, indexes, cache,
dynamic scheduler, recovery, observability, benchmarks, fault injection, protocol, and queries —
plus, for reliability ([ADR-0031](0031-software-critico-criteri-e-priorita.md)):

- **consistent backup and verified restore** (copying closed segments, control log, and hints at
  a CSN; immutable segments make it incremental);
- **offline verifier** `arcdocdb-verify` ([ADR-0033](0033-fail-stop-e-integrita-end-to-end.md) §7);
- continuous **scrubbing** of closed segments.

The updated scope also includes **full-text search** with dedicated inverted indexes
per segment, words and phrases, versioned analyzers, and structured filters in the same
snapshot view (ADR-0053). The NNTP server is a future reference application rather than a
new engine module.

Without a second copy of the data, losing the medium means losing the data (RSK-17):
backup is the minimum response.

**Outside v1**, without precluding it in the formats:

| Feature | Why deferred | What remains prepared |
|---|---|---|
| Segment mirroring to a second path (v1.1) | second defense against RSK-17; requires no consensus | immutable segments and the control log are already the copy unit |
| Replication between servers and high availability | requires a replication log and consensus | immutable segments and CSN are a natural basis for segment shipping |
| Authentication and authorization | — | versioned handshake in the protocol |
| Encryption in transit and at rest | — | the `io` module is the only write point |
| Record compression | must be measured | reserved flag in the record header |
| Multiple devices per server | — | a Serie's path is configurable in the catalog |

<a id="conseguenze"></a>

## Consequences

- Breadth (RSK-14) is limited to the specification and explicitly approved
  extensions, including full-text search; their costs and gates remain to be verified.
- Deferred features have a declared integration point: no format needs to be rewritten.
