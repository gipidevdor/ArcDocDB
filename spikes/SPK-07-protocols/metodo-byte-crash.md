<a id="spk-07--metodo-crash-sui-byte-preregistrato"></a>

# SPK-07 — Preregistered byte-level crash method

;;; REQ: REQ-VAL-001 REQ-FOR-003 REQ-FOR-004 REQ-AFF-002 REQ-AFF-007 REQ-AFF-008 REQ-AFF-009 REQ-AFF-017

Method registered on 2026-10-08 before any compilation or CHECK in this campaign.
Exclusive scope: checkout
`/Users/gpicchiarelli/.codex/worktrees/valutazione-avanzata/ArcDocDB`, new
`byte-crash.lisp`, this method, and new ignored files in its `out/`.
Common Lisp/SBCL, safety 3, warnings and style-warnings fatal. No production
code, benchmark, commit, or push. No SPK-07 core, suite, or runner, or other
spikes are loaded. Sources read: ADR0033 (with §4 superseded by ADR0037),
ADR0037, disk formats, src/foundation/{record,batch,package,crc32c,conditions},
tests/foundation/batch, and existing requirements.

<a id="domanda-e-dominio-finito"></a>

## Question and finite domain

Does read-only recovery preserve valid batch history, explicitly report damage
crossing the acknowledged prefix, and allow interruption at every step of its
finite plan and rerunning without changing bytes?

Four deterministic fixtures: ordinary and prepared/OUTCOME, each in v1 and v2.
Each fixture has three small batches. Keys are single bytes; PUT values are
one-byte CBOR integers. The ordinary fixture contains PUT a=1, PUT b=2;
DELETE a, PUT a=3; DELETE b, PUT c=4. The transactional fixture contains
prepared PUT p (TXID 100) and PUT a; prepared DELETE p (TXID 101) and OUTCOME
100→20; OUTCOME 101→30, prepared PUT q without an outcome, and DELETE a.
SEAL CSNs: 10, 20, 30; explicit file-id, buffer offset in the file 64.
Outcomes resolving prepared records from an earlier batch are also checked.
The expected committed history for each of the four batch prefixes is declared
literally, rather than reconstructed through a production decoder.

Little-endian packing and bitwise CRC32C are implemented in the new module:
no calls to the production encoder, packing, or CRC. CRC is anchored to the
known ASCII vector 123456789 → E3069283 and empty input → 0. Fixtures are
actually read by ARCDOCDB.RECORD:VERIFICA-LOTTO, with explicit version, file-id,
offset, and budget; records are decoded only after a valid SEAL.
The oracle compares the entire history, including DELETE, CSNs, keys, and
values, rather than just the final state. Prepared resolution uses only
OUTCOMEs from fully valid batches in the prefix; an absent outcome leaves the
record invisible. The DECISION table of a real ACTIVE Archivio is not simulated.

For each fixture, the enumeration covers: identity; all N truncations with
available length 0..N−1 (physically shortened buffer); all 8N single-bit
alterations in one byte, including header, body, and SEAL. Every scenario is
crossed with four acknowledged frontiers, at the ends of prefixes of 0, 1, 2,
and 3 batches. Identity represents cut N. Expected lengths are 322 and 360
bytes for the two forms, duplicated for v1/v2: 49,120 main cases, without
randomness. Additional targeted witnesses are counted separately, including
semantically altered SEAL frames with CRCs repaired by independent packing.

<a id="frontiera-coda-e-oracolo"></a>

## Frontier, tail, and oracle

Frontier F is an explicit model fact: reliable external evidence of flushing
and acknowledgments, supplied to recovery. It is not a frontier discovered by
searching garbage for magic or SEAL. Fixture SEALs declare the previous prefix
frontier, capped at F, but do not provide an algorithm for finding that fact
after arbitrary damage. The first batch that fails verification starts at P.
P<F, or EOF before F, yields FAULTED; P≥F yields a tail and valid length P.
No data is returned in FAULTED. A valid batch beyond F may be recovered; the
model does not declare it acknowledged. Cases with F=0 make this distinction
explicit. A second independent calculation uses only positions and the type
of enumerated fault to determine the number of intact batches before the first
damage; it does not decode the fixture. The acknowledged subset must be fully
present for every accepted outcome. Damage to a SEAL below F causes FAULTED
even if all its records remain readable.

The limit of the last unwitnessed flush is explicit: the log alone cannot
distinguish such damage from a tail (ADR0037, RES-05). F is not a production
solution to this indistinguishability. This campaign closes only part of the
byte-level gap: no witness search among arbitrary bytes, segment header,
unordered persistence of multiple simultaneous faults, manifest, real
rename/flush, real filesystem, or collision-free CRC.

<a id="interruzioni-e-controlli-negativi"></a>

## Interruptions and negative checks

