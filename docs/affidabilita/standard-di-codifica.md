<a id="standard-di-codifica"></a>

# Coding standard

Applies to **all product code** (C1…C3, [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md));
tools (C4) follow rules marked ‘tools’. Each rule states **how it is verified**:
`lint` = `make lint`; `build` = warning-free compilation; `rev` = review checklist;
`test` = dedicated test.

Adapted from G. Holzmann's (JPL) ‘Power of 10’ rules, MISRA, and Common Lisp practice
for critical systems. A deviation is allowed only if recorded in
[deviazioni.md](deviazioni.md).

<a id="compilazione-e-tipi"></a>

## Compilation and types

| ID | Rule | Verification |
|---|---|---|
| COD-01 | Compilation without `warning` or `style-warning`. | build |
| COD-02 | `safety` ≥ 2 always; default 3; never `safety 0`; never `safety 1` with `speed` greater than `safety`. | lint, rev |
| COD-03 | `truly-the` and disabling array bounds checks are prohibited. | lint |
| COD-04 | Every C1/C2 function has a complete `ftype`; every structure slot has a type; specialized arrays have an explicit element type. | rev, build |
| COD-05 | Format constants (offsets, lengths, magic values) are defined once in one module. | rev |
| COD-06 | No `(declare (ignore …))` on a value that may indicate an error. | rev |

<a id="controllo-del-flusso"></a>

## Control flow

| ID | Rule | Verification |
|---|---|---|
| COD-10 | Every loop has a proven or declared and enforced upper bound (`loop … repeat`, `dotimes`, iteration over a known-length sequence); ‘until successful’ loops have an attempt ceiling. | rev, test |
| COD-11 | Recursion allowed only with bounded, declared depth; otherwise use iteration. | rev |
| COD-12 | Short functions: at most 60 lines. | lint |
| COD-13 | Bounded complexity: at most 10 independent paths per function. | rev, coverage |
| COD-14 | No `go`/`tagbody` outside documented support macros; no `catch`/`throw` for ordinary control flow. | lint, rev |
| COD-15 | Every `cond`/`case` has an explicit final branch (`t`/`otherwise`) signaling `invariant-violation` if unexpected. | rev, coverage |

<a id="errori-e-asserzioni"></a>

## Errors and assertions

| ID | Rule | Verification |
|---|---|---|
| COD-20 | `ignore-errors` is prohibited. | lint |
| COD-21 | No handler catching `error`/`serious-condition`/`t` except at boundaries (request, worker) with logging and a defined state transition. | rev |
| COD-22 | Errors are conditions in the `arcdocdb-error` hierarchy ([ADR-0033](../adr/0033-fail-stop-e-integrita-end-to-end.md)); never `(error "stringa")` in product code. | rev, test |
| COD-23 | Every return value that may indicate an error is checked; an unhandled outcome is a defect. | rev |
| COD-24 | Internal invariant assertions are always active in production and, in C1, move the Serie to `FAULTED`. At least two assertions per nontrivial C1 function (meaningful preconditions and postconditions). | rev, test |
| COD-25 | No assertion has side effects. | rev |
| COD-26 | `unwind-protect` only to release resources; never to conceal an error. | rev |

<a id="dati-memoria-ambito"></a>

## Data, memory, scope

| ID | Rule | Verification |
|---|---|---|
| COD-30 | No managed-heap allocation on hot paths after startup ([ADR-0024](../adr/0024-memoria-e-gc.md)). | allocation test |
| COD-31 | Minimal scope: variables declared as locally as possible; no mutable special variable (`defvar`) unless registered with an owner. | lint, rev |
| COD-32 | Mutable global state prohibited except listed runtime structures with a single owner (INV-V4). | rev |
| COD-33 | `defstruct` with `:read-only` slots where the value does not change after construction. | rev |
| COD-34 | `eval`, `compile`, `load`, and `intern` on external data are prohibited; `*read-eval*` always `nil`; no `read` on untrusted data. | lint |
| COD-35 | No `sb-sys:with-pinned-objects` or system calls outside the `io` module. | lint, rev |
| COD-36 | A file or directory is deleted only through the `io` module function receiving removal proof: a `.tmp` name not named by the source of truth, or the record recording removal (INV-A10, [ADR-0036](../adr/0036-leggi-di-progetto.md)). | rev, test |
| COD-37 | Recovery opens existing segments read-only; no function truncates a segment (INV-A9). | rev, test |
| COD-38 | Every function making a change durable states the operation's **atomicity point** in its docstring and whether it is before it (preparation) or after it (idempotent completion) (INV-A11). | rev |

