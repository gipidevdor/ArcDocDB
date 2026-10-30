<a id="primo-item-cbor-minimo--seconda-lettura-c1"></a>

# First minimal CBOR item — second C1 reading

2026-10-15. Independent static reading before first
compilation, without LOAD, product execution, or campaigns.
No notes from the other C1 reading were consulted; the inventory
was derived directly from sources.
Local outcome: no concrete defect detected; dynamic verification
and C1/MC/DC qualification remain open.

<a id="perimetro-immutabile-letto"></a>

## Immutable scope read

| Unit | Git blob |
|---|---|
| `src/codec/cbor-item-read.lisp` | `b9099dc8a8c96281063811e686deb4dcb2b1d39b` |
| `arcdocdb.asd` | `8e36893806e499946cbffcc2c8475690ea40cba0` |
| `src/codec/cbor-package.lisp` | `64b3a838f6d5b432148e64604d5e1dfa4a3c32d4` |
| `tests/codec/cbor-item-read-support.lisp` | `0326100362a1c4b24d2c7e511e45357f09a56d33` |
| `tests/codec/cbor-item-read.lisp` | `b2cbdcb4255c51d9da4fe73b28939c1cb923fefe` |
| `tests/codec/cbor-item-read-threads.lisp` | `a0da65545ed80ede0a967cadbb337731f6fe1ce9` |
| `docs/implementazione/cbor-item-metodo.md` | `a67a79bf4fefe11c4778cd881eb5279a006966ca` |
| `tools/foundation-coverage.lisp` | `19369e3ea8f944a420efa1918383c7ac28544c6d` |

Observed HEAD `03dbc4e2`. The corpus is the one frozen before the
kernel. Reused preflight, space, header,
minimality, stack, step, and result were also read directly; no local changes
to those modules appear in the diff. Benchmark,
audit, or mutation drivers under preparation were not read.

<a id="contratto-e-riuso"></a>

## Contract and reuse

REQ-CBR-008 (`docs/tracciabilita/requisiti.lisp:321–324`) and
[ADR-0014](../adr/0014-formato-record-documento-id.md), clarified by
[ADR-0048](../adr/0048-limiti-documentali-e-formato-v2.md), support
the structural primitive. A deterministic document
profile, tag semantics, or map uniqueness/order does not follow.
REQ-LIM-001/002 remain designed for the overall document
contract; the kernel's local limits do not qualify them fully.

Preflight at line20 reuses `cbor-scan-input.lisp:22–38` before
reset28: buffer/range, workspace, KINDS alias, byte/node/depth
configurations, then whole-window budget. It reads no bytes and
does not modify scratch on rejection. A tail exceeding MAX-BYTES is
therefore rejected even if the first item is a one-byte scalar.

Both drains, lines30 and32, receive END equal to the current cursor:
they satisfy `cbor-scan-stack.lisp:89–107`'s precondition and
allow `esito-radice-cbor` to check root/depth/tag without
requiring physical EOF. Step31 instead retains original END and
MINIMAL=T (`cbor-scan.lisp:10–31`); header, payload, and UTF8 remain
bounded by the authorized window. The drain after the last
step is present even when LOOP exhausts SPAN.

If the root remains incomplete, lines33–36 require cursor=END and
invoke the empty header for the same :cbor-truncated at END, without
returning partial values. After positive drain, NEXT is checked
for increase and window bounds; `risultato-struttura-cbor` receives NEXT,
checks counts and inactive state (`cbor-scan.lisp:36–47`), and returns
exactly three values. The tail is not read or included in counts.
Cases 00 FF and 81 00 1C produce 1,0,1 and 2,1,2 respectively by
flow inspection; they are not execution results in this reading.
Exact scanners retain drains at physical END and :cbor-trailing.

<a id="inventario-completo-del-nuovo-controllo-di-flusso"></a>

## Complete inventory of new control flow

One DEFUN, lines 10–43 inclusive: 34 physical lines, including docstring and
declarations; complete FTYPE at lines8–9; safety3 at line5.
Conservative count: base 1 + 6 explicit predicates + 1 LOOP = 8
independent paths, within60 lines/10 paths. Existing callees'
decisions are not expanded into the new wrapper count.

| Decision | Line | Condition and two outcomes |
|---|---:|---|
| D1 | 22 | SPAN within maximum; continue or invariant-violation |
| D2 | 29 | LOOP REPEAT SPAN: iteration available or termination |
| D3 | 30 | drain: root complete and RETURN or step on item |
| D4 | 32 | final drain: result or incomplete path |
| D5 | 33 | cursor=END on incomplete path or invariant-violation |
| D6 | 39 | BEGIN<NEXT or invariant-violation |
| D7 | 41 | NEXT<=LIMIT or invariant-violation |

