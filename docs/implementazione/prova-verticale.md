<a id="scrittura-crash-e-riapertura-di-una-serie"></a>

# Writing, crashing, and reopening a Serie

> **Proposal** — C4 integration test of existing components, with
> explicit serial orchestration in the fixture. This is not a server API.

The [suite](../../tests/vertical/scenarios.lisp) connects ACTIVE preparation,
WAL/CSN, controller, primary index, and GET. It performs inserts, an update,
tombstones, and reads before stopping, using native files. The writer
stops with SIGKILL: no Lisp shutdown or cleanup. A new process reads
CONTROL and the Archivio's complete decision log, recovers ACTIVE through
the authoritative reader, builds and publishes the checkpoint, and rereads the data.
A third process rebuilds the index and reads again from the published files.

Read-only capabilities are opened by the product API
`io:apri-lettura-nella-directory`, relative to the owned directory's FD.
Recovery reads of CONTROL, decision log, and ACTIVE use the EOF
returned with each capability, obtained on the same FD.
The fixture's independent images remain available for byte
comparisons; they do not supply the size for these three canonical reads.

Since 2026-10-17, new `.tmp` outputs also use
[product relative exclusive creation](io-creazione-relativa.md), through
`io:crea-temporaneo-nella-directory` on the same owned parent. The fixture
immediately registers the append capability, with a transfer budget and size
of 8 KiB; name selection and preparation order remain C4.

| Stop point, in both formats | Check after reopening |
|---|---|
| Five durable commits | Latest updated value of A, C present, B deleted |
| 13-byte fragment without SEAL | Same committed state; tail physically retained |
| Checkpoint prepared, before publication | Previous CONTROL authoritative; temporary retained; prepared ID not reused |
| Checkpoint published and rotation, then three new commits | Reads across two CLOSED; update and tombstone in the second segment override the first |

Expected values are constants independent of product responses. The test
compares all bytes of preexisting segments after recovery, checks
signal 9 and stop-point markers, frontiers, record count, and values
read. The negative control changes the expected value and requires the
specific oracle error, in addition to the verifier's nonzero exit.

<a id="riproduzione"></a>

## Reproduction

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/vertical-crash.lisp --self-test
make check
```

The [preregistered method](../../tests/vertical/method.md) defines budgets,
workload, and limits. The [retained results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-vertical-crash/README.md)
distinguish development from the final full check, without attributing earlier
tests to subsequently modified sources.

<a id="ripresa-delle-scritture-e-secondo-crash"></a>

## Resuming writes and a second crash

The [new fixture](../../tests/vertical/resume.lisp) extends each of the
eight scenarios: a new process checks all CLOSED prefixes and empty ACTIVE,
derives the maximum CSN including tombstones, and builds a
separate environment with registry, snapshot, and controller on the same base. After a
checkpoint it performs four new commits and immediately checks GETs and H.
A second SIGKILL follows; two new processes recover and reread the
effects. The final maximum CSN belongs to a deleted key.

The suite runs 16 positive scenarios and two negative controls: 71 processes,
26 intentional SIGKILLs, constant expectations, and segment retention.
The new negative resets the registry to zero: it must detect CSN
reuse before append and leave the new ACTIVE at only 64 bytes.
The [resume evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-vertical-resume/README.md)
also retains failed fixture attempts.
The [final full verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-vertical-resume-verifica/README.md)
retains `make check`, the verified sources, and the ten spike results.
The subsequent [full-text documentation integration](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-vertical-resume-integrazione/README.md)
checks updated traceability, keeping the new designed requirements distinct.

<a id="confine-rispetto-al-prodotto"></a>

## Product boundary

Bootstrap, the budget of eight proposed IDs, name selection, recovery
order, and index replay are test code. Replay accepts
only ordinary records, after checking all CLOSED prefixes; it rejects
prepared/OUTCOME. Serial candidate publication follows the controller
root: it does not demonstrate atomicity between index and root under concurrency.
UUID and namespace completeness are fixture facts.
Even with product opens, EOF, and exclusive temporary creation, bootstrap,
probe-based selection between temporary and final names, and coordination
remain C4. The fixture
registers returned capabilities and retains ownership until cleanup;
no engine-managed collection of capabilities is introduced.

Since 2026-10-16, new ID selection uses the [product directory entry point](id-directory-recovery.md)
on the authoritative manifest and owned parent: canonical names and a single
attested enumeration, without building a C4 inventory of eight IDs.
The fixture separately checks its eight-ID limit and the
`:ready` state; it does not execute the plan's removal actions. Name scanning
is product code; recovery order and replay remain C4.

Resume reconstructs H/CSN only for the fixture case and checks current
GETs; it does not implement the engine admission gate or historical snapshots
after the crash. The decision log is empty: the authoritative entry point is
exercised, while complete multiseries semantics
remain in dedicated campaigns. Files are small and cached;
no performance measurement, power loss, or C1/MC/DC qualification.

The test makes the composition of a Serie and its recovery concrete.
Coordination still needs to move into the engine with its own contracts, errors,
and checks; MVCC and multiseries need integration; and sustained loads,
GC, the reference platform, and later roadmap features need qualification.

<a id="revisione-dellestensione-c4"></a>

## C4 extension review

A checklist reading checks: file/process/cycle budgets;
all CLOSED verified before replay; empty ACTIVE before rebasing;
new environment without reusing inspection capabilities; one registry shared
by WAL/controller/snapshot; constant data and CSN oracles; typed error
before append in the negative case; original bytes unchanged after both crashes.
Deleting an already absent key is allowed only if GET
confirms its absence. That extension did not modify C1 sources. The subsequent
connection to product ID selection has a dedicated contract and checks;
this C4 reading is not an independent review or C1 qualification of the
Recovery Manager.

<a id="acquisizione-delle-fonti--2026-10-17"></a>

### Source acquisition — 2026-10-17

ACTIVE and CLOSED are now opened through the [product owned set](fonti-recovery.md),
once per canonical fixture manifest. The test uses borrowed capabilities,
terminates readers, and closes sets before the parent; it no longer scans CLOSED
IDs from one to eight. Eight remains the C4 budget, without restricting IDs or inventory
in the product. The campaign retains 16 positive scenarios and two negative
controls; replay and overall coordination remain in the test.
