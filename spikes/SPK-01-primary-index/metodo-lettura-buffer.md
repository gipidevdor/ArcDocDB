<a id="spk-01--metodo-preregistrato-lettura-in-buffer"></a>

# SPK-01 — Preregistered method: buffer reads

> **Proposed** — Experimental Phase-0 variant, preregistered before tests.

Recorded 2026-10-08, Phase 0. Common Lisp/SBCL only, `safety 3`, `speed 3`,
`debug 1`; zero warnings/style-warnings. No `eval`, `ignore-errors`, or `truly-the`.
Compilation does not replace CHECK.

<a id="ownership-e-dipendenza"></a>

## Ownership and dependency

Exclusive working checkout:
`/Users/gpicchiarelli/.codex/worktrees/indice-lettura/ArcDocDB`.
This agent owns only `lettura-buffer.lisp`, this method, and new
`spikes/SPK-01-primary-index/out/lettura-buffer-*` directories.
Existing core/runner, `tools/`, shared documents, `src/` outside ownership.
No commit/push. New drivers/diagnostics in this agent's out directories.
Module requires loaded core; imports internals without redefining them.

<a id="api-e-condizioni"></a>

## API and conditions

Package `ARCDOCDB.SPK01.LETTURA-BUFFER`, sole export `LEGGI`:

```lisp
(leggi indice chiave destinazione
       &key (attempts 8) after-fragment after-fields)
;; => (values status-keyword retry-fixnum)
```

`indice` is a core index; `chiave` a 16-u8 simple-array.
`destinazione` is exactly `(simple-array (unsigned-byte 64) (4))`, private to
caller: `[CSN, location, length, end-CSN]`. Types, callbacks, and key length
validated; `attempts` must be integer 1..8 before hashing, index access, or writes.
Incorrect types produce `type-error`; wrong key length produces `limite-indice`
with reason `:chiave-16-byte`. Accepted callbacks: NIL or function object,
not symbolic function designators.

Outcomes: `:hit` and `:miss` with 0..7 discarded attempts;
`:retry-limit` with exactly `attempts` discarded attempts. Latter is explicit
exhaustion, never successful or partial read. Destination fully written only on
`:hit`, after every validation. Miss, exhaustion, synchronous errors leave all
four words unchanged. No payload read returned as Lisp value.

Caller keeps key/destination stable and private during call, including callbacks.
Fixture callbacks modify neither buffer and retain core invariants;
`after-fragment` receives fragment, `after-fields` fragment and slot.
Callback errors propagated before any write. Four writes do not constitute
atomic publication to concurrent destination observers.

<a id="algoritmo-ordine-e-linearizzazione"></a>

## Algorithm, ordering, and linearization

Source is core `LEGGI`/`SONDA-READER`/`LEGGI-SLOT`. One local macro expands same
algorithm in direct/instrumented paths. First excludes callback calls; second
inserts only two injection points. Payload/hash are local typed u64s: no payload
transport between functions or multiple values. Existing inline core hash/probe
helpers remain dependencies. No lowering of safety.

Preserved order: root/generation acquisition; read barrier; fragment selection
and callback; core eight-byte-group probing; initially even sequence; read barrier;
fields, control, arena, key comparison; callback; read barrier; sequence equality;
read barrier; root/generation reread. Odd/changed sequence discards whole attempt.
Changed root discards hit and miss. Skip continues probe, empty control ends with
miss. No writer, lock, CAS, or barrier-order change in module.

For hit, candidate is consistent during stable seqlock interval and accepted only
after root/generation recheck. That check is acceptance point, not a claim that
payload represents state at root-reread instant: writer may update same slot after
second sequence read. Miss preserves core criterion, including retired root.
Linearization is not fixed at root acquisition; v1 prototype qualifications and
single-writer constraint apply.

Layout: words4 v1 (zero end-CSN) and words5-extra-end v1 (fifth end-CSN word),
not v2. High u64 CSN, location, end-CSN must be retained exactly.
Per-attempt limit C slots, C bounded by core constructor; at most eight attempts.
No timing guarantee for arbitrary callbacks.