AND/OR in new source:0, hence0 short-circuit operands.
Numeric chains with at least three operands:0. All explicit numeric
comparisons are four binary comparisons: `<=` line22,
`=` line33, `<` line39, `<=` line41. LOOP adds its own
control decision without introducing a numeric chain in the text.

All five direct ERROR arms are INVARIANT-VIOLATION
conditions, active without removable ASSERTs or side effects
in conditions:

| Guard/reason | ERROR line | Meaning and reading limit |
|---|---:|---|
| `:cbor-item-loop-span` | 23 | defends loop bound after preflight |
| `:cbor-item-loop-bound` | 34 | defends exhaustion at END when root is missing |
| `:cbor-item-empty-header` | 36 | fail-stop if empty header unexpectedly returns |
| `:cbor-item-read-progress` | 40 | defends NEXT strictly after START |
| `:cbor-item-read-range` | 42 | defends NEXT within original END |

The first two and last two check callee contracts; the
third is fallback for the callee that must signal truncation. With
correct callees, their ERROR arms are not expected to be reached from
external inputs passing valid preflight. This static argument is not
a coverage exclusion: all remain in raw denominators;
any missed entries must be fully reported and classified.

<a id="errori-e-prove-fredde-disponibili"></a>

## Errors and available cold tests

The wrapper propagates, without handlers, INVALID-ARGUMENT for range,
workspace, aliases, and configurations; RESOURCE-EXHAUSTED for byte/node/depth
budgets; CORRUPTION-DETECTED for syntax, truncation,
minimality, and UTF8 with absolute offsets; INVARIANT-VIOLATION from the
five listed arms and unchanged callees. It introduces no external
rejection reason or precedence inversion. The invariant
condition remains intended for the Serie owner's fail-stop boundary;
there is no Serie-state integration here yet.

The corpus contains16 serial tests and1 worker test, not run
by this reviewer. `cir-accept` checks arity3, values, entire buffer,
cursor, and scratch state; `cir-cold-reject` also preserves dirty scratch
(`cbor-item-read-support.lisp:43–78`). Serial tests cover MT0..7
and poisoned tails4–12, concatenated boundaries24–41, physical/authorized END
43–49, types/ranges51–64, workspace/aliases66–71, precedence73–86,
window budget88–94, nodes/tags96–108, depth100/101 at110–121,
absolute errors/minimality123–137, all truncations139–146,
header precedence148–157, reuse159–165,16MiB/+1 at167–176, and
fuzz1024 with frozen seed/distribution178–209.
The five internal errors are not declared exercised by tests here.

<a id="lista-di-controllo-c1-a-dodici-punti"></a>

## Twelve-point C1 checklist

| Point | Static outcome and gate still open |
|---:|---|
| 1 | REQ-CBR-008 and ADR0014/0048 consistent with scope and API; REQ annotations present. |
| 2 | INV-A5: traceability; INV-A8: budgets/bounds; INV-P6: private ownership. Cold rejection and immutability tests and two workers are present; outcomes still to be acquired. INV-A3/A4 remain respected through safety3 and typed conditions. |
| 3 | All five direct guards inventoried; propagated families and precedence above. No error ignored or converted into success; coverage/detector-effectiveness measurement pending. |
| 4 | LOOP at most SPAN<=16777216 steps. Every step consumes at least one byte; each drain bounded to102 frames, reset to102 slots, no new recursion/wait. |
| 5 | No AST construction, copy, cons, array, or closure in the new hot path. Zero heap requires benchmark with baseline and positive control: not measured here. |
| 6 | Result only after complete root, progress/range and full result verification; no decoded payload or partial result exported. |
| 7 | Inventory above:6 predicates,1 LOOP,0 AND/OR,4 binary comparisons,0 chains. Coverage without exclusions still to be collected. |
| 8 | OWNER/SHARED lines2–3: stable buffer shareable for reading, exclusive scratch per worker; no new mutable global. |
| 9 | Serial ASDF registers kernel after dependencies at line 36, corpus at 171–172, and aggregate RUN at 246; package exports API at 13. REQ-CBR-008 is implemented and appears in matrix 103; final build, trace/lint, and make check not established by this reading. |
| 10 | FTYPE, PRE/POST/error docstring, safety3, and60/10 bounds present; no deviation required by reading. COD-01 still requires compilation without warnings/style-warnings. |
| 11 | No threads, locks, I/O, waits, or shared per-operation writes in kernel. Worker test with distinct scratch and shared buffer exists; rendezvous demonstrates neither scaling nor simultaneous execution on cores. |
| 12 | No durable change or deletion introduced: storage atomicity point not applicable to the in-memory primitive. |

The matrix row was observed already updated, without running
the generator. Observed REQ and matrix, respectively:
`f24c47fda225ed8420a77b467a36f83a3bb3a871` and
`0ed6c9c6b9a3c3046ed06c73eac18e2f05f1a021`.
Later tests and decisions must be preserved separately;
this second reading remains the precompilation snapshot.
