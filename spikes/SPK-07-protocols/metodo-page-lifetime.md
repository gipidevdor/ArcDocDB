<a id="m0--metodo-preregistrato-per-il-lifetime-dei-frame"></a>

# M0 — Preregistered frame-lifetime method

Date: 2026-10-22. The method precedes the first execution of the new model.
Class C4; no product cache code is introduced or qualified.

<a id="ipotesi-e-oracolo"></a>

## Hypothesis and oracle

Explore all sequentially consistent interleavings of one fixed frame,
one/two readers with one private hazard slot each, and one/two reuses.
READY/RETIRING/BUILDING metadata, announcement, confirmation, and individual
reads/writes are separate atomic steps. The reclaimer scan reads one hazard per
step; it is not an atomic snapshot of the whole registry. Contents have two fields
written/copied separately; logical incarnation is never recycled.

The reader reads identity, announces a token, reconfirms READY/token, copies both
fields, and clears the announcement. A failed comparison completes the attempt with MISS
without rereading contents. The reclaimer closes READY, scans slots, and rewrites only
without matching protection. A late announcement after the scan is harmless because
reconfirmation fails.

The oracle, distinct from the token, is the logical incarnation observed at the reader's first
step. Any copied field differing from it is a violation. The private copy remains
verifiable after frame release/reuse too.

<a id="criteri-prima-dellesecuzione"></a>

## Criteria before execution

- No violation for 1 reader/1 reuse, 1/2, 2/1, 2/2.
- Hard limit 200,000 states per configuration: exhaustion is an error.
- Reach witnesses of success, copy during RETIRING, reclaimer stopped by hazard,
  late announcement after closure.
- Every negative control must produce a counterexample: no reconfirmation, release
  between copies, ignored scan, ABA with recycled token after two reuses.
  Retain the path and failure state.
- Compile with safety 3/fatal warnings; run in SPK-07 suite too.

<a id="progresso-e-limiti"></a>

## Progress and limits

The reader has at most seven of its own steps, without a loop or waiting for the writer;
rank is 6 minus phase, with early completion on miss. This argument concerns
one attempt under SC and terminating abstract primitives. MISS does not prove
lookup or GET completion. A suspended reader with a hazard may prevent frame
reuse, not other readers' steps. A finite fully protected cache may prevent loading.

The model proves neither ARM64/x86-64 memory model, SBCL realization of primitives,
absence of GC pauses, database linearizability, directory lookup, process budget,
snapshots, commit, nor I/O. It does not qualify the product as lock-free.
Generation must exhaust without wrap; real comparison must include PageRef,
frame, generation, without ABA.

The pattern derives from Michael's hazard pointers, 2004:
[IBM publication](https://research.ibm.com/publications/hazard-pointers-safe-memory-reclamation-for-lock-free-objects).
Any product realization requires an ADR and verification of
[SBCL primitives](https://www.sbcl.org/manual/#Atomic-Operations) and documented barriers.

<a id="conservazione"></a>

## Preservation

Record every execution, including failures, with `tools/record-command.lisp`.
No source changes during a run. Retain method, model, driver, original records
in a fresh archive; put results in a separate document, without turning an open gate into
engine qualification.
