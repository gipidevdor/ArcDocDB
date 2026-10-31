# M1 location delta — preregistered verification method

Registered on 2026-10-31 before implementation or execution of this increment.
Scope: the serial M1 delta, publication and lookup integration, activation and
renewal payload accounting, tests, and corresponding documentation.
REQ-IDX-011, REQ-IDX-010, REQ-WAL-006, REQ-LIM-003;
INV-I1, INV-I8, INV-V5, INV-A8, INV-P6. Decision: [ADR-0071](../adr/0071-delta-location-indice-m1.md).

## Contract and independent expectations

Keep exact private keys and the existing bounded linear probe. Reserve a u64
array of five words and a state byte for each table slot. Copy the hash seed
at creation. State zero is unpublished, one LIVE, two TOMBSTONE; other states
are invalid. For committed records, expected words are constructed directly
from known CSN, segment ID, offset, key length, and record length, rather than
read back from the resident index as the only oracle.

Public GET must read updated values, report DELETE as absent without touching
output, and recover a resurrected key. A touched key must not read the base
image or resident table. Temporarily disconnect the engine's resident handle
and invalidate the retained resident lookup in a test-only scope to make an
accidental dependency observable. Restore the handle before cleanup.
Untouched keys must still resolve through the verified image. Digest equality
does not replace exact key comparison, including nonzero input spans.

## Planned checks and fault injection

1. Strict compilation with warning/style-warning errors and safety 3.
2. Existing v1/v2, 4/16/64 KiB delta, activation, renewal, and maintenance tests.
3. Exact `57*C + key-bytes` payload for zero/default and endpoint quotas;
   independently sum actual array element bytes. One byte below activation or
   renewal quota rejects before namespace/WAL effects; equality succeeds.
4. PUT/DELETE/repeated DELETE/resurrection and new keys at full quota. Assert
   unchanged files, CSN, membership, and values on rejected preflight.
5. Full-width CSN/location words, unpublished/invalid state, missing reserved
   key, wrong owner/BUSY state, and corrupted layout. Invalid admitted reads
   must fault without returning a value or silently consulting another backend.
6. Nonlocal exits and injected errors before/after delta publication. No ACK
   before complete publication. Preserve the primary condition and close admission.
7. SIGKILL before append, after flush, immediately before/after delta publication,
   and after commit, in both record formats. An independent restarted process
   checks values, absence, and CSN from known workload expectations. Old image
   bytes must remain unchanged. SIGKILL does not qualify power loss.
8. Repeated direct lookups over preallocated keys/output with live, tombstone,
   and untouched cases; compare expected fields outside timed/allocation windows.
   Five warmed allocation windows and at least 100,000 lookups per window.
   Record bytes-consed; it is not RSS. These are allocation checks, not a
   throughput target or a claim about lock-free progress.
9. Two C1 readings: first publication ordering, exact-key lookup and failure
   semantics; second memory accounting, numeric domains, ownership, and bounds.
   List new compound decisions and the tests that independently falsify them.
10. Complete `make check`, including traceability, links, recorded checks, and
    negative oracles. Preserve failed attempts and their source identity.

## Budgets and evidence

No benchmark with a large dataset or concurrent load in this increment.
Fixtures use the existing bounded M1 engine configurations. Probes stop within
C slots and compare at most 65,535 key bytes per slot; descriptor copies take
exactly five words. No retries, shared state across Serie, or hot-path array
allocation. Maximum configured delta payload is below 24 MiB; headers, GC,
runtime and the retained resident index are separately accounted.

Run commands through `tools/record-command.lisp`, retaining command, environment,
source contents/hashes, exact output, limits, exit status, and failures. Publish
a compact summary and hashes; retain large raw records by the repository's
evidence procedure. Report actual local platform and unsupported platforms.