<a id="campagna-consentita-e-preregistrazione-delle-esecuzioni"></a>

## Allowed campaign and execution preregistration

Budget: at most four compiled revisions, 90 seconds per child, 120 seconds in
recorder, 5 seconds cleanup, heap 1024 MiB. New Common Lisp out driver launches
SBCL processes without user init or shell. Before launch, preregisters argv,
empty stdin, operation, budget, full snapshots, Git blob hashes of core, module,
method, driver. Different before/after snapshots, exhaustion, conditions, or
compile-file warning/failure returns are failures; no partial success.

Each compilation has a fresh exclusive out and schema-1 record with
`:schema-version 1`, `:argv`, `:stdin`, `:source-before`, `:source-after`,
original stdout/stderr, exit code, `:decoded`. Failures retained too.
Data use lists, keywords, strings, numbers; types/functions represented as strings,
absence as keyword. Decoding with `*read-eval*` NIL happens in recorder process
without loading spike packages. Driver promotes warnings/style-warnings to errors,
checks compile-file indicators, loads FASL only after warning-free compilation.
Does not call LEGGI.

Preregistered C1 execution: compile core/module, load FASLs, disassemble LEGGI,
retain diagnostics and stable sources. Diagnostic purpose: find payload boxing
and u64 calls in direct path; barriers/bounds checks must remain.
No performance, allocation, throughput measurement. Disassembly applies only to
observed runtime. Any revision gets rationale and new preregistration here before
compilation, without overwriting previous records.

Campaign driver: `out/lettura-buffer-campagna-20261008-01/driver-campagna.lisp`
and `driver-compila.lisp` in same directory. C1 command from isolated checkout root:

```sh
/opt/homebrew/bin/sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-01-primary-index/out/lettura-buffer-campagna-20261008-01/driver-campagna.lisp c1
```

Schema-1 preregistration saved to `c1/record.sexp` before child launch;
stdin, stdout, stderr, FASL, disassembly in `c1/`.

<a id="c1-fallito-e-c2-preregistrato"></a>

### Failed C1 and preregistered C2

C1: runtime rejected argv before reading child driver because `--dynamic-space-size`
followed Lisp options; exit 1, stable sources, empty stdout, original stderr in
record. No compilation. C2 preregistered: same compile/load/disassemble, heap option
moved before Lisp options. Recorder prints escaped ordinary strings, verifies
readback, retains decoded diagnosis even without structured output.
Same C1 command except final `c2`; new `c2/`, same budgets. Core/algorithm unchanged.

<a id="c2-riuscito-e-c3-preregistrato"></a>

### Passed C2 and preregistered C3

C2: exit 0, core/variant compiled/loaded without warnings/style-warnings;
empty stderr, stable before/after sources, LEGGI disassembly retained.
No CHECK/BENCH. Before B's CHECK, parent requested kernel line
`;;; REQ: REQ-IDX-001 REQ-IDX-007 REQ-VAL-001` and method block `> **Proposta** —`.
Documentation-only changes: algorithm, API, declarations, barriers unchanged.
C3 preregistered: new strict core/variant compilation/disassembly, same drivers
and budgets, new `c3/`; campaign command ends with `c3`.
Shared `kernel-pronto-B.sexp` signal indicates documentation update until final
hashes and READY published.

Agents run no BENCH; measurements, initial profiling, integration belong to parent,
serialized by parent. This agent does not run module CHECK: another agent owns it.
Core-writer serialization remains parent harness responsibility.

<a id="controlli-richiesti-allagente-check-e-al-parent"></a>

## Checks required from CHECK agent and parent

Compare with core for hit, miss, collisions, skip, words 4/5, zero/maximum/
beyond-fixnum u64, maximum 24-bit length. Complete sentinel unchanged on miss,
retry-limit, invalid inputs, callback errors. Deterministic retired-root hit/miss,
sequence odd/changing witnesses, exact retry count; attempts 1/8, invalid values,
nonsimple/wrong-length arrays, incorrect callbacks. Verify both paths with same
oracle and single-writer invariants; no BENCH before parent validation.
