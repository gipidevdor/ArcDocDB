<a id="spk-07--modelli-eseguibili-dei-protocolli"></a>

# SPK-07 — Executable protocol models

> **Proposed** — Phase-0 experiment; no engine component is implemented here.

<a id="domanda-e-metodo"></a>

## Question and method

Do protocols preserve data and visibility in the small explored states, including
when the process stops between steps? A Common Lisp explorer visits distinct states
breadth-first and retains the shortest path to a violation. Transitions are pure;
state limit is explicit. The oracle reads durable facts separately from process actions.

Models: horizon ring, multiseries decision and rotation, EDIT and reclaim,
snapshot registration, seqlock, batches and durable frontier, tombstones and
order-independent reconstruction. Defective variants are negative controls:
the suite must find a counterexample or fail.

The suite also integrates six modules with preregistered methods:
[publication](metodo-pubblicazione.md), [expiration](metodo-scadenza.md),
[compaction with ACTIVE writer](metodo-compaction.md),
[barrier observation orders](metodo-memoria.md),
[two readers and two slots in SC](metodo-seqlock-readers.md), and
[byte-level crashes with batch verifier](metodo-byte-crash.md).

<a id="esecuzione"></a>

## Execution

```bash
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --check SPK-07
```

Code compiled with `safety 3`; warnings and style-warnings stop execution.
Harness retains a schema-1 plist with command, environment, revision,
before/after source hashes, decoded results, original output, and failures.
Result contains counts, model sizes, and counterexamples. No randomness;
orders do not depend on clock. Compiled files go to Git-ignored `out/`.
An individual test uses `run-module.lisp nome-modello` through
`tools/record-command.lisp`, as described in the barrier method.

<a id="limiti-dichiarati-prima-dellesecuzione"></a>

## Limits declared before execution

- Atomic transitions and sequentially consistent memory are model assumptions;
  this is not a proof of ARM64 barriers or SBCL machine code.
- Base-model batches are logical entities with validity already determined.
  Byte extension uses real verifier on independent fixtures; acknowledged frontier
  is an explicit external fact, not an algorithm discovering it after damage.
- Two participants, one transfer, two snapshot versions, and finite CSNs;
  result does not prove arbitrary configurations.
- Scenarios correspond abstractly to FI-01…FI-13; they replace neither engine
  fault injection nor real filesystem crashes.
- Phase-0 gate remains open: a complete architectural weak-memory model with
  multiple readers/slots is missing; real-file crashes, full format coverage,
  and engine fault injection remain pending. Publication, expiration, ACTIVE
  writer, bytes, and SC readers are covered only in their methods' finite domains.
- Base tombstone model assumes an exact filter without false negatives and keeps
  no active snapshots; compaction extension adds one snapshot and conservative
  ‘possibly’ filter without proving concrete MERGE admission policy.

<a id="ambiente-e-risultato"></a>

## Environment and result

Run on 2026-10-08, Apple M4, 16 GiB, macOS/Darwin 27.0.0 ARM64, SBCL 2.6.9
GENCGC. Command above; no seed, no random choices.

| Correct model | Distinct states | Transitions |
|---|---|---|
| Horizon, pending registry, up to 6 CSNs / capacity 2 | 43 | 72 |
| Multiseries, 2 participants | 59 | 114 |
| EDIT and reclaim, 2 references | 19 | 28 |
| Seqlock, 2 fields and 1 update | 127 | 164 |
| Snapshot registration, 1 replacement | 28 | 34 |

Other enumerations: 85 unsynchronized-persistence combinations, 2 corruptions
witnessed by a later SEAL, 2,256 compaction/rebuild orders over four records,
25 reconciliation/recovery cases. No violations in correct models.
These counts are not engine-code coverage.

**Defect found in design:** ADR-0038's ring model produces `H=4` after five
already completed commits; reproducible path is retained in `check` output and
[ADR-0046](../../docs/adr/0046-orizzonte-con-registro-limitato.md). The registry of actual
pending commits passes the model; distance-based alternative passes 23 states and
32 transitions but consumes its window for already finished commits too.

Three additional negative controls detected: forgetting decision before durable
outcomes, reclaim with active references, read without seqlock validation.
Registration without publishing threshold also loses a snapshot's needed version.
Positive results depend on assumptions declared above.

<a id="estensione-dei-modelli--2026-10-08"></a>

## Model extensions — 2026-10-08

| Module | Observed exploration | Negative controls detected |
|---|---|---:|
| Publication | 25 explorations, 64,316 total states, 110,401 transitions | 6 |
| Expiration | 2 correct graphs, 67,558 states, 256,971 transitions; 14 positive witnesses | 5 |
| Compaction with ACTIVE writer | 98 correct graphs, 7,994 states, 16,952 transitions; 11,592 crash projections | 8 |
| Observed barrier orders | 280 correct orders; 840 orders per each of four mutants | 4 |
| Two readers / two slots, SC | 8 correct graphs, 28,434 states, 65,096 edges; 192 positive witnesses | 28 |
| Byte-level crashes v1/v2 | 49,120 cases, 655,997 recoveries, 303,432 interruptions/restarts; inputs unchanged | 3 |

Publication also retains three explorations of generation-mutant histories and
four reachability witnesses. Omitting root recheck violates generation contract
in the model, but explored histories remain linearizable: result does not claim
loss of linearizability.

Expiration distinguishes snapshot pins from already admitted accesses' epochs.
All 67,507 lifetime-graph states have an abstract path to a terminal; this is not
a time bound for a blocked reader. Compaction compares latest and historical
results with independent committed history; crashes are logical projections,
not real filesystem stops.

Normative tensions around INV-I1/ADR-0043, reclaim delay with a blocked reader in
ADR-0016, and MERGE admission with snapshots are declared in methods. These spikes
change no engine decisions or requirements. Tests, failed attempts, and limits are
retained in the [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/catalogo.lisp).

The [final integrated campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-final-spikes-check.lisp)
verifies commit `8e4f98f` in a clean checkout and retains decoded results of all
seven spikes then registered. `make check` also passes 26 foundation tests,
warning-free compilation, lint, traceability, links, and catalog; the
[command record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-final-verification.lisp)
retains original output. No engine requirement is promoted to verified based
solely on models.

The [new integrated verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/integrated-check.lisp)
includes six modules and SPK-08. Byte campaign also retains five semantic SEAL
checks with repaired CRCs and the unwitnessed-final-flush witness: identical bytes
can represent a tail or acknowledged damage depending on external frontier proof.
All attempts and limits are in the
[progress catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/catalogo.lisp).
