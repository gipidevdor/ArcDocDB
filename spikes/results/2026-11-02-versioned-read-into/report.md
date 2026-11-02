# Versioned reads into caller-owned storage

The Unix client now exposes `client-get-version-into`: one canonical current read
returns the verified document in reusable caller storage, its byte count and its
positive u64 CSN. The caller can pass that token directly to conditional PUT or
DELETE. Absence returns exactly `:absent/0/0` and leaves the output unchanged.

This composes the current-version engine path with the existing buffer API. It
removes the intermediate document vector from this workflow; it does not add a
wire operation, capability, engine admission path or durable format. The original
versioned GET still produces an independent persistent copy. Resident/paged
selection stays transparent to both clients.

Base: `059e91b1f17609c14ddf597853ec54799d41c37d`. Runtime changes are limited to
five `src/local/` files: package exports, shared output preflight, response
dispatch, the new client entry and the extracted version-response validator.
ASDF adds test inventory only. Engine, storage, primary index, I/O and WAL source
bytes are unchanged. The [method](method.md) and [two author readings](review.md)
state contracts, decisions and remaining qualification limits.
After qualification, the branch fast-forwards to `e4cfeba9`, an update of two CI
reconciliation evidence paths only. It changes none of the qualified source bytes.

## Correctness and integration

- Strict warning-as-error compilation and 208 focused local cases pass.
- Exact planned/started/passed ledgers qualify **469 cases in nine suites on each
  of SBCL 2.6.9 and 2.6.10**. These are two runtime observations of the same cases,
  not 938 distinct tests. [2.6.9 ledger](qualification-sbcl9/completed.lisp),
  [2.6.10 ledger](qualification-sbcl10/completed.lisp).
- Nine added test methods cover output/owner/capability preflight, complete
  u64 IDs/tokens, malformed responses before any copy, unchanged rejection and
  absence output, persistent copy ownership, retained coalesced frames, callback
  GC/BUSY exclusion, deadlines and nonlocal exits.
- The new process method executes four format/mode scenarios per runtime:
  formats 1/2 × resident/paged. Eight actual service processes include four
  intentional SIGKILLs. Two real clients exercise stale-token conflicts,
  delete/reinsert, 60,000-byte documents, a too-small negotiated frame and
  conditional writes using the recovered token, with exact fresh CSNs.
  These process counts describe this new method only, not the entire P3 suite.
- `make docs` passes generated-reference/export/docstring checks and the extended
  public Lisp example, which reads a token into the reusable buffer, applies a
  conditional update, rejects a stale token and checks clean reopen and absence.
- Trace regeneration, trace, lint and links pass without a matrix change.

The fresh full `make check SBCL=/opt/homebrew/bin/sbcl` passes warning-as-error
build, the complete product suite, legal/static/trace/link/full-text/evidence
checks, all eleven registered spikes and CI self-tests. Before/after identities
match the same **1,765 actual source files** used by both selected qualifications.
The independently inspected nested `check-core` receipt contains the actual
complete build and spike output; its outer receipt only records that command.

Retained command receipts: [focused](commands/version-into-focused-01/report.lisp),
[2.6.9 qualification](commands/version-into-qualification-sbcl9/report.lisp),
[2.6.10 qualification](commands/version-into-qualification-sbcl10/report.lisp),
[complete check](commands/version-into-checks/report.lisp),
[actual nested check output](commands/4002626104-command-9751-0/report.lisp),
[documentation](commands/version-into-docs/report.lisp) and
[trace/lint/links](commands/version-into-static/report.lisp).
The [source identity verification](source-identity.lisp) checks the actual source
inventory, runtime scope, base validator copy, exact case ledgers and allocation
controls. [Archive inventory](archive-data.lisp) maps originals to verified copies,
including 1,302 child stdout/stderr files from retained successful P3 roots.
The [lossless closure](closure.lisp) independently verifies copied original-byte
hashes after compaction. Regenerable paths are consumed only after this closure
and the completed verification receipts are retained.

## Managed allocation diagnostic

Both runtimes complete five alternating 10,000-call windows for each API at
absence, CBOR null, 1,024-byte and 60,000-byte documents: **40 windows and 400,000
calls per runtime**, split evenly between the persistent and caller-buffer APIs.
All **20 caller-buffer windows per runtime** report zero allocated bytes:
200,000 new-API calls per runtime, 400,000 across both runtimes.

Reported allocation per 10,000-call window is identical in all five repetitions
and both local runtimes:

| Result | Persistent API, bytes | Caller-buffer API, bytes |
|---|---:|---:|
| Absent | 0 | 0 |
| Present CBOR null, 1 byte | 262,144 | 0 |
| Present, 1,024 bytes | 10,352,160 | 0 |
| Present, 60,000 bytes | 599,979,952 | 0 |

The three present-document persistent controls allocate, demonstrating that the
counter sees document copies; absence is already nonallocating in both APIs.
Counters are SBCL process measurements, not exact object-size accounting.

This fixture preallocates documents, caller buffers and injected I/O closures. It
uses one reply arena, stamped by the existing wire encoder on each mock send;
that work and byte/token validation are inside allocation accounting. Warmup and
full GC occur outside each window. IDs and tokens fit fixnums. No real socket,
engine throughput, latency, cold-I/O bandwidth or uninterrupted-client GC behavior
is measured here. Large numeric conversions, custom callbacks and errors may
allocate. This is no universal COD-30 or production-performance qualification.
Raw final diagnostics:
[SBCL 2.6.9](commands/version-into-allocation-final-sbcl9/report.lisp),
[SBCL 2.6.10](commands/version-into-allocation-final-sbcl10/report.lisp).

## Failures and retained scope

The first allocation fixture used a little-endian storage helper for a CBOR
document length. The actual validator rejected that fixture at the 1,024-byte
case, after its smaller cases. Its exact
[source](variants/initial-allocation/allocation.lisp.source) is retained; final
measurements use the canonical wire header writer. No product source correction
was needed. The failed partial run is excluded from the counts above.
[Failed allocation receipt](commands/version-into-allocation-sbcl9/report.lisp).

The first archive-tool self-test caught an unmatched parenthesis before the
collector could run. Its [source](variants/initial-archive/archive.lisp.source)
and failed command remain separate from the passing final self-test.
[Failed archive receipt](commands/version-into-archive-selftest/report.lisp).
Completed
case-ledger, archive, verifier, closure and cleanup guard fixtures reject their
respective altered data, missing/duplicate cases or wrong scope.

This is local macOS ARM64 functional and allocation evidence on Apple M4. It does
not qualify Linux, power loss, complete C1/MC/DC, historical MVCC, concurrent engine
readers or multiseries behavior. Existing gates remain open. Cleanup is limited
to owned regenerable outputs/cache and the successful P3 fixtures whose logs are
archived. Other worktrees, branches and shared Git metadata are preserved.
