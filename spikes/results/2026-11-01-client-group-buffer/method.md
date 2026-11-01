# Caller-owned grouped GET output — method before product edits

Base `94397753569159f01e1bbeef6f4cbec7c9d064bc`, 2026-11-01. Add
`client-get-group-into client keys arena lengths &key count start` over existing
negotiated opcode 5. Return count and total payload bytes; pack each present
minimal-CBOR document consecutively at START, lengths[i] is its positive byte
count or zero for absence. Preserve key order, duplicates and unselected tails.
Require the complete 65,536-byte M1 output grant from START before ID/I/O;
selected keys and all private client buffers must not alias caller output.
Use an exclusive simple UB8 arena and UB64 lengths prefix, not borrowed wire spans.

Both APIs share one full response/count/CBOR/document validator. Copy only after
all validation and exact capacity checks. Only successful return authorizes arena
and lengths; late deadline/error/nonlocal exit can leave unconfirmed caller bytes.
Rejections leave both outputs unchanged and READY; incomplete reads close without
retry or mutation ambiguity. Clear fixed private span scratch on every exchange
exit. No new capability, format, server/engine scheduling or durable operation.

Record the allocating public grouped API before edits using the frozen drivers.
Sixteen cases: resident/paged, 1/8 client owners, 1/8 members, 1,024 bytes/member
or 60,000 bytes/group (60,000 for one, 7,500 each for eight). Values differ by key
so ordering errors are observable. Five windows of 5,000 groups per worker, warm
100 calls, one full GC while all workers are parked before each window. Baseline
has 80 windows and 1,800,000 groups; paired calibration has 160 windows and
3,600,000 groups, with alternating API order on the same clients/server.

Public-call adapter latency ends before validation. Full-window wall throughput,
client CPU/allocation and aggregate GC CPU include exact-byte validation,
synchronization and one canary check per window. Server CPU is outside those
client counters. Capture every raw latency and exact nearest-rank quantile;
reported multithread allocation can quantize. Keep diagnostics and compilation
outside full timing campaigns. No server cohort gate or artificial arrival delay.
Check private ID counts, final values/CSNs, actual primary mode and child outcomes.
These longer windows address the short-window variability of the previous turn;
local hot-key M4 checks do not qualify production SLOs, cold disk, natural arrivals,
concurrent engine readers or power loss. Repeat only if variability requires it.

Cover bounds, full aggregate >60,000 bytes, missing/null/duplicate values, selected
prefixes, every alias, malformed final members, wrong IDs/kinds/statuses, partial
I/O, deadlines before/after copy and incomplete nonlocal exits. Qualify actual
service, both formats and primary modes with SIGKILL/reopen. Complete two C1
readings/decision table, strict affected suites on both SBCL runtimes, static,
trace, all relevant spikes, docs/example and source identities. Retain failures,
verify lossless compressed evidence, clean only owned regenerable paths, publish
without force and leave all other worktrees/branches/processes untouched.
