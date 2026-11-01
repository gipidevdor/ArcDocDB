# Negotiated Unix read groups — preregistered method

Parent `d9d7b04307dc13d1156f388063d3720d3da9d172`. Integrate the existing
canonical GET, verified record cache and automatic RAM/paged primary storage
into one bounded serial Unix read-group request. SPK-01 motivates point lookup,
SPK-07 supplies publication/barrier reasoning, and SPK-11 supplies framing,
ownership, deadlines and partial-I/O checks. Run all eleven spike checks with
the final sources; make no whole-engine or concurrency qualification claim.

Opcode 5 is opt-in. HELLO key 2 admits exactly ordered nonempty subsets of
`[4,5]`; WELCOME retains mandatory `[0,1,2,3]` followed by exactly the requested
optional opcodes. Preserve default and write-only handshake bytes and the
two-value public capacity decoders. Add `connect-local :read-groups t` and
`client-get-group(client, keys, :count count)`, accepting a stable simple-vector
prefix of 1..8 binary keys. Return one private simple vector containing copied
document octets or NIL for absence, in input order, including duplicate keys.
Do not downgrade, split or retry implicitly.

Request payload is `[key:bstr,...]`; success is
`[[true,document:bstr] or [false,null],...]`. Validate the complete key group
before copies/GET. Enforce the existing key/document/CBOR limits and the actual
complete negotiated response size, at most 65,536 body bytes. Overflow rejects
the entire response with status 5 while the engine remains usable; it never
passes a too-small target to engine GET. Read each document into the existing
60,000-byte connection scratch and assemble only private response bytes.
No result is queued before complete success. Unnegotiated requests return 4.

Drain earlier collected writes, recheck deadlines after draining and validation
and between reads, then finish all GETs in one serial dispatch. There is no
interleaved write or peer wait; canonical GET releases every pin before response
send. This provides one current serial view, not historical MVCC. Reuse the
connection's existing exclusive group workspace and clear references on every
exit. On the client, validate every result/document before copying any document;
correlation and the absolute deadline precede exposing the vector. Incomplete
read exchanges close ownership and preserve causes/control, without mutation
uncertainty classification.

First run an unchanged-code baseline with the same driver bytes later used for
widths 1/2/4/8: both formats, resident/forced-paged automatic primary storage,
record cache 0/1 MiB, documents 2,048/6,144 bytes, eight hot keys, five 128-read
samples. Fixed inputs, seeding, warmup, GC, counter PINGs and restart/new-CSN
checks stay outside timing. Check every returned byte. Cold C4 wrappers select
paged quota only after actual engine startup, increment GET/flush/RPC counters
without per-request logging, and report them only on untimed PINGs. Counter
differences verify exact engine GETs, RPC width, cache hits and no timed flush.
Client allocation counters are quantized observations, not server/RSS measures.

Independent tests cover all capability combinations and old byte literals,
malformed/duplicate/unsolicited flags, zero/nine counts, invalid last key/result,
exact frame boundaries and one over, absence/duplicates/order, input prefix,
deadline expiry at each boundary, I/O errors/EOF/short I/O/nonlocal exits,
unchanged CSNs, preceding writes, cache hit/corruption fallback, both formats
and all primary profiles, grouped reads after rotation/compaction/restart,
real fragmented/coalesced frames, slow peers and response loss. Preserve raw
failures and rejected variants verbatim with verified lossless compression.

Freeze all non-result source/tool/test/docs files before final strict 2.6.9
check-core, 2.6.10 build/tests and documentation checks. Run performance serially
after functional work, compare full source inventories and both driver hashes,
retain completed records and check archive closure before owned-path cleanup.
No unexecuted Linux, physical power loss, physical-RAM scale, arbitrary
concurrency, full C1/MC/DC or universal performance claim follows.
