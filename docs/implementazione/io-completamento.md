<a id="completamento-delle-operazioni-io"></a>

# Completion of I/O operations

The CONTROL preparation and publication path uses the same transfers and flushes as the writer. Each capability has one owner throughout the call; injected callbacks are trusted and honor this ownership. Intentional invalidation probes check boundary behavior even when a callback closes the capability. They are not evidence against concurrent close/dup2 consistent with the contract.

<a id="append-e-lettura"></a>

## Append and read

`append-esatto` installs cleanup after range/budget rejections, before the first possible effect. Any incomplete exit, including an original condition or a nonlocal exit after effects not yet counted, faults only an OPEN capability. CLOSED stays closed. No retries, truncation, or undo; caller reconciles physical position. Positive progress already returned remains in the written frontier; unreturned progress remains uncertain. The durable frontier does not advance.

After every writer return, the counter must equal its initial value plus already counted progress before adding new progress. An external frontier mutation is rejected. Append and read recheck capability before and after every fragment: an observed close prevents the next call and successful delivery, even when the last callback returned the entire range. Nondestructive reading retains the existing policy: an original condition alone does not fault the read-only capability, and a partial buffer is not delivered as complete.

## Flush

`durable-flush` captures the written frontier before the effect; after POSIX zero returns, it still requires OPEN capability and unchanged frontier. Only then does it update the durable frontier to the captured value. Incomplete exit faults OPEN, preserves CLOSED, the previous durable frontier, and the original condition. Synchronization performed but not observed as completed does not authorize client acknowledgment.

`fallisci` applies the same monotonic transition to write/flush errors; reading remains nonmutating. Brief state transitions are protected against interrupts inside IO, without syscalls or waits in the protected section. No object, lock, or coordination between Serie is added to the normal path.

<a id="decisioni-del-delta"></a>

## Delta decisions

| ID | Decision | Dedicated cases |
|---|---|---|
| ICO-D01 | incomplete effect and OPEN state | success, original condition, nonlocal exit, CLOSED, FAULTED |
| ICO-D02 | POSIX result exactly zero | zero, nonzero, NIL, float, errno including EINTR |
| ICO-D03 | written frontier unchanged during flush | equal, advanced, closed capability |
| ICO-D04 | initial append frontier + done | equal, altered by callback, short I/O |
| ICO-D05 | capability still open after every fragment | short/final read/write, close, no second call |
| ICO-D06 | confirmed positive progress | error before return, error after fragment, increment once |

Functional tests do not establish complete MC/DC pairs or asynchronous interrupts at every instruction. Checkpoint tests verify local order through the reread manifest: CLOSED inventory, controller adoption, indexes, traffic, and whole-engine crashes remain distinct. Campaign method is in the [record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-control-verifica/README.md).
