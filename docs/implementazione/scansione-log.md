<a id="scansione-dei-log"></a>

# Log scanning

In-memory scanning of sealed batches from writer segments, control logs,
and `multiserie.log`, under [ADR-0037](../adr/0037-lotto-sigillato.md).
The [`src/recovery/`](../../src/recovery/) module verifies the usable prefix
and distinguishes an incomplete tail from corruption witnessed by a later SEAL.

<a id="contratto-e-responsabilità"></a>

## Contract and responsibilities

`arcdocdb.recovery.scan:scansiona-log` receives a stable byte vector,
a `[start,end)` interval, the file identifier, and the version already verified
from the header. `start` identifies the first batch after the header or an
already verified authoritative boundary; `file-offset` is the file position
of `buffer[0]`. For control log and multiserie, file-id is zero.

The caller supplies `file-size` from an authoritative source and guarantees
that the buffer reaches stable physical EOF: `file-offset + end = file-size`.
A partial window does not authorize final tail classification.
A length declared in data does not substitute for physical file size.
This first API is not a streaming scan.

| Outcome | Result |
|---|---|
| All batches pass frame and SEAL verification | End of prefix, `:complete`, batch and record counts |
| First invalid batch without a later durable witness | Start of that batch, `:tail`, prefix counts only |
| Later SEAL with durable frontier beyond the invalid batch's start | `log-corruption` condition, without applying a prefix |
| Invalid/exhausted input, format, or budget | Typed error; no tail classification |

The returned boundary is a **buffer** offset. The corruption condition
also reports absolute offsets of the first invalid batch and witness SEAL,
its frontier, and the reason for the first error. The module does not apply
records, publish data, open files, or modify the buffer.
Transition to `FAULTED`, event recording, and any closing of the old ACTIVE
remain the log owner's responsibility. No truncation.

<a id="prefisso-e-risincronizzazione"></a>

## Prefix and resynchronization

The contiguous prefix uses the batch checker from the
[binary foundations](fondazioni-binarie.md). A batch is usable only in its
entirety: point `P` is its **start**, even if the error concerns an internal
record. Simply finding a valid record is insufficient to declare corruption.

The prefix verifies frames, allowed types, CRC, stamp, and SEAL. Complete
EDIT/DECISION payload verification and application belong to subsequent
layers: `:complete` does not certify those metadata semantics.

From `P`, the search advances one byte at a time, without jumps based on
corrupt lengths. Every SEAL candidate has a fixed size of 56 bytes; the codec
checks header and body CRC, type, flags, key, and length. It also checks
file-id, batch start within the record area and no later than the SEAL
position, and durable frontier no later than the declared batch start.
A witness with `D > P` signals corruption; with `D = P`, search continues.
Even after an intact candidate, it advances only one byte.

> **Proposal** — After damage, the actual batch boundary declared by a SEAL
> cannot always be reconstructed. Resynchronization therefore uses conservative
> evidence from CRC, identity, and plausible positions. It does not require
> the witness batch to be intact: its body could be damaged along with the
> first batch. A false SEAL can reject opening, as specified by ADR-0037;
> it never authorizes replay of records beyond `P` or their deletion.

<a id="budget-e-parallelismo"></a>

## Budgets and parallelism

> **Proposal** — Defaults are 64 MiB per interval and per batch, 65,536
> batches, 65,536 records per batch, and 64 MiB of resynchronization positions.
> These are configurable operating budgets, distinct from persistent file limits.

Search exhaustion is not converted into a tail. The search budget counts
possible candidate starting positions; a tail shorter than 56 bytes cannot
contain a complete SEAL. Offset sums are checked in the u64 domain before
starting. Work is bounded by the interval, batch budgets, and positions
actually examined.

Scanning belongs to opening/recovery, not the GET path.
It does not promise absence of allocation: errors create conditions and
inspection of u64 integers may materialize bignums. It introduces no mutable
state, lock, wait, or shared counter between Serie. Each scan reads its
own buffer; the caller keeps it stable.

<a id="verifica-e-limiti"></a>

## Verification and limits

Tests in [`tests/recovery/`](../../tests/recovery/) exercise both versions
and all three log types, truncations, corruption, frontiers before/equal to/after
`P`, identities and offsets, budgets, incomplete inputs, and buffer immutability.
The [decision table](scansione-log-decisioni.md) links checks to regression cases.

Two additional tests alter one bit at a time in every byte of three batches,
for all three log types and both versions: 13,504 cases before a subsequent
witness and 6,752 in the final batch, 20,256 total. Fixtures use bytewise
packing and bitwise CRC independent of the product; they check classification,
boundary, counts, and buffer immutability. One further case constructs two
intact overlapping SEALs: an inconclusive candidate must not skip the next
one. There are 19 recovery tests in total.

The [verification records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-recovery/catalogo.lisp)
retain commands, environment, source hashes, output, and failed attempts.
Targeted campaigns introduce nine defects in boundaries, witness identity,
positions, EOF, and budgets. The `sb-cover` measurement also retains the raw
denominator and is not equivalent to MC/DC coverage. Checks are reproducible
from a stable repository copy:

```sh
make check
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-mutation.lisp --self-test
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-mutation.lisp --run spikes/out/recovery-mutants/ recovery
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-coverage.lisp --self-test spikes/out/recovery-coverage-self-test/
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-coverage.lisp --report spikes/out/recovery-coverage/ recovery
```

The mutant directory must be new. Coverage and mutations run separately,
without modifying product sources.

Requirements: REQ-FOR-001/003, REQ-AFF-008/009/017. Affected invariants:
INV-F1/F2/F3, INV-A4/A8/A9, INV-P6, and INV-X3. No engine requirement is
promoted to verified solely on the evidence of this scan.

The limitation stated in ADR-0037 remains: damage in the last flush,
without a later SEAL witnessing it, may be indistinguishable from a tail.
CRC32C has collisions and does not authenticate data. In-memory tests do
not verify I/O, complete recovery, payload semantics, manifest, multiserie
decisions, or health transitions. No release gate is closed here.
