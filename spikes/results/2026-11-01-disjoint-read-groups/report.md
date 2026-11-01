# Strong-flush cost and independent GET scheduling

Base: `0b81e0335c8f058a5c570db2612a8e64976b1fe5`. The single serial Unix actor
now retains its same-turn write queue across valid ordinary GETs on disjoint
binary keys. Same-key reads and all other barriers remain. Canonical copied
values, FIFO CSNs, Darwin F_FULLFSYNC and strong completion before socket sends
are preserved. [ADR-0088](../../../docs/adr/0088-independent-get-write-groups.md),
[method](method.md), [two C1 readings/decision table](review.md).

The unchanged baseline attributes 78–96% of server wall time to completed strong
sync calls in this matrix. Physical flush count and wall time are measured
separately: timing includes successful calls only, not a percentile subtraction.

Each main campaign has twelve cases, sixty windows and 34,000 checked operations:
1,024-byte canonical documents, format 2, resident/paged, one/eight connections,
95/5 and 50/50 GET/PUT, forced maintenance and administrative limit-1 controls.
Five 100-round windows/case; actual closed-loop bursts, not natural arrivals.
Parent/server/common/definition driver hashes are identical across baseline,
candidate and repeat. Every returned document, per-key version, consecutive
CSN interval and final strong frontier is independently checked. All windows
and failures are retained.

| Eight connections, 50/50 | Baseline median ops/s | Candidate gain | Repeat gain | Baseline groups / 2,000 writes | Candidate / repeat groups |
|---|---:|---:|---:|---:|---:|
| Resident | 665.6 | 2.216× | 2.345× | 1,513 | 671 / 678 |
| Paged | 655.4 | 2.482× | 2.578× | 1,526 | 617 / 648 |
| Resident, maintenance | 647.9 | 2.294× | 2.260× | 1,517 | 581 / 620 |
| Paged, maintenance | 647.4 | 1.813× | 1.891× | 1,519 | 706 / 711 |

Normal 50/50 flush count falls 55–60%; the repeated improvement is supported by
actual coalescing rather than a durability change. Single-connection/95%-read
cases retain exactly the same group counts and range 0.950–1.031× throughput.
Limit-1 controls retain exactly 2,000 flushes: resident is 1.003/1.007×, paged
1.014/0.771×. The latter is retained host/storage variability, not hidden or
attributed to the optimization. No universal write-speed or latency SLO follows.

Separate baseline/candidate calibration has four cases, twenty-four windows and
10,800 operations each, with sync timing alternately off/on. Timing overhead,
changed cohort density and host variability remain separate from the main
measurements. Observed timing-on/off median throughput ratios range 0.945–1.058×;
negative apparent overhead is not interpreted as a timer speedup. A warmed 100,000-call classifier window with both outcomes and a
full eight-key queue allocates zero Lisp bytes; existing M1 decode/descriptor
allocation remains. This is not whole-service zero-allocation qualification.

Nine new actor methods exercise dependencies, admission gates, old values before
later same-key writes, deadlines, capacity fallback, read faults and strong
error/nonlocal exits. The new real-process method covers twelve cases across
both formats and primary modes: successful strong completion, pre-flush failure,
post-flush failure, no response from a failed turn, SIGKILL/reopen and next CSN.
The focused campaign passes 160 native/wire/actor methods and 24 child processes.

Pure 60,000-byte read controls complete 36,000 additional operations in twenty
windows. Against the immediately preceding main controls: resident 576.59 MB/s
(one connection, 1.001×) / 760.51 MB/s (eight, 0.994×), paged 587.53 MB/s
(one, 1.109×) / 726.97 MB/s (eight, 0.997×). MB is decimal payload bytes per
measured wall second. All documents and version/frontier oracles pass.

The strict full SBCL 2.6.10 run passes all 2,750 displayed cases. The initial
2.6.9 run passes the identical first 2,744 cases, then stops at an existing
response-loss fixture's diagnostic race: EOF can reach the parent before the
child flushes its marker. Both version logs contain the marker by final capture.
Four C4 loss injectors now flush their marker before closing the peer. Product,
tests, benchmark and documentation sources remain byte-identical. All nineteen
Unix process cases, plus 160 focused native/wire/actor methods, pass again on
both runtimes. The source-identity proof checks the exact passed prefix, complete
Unix suffix, and the exact four-file C4 delta; it does not relabel the failed
whole command as passed or repeat unchanged storage/crash cases.

Documentation passes 569 source documents, 1,189 pages, 90,679 local links and
anchors, 56 runtime packages, 758 exported bindings and 670 prose contracts.
The public example passes Unix PUT/GET, reopen, DELETE and absence. Static, evidence, all eleven correctness spikes and nested CI checks pass on
the final C4 fixture tree. The source-identity proof passes 1,754 non-result
files and verifies the unchanged baseline and exact final runtime/test coverage.
Evidence closure verifies raw-byte preservation before owned cleanup. Local Apple M4 measurements are not
reference-hardware, concurrent-reader or power-loss qualification.

Retained failures include the first C4 smoke's assumption that every timed sync
must take positive ticks (directory fsync can measure zero), four focused-test
setup/compile failures (parenthesis and attempts to set immutable fixture
fields), and the first process fixture's reuse of a socket name after SIGKILL.
The corrected fixtures use constructor-time injection and distinct names. Raw
records, relevant driver variants and failed private fixture bytes are retained;
none is promoted to a passing qualification. Orphan IPC nodes have metadata,
not replayable file bytes. Successful reruns overwrite no failed record.

The C4 source-identity helper's reviewed arity correction and original self-test
warning are retained with its variant; final identity verification passes. The
failed 2.6.9 whole-command record and its private fixture are retained alongside
the successful affected-suite reruns and remaining checks.

The first terminal-receipt adapter used the wrong load pathname for the existing
compaction definitions; its failed command and original variant are retained.
The corrected adapter binds the original tool pathname and verifies terminal
receipts before cleanup.

Evidence closure passes 1,167 byte checks and 344 additional lossless compactions.
Terminal receipts, including failed adapters, are retained and verified before
cleanup. Eighteen owned generated/cache/failed-fixture roots are removed after
closure: 261,008,441 logical bytes, not a measurement of physical free space.
Other worktrees, their branches, runtimes and shared Git storage are untouched.
