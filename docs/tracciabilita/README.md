<a id="tracciabilità"></a>

# Traceability

[Documentation](../README.md) · [Reliability](../affidabilita/README.md) · [Decisions](../adr/README.md)

Traceability is **bidirectional and checked by a tool**
([ADR-0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), INV-A5).

```
specification / ADR  →  REQ-…  →  invariants, ADR, class  →  code (;;; REQ:) → test → outcome
                      ▲                                                          │
                      └──────────────  generated matrix, `make trace`  ◀─────────┘
```

<a id="file"></a>

## Files

| File | Contents |
|---|---|
| [requisiti.lisp](requisiti.lisp) | requirements as data: source, statement, class, invariants, ADRs, verification methods, FI scenarios, state |
| [matrice.md](matrice.md) | the **generated** matrix: requirements, invariant and FI-scenario coverage, ADR → requirements |
| [`tools/check-trace.lisp`](../../tools/check-trace.lisp) | validation and generation |

<a id="comandi"></a>

## Commands

```bash
make trace          # checks; fails if anything is inconsistent
make trace-write    # regenerates matrice.md after changing requisiti.lisp
```

<a id="che-cosa-viene-controllato"></a>

## What is checked

1. Every requirement has a `REQ-<AREA>-<nnn>` identifier, source, statement, integrity class
   (C1…C4), state, and at least one verification method; identifiers are unique.
2. Every cited `INV-`, `ADR-`, and `FI-` **exists** in the documentation.
3. **Every invariant** in [invarianti.md](../invarianti.md) is covered by at least one requirement.
4. **Every [fault-injection](../14-fault-injection.md) scenario** is covered by at least one
   requirement; a requirement verified using `:fi` lists the scenarios.
5. Every `REQ-…` reference in `src/`, `tests/`, `tools/`, and `spikes/` names an existing requirement.
6. A requirement in `:implementato` or `:verificato` state is cited in code (`src/` or `tools/`)
   and, unless it is class C4, in tests.
7. The committed matrix exactly matches generated output.

Code scanning excludes `spikes/out/` and `spikes/results/`: they contain outcome data
and diagnostics, verified separately by `make evidence`. Selection has a boundary
self-test; spike sources and fixtures remain included.

<a id="stati-di-un-requisito"></a>

## Requirement states

| State | Meaning |
|---|---|
| `:specificato` | statement defined, without a design |
| `:progettato` | realized by ADRs and documents; no code |
| `:implementato` | code present and traced (`;;; REQ: REQ-…`) |
| `:verificato` | all checks in the `:ver` list executed and passing |

<a id="come-si-aggiunge-o-si-cambia-un-requisito"></a>

## Adding or changing a requirement

1. Edit [requisiti.lisp](requisiti.lisp): a requirement is **retired** (state and note),
   never renumbered, and its identifier is never reused.
2. Run `make trace-write`, then `make trace`.
3. Cite IDs in commits (`Refs: REQ-…`) and, where there is code, in `;;; REQ:` and the test
   name.

<a id="limiti-dichiarati"></a>

## Declared limitations

- The tool checks the **existence** and **completeness** of links, not their **semantic
  correctness**: whether an ADR actually realizes a requirement is established by review
  ([checklist](../affidabilita/standard-di-codifica.md#lista-di-controllo-di-revisione-c1)).
- Until Phase 1, there is no product code: experiments cite the requirements they study
  but do not promote them to `implementato` or `verificato`. Only the C4 harness requirement
  has tooling code; completed tests are not tests of the future engine.
