<a id="lavorare-nel-repository"></a>

# Working in the repository

[Contributing](../CONTRIBUTING.md) · [Implementation](implementazione/README.md)

<a id="fonti-e-stato"></a>
## Sources and status

The [source hierarchy and normative conventions](riferimenti.md#convenzioni)
define how to read the specification, ADRs, invariants and subject guides.
Identifiers are stable: retire them without renumbering them or deleting their history.

The [implementation guide](implementazione/README.md) describes the available M1
profile; the [roadmap](roadmap.md) records phase exit criteria. An implemented
component or a local measurement does not close a gate on its own.

<a id="regole"></a>
## Rules

- **Common Lisp/SBCL only**, including spikes; contribs are allowed, external
  dependencies are not: [ADR-0001](adr/0001-common-lisp-sbcl.md), [ADR-0027](adr/0027-dipendenze-e-test.md).
- **Integrity before performance.** Priorities, the fault model and claims that
  may be made follow [ADR-0031](adr/0031-software-critico-criteri-e-priorita.md)
  and the [assurance case](affidabilita/README.md).
- **Mandatory standard:** safety at least 2, no warnings or style warnings,
  no `ignore-errors`, `truly-the` or `eval`;
  see the [rules and checks](affidabilita/standard-di-codifica.md). Deviations require
  recording and approval in the [register](affidabilita/deviazioni.md).
- **Parallelism and atomicity:** Serie do not wait for one another;
  no new shared coordination without an ADR;
  one atomicity point per operation, prepare/decide/complete, and recovery
  without truncation or deletion based on absence. The
  [design laws](adr/0036-leggi-di-progetto.md) and [invariants](invarianti.md) apply.
- **Justified guarantees:** no probabilistic or timing argument may serve as a guarantee.
  For concurrency and progress, state the scope actually demonstrated:
  [ADR-0032](adr/0032-seqlock-a-64-bit.md), [paged index](adr/0058-pagine-indice-primario.md).
- **Traceability:** requirements are in `tracciabilita/requisiti.lisp`, with `;;; REQ:`
  references in code and IDs in tests. After a relevant change, run `make trace-write`
  and `make trace`; the [matrix](tracciabilita/matrice.md) is generated.
- **Reproducible evidence:** record the command, environment, revision, source hashes,
  parameters, results, limits and failures according to the
  [evidence register](valutazione/registro-delle-prove.md).
  Publish summaries and hashes in the repository; large raw data follows the
  [external retention procedure](../spikes/evidence/README.md).

<a id="dove-intervenire"></a>
## Where to work

| Path | Contents |
|---|---|
| `src/`, `tests/` | Product and contract verification |
| `tools/` | C4 tools in Common Lisp |
| `spikes/` | Disposable experiments with a question, method and commands |
| `docs/` | Specifications, decisions, implementation and evaluation |

A requirement change starts in the specification or an ADR that amends it and
propagates to invariants and documents in the same commit. An accepted ADR remains
unchanged in meaning; a resolved question retains its decision reference.

Write it once using the best known solution: the
[engineering principles](principi-di-ingegneria.md) apply. Run `make check` before
publication, as specified in [Contributing](../CONTRIBUTING.md).
