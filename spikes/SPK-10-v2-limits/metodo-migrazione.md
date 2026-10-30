<a id="spk-10--metodo-per-selezione-del-formato-e-modello-di-migrazione"></a>

# SPK-10 — Format selection method and migration model

> **Proposed** — Experiment in `migrazione.lisp`, package
> `arcdocdb.spk10.migrazione`. This method is registered before execution.
> It does not complete the v2 gate or implement an on-disk converter.

<a id="domanda-e-riferimenti"></a>

## Question and references

Check that the fileheader explicitly selects v1/v2 and rejects unknown versions;
explore a finite model of interrupted and rerun offline conversion, with
immutable sources, a single publication EDIT, and reclamation subject to pins.
Requirements: REQ-FOR-002, REQ-LIM-003, REQ-AFF-007, REQ-AFF-018, REQ-AFF-019.
Sources: ADR-0048; ADR-0036; ADR-0040; `docs/formati-su-disco.md`, segment
header and temporary names; specification, CLEAN/MERGE workflow, and readers.

> **Decided (versioning → ADR-0048)** — The layout is selected by file version.
> The only documented segment magic is `ARCDSEG1`: its final character does not
> replace the little-endian u16 field at offset 8. The historical table states
> version 1; v2 fixtures use that same magic and version 2 under ADR-0048.
> Neither `ARCDSEG2` nor a new persistent format is introduced.

<a id="metodo-registrato"></a>

## Registered method

- Build fixtures of only 64 bytes, with origin 1/2, 16-byte Serie ID,
  u64 segment-id and timestamp, zero reserved fields, CRC32C at offset 56 over
  bytes 0–55. Reuse the SPK-09 reference CRC, already loaded by the runner;
  no dependency on the v2 codec, indexes, or other modules' CBOR decoder.
- Validate type and bounds before access, then magic, CRC, origin, and all
  reserved fields (11–15, 48–55, 60–63), then version 1/2. Unknown versions
  rejected before returning or invoking a parser. Check fixtures with correct
  CRCs even for semantically invalid fields, all truncations, and all bit flips.
- Separate model: one v1 source, one v2 output, pin 0/1, presence of `.tmp`
  and final file, validity, verification, file and directory durability,
  durable EDIT, and completion. Contents are symbols/booleans, rather than
  encoded records; the model does not prove byte conversion or real crashes.
- Phases: prepare `.tmp`; write v2 (including partial prefixes); verify;
  make the file durable; make the directory durable; publish EDIT;
  complete rename; reclaim only without pins. Before EDIT, the manifest
  selects v1 and the source remains intact; afterward it selects v2 and
  the source remains intact until reclamation authorized by the removal record.
  There are ten distinct phases: preparation, partial write, complete write,
  verification, file durability, directory durability, EDIT, rename, directory
  durability after rename, reclamation. An interrupted rename leaves either
  the old or new name. Missing output after EDIT means **both** `.tmp` and
  the final file are absent; a named `.tmp` is completed by recovery.
- Enumerate crashes before/after every phase, including partial writes,
  corrupt output, negative verification, and false positive verification.
  Explore recovery interruptions separately and compare rerun results with
  uninterrupted results. An output named by EDIT but absent/corrupt produces
  an integrity error, retaining sources; an unknown final file remains present
  and is reported.
- Oracle independent of transitions: checks selection, integrity, immutability,
  removal evidence, pins, EDIT count, and atomicity point.
  Mutants `unlink-before-EDIT`, `skip-verification`, `reclaim-pinned` must
  be detected with deterministic counterexamples.
  False positive verification is a deliberately incorrect response relative
  to the boolean validity known to the oracle: the oracle detects it and the
  case stops before publication. This does not prove a real verifier infallible.
  Negative verification of valid output is a rejection.
- Saturate phase and copy budgets: explicit rejection before the phase that
  exceeds the budget, no incomplete EDIT. No waiting for pins: reclamation
  is deferred and rerun after explicit release. State local to one model;
  no locks, per-Serie shared state, or I/O.

<a id="costi-e-limiti-dichiarati"></a>

## Declared costs and limits

> **Proposed** — Experimental limits, rather than guaranteed performance:
> fileheader exactly 64 bytes; CRC over 56 bytes; comparisons and reserved
> fields at most 64 bytes; integer writes at most 8 bytes, Serie ID 16 bytes.
> All fixtures are bounded. The model uses one source and one output, two pin
> states, and a fixed number of phases; writes and durability are finite
> symbolic actions. Each phase and each recovery step consumes one budget
> unit; partial and complete writes also consume copy units. Actual counts
> and checked ceilings are returned by `check`. Abstract atomic actions do not
> model syscalls, real fsync/rename, device reordering, corruption undetected
> by CRCs, concurrent reader synchronization, or record conversion. Model pins
> are conservative even during recovery; readers of the old process do not
> survive a real restart (ADR-0040).

> **Proposed** — Checked ceilings: 32 steps per model execution and 2 copy
> units per attempt (4 including interrupted attempt and rerun);
> 10 phases; 4 recovery steps; 11 prefixes per scenario;
> 4 scenarios (healthy, corrupt, negative verification, false verification);
> pin 0/1; 4 crash alternatives (name and content retained/lost when not durable).
> Each recovery is interrupted after 0..4 steps and in turn receives every
> crash alternative. Idempotence compares all logical and durable facts;
> only budgets and counters of work already performed are excluded. The
> source is immutable symbolic content; the fileheader is checked on real bytes.

