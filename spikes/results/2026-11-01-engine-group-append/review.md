# Bounded group append author review

Two local readings cover the frozen implementation: first bounds, byte routing
and states; then acquisition/copy/append unwinding, ownership and lifetime.
This is author review, not independent external review or MC/DC certification.

- ADR-0082 adds only an optional borrowed WAL scratch. Generic calls keep
  sequential append. M1 reuses its already allocated scratch after serial
  recovery/maintenance. No new heap arena, dependency, ABI, syscall, lock,
  cross-Serie write, wire operation or durable format is introduced.
- Each total must fit the minimum of three independent bounds. Neither buffer
  capacity nor file-transfer cap is ordered relative to the other. Type and
  identity with every input batch are checked before log acquisition, including
  on paths that would otherwise fall back. Simple octet arrays cannot hide a
  displaced alias; exclusivity against other owners remains a caller contract.
- Existing complete group acquisition still validates file quota, initial
  position, every sealed batch and historical durable witness. Combined copying
  rechecks every start and final sum before writing; the exact returned frontier
  precedes written states. Source batches and CSN/SEAL bytes remain unchanged.
- The executor's unwind boundary is installed before acquisition. It faults
  only if this group owns the log on an incomplete exit. Known unacquired
  refusals do not fault another owner; admitted unexpected errors/nonlocal
  exits preserve their original cause/control transfer and retain obligations.
- Default and buffered paths share this guard. An I/O error can leave a physical
  prefix; no path fallback, retry, scratch reuse or response is authorized.
  Positive short writes complete through existing I/O. EINTR is an error and
  is not retried. Successful append is still not durable or published.
- Strong flush and FIFO root/token/index publication remain untouched. SIGKILL
  injection now chooses exact cumulative frame-plus-SEAL byte offsets in the
  combined buffer, preserving the existing independently expected prefixes.
  RAM/paged selection and source lifecycle are unaffected.
- New product definitions have complete FTypes, REQ tags, docstrings and
  safety 3/speed 2/debug 2. All loops are bounded by existing group slots;
  copy bytes are capped at 64 KiB. No heap-allocation inference is made from
  code inspection; the final allocation campaign remains separate.

| Decision | Exercised alternatives |
|---|---|
| Optional scratch | NIL, octet buffer, invalid type, alias with each of three batches |
| Group count | Single batch versus multiple; generic default versus explicit option |
| Capacity conjunction | Exact scratch, one short, empty, scratch larger than 64 KiB, total exactly 65,536/65,537, transfer cap below total or exactly total |
| Before acquisition | Invalid input and file refusal preserve buffers/state/CSNs; busy-group checks remain in existing WAL suite |
| Owned exit | Nonlocal exit before/after actual acquisition, both append paths; only owned group becomes terminal |
| Copy invariants | Exact batch starts and total sum; independent damaged start/sum before any writer call |
| Append/frontier | Full writer, chunks 1/7/full, every byte cut, bad returned frontier, EIO/ENOSPC/EINTR after progress |
| Cleanup/cause | Same arbitrary primary condition, same throw value, retained log/group/batches, no new flush/retry |
| Durability/reuse | One flush, exact old/new frontiers, flush error, no early coverage/reuse, caller overwrites scratch after completion |
| Real engine | Both formats, all three primary profiles, small/large values, exact scratch identity, reopen/new CSN, existing group/rotation/compaction/crash suites |

The byte-cut model checks 1,632 combinations: both formats, 272 cuts through
three batches with PUT/tombstone/multiple PUTs, and chunk ceilings 1/7/full.
Its expected ends, record counts and exact prefix bytes are independent of the
recovery scan being checked. This does not model device power loss or arbitrary
concurrent mutation; current serial ownership is explicit.

## Development diagnostics

The first C4 candidate self-test found a zero observer count because native-write
was already inlined: changing its function definition could not observe native
calls. The revised experiment counts non-inlined append entries and does not
label them measured syscalls. It also reads retained workspace sizes after
the normal batch-used counter reset, avoiding a vacuous last-copy check.

The first focused compilation found a missing close in a new engine test.
The next run passed all seven initial WAL methods but found that real M1
still used sequential append. The initial guard incorrectly chained the upper
bounds with `<=`; it compared bounds to one another instead of comparing total
bytes to their minimum. This was a product selection defect, with canonical
bytes/durability preserved by fallback. The fix uses `min`; added oversized
scratch and exact small transfer-cap cases detect it independently. Original
drivers, defective helper and failed raw records are retained.
