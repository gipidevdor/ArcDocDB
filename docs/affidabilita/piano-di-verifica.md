<a id="piano-di-verifica"></a>

# Verification plan

Implements [ADR-0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md). The principle:
a requirement is ‘verified’ only if **executable, repeatable** evidence exists that would
fail if the requirement were violated.

<a id="metodi"></a>

## Methods

| Code | Method | Evidence |
|---|---|---|
| `test` | unit and module tests | automated suite, measured coverage |
| `prop` | property tests | generation with reproducible seed |
| `diff` | differential test against reference model | engine and model execute the same sequence; results match |
| `model` | exhaustively explored protocol model | exploration report with state count and checked invariants |
| `fi` | fault injection (simulator and real crashes) | FI scenarios, with verifier and oracle after every recovery |
| `fuzz` | decoder and protocol fuzzing | no crashes, every malformed input detected |
| `corr` | deliberate corruption of persistent files | every damage detected or repaired |
| `mut` | mutation testing | mutation score and analyzed surviving mutants |
| `soak` | long-running tests with repeated crashes | no violations, clean verifier |
| `bench` | reproducible benchmarks | minimum performance and cost of checks |
| `rev` | review with checklist | checklist completed in the change |
| `analisi` | static analysis, warning-free compilation, linter | CI outcome |

In the requirements file, methods are keywords: `:test :prop :diff :model
:fi :fuzz :corr :mut :soak :bench :rev :analisi`.

<a id="copertura"></a>

## Coverage

| Class | Statements and branches | Conditions in compound decisions | Notes |
|---|---|---|---|
| C1 | 100 % (`sb-cover`) | 100 % (MC/DC equivalent) | unreachable lines are listed and justified in `docs/affidabilita/copertura-eccezioni.md` |
| C2 | 100 % | decisions flagged by linter | — |
| C3 | ≥ 95 % | — | — |

**Declared limitation.** `sb-cover` measures form and branch coverage; it does not measure
MC/DC. Condition coverage is obtained as follows: `lint` extracts C1 compound decisions
into a **decision table**; for each, the suite must contain cases where each condition
independently changes the outcome (independence pairs). The table is an artifact
checked in review and by mutation tests on logical operators.

<a id="livelli-di-test"></a>

## Test levels

1. **Unit/module:** each module tests its functions, error conditions, and invariants.
   Decoders are tested with known vectors and every field at boundary values.
2. **Differential:** in-memory reference model (hash table and version lists) with the
   same GET/PUT/DELETE/transaction/snapshot semantics; random operation sequences on
   engine and model with every response compared; with simulated crash and recovery,
   the engine must remain equal to the model **for what was acknowledged**.
