<a id="decisioni-della-scansione-cbor-con-testate-minime"></a>

# CBOR scanning decisions with minimal headers

Inventory and static self-reading by the refactor author before
campaigns. Does not constitute an independent C1 reading or human approval.
The product author has not read the new tests. Strict build,
lint, traceability, tests, coverage, mutations, and heap measurement are pending;
lines below refer to sources in this delivery.

<a id="ambito-e-percorso"></a>

## Scope and path

`verifica-struttura-cbor-minima` passes T to
`verifica-struttura-cbor-interna`; `verifica-struttura-cbor` retains its
public signature with the same keywords and defaults, passing NIL. No new
mode is exposed on the generic API. The internal positional
boolean directly selects the reader in `passo-struttura-cbor`;
it introduces no closure, callback, dynamic keywords, or second traversal.

The shared core performs preflight before scratch reset.
It retains exclusive 102-cell workspace, SPAN-bounded loop, and
drain bounded to 102 frames. Containers and text use unchanged helpers:
depth only for array/map, UTF-8 after availability of the entire
payload, and no u64/float reconstruction. Three values emerge only from
the postconditions of `risultato-struttura-cbor`.

The new API requires minimal headers at every position reached, including
keys, values, and tags. It does not verify tag semantics, map order, or
duplicates; it does not attest the complete ADR-0014/0048 document profile.
The kernel owns no Serie and propagates invariants: the responsible
controller must implement the FAULTED transition outside this API.

<a id="decisioni-composte"></a>

## Compound decisions

The **three compound decisions in the refactored file are preserved**;
new reader selection is a simple decision. Wrappers contain
no decisions: they delegate with a constant boolean. Existing inventories
of minimal header, input, scratch, stack, and item remain separate.

| ID | File, function, and line | Conditions | Planned verification or limit |
|---|---|---|---|
| D01 | `cbor-scan.lisp`, `passo-struttura-cbor`, 29 | lead < cursor after step; cursor <= END | Generic/minimal corpus, truncations, and nested inputs must advance or signal an error. Opposite outcome is internal defense, retained in denominator. |
| D02 | `cbor-scan.lisp`, `risultato-struttura-cbor`, 41 | 1 <= nodes <= max-nodes; peak <= max-depth | Exact limits, depth-zero scalars, and depth 100; internal postcondition remains in denominator. |
| D03 | same function, 44 | top zero; depth zero; no pending tag | Exact items, chained tags, and empty/nonempty containers. Residual state on success is internal defense; no unreachability proof. |

Fixtures and results belong to the independent oracle and campaigns.
This table demonstrates neither condition-by-condition coverage nor MC/DC;
it approves no exclusions of guards, declarations, defaults, or fallbacks.

<a id="selezioni-e-priorità-osservabili"></a>

## Observable selections and priorities

| Path point | Preserved or introduced order |
|---|---|
| Wrapper | Same keywords and defaults; generic NIL, minimal T. No other public entry to the boolean. |
| Preflight | Range → workspace → alias EQ kinds → byte-limit → node-limit → depth-limit → byte-budget, before reset or byte reading. |
| Step, lines 19–24 | T: base syntactic reader inside minimal reader → minimality → context; NIL: generic reader → context. Syntactically incomplete or illegal header precedes `:cbor-nonminimal`. |
| Node and body, lines 25–28 | Minimality completed before node-budget, depth-budget, payload availability, and UTF-8. Syntactically permitted indefinite/break is nonminimal at lead in minimal API. |
| Drain, lines 70–73 | Frame/root before next header. An already-completed root signals `:cbor-trailing` at first remaining byte, without applying minimality to tail. |
| Incomplete end, lines 73–77 | Span `END..END` is read by base reader: `:cbor-truncated` at END even for empty span or tag without terminal item. No complete header exists to apply minimality to. |
| Reuse | Preflight rejection leaves scratch unchanged; rejection during scanning may dirty it. The next valid call resets before either path. |

<a id="checklist-c1-dellautore"></a>

## Author's C1 checklist

| Item | Static finding and limit |
|---|---|
| 1. Requirements/ADRs | REQ-LIM-001/002 and AFF-004/008 declared; ADR-0014/0048 for headers, ADR-0031/0035 for C1 discipline. Complete profile out of scope. |
| 2. Invariants | Immutable buffer, exclusive scratch, checked progress and results; INV-F1/A8/P6. Oracles and boundary tests still pending. |
| 3. Errors | Typed conditions propagated; syntax/minimality and trailing priority described above. No new handler; Serie FAULTED transition outside kernel. |
| 4. Limits | Single repeat SPAN loop and unchanged drain102, maximum nine-byte header; no new recursion or wait. |
| 5. Heap | Only local arguments/values in refactor, existing preallocated scratch, and direct calls. Nonallocation not attested: measurement and positive sensor pending. |
| 6. Output | Only three values after shared postconditions, no decoded or copied AST/payload. |
| 7. Decisions | D01–D03 compared with code; simple T/NIL selection and priorities inventoried. Raw coverage and MC/DC not attested. |
| 8. Ownership | OWNER/SHARED comments in both files: caller buffer, scratch of one worker/call; no new mutable global. |
| 9. Integration | Export added. ASDF, matrix, build/lint/trace, and `make check` are coordinator tasks and remain pending. |
| 10. Standard | safety3, complete FTYPEs, docstrings/REQ, functions within 60 lines. Step, result, and core have at least two active checks; wrappers are trivial delegations. No deviation introduced or approved. |
| 11. Parallelism | No lock, shared state, wait, I/O, or thread creation. Concurrent sharing of the same scratch violates the precondition; independent workers must each have one. |
| 12. Durability | No durable write, publication, or deletion. Atomicity point not applicable. |

Static findings contain no open issues. Coordinator campaigns
must still verify observable behavior,
including generic API behavior after moving its body, and quantify
heap allocation and coverage without narrowing the denominator. This delivery does not
close an engine gate or human approval.
