# Explicit conditional group review

Two static readings of the final path: first ownership/admission/durability,
then whole-frame/whole-response validation, bounds, deadlines and errors. These
are the implementer's readings, not an independent C1 qualification review.

The engine algorithm is unchanged from ADR-0086. Every request is conditional,
so distinct keys satisfy its stronger no-preceding-key dependency rule. The
serial M1 owner excludes asynchronous API reentry; no callout or peer wait is
added. Applicable records retain separate SEALs and CSNs, one covering strong
flush and FIFO publication. An explicit group never uses the collector's
individual capacity fallback. All-conflict result zero is a successful Lisp
truth value, so it is encoded normally without entering the writer.

The server validates all spans and exact binary key uniqueness before copying.
Fixed expected/condition/result arrays are cleared with the existing descriptor
and span workspace on every dispatch exit. The client rejects overlapping inputs,
outputs and its private u64/u8 buffers. Decoding writes private scratch only;
correlation and fresh absolute-deadline checks precede both caller copies. No
output is authorized on an incomplete exit. Existing default and old option
handshake bytes and two-value capacity returns remain exact.

| Decision | Boundary | Evidence |
| --- | --- | --- |
| H1 | Exact optional flag set, ordered unique capabilities, unknown opcode, boolean options | Sixteen independent HELLO/WELCOME byte fixtures and negative flags/capabilities; prior eight combinations retained |
| R1 | Original buffer binding, REQUEST kind/opcode, complete array/end | Malformed member fixtures; old envelope/range/minimal-header tests |
| R2 | Nonempty count and administrative bound before member copies | Counts 0/1/2/8, configured refusal and no-copy sentinel |
| R3 | Conditional opcode/field count, u64 token, key/document validity and limits | Independent tokens through max u64, bad last fields/document, empty/oversized key, maximum document and full-frame refusal |
| R4 | Exact binary duplicate key before copying/probing | Duplicate raw member with zero copy count; input-encoder no-output refusal |
| R5 | Selected prefix, types, bounds and distinct result ownership | Public preflight alias/type/private-scratch tests; ignored invalid tail and all-conflict zero return |
| D1 | Prior collector writes drain before comparison and following GET | Same-key prior write, conditional update and ordered current read |
| D2 | Original deadline after drain, before admission, after encoding and client validation | Injected clocks at each boundary; no stale ACK or renewed admission |
| E1 | Only READY unadmitted engine capacity refusal is status 2 | Capacity/admin/capability refusals preserve all files/frontiers and never split |
| E2 | Admitted error/encoder error cannot become a false busy result or retry | Post-flush resource fault, post-commit encoder error/throw and exact frontier |
| O1 | Complete result count, booleans, u64 and positive ordered applied CSNs | Independent mixed/all-conflict bytes, bad final member, duplicate/reversed applied token |
| O2 | Known error/null versus uncertain exchange failure | All five rejection statuses remain READY; malformed/error payload, EOF, wrong ID, late result and nonlocal transfer close with unchanged outputs |
| C1 | All references and private scalar results clear on incomplete exits | Nonlocal request-copy, encoder and client-send tests; complete-array scratch assertions |
| P1 | One client, actual flush count, current values and durable recovery | Both formats and resident/paged actual service; mixed/all conflicts, SIGKILL/reopen and lost complete reply followed by an explicit application probe |

The additional arrays are cold fixed workspace (80 payload bytes per connection,
eight per client); descriptor/key/document and envelope allocation in M1 remains.
No claim of complete COD-30, C1/MC/DC, P99, concurrent readers, power loss or
whole-engine qualification follows. C4-only observability wrappers add no cohort
gate or production wait. Baseline and candidate measurement drivers stay
byte-identical, and every child log is hash-checked before interpreting counters.

Reader-only development checks caught parenthesis balance in test forms before
compilation; replacing package colons for that check also requires preserving
the `#:` dispatch and excluding existing trusted `#.` native declarations. No
reader-only check qualifies product behavior. Completed early focused commands
remain distinct from the final frozen-source campaigns.

The supplemental `boundaries.lisp` fixtures execute false opcode/field-count,
nine-member and 60,001-byte-document decisions plus the actual small-client-frame
refusal and document/private-scratch/short-output aliases. They do not modify
product/test sources or allocate an engine fixture. Their driver hash, terminal
marker and frozen product inventory join final source qualification; ten fixtures
are separate from the 22 newly registered permanent test methods.

The first GET-wrapper self-test failed before fixture/server creation: preloading
the test system and then loading the immutable historical driver loaded SBCL's
CRC VOP definitions twice. Preserve the failed command and exact wrapper variant.
The corrected C4 wrapper lets the driver perform its sole ASDF load, installs an
untimed child-copy verifier through a temporary ASDF after-method, then restores
that method/function on every exit. Product sources and measured driver bytes
remain unchanged; this development failure does not qualify a GET measurement.