Each phase costs one symbolic step, including reclamation deferred by a pin:

| Phase | Effect and copy cost |
|---|---|
| `prepare.tmp` | Temporary file present; zero copies |
| `write.partial` | Partial output; one copy unit |
| `write.v2` | Complete output, validity fixed by scenario; one copy unit |
| `verify` | Verifier response, distinct from oracle truth; zero copies |
| `durable.file` | Abstract content durability; zero copies |
| `durable.directory` | Durable `.tmp` name; zero copies |
| `publish.edit` | Single durable EDIT and evidence for source removal; zero copies |
| `complete.rename` | Repeatable rename after EDIT; zero copies |
| `complete.directory` | Durable final name; zero copies |
| `reclaim` | Removal only with evidence, completion, and zero pins; zero copies |

Recovery executes at most two steps before EDIT (`discard.tmp`,
`report.unknown`) or four after EDIT (`inspect.output`, rename, syncdir,
reclamation). Discarding, reporting, and inspection also consume one step,
without copies. State has fixed size: copies of `stato` do not depend on
document bytes. Copy units are a **symbolic** cost, rather than bytes or I/O
time. Phases are serial within this one migration; there is no serialization
between Serie. Counts concern executed injections: alternatives with facts
already durable may converge to the same state, without being counted as new
distinct states.

<a id="ambiente-e-riproduzione"></a>

## Environment and reproduction

Environment identified before execution: SBCL 2.6.9, Darwin arm64.
Module policy: `(safety 3)`. No external dependencies beyond Common Lisp/SBCL;
reference CRC from the local SPK-09 module. The runner loads SPK-09 and modules
in order codec, index, cbor, migration. Compile with fatal `warning` and
`style-warning`, check all `compile-file` values, load the FASL, and call
`arcdocdb.spk10.migrazione:check`. Output is a plist with `:status :ok`,
counts, limits, and the three expected mutants. No long benchmark;
aggregate measurements run sequentially in the integrated harness.
Every local check produces a schema 1 plist in `out/migrazione-check.lisp`,
read with `*read-eval* nil`, with command, environment, source blobs,
compilation status, result, limits, times, stdout/stderr, and any failure.
The record also retains previous attempts if repairs are needed.

<a id="risultati"></a>

## Results

> **Proposed** — Local evidence for fileheaders and the finite model only;
> it does not complete the engine's v2 gate. Check on 2026-10-08 with SBCL
> 2.6.9, Darwin 27.0.0 / ARM64, safety 3 policy.

Strict compilation: `:status :ok`, `warnings nil`, `failure nil`; FASL loading
and `check`: `:status :ok`. Captured stdout/stderr empty, no warnings or
style-warnings. Result and blobs are in
[`v2-migrazione-check.lisp`](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-migrazione-check.lisp), one schema 1 plist
readable with `*read-eval* nil`. The checked source has Git blob
`cab850dc32ff9908b487b24edf3e1df2cc90008c`; the SPK-09 reference CRC has blob
`80cdac4c0e52703618e1f274413b2ecbe00e6b14`.

| Check | Actual count |
|---|---:|
| Valid fileheaders, including shifted ranges | 8 |
| Invalid fileheaders rejected before the parser | 2,393 |
| Bit flips / truncations / reserved fields with valid CRC | 2,048 / 256 / 68 |
| Invalid origins / unknown versions / invalid bounds / alternative magic | 12 / 4 / 4 / 1 |
| Reachable prefixes of four scenarios with pin 0/1 | 52 |
| Migration crashes / healthy reruns | 208 / 208 |
| Recovery interruptions with another crash and rerun | 4,160 |
| Negative verifications / false verifications detected by the oracle | 4 / 2 |
| Missing or corrupt committed output, integrity error | 2 |
| Named `.tmp` completed / unknown final file retained and reported | 1 / 1 |
| Budget saturations / pin retention and release | 13 / 2 |
| Maximum observed work / ceiling | 22 steps / 32 |
| Maximum observed copies / ceiling, including interrupted attempt and rerun | 4 / 4 |

Detected mutants: `unlink-before-EDIT` at preparation, `skip-verification`
at EDIT publication, `reclaim-pinned` at reclamation. All three produce
oracle counterexamples. Before and after EDIT, the source remains immutable
and present until reclamation is authorized and pins are zero.

Times **measured for this run only**, rather than benchmarks or guarantees:
compile 0.179701 s; check 0.007486 s; complete harness 0.651317 s. The artifact
retains four earlier attempts: three failures (extra parenthesis, insufficient
copy budget for rerun and its diagnosis) and one successful check before
clarifying maximum-work counting. Every attempt has command, environment,
blobs, compilation status, result or failure, times, and logs.

<a id="limiti-ancora-aperti"></a>

## Remaining open limits

> **Proposed** — Still needed: a real offline v1/v2 converter, verification of
> record bytes and their equivalence, byte/memory/I/O budgets, checks with
> fsync and real filesystems, crashes inside syscalls/writes, and concurrent
> reader tests. Durability and EDIT are abstract atomic actions; segment
> contents are booleans/symbols. False verification is recognized because the
> oracle knows the case's validity, rather than a real verifier being
> guaranteed infallible. The CRC dependency is the local SPK-09 module, rather
> than the v2 codec; this experiment certifies neither the other modules nor
> the v2 gate.
