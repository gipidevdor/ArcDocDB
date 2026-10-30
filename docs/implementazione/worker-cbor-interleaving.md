<a id="rendezvous-dei-worker-nelle-fixture-concorrenti"></a>

# Worker rendezvous in concurrent fixtures

Method preregistered before correction verification. Full local
attempt R1 of [GET lifetime](get-lifetime.md) campaign failed
on float-worker overlap; PR 13 CI run `38634044870`
failed on macOS tag-worker overlap. Ubuntu succeeded. Original
evidence/failed outcomes separate and preserved.

Simultaneous release of two semaphore credits does not require
scheduler to start both bodies before one ends. Nonoverlapping
interval may therefore fail test after correct results.
First correction concerns float/tag fixtures only, without changing
encoders, formats, item counts, oracles, product APIs.

<a id="ordine-controllato"></a>

## Controlled order

Every reused worker records initial wall time, encodes first
item, checks result, full image, sink contribution.
Then records first-checkpoint time, signals `ready`, waits
for `go`. Controller waits for both checkpoints before allowing
remaining operations. Each wave retains distinct semaphores; waits/joins
bounded, cleanup releases gates before stopping workers.

No worker can finish body before other has
completed first item. Check `start <= first <= finish`,
`max(first) <= min(finish)`, positive duration/overlap. Times
observed without rounding, clamp, synthetic timestamps. Intervals,
checkpoints, sinks, overlap printed/flushed before temporal
assertions, preserving diagnostics even on new failure.
Value/immutability oracles unchanged.

Metric is **fixture** wall interval, including rendezvous
and checks. Demonstrates imposed task interleaving; measures neither
encoder-only latency, CPU simultaneity, nor scaling. Two first-correction
helpers each have one test caller, not used by
benchmarks.

<a id="verifica"></a>

## Verification

New source/method commit frozen before campaigns.
Independent review checks checkpoint position,
counts, cleanup. `make check` recompiles without warnings, runs all
suites including four unchanged v1/v2 lifetime cases; full CI
then checks Linux/macOS. Original outputs, errors, configurations,
private caches preserved; data read with READ-EVAL NIL/EOF,
never loaded as code. No C1/performance qualification promotion.

Requirements: REQ-CBR-004, REQ-CBR-007, REQ-CON-005, REQ-AFF-004,
REQ-AFF-008, REQ-VAL-001.

<a id="estensione-preregistrata-dopo-il-controllo-su-main"></a>

## Preregistered extension after main check

PR 13 integrated in commit
`05a1c1f1688968c7c64b483a14528945a05b1335`, same tree as
successful CI checkout. Subsequent main run `38640790953` succeeded
on Ubuntu/documentation but failed on macOS second ARRAY-write
wave overlap. First wave prints positive overlap;
second log still precedes correction, lacks failed
intervals. Both corrected FLOAT intervals positive.
Failure preserved, not attributed to external load.

Two independent readings identify same natural gate in eleven remaining
fixtures: ARRAY, MAP, SIMPLE, STRING write; header write/read;
minimal header; minimal/structural scanning; UTF-8; two-Serie
computation fixture. Extension concerns those tests, without product,
requirement, registered-name changes or already corrected FLOAT/TAG fixtures.

Checkpoint follows first real operation with intended checks/sink
or first full plan iteration. Header write completes
all seven planned headers, checks image/cursor before gate.
Two-Serie test separately preserves B progress while A
holds guard/token: computation rendezvous follows release
of both leases and first CRC compared to cold result.
No gate holds a resource needed by other worker.

Counts unchanged: 8,192 ARRAY/MAP compositions each;
32,768 SIMPLE/STRING items each; 229,376 header writes; 2,097,152 header
reads; 524,288 minimal headers; 48 minimal scans, 48 structural scans;
128 UTF-8 calls across 83,886,080 bytes; 64 CRCs per each of two
Serie. No extra measured-operation call. Final oracles,
read-only inputs, private scratch, bounded cleanup
remain active. Reused waves retain distinct semaphores.

Strictly positive overlap, positive duration, checkpoint order,
flushed diagnostics before timing assertions retained.
Historical CPU labels also become fixture WALL: include
waits/checks, without pure-operation timing measurement.

Three authors work on exclusive files, exchange change
reviews. New commit frozen before one full check
with new private ASDF cache. Counts/names derived from that commit's
Git and actual CI checkouts; current total 1,528 tests in
33 suites plus two smoke tests. Original attempts, configurations,
records, caches preserved before cleanup.
