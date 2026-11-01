# ACTIVE metadata integration review

Two local author readings cover the final code: (1) configuration, bounds,
ownership and all reader accesses; (2) tail preparation, adoption, failure
unwinding, publication, lifecycle and recovery. This is not independent external
review, MC/DC certification or whole-engine C1 qualification.

- ADR-0081 preserves the generic persistent source default and adds an explicit
  append-only source option. M1 selects it with page/PUT bounds equal to its
  record limit. All disk/wire formats, one CSN/SEAL per operation, the shared
  group flush and the existing FIFO publication are unchanged.
- Exactly three specialized u32 arrays are charged before construction:
  `8*pages + 4 + 24*puts` payload bytes. M1 reserves `32*max-records + 4`.
  Dimensions, full startup quota and mode precede array allocation. Object
  headers and the fresh immutable root descriptor remain outside this payload
  metric; no zero-allocation or RSS claim is made.
- The source writer alone updates the unused suffix and initialized-tail count.
  Every completed page end, cumulative row boundary and row span is write-once.
  Each root's count/PUT-count/end/content is immutable. GET reads only that
  captured prefix and never consults the mutable writer count. The existing
  acquire publication and EBR source/FD lifetime remain the ordering mechanism.
- Page lookup has 17 comparisons plus the checked final convergence; row lookup
  has 33 comparisons and an explicit first/count interval. Geometry and prefix
  checks dominate every array access; local neighbor ends, page membership and
  row limits prevent routing outside the acquired prefix. Tombstone pages
  advance page/byte limits without consuming a PUT row.
- Common source, candidate CSN/size/flags, target, proof and canonical record
  checks are shared with the persistent/CLOSED resolver. The refactor extracts
  those checks rather than creating a second verification implementation.
  Missing or inconsistent metadata faults GET and releases its pin, never
  produces document absence or a copied authorized result.
- OPEN preflight checks exact cumulative capacity and untouched tail before
  CSN. A known sealed CSN-order refusal is checked before tail writes and leaves
  the source healthy. Once tail preparation begins, every error/nonlocal exit
  faults the controller at Archivio scope, including an exception after the
  underlying event was adopted. The primary cause/control transfer survives;
  no tail rollback, retry, token resolution or response is invented.
- There is no new lock, global counter, clock, syscall or cross-Serie write.
  The writer count is local; a GET introduces no shared write (INV-P6).
  The original durable SEAL is still the atomicity point (INV-A2/A11).
- Automatic RAM/paged switching retains the same ACTIVE arena. Rotation and
  full-prefix compaction create fresh file-bound sources/arenas and retire the
  old source through the existing lifetime. No new canonical deletion path is
  introduced. Retained old-root witnesses verify unchanged prefixes across
  actual group writes and backend changes.
- Full FTypes, requirement tags, docstrings and safety 3/speed 2 remain in
  product code. New compound decisions are listed below. The immutable-root
  descriptor allocation remains an explicit COD-30 residual.

## Decisions and evidence

| Decision | Exercised alternatives | Evidence |
|---|---|---|
| Source layout | persistent default, append-only, invalid value | unchanged generic tests; new mode/budget test; same-code reader comparison |
| Startup charge | exact bytes, one below; empty vs populated roots | exact 92/91-byte construction; empty reservation; M1 32N+4 witness |
| Arena dimensions | page/limit/row array lengths match source bounds | typed geometry checks and reader/factory paths; malformed metadata faults |
| Prefix identity/bounds | empty/nonempty, directory NIL/nodes zero, counts within capacity, end matches immutable final page | empty and mixed-page cases; 65,536-page extremes; old-root and corruption cases |
| Unused writer tail | matching prepared count and prefix; free/nonzero next page; quota fit/exhaustion | exact OPEN refusals, repeated preflight and reused-tail fault without CSN |
| PUT row span | zero/one/multiple PUTs; nonzero first row; u32 CSN carry; ordinary flags | mixed PUT/tombstone pages in v1/v2 at base #x1ffffffff |
| Sealed event order | increasing vs duplicate captured CSN | known-order refusal before metadata mutation, healthy source and caller-owned batch |
| Preparation completion | complete, copy error, copy nonlocal exit, error after adoption | same-cause and throw controls; terminal Archivio scope; no publication/I/O/reentry |
| Captured visibility | no/current/old prefix, prepared durable tail outside published bounds | direct future-location fault; old reader ignores corrupted future entries and writer count |
| Page search | rank first/last/midpoint, all 17 comparisons, predecessor/successor within captured bounds | 65,536-page geometry oracle and neighboring-end corruption |
| Row/canonical checks | matching vs missing offset, altered CSN/size/flags/proof | independent damage cases before I/O and complete existing resolver suites |
| Lifecycle | same ACTIVE across backend changes; fresh arena after compaction/reopen | two engine integration methods and existing rotation/group/crash matrices |

The independent finite model enumerates 224,213 three-phase reader schedules,
832 captured roots and 468 incomplete cuts over eight PUT/tombstone patterns
and group widths 1/2/3. Three controls detect premature publication, prefix
mutation and a missing fault-admission guard. It models SC with explicit
publication and does not qualify arbitrary weak memory or physical power loss.

## Development diagnostics

The first focused compilation rejected extra closing parentheses in the new
test files. Two later focused attempts exposed test-oracle mistakes: public
controller health is `:faulted` with a separate `:archive` scope, and a public
root query intentionally refuses an already faulted controller. The revised
witness reads raw owned fields to verify no CSN/buffer/event effects while
checking health/scope separately. Original failed records and test variants
are retained; these corrections did not weaken product checks.

The larger allocation window also refines interpretation of the earlier
group-commit report: its 128-operation counter windows showed roughly 512
bytes/write, while 4,096-operation windows show roughly 751. TLAB accounting
granularity is preserved rather than rewriting old results. The new campaign
compares identical large windows and retains the small-window counters only
as observed values, not as exact allocation proofs.

The first final lint/trace/link/evidence invocation used Make's unqualified
`sbcl` from the inherited PATH. That executable refused its mismatched core
before lint ran (runtime/core identity mismatch). The failed raw command is
retained; the final checks explicitly select the already qualified Homebrew
2.6.9 executable and matching PATH. No source or product check was weakened.
