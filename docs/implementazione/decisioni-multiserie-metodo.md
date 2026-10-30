<a id="metodo-di-verifica-della-tabella-delle-decisioni"></a>

# Decision-table verification method

Scope registered before campaigns: rebuild in memory the table
TXID → CSN and participant set from verified prefix of
`multiserie.log`, under [ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md).
Module does not apply records, modify logs, or decide catalog state.

<a id="contratti-da-verificare"></a>

## Contracts to verify

- Batch verifier and corruption search finish before
  returning any table. Only a successfully constructed table
  permits interpreting an absent TXID as presumed abort.
- Prefix contains only complete batches; incomplete tail adds no
  decisions. Malformed DECISION payload in prefix that passed frame
  and SEAL verification is semantic corruption, not a new
  tail to ignore. A frame below minimum length is instead a scanner
  error: tail without later witness, corruption with a later SEAL
  whose durable frontier covers invalid batch start.
- Each decision contains at least two distinct participants. Repeating the
  same TXID with identical CSN and participant set is idempotent;
  CSN or set changes are a declared conflict. Participant
  order does not change decision meaning.
- TXID and CSN are opaque u64s: no log order, positivity,
  or CSN uniqueness across different TXIDs imposed. Serie identifiers are
  compared across all 16 bytes.
- Table owns copied data. Changing source buffer after
  construction does not change queries; no internal vector
  is returned to caller.
- Budgets count records and participants read before coalescing
  duplicates. Exact limits accepted; overruns or invalid input produce
  typed errors and no partial result, even for an empty log.
- Queries check Serie ID range and length even when
  sought TXID does not exist. Outcomes include explicit presence,
  so zero CSN and absent decision remain distinguishable.

<a id="prove-e-oracoli"></a>

## Tests and oracles

Frame, payload, and SEAL fixtures with bytewise packing and bitwise CRC
independent of product codecs. Histories declared as data feed
a list-and-set oracle; comparison with table queries
for both format versions, arbitrary order, and nonzero offsets.
Generated-history seed is fixed and reported in test.

Truncation at every batch byte, corruption before witness SEAL,
insufficient search budget, semantically invalid payload with correct CRC
and SEAL, permuted and mismatching duplicates, identifiers with high
bits or last-byte differences, u64 endpoints, zero/exact and
exceeded budgets, source immutability, and result ownership.

Warning-free compilation, lint, traceability, and `make check`. Coverage
and mutation campaigns separate from ordinary tests; tool self-tests.
Records preserve commands, environment, before/after hashes, output, and failed
attempts. Two C1 readings check contracts and decision table.

Targeted campaign must detect every selected compilable mutant:
record/participant limits, CSN and whole-ID16 equality,
duplicate participants, and explicit query presence. Error before
test startup does not count as detection; noncompilable mutants
are corrected while preserving initial attempt.

<a id="limiti"></a>

## Limits

Open/recovery path: copies, sorting, and conditions may
allocate. No promise of zero heap allocation or database performance;
no I/O benchmark inferred from these in-memory tests.
Caller verifies log header and stable physical size.
Catalog, manifest, prepared resolution/application, compaction,
flush, and recovery atomicity point remain separate modules.
Local tests close neither an engine-qualification gate nor MC/DC.
