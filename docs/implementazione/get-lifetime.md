<a id="lifetime-delle-fonti-get-metodo-della-verifica-integrata"></a>

# GET source lifetime: integrated-verification method

This method precedes increment runs. Verifies
[Serie source](get-fonti-serie.md) bridge with existing GET, WAL, primary, and EBR
APIs, native FDs, and separate workers. Introduces no product code,
formats, or compaction/rotation executor.

<a id="autorità-e-perimetro"></a>

## Authority and scope

Each case uses one initial CLOSED key, an ordinary ACTIVE
controller, private contexts, and no registered snapshot. New roots
published by real batches through `pubblica-commit-serie`; current
locations change through primary's public API.
A new PUT of same key has a new CSN: replacement of
current version, not physical relocation of unchanged version.

Fixture keeps native maps valid until close. Durable catalog
decision and MVCC retention are caller preconditions,
not test conclusions. Temporary files removed only
in final exclusive cleanup; observed reclamation closes FD and releases
ticket, without attesting durable segment removal.

Obligation `L ⊆ S(R)` holds on every acquisition: first update
retains CLOSED and ACTIVE together. Directory reduction occurs
only when old location is no longer in current primary and
sole old reader has already acquired capability in same read
task. No new lookup can then copy that location.
EBR protects captured capability, without making a map
removed before acquisition resolvable.

<a id="casi-e-oracoli-preregistrati"></a>

## Preregistered cases and oracles

Four registered tests, each in v1/v2 formats. First serially
imposes lookup/publication/acquisition order; other three
use I/O worker separate from writer:

1. GET copies CLOSED candidate; writer publishes ACTIVE superset.
   Later acquisition still resolves candidate and reads expected
   bytes from native file.
2. GET stops in native-read hook after acquisition.
   Writer reserves retirement before logical changes, first publishes
   superset, replaces current location, then publishes reduced
   sources. Published retirement cannot be claimed with old pin
   active. After read, copy, and completion, claim succeeds,
   one native close occurs, and credit becomes free. Later GET
   verifies new ACTIVE location and expected value.
3. Same order with typed condition in native hook:
   original cause, intact output, and pin released before external
   cleanup; reclamation can then complete.
4. Same order with nonlocal exit: internal GET cleanup,
   intact output and pin released before external cleanup; then reclamation.

Oracles compare independent inputs, candidate CSN/location,
buffer sentinels, I/O events, FD state, ticket, pin, and EBR credits.
Actual closes observed in fixture backend under
mutex. No global function replacement with workers in flight.
Gates and timeouts are C4 tools imposing interleaving, not waits
added to product; I/O worker retains pin during syscall.
All workers must terminate before controller mutates contexts or closes
FDs. Timeout or missing join fails case.

<a id="esecuzioni-e-conservazione"></a>

## Runs and preservation

Sources, ASDF registration, and method frozen in commit before
campaigns. Warning-free compilation, full suite, and repository
checks through `tools/record-command.lisp`/`make check`.
Existing ACTIVE selection remains unchanged; increment does not
require repeating its mutation campaign without product
or driver changes. Independent reading verifies protocol and
raw outcomes; CI also verifies Linux.

Original output, any observed errors, configurations, and private FASLs
preserved before cleanup. Reports and evidence are data:
reading with `*read-eval* NIL` and EOF, never `LOAD`. Evidence copy
verified in full before publication. Outcomes and run identities
will be reported in campaign catalog after verification.

Requirements: REQ-IDX-001, REQ-WAL-006, REQ-CMP-007, REQ-AFF-001,
REQ-AFF-008, and REQ-VAL-001. This functional verification qualifies neither
performance, zero heap allocation, C1, nor overall MC/DC.
