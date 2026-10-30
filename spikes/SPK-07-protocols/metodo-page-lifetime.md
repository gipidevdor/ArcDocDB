<a id="m0--metodo-preregistrato-per-il-lifetime-dei-frame"></a>

# M0 — Preregistered frame-lifetime method

Date: 2026-10-22. Method precedes first execution of new model.
Class C4; no product cache code introduced or qualified.

<a id="ipotesi-e-oracolo"></a>

## Hypothesis and oracle

Explore all sequentially consistent interleavings of one fixed frame,
one/two readers with one private hazard slot each, and one/two reuses.
READY/RETIRING/BUILDING metadata, announcement, confirmation, and individual
reads/writes are separate atomic steps. Reclaimer scan reads one hazard per
step; not an atomic snapshot of whole registry. Contents have two fields
written/copied separately; logical incarnation is never recycled.

Reader reads identity, announces token, reconfirms READY/token, copies both
fields, clears announcement. Failed comparison completes attempt with MISS
without rereading contents. Reclaimer closes READY, scans slots, rewrites only
without matching protection. Late announcement after scan harmless because
reconfirmation fails.

Oracle, distinct from token, is logical incarnation observed at reader's first
step. Any copied field differing from it is violation. Private copy remains
verifiable after frame release/reuse too.

<a id="criteri-prima-dellesecuzione"></a>

## Criteria before execution

- No violation for 1 reader/1 reuse, 1/2, 2/1, 2/2.
- Hard limit 200,000 states per configuration: exhaustion is error.
- Reach witnesses of success, copy during RETIRING, reclaimer stopped by hazard,
  late announcement after closure.
- Every negative control must produce counterexample: no reconfirmation, release
  between copies, ignored scan, ABA with recycled token after two reuses.
  Retain path and failure state.
- Compile with safety 3/fatal warnings; run in SPK-07 suite too.

<a id="progresso-e-limiti"></a>

## Progress and limits

Reader has at most seven own steps, without loop or waiting for writer;
rank is 6 minus phase, with early completion on miss. This argument concerns
one attempt under SC and terminating abstract primitives. MISS does not prove
lookup or GET completion. A suspended reader with hazard may prevent frame
reuse, not other readers' steps. A finite fully protected cache may prevent loading.

Model proves neither ARM64/x86-64 memory model, SBCL realization of primitives,
absence of GC pauses, database linearizability, directory lookup, process budget,
snapshots, commit, nor I/O. Does not qualify product as lock-free.
Generation must exhaust without wrap; real comparison must include PageRef,
frame, generation, without ABA.

Pattern derives from Michael's hazard pointers, 2004:
[IBM publication](https://research.ibm.com/publications/hazard-pointers-safe-memory-reclamation-for-lock-free-objects).
Any product realization requires ADR and verification of
[SBCL primitives](https://www.sbcl.org/manual/#Atomic-Operations) and documented barriers.

<a id="conservazione"></a>

## Preservation

Record every execution, including failures, with `tools/record-command.lisp`.
No source changes during a run. Retain method, model, driver, original records
in fresh archive; results in separate document, without turning open gate into
engine qualification.