<a id="concorrenza"></a>

## Concurrency

| ID | Rule | Verification |
|---|---|---|
| COD-40 | Every shared datum has a declared single owner and a documented access protocol (`;;; OWNER:` comment). | rev |
| COD-41 | Only `sb-thread` (mutexes, condition variables), `sb-ext:compare-and-swap`, and `sb-thread:barrier`. | lint, rev |
| COD-42 | Every wait has a time limit or a proven exit condition; no unbounded wait on a lock held by code outside the owner. | rev, test |
| COD-43 | `without-interrupts` and `without-gcing` outside the `io` module are prohibited. | lint |
| COD-44 | Time, randomness, scheduling, and I/O only through injectable interfaces ([ADR-0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md)). | lint, rev |
| COD-45 | A task does not suspend: no blocking calls outside I/O-pool tasks; a wait is parking on a list with maximum length and duration (INV-P5, [ADR-0045](../adr/0045-modello-di-esecuzione.md)). | rev, test |
| COD-46 | **Parallelism.** No shared state between Serie outside the closed list in [architecture](../architettura.md#archivio-coordinamento-minimo); no shared writes between Serie on a single operation's path; every shared structure declares, alongside its owner, when it is touched (`;;; SHARED:` comment with the list entry) (INV-P6, [ADR-0036](../adr/0036-leggi-di-progetto.md)). | rev, bench |

<a id="documentazione-e-tracciabilità"></a>

## Documentation and traceability

| ID | Rule | Verification |
|---|---|---|
| COD-50 | Every product `defun`, `defmacro`, and `defstruct` has a docstring declaring preconditions, postconditions, and signaled conditions. | lint |
| COD-51 | Every product definition carries `;;; REQ: REQ-…` with the requirements it implements. | `make trace` |
| COD-52 | Every test's name includes the ID of the requirement it verifies. | `make trace` |
| COD-53 | Macros are allowed only to eliminate repeated forms or for invariant checks; every macro has expansion tests. | rev, test |
| COD-54 | Every compound decision (`and`/`or` with multiple conditions in `if`/`when`/`unless`/`cond`) in C1 is listed in the decision table and covered condition by condition. | verification plan |

<a id="strumenti-c4"></a>

## Tools (C4)

| ID | Rule | Verification |
|---|---|---|
| COD-60 | Every tool has a `--self-test` or fixtures demonstrating detection. | test |
| COD-61 | A tool failing a check exits with nonzero status and a message identifying the file and rule. | test |

<a id="lista-di-controllo-di-revisione-c1"></a>

## Review checklist (C1)

Every C1 code change receives **two readings** with this checklist, and the reviewer completes
it in the change description:

1. The `REQ-…` requirement and ADR are identified and consistent with the code.
2. Affected invariants are listed; each has a test that would fail if violated.
3. Every possible error has a type, handling, and test.
4. Every loop and wait is bounded; no unbounded recursion.
5. No hot-path allocation (measured).
6. No unverified data leave the module.
7. Every new compound decision is in the decision table.
8. The owner of every shared state is declared and respected.
9. The traceability matrix is current and `make check` passes.
10. No rule violated without a registered deviation.
11. The change introduces no lock, wait, or shared write between Serie per operation;
    what it serializes is declared (INV-P6).
12. Every durable change identifies its atomicity point; what precedes it is discardable,
    what follows is idempotent; nothing is deleted without a record authorizing it
    (INV-A10, INV-A11).
