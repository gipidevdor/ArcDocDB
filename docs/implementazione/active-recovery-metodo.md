<a id="recupero-del-vecchio-active-metodo-delle-prove-funzionali"></a>

# Recovery of the old ACTIVE: functional-test method

Method registered before runs for the
[`src/recovery-active/`](../../src/recovery-active/) module, already described in
[active-recuperato.md](active-recuperato.md). The increment adds a dedicated
suite; it uses existing readers, decoders, and publishers.

The current suite is in `tests/recovery-active-checkpoint/`, in package
`arcdocdb.recovery.active.checkpoint.tests`. The first freeze,
`b92c1a25619279f1d4e1244fc970b3829c0ecca4`, and its preserved tests
used `tests/recovery-active/` and `arcdocdb.recovery.active.tests`.
Later integration of a separate campaign on `main` required
isolating this suite: the 27 test names and bodies remain unchanged.
CI for the new commit verifies both suites together.

<a id="autorità-e-risorse"></a>

## Authority and resources

Every fixture owns an exclusive temporary namespace, native files,
capabilities, observed backend, and private scratch. The old `control.log` is
read through `leggi-control-recuperato`; its manifest identifies the
old ACTIVE. The segment is read through its own read-only FD, separate from the
control log. EOF and physical identity come from the FD held stable.

The DECISION table is rebuilt by the public decoder from a complete log
declared by the fixture, with participants and results known before
encoding. No manually constructed private table or NIL shortcut
for absence of decisions is used. Completeness and membership in the
same Archivio remain controller preconditions: the test does not implement
the Archivio log reader or exclusion of other processes.

The campaign exercises the `leggi-active-recuperato` entry point with a bare table.
The `leggi-active-con-decisioni` entry point, introduced later in the
[Archivio reader](decisioni-recuperate.md), retains its own dedicated qualification
separate from these cases.

Little-endian packing, bitwise CRC, fixture records, and SEALs are
independent of product encoders. Offsets, expected prefix, counts,
and TXID/CSN pairs are declared fixture facts. Real factories
construct product wrappers; no result is forged.

<a id="casi-e-oracoli"></a>

## Cases and oracles

Every functional case separately exercises v1 and v2:

- header-only and ordinary PUT/tombstone batches;
- prepared with local OUTCOME, matching or absent DECISION; DECISION
  without OUTCOME; absence of both and presumed abort;
- present zero CSN, high u64 TXID/CSN, identical duplicate OUTCOMEs, and
  OUTCOME without prepared in the segment;
- contradictions between participants, CSNs, duplicates, and batches; prepared after
  OUTCOME; exact and insufficient budgets;
- complete prefix, preserved unsealed tail, and corruption attested
  by a later durable SEAL;
- public queries and CLOSED serializer: derived outcomes only, ordered TXIDs,
  size `20 + 16 × E`, offsets, and sentinels around the range;
- closure into a complete checkpoint, publication through the single
  publisher, and reopening the new control log; P/outcome rejections
  and capability closed before claim.

`esito-chiusura-active = NIL/0` indicates absence of a **derived outcome to
preserve**; an already-local OUTCOME may yield the same answer. Statistics
verify `prepared = locali + derivati + abort`, distinguishing
physical records from distinct transaction identifiers.

No append, flush, rename, or close may occur during reading.
Before/after observations include bytes, EOF, inode, offsets, and capability
frontiers. After the result, scratch may be overwritten to
verify that queries and serializer do not borrow it. Native resources
remain open until exclusive fixture cleanup.

The new publication check precedes claim: rejection leaves
the publisher prepared and the authoritative name unchanged. Success follows
atomic rename and parent fsync; reopening verifies the
manifest actually named. Generic publisher tests remain
separate from the new ACTIVE connection tests.

<a id="esecuzione-e-conservazione"></a>

## Execution and preservation

Authors work on separate files and reread code before
runs. Sources and method are frozen in a commit. Full verification
uses `make check`, which preserves environment, command, sources before
and after, outcome, and original output even on failure. Sources remain
unchanged during the process. CI repeats verification on Linux and macOS.
Every subsequent correction belongs to a new commit and preserves the
previous attempt.

Cited evidence is preserved in the catalog with original registers;
it is read as data, with `*read-eval* NIL`, without loading reports or FASLs.
Copying and preservation precede worktree cleanup.

Affected requirements: REQ-REC-001, REQ-REC-002, REQ-STO-003, REQ-TXM-005,
REQ-TXM-007, REQ-FOR-001, REQ-FOR-003, REQ-AFF-001, REQ-AFF-002,
REQ-AFF-008, REQ-AFF-009, REQ-AFF-018, and REQ-VAL-001. Local decisions
ARV-D01…D14 are a reference for cases; this functional campaign does not
attest MC/DC or full C1 qualification. It measures no performance or heap allocation and does not
rebuild the primary index, CSN horizon, inventory, or admission gate.
