<a id="preparazione-del-tratto-rilettura-c3c4"></a>

# Preparing the execution slice: C3/C4 rereading

Author's reading on 2026-10-15, after development fixtures and before
formal campaigns. One C3 reading with ADR-0031/0034 checklist; neither a new
C1 review nor an independent review. Favorable static outcome, without
open findings. Coverage, measurements, and full checks remain separate evidence.

| Check | Finding |
|---|---|
| Requirements and scope | REQ-THR-001, REQ-CON-001/002/004/005, REQ-AFF-008; C3/C4 changes only. |
| State and owner | No new state; public step checks port/owner/binding/phase before selection. |
| Bounded flow | One step and at most one begin; no new loops or waits in product. |
| Routing | Selected link used directly; spy checks one routing and zero calls to second adapter. |
| Results | Seven scalar values; original token with ACTIVE/CLOSING, zero with outcomes without begin; original metadata. |
| CLOSING and busy | Distinct gate returns and writer/ready conditions; explicit close with live token, no implicit retry. |
| Errors after transfer | Writer-busy and invalid-routing tests preserve successful claim/ACK; no rollback. |
| Operational defenses | Link/status T and NOTINLINE helper; FI on ten pairs/statuses, before begin. |
| Terminal fault | EQ cause, references, and writer lease retained; no C3 handler or fault marking; caller limits documented. |
| Memory and parallelism | No new intentional allocation or global state; no shared per-message write. Separate formal measurement. |
| C4 | Seven negative oracles; shared heap/sink/clock sensor, CLI/partial driver checked; five fresh fixtures per campaign. |
| Coverage and preservation | Native/HTML reader across eight files, independent fixture 8/9 and 1/2 branches; raw, missing, and attempts preserved without exclusions. |

SHA-256 identities of files read (document itself is not self-referential):

| File | SHA-256 |
|---|---|
| `src/dispatch/begin.lisp` | `4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/package.lisp` | `6b791437e5b6c7c21dc9cf1be85b81ec0498725c307512b5978d4c8ed04e7255` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `src/dispatch/start.lisp` | `087fd623a51a89d4f5fe4d917ba7f563c8062b6e24ead3618d7f2501e0335b5d` |
| `src/dispatch/step.lisp` | `0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `arcdocdb.asd` | `023ad35a7263ca41ba9a58abd4f5bb0983e80c459fa4b4eea9ee45275e0af194` |
| `tests/scheduler/pool-start.lisp` | `a6647dc88a69d58437ee8d738bf14b7d2dea94f17b24067a4fb3b4532f9a0bdd` |
| `tools/measure-pool-start.lisp` | `72dad0204d67d2d2596ee60dc252f939fc1bec2b82eeac8f19854299e48e73cf` |
| `spikes/out/pool-start/coverage-run.lisp` | `3b869030b495ae7a0532685f614670ca347bc392137bbf0687623862e402c4c2` |
| `spikes/out/pool-start/dispatch-coverage-reader.lisp` | `561ef6d1dbb9b17e8221d3085ebec6202940c033cbb94ae047c765a1b032939d` |
| `spikes/out/pool-start/reader-run.lisp` | `7de22c68baace90fad6e1e3037d597f703f7efa3d6e68b6d2da8e15144d15aef` |
| `spikes/out/pool-start/tool-run.lisp` | `83e717a03a89cc099e33092811f236462be151fbab773262883c33331e5b873b` |