The read plan has checkpoints before each VERIFICA-LOTTO, before decoding each
record in a verified batch, before private batch publication, and before the
final result. For each case, the plan is interrupted at every checkpoint
actually reached, private state is discarded, and execution restarts from
scratch. Outcome, valid frontier, and history must match the first result.
FAULTED and tail paths participate as well. A before/after bytewise comparison
is required for every recovery, interruption, and restart: no truncation,
segment writes, or destruction. No crash between individual instructions
inside the production verifier is promised.

Three mutants must produce relevant witnesses, including input, fault,
expectation, and actual result: (1) ignore CRC and accept a single-bit-altered
body in the acknowledged prefix; (2) apply an intact PUT before its SEAL,
truncating before the first batch's SEAL; (3) treat every error as a tail,
hiding damage in the acknowledged prefix. Witnesses must respectively show
acceptance of altered data, publication of uncommitted history, and silent
loss of the acknowledged prefix. A generic error is insufficient.

<a id="budget-e-registrazione-di-tutti-i-tentativi"></a>

## Budgets and recording of all attempts

CHECK, exported by package ARCDOCDB.SPK07.BYTE-CRASH, returns a plist with
:status :ok only after the entire campaign completes. Default budgets:
60,000 cases, 16 checkpoints per recovery, 2,000,000 recoveries started,
40,000,000 total checkpoints, 150 seconds per CHECK, buffer ≤512 bytes,
three batches, four records per batch, 512 bytes per VERIFICA-LOTTO.
Exhausting a limit is an error, never partial success. An expected check with
case-limit=1 and another with step-limit=1 must fail explicitly; neither enters
the positive total. The recorder limits each child to 180 seconds and its heap
to 512 MiB; stdout/stderr each have an 8 MiB threshold, whose exceedance is a
failure, while originals are still preserved in full. No performance measure
is derived from time used for the budget.

A new Common Lisp recorder in out/ saves the schema 1 record before starting
each SBCL child with initializations disabled. Every record contains exact argv
and stdin (empty stdin with the script identified and included), environment,
complete relevant source contents before/after, decoded result, full
stdout/stderr, exit code, limits, and failures. Only the necessary foundations
are compiled manually, in order, into new FASLs in out/: foundation package,
conditions, binary, crc32c, record, batch; then the new module. The first three
attempts also loaded the root package; it is not a module dependency. Fatal
warnings and fatal warnings/failure values in every compilation. Child phases
are also saved in a schema 1 data report, including the failure point. The
recorder does not read other agents' working files; no Git commit is captured.
Recorder bootstrap is infrastructure, rather than an additional CHECK.

Module reports retain fixtures (bytes, batches, and declared histories), every
scenario/frontier, decoded conditions, interruption and restart counts,
witnesses, limits, and coverage. Reports and serialized fixtures are data
artifacts: never LOAD, EVAL, or COMPILE-FILE; read with *READ-EVAL*=NIL.
A failed attempt remains recorded, and every necessary change precedes a new
attempt. The attempt summary is added here at delivery. No outcome promotes
engine requirements or closes the Phase 0 gate.

<a id="correzione-preregistrata-dopo-il-tentativo-03"></a>

## Preregistered correction after attempt 03

Attempts 01/02 checked explicit errors for case-limit/step-limit; attempt 03
completed the first campaign. Subsequent review: initial packing always
declared the full previous frontier in SEALs, including cases crossed with
F=0 or F=first-batch. Such combinations do not represent a consistent durable
fact: a later intact SEAL declared more than F. Record 03 is retained, but is
not the final evidence for the corrected model.

Before further checks, the domain is corrected: four variants are constructed
for each of the four forms, one per F; every SEAL declares
64 + min(batch-start, F). There are therefore 16 buffers, with the same total
of 49,120 cases; each buffer exhausts identity, cuts, and single-bit alterations
under its own frontier. Literal histories remain unchanged. The position oracle
remains separate from the decoder. An additional witness keeps the same bytes
of damage to the last batch and reads them with F at the end of the second or
third batch: tail or FAULTED depends on external evidence. Both buffers have
the same SEALs (the last flush lacks a subsequent witness). This witness makes
RES-05 visible without claiming to solve it.

Three expected exhaustion checks are added: recovery-limit=1, read-limit=1,
and seconds-limit=1/1,000,000,000; together with the two already planned, they
must produce a BUDGET-EXHAUSTED condition naming the relevant limit.
Child reports also retain the failure case and phase; no expected failure is
declared as CHECK :status :ok.

<a id="consuntivo-e-percorsi-di-tutti-i-tentativi"></a>

## Summary and paths of all attempts

All paths below are relative to this method in the isolated checkout.
Every directory contains `record.sexp` (schema 1 command and full before/after
snapshots), `data.sexp` (schema 1 driver and module data), empty `stdin.txt`,
full `stdout.txt` and `stderr.txt`, and exclusive FASLs.
The recorder and driver are `out/byte-crash-20261008/{record,child}.lisp`.
The `.sexp` reports are data; they must not be loaded or compiled as sources.

