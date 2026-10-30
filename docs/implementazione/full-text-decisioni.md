<a id="full-text--revisione-del-nucleo-e-decisioni"></a>

# Full text — core review and decisions

Scope: [analyzer, positional run, and frame](full-text.md).
Class C1 for frame; C2 for analysis and run predicates.
Both readings dated October 16, 2026 are reviews by the change's own author,
not independent review or complete-engine qualification.

<a id="decisioni-composte-della-cornice-c1"></a>

## C1 frame compound decisions

Internal assertions are always active; when core is connected to a worker,
that boundary must convert `invariant-violation` into Serie fail-stop.
Public-rejection tests check condition, reason, and byte preservation.

| Function / decision | Conditions and coverage |
|---|---|
| `controlla-input-cornice`: range | Simple u8 array, start/end index, start <= end <= length; nil buffer, negative start, end beyond buffer, and reversed range, besides valid unaligned spans |
| Same: identity and budget | 16-byte u8 identity; positive index budget; short/nil identity, zero/text budget and valid cases; out-of-u64 segment-id rejected |
| `controlla-lunghezze-cornice`: layout | Six-element u64 array, META 1..65536, minimum size, divisibility, and capacity of every section; generic vector, META zero/65537, incorrect width, insufficient capacity, and huge u64 |
| Same: alignment/end | Padding within capacity and exact final cursor; fixture with empty sections, padding, and maximum META; incompatible final size rejected |
| `scrivi-cornice-indice-full-text` | Input and capacity checked before any write; buffer/identity without alias; file budget below, equal to, and above span |
| `verifica-header-full-text`: CRC/magic/version/kind | All sample bits; alterations with recalculated CRC; unknown version distinct from corrupted content |
| Same: count/flags/reserved | Count 6, zero flags, zero reserved checked even outside header CRC coverage; each altered separately |
| Same: size and directory | Exact size and directory offset 64; separate alteration with correct CRC |
| Same: segment and Serie | U64 compared without reassembling bignum; bytewise identity; swapped segment/Serie rejected |
| `verifica-entry-full-text`: fields | Exact ordinal type, zero flags and reserved; each field altered for every one of six entries |
| Same: range | Expected offset and length <= remainder; altered offsets, huge u64 length, fixed widths, and zero META, besides valid fixtures |
| `verifica-directory-full-text` | Alignment within footer and all padding bytes zero; altered padding with correct CRC, empty sections, and no tail allowed |
| Reader API: complete frame | Minimum span before reads; budget before content; header before footer; directory before returning META span |
| Internal header/directory/entry guards | Range and postconditions separate from wire rejections; fail-stop branches not all declared covered by public cases |

Postcondition assertions neither write nor repair data. SB-COVER coverage
is diagnostic: unreached internal guards, compound decisions, and extreme
limits do not become qualified merely because all tests pass.

<a id="lettura-1--formato-invarianti-ed-errori"></a>

## Reading 1 — format, invariants, and errors

Offsets and widths reread against ADR-0054: header 64, directory 144, six sections starting at
208, four-byte footer; header CRC excluded from its own span and final CRC from 64.
No external field becomes a Lisp object or path. Length sums
only after comparing with remainder; padding calculated within capacity; u64
identifiers without lossy conversion. Writer preflight before destination mutation.
Oracle fixture and CRC constructed separately from product.

Layout check does not yet establish INV-I5: META, comparison with
authoritative descriptor and hint, dictionary/position/length validation missing.
Test `REQ-SEC-008-NO-SEMANTIC-PROMOTION` makes this limit observable.

<a id="lettura-2--ownership-lavoro-e-risultati"></a>

## Reading 2 — ownership, work, and results

Transitions reread: analysis `idle/done/failed -> decode -> … -> done/failed`;
run `building -> copying -> building -> heap-build -> heap-sort -> sealed/failed`.
Partial analysis result inaccessible; unsealed run unsearchable.
Query changes only its own work counter. Unicode tables and sealed runs
shared read-only; no write between Serie per operation.

Memory limits precede constructor allocations. Run limits
precede scratch acquisition; analysis, comparison, copy, and sort limits
produce explicit errors. Phrases check positions and repetitions within same
row/field; component does not merge versions or check visibility by itself.
No I/O, commit, or durable cleanup introduced here; INV-I4/I6 still require
connection with writer and Query Engine. Allocation measurements and parallel tests
separate from instrumented coverage. Full repository check
recorded with source hashes, environment, stdout, stderr, and exit code.
