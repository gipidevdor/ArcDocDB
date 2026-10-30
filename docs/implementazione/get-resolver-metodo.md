<a id="metodo-di-verifica-funzionale-resolver-closed-e-prove-outcome"></a>

# Functional verification method: CLOSED resolver and OUTCOME proofs

This campaign adds a first dedicated suite in
[`tests/get-resolver/`](../../tests/get-resolver/). Scope covers CLOSED map construction,
OUTCOME proof sorting and lookup, association with
prepared PUTs, and reading through public resolver APIs. The method
is written before execution. The integration ancestor is `4344d9e`;
freeze commits and outcomes will be recorded in native evidence.

<a id="oracoli-e-casi-fissati"></a>

## Oracles and fixed cases

The suite fixes 42 named tests: 8 for sorting/lookup, 13 for construction,
and 21 for reading. A test may exercise multiple formats, words, or APIs;
these iterations do not increase named-test count.

The fixture owns a real file, opened read-only by the product, a canonical
view, index, GET context, private output, and snapshot/EBR registries.
Header, frames, SEAL, and manifest are encoded byte for byte with independent
bitwise CRC32C. Encoders come from directory support,
with attribution in source; they do not call the product writer or codecs
to generate expected data. The manifest is interpreted by the public API
before map construction. The fixture retains offsets, lengths,
TXIDs, CSNs, and expected values separately from resolver-built structures.

Formats are v1 and v2, with 16-byte keys. TXIDs and CSNs cross the
`2^32` boundary and reach maximum u64. Physical OUTCOME order may
differ from TXID order. Cases include zero, one, and multiple proofs,
stable identical duplicates, and mismatching CSNs separately in high
and low words. An OUTCOME before the PUT is corruption; a prepared record without proof
does not authorize a response. Invalid bytes after the CLOSED frontier
must be neither read nor interpreted.

Array budget is checked at exact limit and one byte below:
`24P + 20O` for O ≤ 1, `24P + 40O + 1024` for O ≥ 2. Permanent payload
remains `24P`. Reusing the source buffer after construction must not
alter the map. These figures describe array payload, not RSS,
observed allocations, or GC behavior.

Internal serial tests use explicit tuples (TXID, CSN, offset), without
product sorting or lookup in the oracle. They exercise all eight
radix digits, high/low boundaries, first duplicate proof, boundary misses,
physical order, and wrong-geometry rejection before effects.
Internal access is declared as verification of local contracts;
it does not replace cases through `crea-mappa-segmento-get`.

Reads use `risolvi-candidato-get`, `sonda-cache-risolta-get`, and
`leggi-record-risolto-get` after `avvia-get`. The I/O observer records FD,
offset, and quantity: resolve/probe do not read; cold prepared reads the first
proof then PUT; warm prepared rereads proof even on cache hit.
Errors authorize no output. Provisional copy, completion with fresh time,
sentinels, GET pins, and EBR announcement are explicitly verified.
Fault injections concern only fixture resources and are
documented in tests; cleanup must precede file reuse and closure.

<a id="esecuzione-e-conservazione"></a>

## Execution and preservation

Before each group, commit sources, tests, tools, and this
method. None of these files changes while the group runs.
Commands are wrapped by `tools/record-command.lisp`: they preserve argv,
environment, commit, working tree, inventory/hashes before and after, stdout,
stderr, and exit code even on error. A group with changed sources is not
accepted. A correction requires a new freeze; previous tests
remain preserved and attributed to their commit.

Full local verification is `make check`. Separate coverage uses
[`get-resolver-coverage.lisp`](../../tools/get-resolver-coverage.lisp),
loads the test system without invoking its `test-op`, and runs only
this suite. It reports the seven CLOSED files (package, types, scan, sort,
rows, build, read), with per-file counts, raw state, and HTML. The six
ACTIVE files are excluded from the local report. SB-COVER expressions and branches are
diagnostic; they are not MC/DC evidence.

Before the pull request, warning-free compilation, full regression,
static checks, traceability, links, and evidence verification must pass.
CI repeats checks on Linux and macOS, retains artifacts,
and checks documents separately. Records are read as data
through `tools/evidence-storage.lisp`; reports, coverage state,
and FASLs are not loaded as code. Publication retains complete
groups, raw outputs, errors, and original LEAF catalogs, including raw FASLs.

<a id="limiti-delle-conclusioni"></a>

## Limits of conclusions

No performance or allocation measurements and no mutants in
this campaign. Independent review includes fixtures, oracles,
diff, and results, separate from the author. The suite does not close C1 qualification,
MC/DC, requirements, or Phase 0. ACTIVE, EDIT proofs, history,
mixed directory, rotation/reclamation, scheduler, and server integration remain outside scope.
