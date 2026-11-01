# Explicit bounded Unix write groups — method

Base `e404b897f4cb984421ef86661eae82f55765a7e4`. SPK-03 and the existing M1
group integration show why sharing a canonical strong flush matters. SPK-11
supplies framing, ownership, partial-I/O and correlation checks; SPK-07 supplies
independent-SEAL/crash-prefix ordering. The previous append optimization reduces
CPU but cannot let a single synchronous Unix client share its writes' flush.

Integrate an explicit negotiated write-group command, not an implicit batching
timer. Keep one request in flight. Default HELLO/WELCOME and opcodes 0..3 retain
their exact bytes. Opt-in HELLO adds ordered key 2 with `[4]`; only that request
receives WELCOME's opcode list `[0,1,2,3,4]`. A new client must verify the exact
requested capability before returning READY. No downgrade or operation retry.
Without negotiation, opcode 4 is unsupported and cannot enter the engine.

Opcode 4 payload is an array of 1..8 operations: `[1,key,document]` or
`[3,key]`. Keep total negotiated frame <=65,536 bytes, key 1..1,024,
document one minimal CBOR item of 1..60,000 bytes/depth <=100. Validate the whole
group before copying/admission; a bad last member cannot commit earlier members.
Use existing cumulative engine admission and distinct CSNs/SEALs, one strong
flush and FIFO publication. Success returns an exact increasing positive u64
CSN array. A group is not an all-or-nothing transaction on crash; uncertain
errors close the client and do not trigger fallback to individual operations.

Reserve fixed per-connection spans/operation/result slots before listen; retain
no borrowed request references after dispatch. Explicit groups drain prior
opportunistic writes and are not merged with adjacent commands. Preserve
absolute deadlines and finish engine work before peer sends. Client checks
all returned CSNs/correlation before copying results; every incomplete exchange
closes ownership, preserving errors/nonlocal exits and secondary cleanup faults.

First record unchanged-code single-client baselines with the same driver bytes
later used for groups: both formats, resident/forced-paged automatic index,
2,048/6,144-byte documents, five 128-write samples. One connection and eight hot
keys; seed/GC/reopen/GET correctness outside timing, exact returned CSNs and
canonical flush histograms checked. Then freeze product/test/tool/docs sources,
qualify strict builds/tests on SBCL 2.6.9 and 2.6.10 and `make check`/docs, and run
widths 1/2/4/8 serially. Same per-case live engine handles all widths without
rotation under the existing 16 MiB file budget. A C4 child chooses paged mode
only after real startup and before listen, using the existing budget API.

Before qualification exercise exact legacy/negotiated handshake literals,
malformed/unsolicited capability lists, counts/budgets/u64/last-member failures,
repeated keys and mixed DELETE/PUT, all statuses, response loss after commit,
short I/O/EINTR/EAGAIN/EOF/deadlines, nonlocal exits/cleanup, admission refusal,
rotation/compaction/reopen and real SIGKILL. Retain failed diagnostics and source
variants verbatim. No performance inference from functional runs or claim of
zero allocation, RSS bounds, arbitrary concurrency, full C1/MC/DC, unexecuted
Linux, whole-engine completion or physical-power-loss qualification.
