# Author readings and decision table

Two author readings before candidate execution on 2026-11-02, after the frozen
baseline completed. These are the implementing author's readings, not independent
review, a completed C1 dossier or an MC/DC coverage claim.

First reading: traced decode, capability/state gates, exact queued-key checks,
canonical copy and verified token, response encoding, deadlines, final group
completion and outer peer cleanup. The new predicate reuses an inline, typed,
side-effect-free helper; no heap structure, wait, I/O or new loop is introduced.
The existing exact-key loop is bounded by the eight-entry queue. Only three
runtime files change; all executable scheduling changes are in two files.

Second reading: checked negative gates, conservative conflict dependencies,
later same-key writes, oldest cached token versus global CSN, fallback/rotation,
read faults before admission, strong failures and nonlocal exits. Reviewed v1/v2
and all index profiles, boundary credit, full u64 ID/token, expiry after decode,
after canonical copy and after encoding, and real three-peer success/failure
recovery. Corrected a surplus parenthesis in the generalized process fixture
before execution; strengthened the rotation oracle to check the old token.

| Decision | Qualified outcome | Witness |
| --- | --- | --- |
| opcode6, operation0, versions negotiated | May continue qualification | admission gates |
| ordinary opcode2 | Same shared checks, credit60032 | existing admission tests, benchmark control |
| invalid status, nil key, other operation/opcode | Drain | gates and rejection turns |
| grant60039 versus60040 | Drain versus qualify | gates and full response test |
| engine not READY or queue empty | Drain/no bypass | gates, existing failure path |
| exact queued key, including DELETE/condition/conflict | Drain | exact-key and conflict test |
| different-length prefix | Independent | gates |
| independent read, later write to its key | Copy original value/token | v1/v2/profile matrix |
| cache hit or damaged cached record | Canonical proof or verified disk fallback | cache test |
| capacity refusal or rotation | Keep copied value/token | fallback test |
| expiry after decode/copy/encode | Close read, no renewed request deadline | deadline tests |
| read fault | Fault engine, no earlier write admission | recovery test |
| success/error/throw after strong | No send within turn; abort on incomplete exit | unit and process tests |
| failed real strong turn | No response on any peer; recover allowed durable prefix | real Unix tests |

No changed product function exceeds 60 lines. Existing engine reader, CSN allocator,
CRC, cache and persistence paths are unmodified. Author review does not establish
correctness of arbitrary injected callbacks; their existing no-reentry and
no-logical-mutation contracts apply.

The first focused compile found a missing closing parenthesis in the new profile
matrix test, before any selected case ran. The failed receipt and exact test
source variant are retained under `variants/focused-01/`. Added the missing
closing parenthesis and reread the matrix's nested lifetime/cleanup forms.
No product code changed in this correction.

The second focused run reached the new profile matrix but its cache grant was
below the minimum for 64 KiB record frames. Reused the existing grouped-reader
fixture's 1 MiB cache grant, reread both cache fixture lifetimes and retained
`variants/focused-02/` with the failed command/event ledger. This is a test setup
correction; no product code changed.

The first real-process qualification passed all 50 selected server cases and the
ordinary disjoint process method, then hit an existing-directory error before
the versioned method could start. The suite shares one private root across its
methods. Made the two fixtures' runtime/data names and stage ranges distinct;
retained the failed receipt, child logs/storage and exact process-test variant.
Reread both fixture/restart paths. Product scheduler and benchmark drivers are
unchanged. Repeat final measurements and gates on the final test-source inventory.
