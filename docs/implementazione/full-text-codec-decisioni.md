<a id="codec-full-text--decisioni-e-due-letture"></a>

# Full-text codec — decisions and two readings

C1 scope: [codec and verified view](full-text-codec.md), under ADR-0054.
Two readings by the same author on October 16, 2026: neither independent review
nor complete C1 qualification. Diagnostic coverage and allocation tests are separate.

| Compound decision | Branches and tests |
|---|---|
| Public boundaries | Simple u8 buffer, span, and positive budgets before access; null, wrong types/ranges, and zero/insufficient budgets rejected |
| Cold descriptor | 16-byte identity, segment/source u64, bounded hint span and bitmap; META 1…65536, budget before copying |
| META | Definite minimal form; positive IDs, rows and PUTs equal authority; duplicate aliases/paths and IDs, backward order, unknown profile, and tail rejected |
| Configuration | Five positive limits, tokens within u32, paths 1…100; up to 16 fields and term capacity within scratch, with resource error distinct from corruption |
| Buffer aliases | Destination and input separate from META/identity/analysis scratch; destination separate from run; no mutable loan during view lifetime |
| Plan | Sums only within remainder; lengths and positions within capacity; output/work reserved before fill/copy/CRC |
| LENGTHS | Strict row/field order, zero reserved fields, declared field, row within bitmap and committed bit; per-document tokens and total sum checked |
| Run terms | Field/term ordered, rows and positions increasing; counters partition all sections and written-byte postconditions |
| External u64 | High/low words compared with maximum before reconstruction; UINT64_MAX references rejected without bignums on hot path |
| Owned segment ID | Integer boxed once in private descriptor cell; no raw u64 slot read to pass to frame. UINT64_MAX test unchanged after x86-64 CI failure |
| File META | Full comparison with authoritative canonical copy, beyond frame identity and CRC; configuration/hint cannot be replaced by a simple hash |
| DICT | Declared field and zero reserved field; positive length within limit and remainder; exact offset and first posting; strict order, at least one posting |
| Normalization | Input term within scratch, exactly one identical token; uppercase, multiple segments, punctuation only, and invalid UTF-8 rejected with correct CRC |
| Posting | Increasing row, positive frequency within remaining positions, LENGTHS present and exact first ordinal |
| Positions | Strict order, position < token-count, and previously unmarked bitmap; cross-term duplicates and gaps not certified |
| Query | Ready view/analysis, field/row within type, 1…256 tokens and known mode; saturation distinct from absence, no ordinal sum beyond u32 |

<a id="lettura-1-formato-e-failure"></a>

## Reading 1: format and failures

All widths and offsets reread against ADR-0054 and independent fixture.
Frame remains separate from full validator. Multiplications use counts
already bounded by sections/capacities; no external u64 reference used as
index before comparison with remainder. Frequency causes no allocation.
LENGTHS fixes bitmap prefixes: every position marked once; final
check verifies all required bits. CRC does not substitute for checks.

Errors and ownership reread: preflight rejections before bytes, internal failures without
rollback, reusable scratch, and analysis input released even on error. Descriptor
constructor copies supplied authority and cannot itself prove caller
replayed and verified hint. Type is not promoted to readiness proof.

<a id="lettura-2-concorrenza-lavoro-e-ambito"></a>

## Reading 2: concurrency, work, and scope

Dependencies reread: SEALED runs and immutable descriptors, one scratch
owner, views created only after verification; a view's buffer never rewritten. Queries
mutate only their private budget. No counter, lock, callback, or I/O between Serie.
Constructors and views allocate only on cold path; measurements exclude those openings.
Writer completion work reserved before first modification.
C4 test child waits have bounds and cleanup of owned processes only.

INV-I5 supported by binding to hint bytes and local ordinal verification,
but its overall proof requires verified hints/records and reanalysis.
INV-I4 and INV-I6 not closed by codec: publication, MVCC, inventory,
predecision reservations, and generation lifecycle missing. Complete MC/DC, fault injection
at worker boundaries, and load campaign remain open; negative tests and
local coverage are not presented as full engine qualification.
