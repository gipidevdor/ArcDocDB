<a id="nucleo-full-text"></a>

# Full-text core

Implementation authorized by author on October 16, 2026, under
[ADR-0053](../adr/0053-ricerca-full-text-indici-invertiti.md) and
[ADR-0054](../adr/0054-contratto-e-formato-full-text.md).
Unicode analyzer, in-memory positional inverted run, and binary index
frame available. Later [complete codec](full-text-codec.md) adds
section serialization and queries on verified views. Serie search with commits, snapshots,
generation catalog, and full persistence remains to integrate.
REQ-SEC-003…REQ-SEC-010 remain **designed** within their overall scope.

| Product component | Available | Boundary |
|---|---|---|
| `arcdocdb.fulltext.analysis` | Strict UTF-8, NFC, full case fold, NFC, Word_Break, and L/N filter | One scalar field at a time; CBOR path extraction later |
| `arcdocdb.fulltext.index` | Run ordered by field/term/row/position; `all`, `any`, phrase | Row identifies a local version, does not certify commit or MVCC visibility |
| `arcdocdb.fulltext.format` | Header, directory, padding, footer, and CRC for `.idx` v2/type 5 | META, dictionary, postings, hints, and coverage not validated by this API |
| `arcdocdb.fulltext.codec` | [Six complete sections and verified search view](full-text-codec.md) | Hint/decision authority supplied by caller; publication/MVCC still to integrate |

NNTP server remains a future application. Core can separately index
article subject and body without knowledge of MIME, groups, or NNTP commands.

<a id="analisi-e-proprieta-dei-buffer"></a>

## Analysis and buffer ownership

`crea-spazio-full-text` allocates only during worker configuration. Limits
`:max-scalars`, `:max-tokens`, `:token-bytes` determine private specialized arrays;
`:max-memory` checks their payload plus conservative 4096-byte overhead.
It does not measure whole-process or shared-table consumption.

`inizia-analisi-full-text(space, input, start, end)` borrows immutable UTF-8
span and invalidates previous results. Per-operation limits are
`:max-term-bytes`, `:max-tokens`, `:max-work`; token limit must fit
scratch. Capacities do not grow automatically. Span limited to 16 MiB.
A new start during active analysis is rejected without overwriting it.

`passo-analisi-full-text(space, quantum)` performs at most 1…65536 steps and returns
`:running` or `:done`. Quantum counts state steps; lookups, expansions, and bytes
also consume work budget. Combining-mark reordering makes at most
one swap per step, avoiding an indivisible quadratic loop. Decomposition
has a fixed 64-scalar stack; Hangul uses algorithmic decomposition/composition.

`risultati-analisi-full-text` returns five values only after `:done`:
UTF-8 term buffer, start array, end array, token count,
bytes used. Position is token index, from zero. Ranges exclude
separators and remain valid until next start on same space. They are not
Lisp strings allocated per word. Empty input or input without letters/numbers produces zero tokens.

Profile is exactly `unicode-word-18.0.0-v1`; independent of SBCL tables.
[UCD data and licenses](../../data/unicode/18.0.0/README.md) versioned with
SHA256; Common Lisp generator checked for reproducibility in `make check`.
Exhausted budget or Unicode error moves analysis to `:failed`, releases input,
and makes partial results inaccessible. New analysis can reuse scratch.

<a id="run-invertito-in-memoria"></a>

## In-memory inverted run

`crea-indice-posizionale` preallocates capacity for occurrences, bytes, and present fields.
Each occurrence uses five `u32` words: field, row, position, term offset and length.
Terms in byte buffer; field lengths in separate `u32` triples.
This internal layout is not `.idx`'s serialized DICT/POSTINGS/LENGTHS layout.

`inizia-campo-full-text(run, row, field, analysis)` accepts `:done` analysis,
`row u32`, and `field` from 1 to 65535. Fields must arrive in strict
`(row, field)` order: duplicate same row/field and backward order are errors.
Capacity for all tokens, bytes, and field length checked
before transition to `:copying`. Present empty string records length zero;
for an absent field, this function is not called.