3. **Models:** 2PC + recovery; compaction + swap + reclaim; seqlock; batch and durable
   frontier; visibility horizon and snapshot registry; self-contained segments;
   tombstones; fragment split; a crash before and after every
   [atomicity point](../analisi-progettuale.md#punti-di-atomicità); exhaustively explored
   on small configurations with crashes at every point.
4. **Deterministic simulation:** the whole system with simulated time, randomness,
   scheduling, and I/O; millions of scenarios per seed; every error reproducible from the seed.
5. **Real crashes:** `kill -9` at random times on a real filesystem; after every restart,
   offline verifier and oracle comparison.
6. **Corruption:** detection is tested for every persistent file and damage type.
7. **Fuzzing:** coverage-guided decoder testing; the corpus enters regression tests.
8. **Saturation:** every resource limit (INV-A8) is exceeded; the response is a controlled
   rejection.
9. **Soak:** mixed load and repeated crashes for hours, with periodic scrubbing and verification.
10. **Parallelism (INV-P6):** scalability benchmarks with Serie and core counts, and
    isolation (a burst on one Serie does not alter others' latency and throughput); review
    checks that the list of what Serie share remains that in
    [architecture](../architettura.md#archivio-coordinamento-minimo).

<a id="interfaccia-locale-unix-socket"></a>

## Local Unix socket interface

[ADR-0055](../adr/0055-interfaccia-locale-unix-socket.md) adds
REQ-IPC-001…REQ-IPC-004 and INV-N1, all still **designed**.
Existing engine tests do not verify a local listener or client.
Initial M16 integration, brought forward in the [roadmap](../roadmap.md), must
produce this evidence with two real processes and injectable I/O:

| Requirement | Evidence to produce |
|---|---|
| REQ-IPC-001 — transport and priority | Default configuration with Unix socket only, explicit path, error on absent/inaccessible socket, and no implicit TCP attempt or listener; first integration of available operations independent of query/TCP completion |
| REQ-IPC-002 — framing and admission | Fragmented header/body reception, coalesced frames, partial sends, incorrect version and lengths, malformed CBOR, correlation of out-of-order responses; maximum document plus envelope; saturation of every limit and slow client with traffic on another Serie, without retained epochs or starvation |
| REQ-IPC-003 — runtime resources | Missing, invalid, or overlong paths, allowed and denied accounts, directories with incorrect owner/permissions; name occupied by listener, orphan socket, file, or link, always preserved at startup; shutdown and replaced node; crash and restart with orphan diagnostics |
| REQ-IPC-004 — commit boundaries | Disconnection before admission, during commit, and after publication before response; comparison with durable oracle after reopen, no replay on reconnection, no early acknowledgment, and no application traffic before recovery |

Framing and ordering are explored with finite models and decoder fuzzing;
FI-01/FI-02/FI-05 scenarios are repeated through the local socket.
Access checks must use distinct identities on the reference platform.
Coverage, review, and methods of the assigned classes apply.
The [SPK-11 test](../../spikes/SPK-11-unix-socket/README.md) exercises transport
only with two processes; the [session contract](../implementazione/sessione-locale.md)
remains proposed. No IPC requirement is promoted by spike success.
[Local-path measurements](../13-benchmark.md#interfaccia-locale-unix-socket)
follow correctness tests and remain separate from engine-only benchmarks.

<a id="ricerca-full-text"></a>

## Full-text search

[ADR-0053](../adr/0053-ricerca-full-text-indici-invertiti.md) adds
REQ-SEC-003…REQ-SEC-006 and INV-I4; completion in
[ADR-0054](../adr/0054-contratto-e-formato-full-text.md) adds
REQ-SEC-007…REQ-SEC-010 and INV-I5/INV-I6. These are **designed** requirements:
existing primary-index, codec, and recovery tests do not qualify them.
The [full-text core](../implementazione/full-text.md) adds Unicode corpora,
a positional oracle, frame corruption, budgets, allocations, and negative controls;
it does not yet qualify requirements across the full Serie scope.
Phase 8 must produce this evidence before benchmarks:

| Requirement | Evidence to produce |
|---|---|
| REQ-SEC-003 — semantics and analysis | Independent scan oracle for words, phrases, all/any, and/or/not, filters, and missing fields; pinned Unicode profiles, accents, canonical equivalence, repetitions, and field boundaries |
| REQ-SEC-004 — commit and snapshots | Same version for text and filters; update/delete, abort, ACTIVE/CLOSED, historical snapshots, and compaction; exploration of publication points and fault injection before/after SEAL and DECISION |
| REQ-SEC-005 — generations and derivatives | Concurrent build, analyzer change, restart/restore, missing files, incorrect CRC/identity, and incomplete coverage; one generation per query and explicit error until full readiness |
| REQ-SEC-006 — limits and isolation | Saturation of every budget, write rejection before durable decision, cancellation, and timeout; query error distinct from requested limit, without silently partial results; load on other Serie |
| REQ-SEC-007 — profile and queries | Unicode 18.0.0 corpora and manual expected results; C/F mapping, repeated phrases, stable ordering, and terminal-state recognition |
| REQ-SEC-008 — codec and identity | Independent binary `.idx` v2/type 5 fixtures, corruption including with valid CRC, swapped hints, ordering/offsets, and reserved fields |
| REQ-SEC-009 — generation protocol | Concurrent capture with initial boundary, inventory changed before swap, separate files, authorized retirement, and already admitted readers |
| REQ-SEC-010 — reservations and completion | Delta/staging and file upper bound reserved before decision; rotation, saturation, post-batch error, cleanup, and single terminal continuation |

The assigned classes apply: C2 to query semantics and C1 to derivative publication,
visibility, and recovery paths. Coverage, conditions, review, mutations, and models
follow class rules. Corpora, profiles, generations, and expected results must be
reproducible; a negative control must demonstrate oracle sensitivity.
The [performance campaign](../13-benchmark.md#ricerca-full-text) separately measures
analysis, search, commit, build/rebuild, and interference.
The [detailed acceptance matrix](../full-text.md#criteri-di-accettazione) ties these
requirements to inputs, oracles, and success conditions. Budget defaults are design
policies requiring qualification; they are not measured performance.

<a id="revisione-e-configurazione"></a>

## Review and configuration

- [Coding-standard checklist](standard-di-codifica.md#lista-di-controllo-di-revisione-c1)
  for every C1 change; two readings.
- No change without a traced requirement; `make check` is mandatory.
- **Independence:** the author is not the only reader of C1 code. Mitigations: automatic
  tools, checklist, rereading with a second reviewer (including automated)
  **over verifiable data** (diff, coverage reports, test outcomes), not conclusions.
- SBCL version and core hash recorded at every baseline; signed baselines.

<a id="criteri-di-rilascio-di-una-fase"></a>

## Phase release criteria

A phase closes only if, for every relevant requirement:

- [ ] every requirement's listed checks have run and passed;
- [ ] coverage meets the table's values for the class;
- [ ] no model or fault-injection scenario violates an invariant;
- [ ] offline verifier is clean after the crash suite;
- [ ] C1 mutation score reaches the threshold fixed at phase start, and surviving
      mutants are explained;
- [ ] `make check` passes; matrix current; no unapproved deviation;
- [ ] high-exposure risks are mitigated or accepted in writing.

<a id="strumenti-stato"></a>

## Tools (status)

| Tool | Status |
|---|---|
| `tools/check-links.lisp` | active |
| `tools/check-trace.lisp` | active |
| `tools/lint.lisp` | active (prohibitions, length, docstrings) |
| test harness and simulator | Phase 1 |
| model explorer | Phase 0, SPK-07 |
| offline verifier `arcdocdb-verify` | Phase 1 (formats defined) |
| mutation testing | Phase 1 |
| fuzzing | Phase 1 |
