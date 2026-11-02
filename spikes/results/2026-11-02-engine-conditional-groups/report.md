# Shared public engine conditional groups

`arcdocdb.engine:scrivi-gruppo-documenti-se-versione` now exposes bounded
conditional strong groups to an embedded serial owner. The explicit Unix
conditional dispatcher calls this same public engine entry. Existing mixed
same-turn cohorts retain their flag-vector interface and semantics.

Select 1..8 distinct-key descriptors and stable expected-u64 tokens; provide
separate exclusive token-u64/applied-u8 outputs. The result is the applied count,
with complete prefixes of `1/new strong CSN` or `0/current live CSN` (zero for
absence). Output tails and expected tokens stay unchanged. Conflicts consume no
CSN. An all-conflict group skips writer preflight, maintenance and flushing even
at full ACTIVE capacity. A capacity refusal never splits the group.

NIL at the private flag boundary means all members are conditional. This reuses
the complete existing validator, projection, strong writer and cleanup without a
new flag array, mutable global, lock or per-engine allocation. The projection's
208-byte array payload remains unchanged. Each applied operation retains its own
SEAL and CSN; covering strong flush and FIFO publication precede output. This is
not a transaction: an admitted failure can recover a sealed prefix and authorizes
no output. No automatic retry is added.

Base: `3bf46428e03d7b9e8ef9bd1e6394201b038c3ffe`. Exactly three runtime source
paths change: engine package exports, conditional-group composition, and the Unix
conditional dispatcher. WAL, storage, I/O, primary indexes and durable formats
are unchanged. [Preregistered method](method.md) and
[two author readings/decision table](review.md).

## Verification

- **58 selected affected cases in four suites pass on each of SBCL 2.6.9 and
  2.6.10**, with exact planned/started/passed IDs and explicit exclusions from
  the full catalog. [2.6.9 ledger](qualification-sbcl9/completed.lisp),
  [2.6.10 ledger](qualification-sbcl10/completed.lisp). These are two runtime
  observations of the same selected cases, not 116 distinct tests or complete
  suite qualification.
- The final focused selection passes 56 cases in three suites. Nine new test
  methods cover counts 1..8 and one flush, independent histories, v1/v2 and all
  three index profiles, rotation/reopen, full-ACTIVE conflicts, input/alias/key
  refusals before probes, capacity/output preservation, owner/BUSY/GC/closed
  admission, error/throw recovery and the actual public Unix call boundary.
- Existing distinct-process explicit-group and lost-response tests pass through
  the shared public engine entry: v1/v2 × resident/paged, exact individual
  tokens/flush counts, SIGKILL, restart, recovered values and fresh CSNs. Each
  runtime executes 16 service processes, eight intentional SIGKILLs and eight
  scenarios in these two selected process methods. The dedicated logs are retained.
- `make docs` passes source/export/docstring verification and the extended public
  example. The example obtains a current token into reusable storage, applies a
  two-member conditional Unix group, rejects the old token and verifies clean
  reopening, subsequent CSNs and absence.
- Trace regeneration, trace, lint and links pass without a matrix change.

The fresh complete repository check passes warning-as-error compilation, the
entire product suite, legal/static/full-text/evidence checks, all eleven
registered spikes and CI self-tests. The same 1,765 actual source files match
both selected qualifications, allocation diagnostics, documentation and complete
check. Normal full-check process fixtures retain their standard successful
cleanup policy; dedicated process runs retain their logs for this campaign.

Retained receipts: [final focused selection](commands/engine-if-focused-final/report.lisp),
[SBCL 2.6.9 qualification](commands/engine-if-qualification-sbcl9/report.lisp),
[SBCL 2.6.10 qualification](commands/engine-if-qualification-sbcl10/report.lisp),
[complete check](commands/engine-if-checks/report.lisp),
[actual nested check output](commands/4002631245-command-28116-0/report.lisp),
[documentation](commands/engine-if-docs/report.lisp) and
[trace/lint/links](commands/engine-if-static/report.lisp).
[Source identity](source-identity.lisp) independently verifies the runtime scope,
complete current source inventory, exact ledgers, controls and prior test variant.
[Archive inventory](archive-data.lisp) maps original bytes to verified retained copies.
The [lossless closure](closure.lisp) verifies all copied original-byte hashes
after compression, including dedicated child logs. Regenerable storage is
removed only after these receipts and the closing command are retained.

## Allocation scope

The real public all-conflict path completes 40 windows per runtime:
legacy/resident × 1/8 members × five paired 10,000-call windows, using reused or
freshly allocated caller outputs. All **20 reused-buffer windows per runtime**
report zero managed allocation: 200,000 API calls per runtime, 400,000 across both.
The 20 allocating-caller controls per runtime report positive allocation.

These calls perform real authoritative index lookups with a full ACTIVE and a
live first key plus absent remaining keys. Actual output tokens, flags, guards,
cleared private scratch, canonical file bytes and frontier 1 are checked. The
allocating control changes only caller output provisioning; product semantics
and logical state are the same. Warmup and full GC precede each measured window
outside accounting. Counters are SBCL process measurements, not exact object-size
accounting or proof of universal nonallocation.
Raw final diagnostics:
[SBCL 2.6.9](commands/engine-if-allocation-sbcl9/report.lisp),
[SBCL 2.6.10](commands/engine-if-allocation-sbcl10/report.lisp).

No mutating throughput, latency, paged-I/O allocation, bignum conversion,
uninterrupted-client GC or production SLO is measured. Admitted writes and error
paths retain their existing allocation behavior. This is no complete COD-30,
C1/MC/DC, Linux, power-loss, historical-MVCC or multiseries qualification.

## Earlier selection and retention

The first focused selection passes 55 cases before the final mixed-flag refusal
regression is added. Its exact earlier
[test source](variants/focused-01/conditional-group.lisp.source) is retained and
checked against that command's recorded blob. Product code does not change
between those selections; only the final selection/qualification is attributed
to the complete final test inventory. No failed product execution is observed.

Terminal commands, original outputs and dedicated child logs are retained with
hashes and lossless compression. Cleanup is limited to this worktree's
regenerable build/output/cache and verified successful private fixtures. Other
worktrees, branches and shared Git metadata remain untouched.