Caller keeps analysis space exclusive until `passo-indice-posizionale(run, quantum)`
returns `:building`. Copy proceeds by bytes and records;
then space may be reused for next field.
`sigilla-indice-posizionale` starts in-place heapsort, with configured maximum work
including copying. One step repairs a subtree at most 32 deep;
each comparison counts all examined bytes. Step cost also depends on term
length, bounded during analysis. An error during copy/sort leaves
run `:failed` and releases scratch loan; that run cannot be queried.

After `:sealed`, run immutable and readable by multiple workers. No lock,
per-document global state, or shared counter updated by readers.
Owner keeps run alive throughout read; connection to EBR and
Serie generations is a later step.

`corrisponde-riga-full-text(run, row, field, query, mode)` accepts complete analysis
with 1…256 tokens and `mode` equal to `:all`, `:any`, or `:phrase`. Search uses binary
bounds on ordered occurrences; phrase checks consecutive positions in same
row and field, including repeated terms. Exclusive `query` budget
includes analysis and comparisons across all examined rows; saturation is an error,
never a negative result. Even searching an empty run consumes work.

Predicate does not enumerate document universe: `not`, structured filters,
ordering by `_id`, top-N, deduplication, and checking visible committed version
belong to Query Engine. A positive predicate result alone is not
a complete response to a Serie query.

<a id="cornice-binaria"></a>

## Binary frame

`scrivi-cornice-indice-full-text` receives buffer, span, Serie identity, segment-id, and
six lengths. Writes only header, directory, padding, and CRC after preflight;
payload and external bytes remain intact. Preflight rejection does not change destination.
`verifica-cornice-indice-full-text` returns file end and META span only after
CRC, identity, version, reserved fields, sizes, alignments, and contiguity checks.
Docstrings specify distinct conditions and reasons; internal inconsistencies
signal `invariant-violation` to future worker boundary.

Payload deliberately opaque to both functions. Correct CRC on meaningless META
or postings passes frame verification: dedicated test prevents
promoting this API to semantic validator. No file opened or published,
and no durable atomicity point exists here.

<a id="verifica"></a>

## Verification

`make test` compiles without warnings/style-warnings and includes first core's 24 tests,
plus 15 [complete-codec tests](full-text-codec.md#prove-e-confini-residui):

- 20,171 NFC rows, 100,855 comparisons; 1,944 Word_Break rows, 8,487 boundaries;
  1,606 C/F mappings and reading all 1,112,064 Unicode scalars.
- 115,200 positional-predicate comparisons with independent scan;
  repetitions, absent/empty field, distinct rows/versions, different quanta, and parallel readers.
- Independent wire fixture, all 3,168 bits and every sample-file truncation;
  corruption with recalculated CRC, reserved fields, offsets, identity, and section limits.
- Saturation of work, scalars, bytes, tokens, and run capacity; scratch reuse
  after error and destination immutability on preflight rejection.
- After warmup: zero bytes consed for 1000 analyses with phrase search and
  1000 writes with frame verification, on SBCL 2.6.9 arm64 with safety 3.

`make fulltext-check` also verifies tools and introduces four temporary semantic
mutants in a test process: NFC without composition, boundary everywhere,
phrase always accepted, and unverified header. All must be detected; original
functions restored. Codec adds two further mutants and a reopen test
in separate processes. This is not an exhaustive mutation campaign.
The [decision review](full-text-decisioni.md) records both core readings.
Diagnostic coverage separate from allocation measurements:

```sh
sbcl --script tools/fulltext-qualification.lisp --coverage spikes/out/fulltext-coverage-R1/
make check
```

Tests described here do not yet qualify pre-SEAL/PREPARE admission,
publication before H/ACK, concurrent build,
generation recovery, or MVCC search. These are later connections
planned by the [full-text contract](../full-text.md).
