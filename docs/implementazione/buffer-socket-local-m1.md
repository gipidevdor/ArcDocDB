# Full-frame Unix socket buffers — M1

REQ-IPC-002, REQ-IPC-003, REQ-LIM-003, REQ-AFF-004. This implementation
refines the native I/O boundary of [the production Unix profile](production-unix-m1.md)
without changing framing, durability or the serial actor's scheduling contract.

During creation/configuration of each owned Unix stream socket, inspect the
effective SO_SNDBUF and SO_RCVBUF grants separately. Preserve each grant already
at least 65,540 bytes. Raise a smaller grant once to 65,540 bytes, covering the
maximum 65,536-byte M1 body plus its four-byte prefix, then verify the effective
positive signed-int grant meets that minimum. Linux can report a doubled grant.
Existing larger grants are preserved. The kernel owns this memory/accounting;
it is separate from Lisp buffers, index/cache quotas and RSS claims.

The default native `:configure` operation now covers both buffer grants along
with NONBLOCK/CLOEXEC, preserving unrelated descriptor flags. Both new sockets
and accepted sockets complete configuration before FD handoff. Two directions
bound work to at most six socket-option syscalls per acquisition. A failed query,
set or readback follows the existing single-close configuration boundary,
preserving the primary error and optional close failure. No fallback or retry is
performed. Native lifecycle callbacks retain their trusted, nonreentrant contract.

All option calls are inside `src/local/native.lisp`, with injectable logical
`:send-buffer`, `:receive-buffer`, `:set-send-buffer` and `:set-receive-buffer`
controls. The qualified Darwin ARM64/Linux x86-64 ABI uses four-byte int and
socklen scalars. Validate exact getter size/result and capture errno immediately.
Local foreign scalars are borrowed only for their synchronous syscall; no Lisp
array is retained, copied or pinned by this operation.

No option call or new allocation enters a request path. The actor still gives
each slot one finite transfer attempt per turn. Short sends/receives and
EINTR/EAGAIN remain possible and retain offsets and absolute deadlines. Larger
buffers do not establish completion. Strong publication still precedes response
encoding; engine contexts/pins still end before peer I/O. The global Unix stream
sysctls and process signal policy are unchanged.

The motivating host had 8,192-byte Unix stream defaults. A 60,000-byte response
then required many actor iterations even after the engine read completed. The
same hashed C4 drivers compare the unchanged service and the buffer reservation,
including 1/2/4/8 connections, both index backends, formats 1/2, small/large values,
mixed strong writes and forced maintenance. A separate alternating off/on
calibration measures profiler interference. These are closed-loop client bursts,
not natural concurrent arrivals, physical disk bandwidth or a production tail SLO.
See the [method](../../spikes/results/2026-11-01-unix-service-latency/method.md),
[two C1 readings and decision table](../../spikes/results/2026-11-01-unix-service-latency/review.md),
and [qualification/results](../../spikes/results/2026-11-01-unix-service-latency/report.md).