| Attempt | Record | CHECK outcome and role |
|---|---|---|
| 01 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-01.lisp) | expected :failed, case-limit=1, used=2; first variant |
| 02 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-02.lisp) | expected :failed, step-limit=1, used=2; first variant |
| 03 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-03.lisp) | preliminary :ok, 49,120 cases; superseded by the frontier correction declared above |
| 04 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-04.lisp) | expected :failed, case-limit=1, used=2; corrected packing, before adding structured context to budget errors |
| 05 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-05.lisp) | expected :failed, case-limit=1, used=2; final source |
| 06 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-06.lisp) | expected :failed, step-limit=1, used=2; final source |
| 07 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-07.lisp) | expected :failed, recovery-limit=1, used=2; final source |
| 08 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-08.lisp) | expected :failed, read-limit=1, used=2; final source |
| 09 | [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-09.lisp) | expected :failed, seconds-limit=1/1,000,000,000, used=477/1,000,000; final source |
| 10 | [final record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-10.lisp) | :ok, complete corrected campaign; final source |

Eight expected budget failures and two complete CHECKs; no unexpected
compilation or execution failures. Eight compilations in each of attempts
01–03 and seven in each of attempts 04–10 total 73 completed strict
compilations, without warnings/style-warnings or warnings/failure values.
All records have `:source-stability :stable`. The recorder shell exits 0 even
for a recognized expected failure: CHECK and the child remain :failed/exit 1.
The method is completed with this summary after attempt 10; its full
preregistered snapshot is retained in the attempt record.

The final check compiles only the six foundation files and byte-crash.lisp:
no root package, storage, tests, core, or suite are needed. Exact recorder
command (child argv and driver contents are in the record):

```sh
cd /Users/gpicchiarelli/.codex/worktrees/valutazione-avanzata/ArcDocDB
/opt/homebrew/bin/sbcl --dynamic-space-size 512 --noinform --no-userinit --no-sysinit --script spikes/SPK-07-protocols/out/byte-crash-20261008/record.lisp attempt-10 full
```

`attempt-10` already exists, and the recorder refuses to overwrite it.
A new check uses a new attempt name. The module exports CHECK in package
ARCDOCDB.SPK07.BYTE-CRASH and is independent of the other models.

<a id="conteggi-finali"></a>

### Final counts

- 16 fixtures: four forms (ordinary/prepared, v1/v2), each with four consistent
  frontier facts. Buffers of 322 or 360 bytes; three batches each.
- 49,120 main cases: 16 identities, 5,456 byte-by-byte truncations,
  43,648 single-bit alterations. No random or sampled scenarios.
- 16 complete outcomes, 25,092 tails, 24,012 instances of damage below the
  acknowledged prefix explicitly rejected as FAULTED. No FAULTED result
  publishes data.
- 655,997 recoveries started, 3,760,830 checkpoints executed, at most 14
  checkpoints per recovery; 303,432 interruptions and 303,432 complete restarts
  with identical results and unchanged bytes. Checkpoints interrupted before
  execution are excluded from the executed checkpoint total.
- Three negative checks with relevant witnesses; five SEAL fields altered and
  CRCs independently repaired, all rejected with :seal-mismatch; an additional
  witness for the last unwitnessed flush (two reads).
- The 13 witness recoveries are additional to the 49,120 initial recoveries
  and 606,864 interruption/restart recoveries. Witnesses are additional and
  belong neither to the 49,120 main cases nor to their restart campaign.

The [final data report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/byte-crash-attempt-10.lisp) retains
all fixtures and literal histories, the 49,120 scenario rows, typed conditions
and observed positions, witnesses, and counts. Each row identifies fixture,
fault, frontier, expected/obtained prefix, class, checkpoints, and number of
interruptions/restarts; the checked history is the one declared for the
fixture's prefix (or none for FAULTED).

Limits applied in the final check: 60,000 cases, 16 checkpoints per recovery,
2,000,000 recoveries, 40,000,000 total checkpoints, 150 seconds for CHECK;
512-byte buffer and batch budget, at most four records before SEAL, three
batches per fixture. The child has a 180-second watchdog, 512 MiB heap, and
8 MiB thresholds for stdout/stderr each, with full original output. No limit
was reached in the positive campaign. The five budget checks on the final
source retain the condition's name, value, maximum, and case.

Coverage remains finite and conditional on external evidence of F. The last
flush without a subsequent witness remains indistinguishable from the log
alone; the witness preserves precisely identical bytes with different outcomes
for the two external facts. Filesystem, real flush/rename, collision-free CRC,
persistence with simultaneous faults, file headers, DECISION, manifest, and
complete engine recovery are not proven. No benchmark, commit/push, or changes
to existing files were performed by this campaign.
