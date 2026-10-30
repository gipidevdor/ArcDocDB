<a id="metodo-di-verifica-delle-code-dei-writer"></a>

# Writer-queue verification method

Scope registered before campaigns: bounded MPSC queue, private to a
Serie, and writer token on reusable workers. Contract from
[ADR-0045, items 6 and 8](../adr/0045-modello-di-esecuzione.md),
[concurrency](../10-concorrenza-e-scheduling.md), and
[architecture](../architettura.md#thread-pool).

<a id="contratto-e-oracoli"></a>

## Contract and oracles

Preallocated ring; capacity and messages extractable per execution slice bounded.
Each operation tries the local guard once through CAS: no
spin, wait, callback, or I/O. Full queue and contention signal distinct
`resource-exhausted` reasons without accepting message. FIFO means acceptance
order, not concurrent-producer invocation order.

Only one worker holds the Serie token. Returned token includes
a monotonic fixnum generation: extraction and release also check current
thread, and an old token remains invalid after a new acquisition
by the same thread. Generation does not wrap. Extraction fills a
span of a caller vector and charges messages actually extracted to the
slice quota; subsequent calls do not reset quota. `NIL` is a
valid message, distinguished from empty by returned count.

Independent oracles: declared FIFO list, preallocated-message identity,
per-producer counters, and acceptance/delivery bitmap. Capacities 1/2/3 and
larger cardinalities, ring wraps, unaligned spans, empty, full, and exact/
exhausted quota; invalid configuration, invalid target or ring alias,
token passed to wrong thread, recursive acquisition, double release, and
old token on same thread. Counter near maximum is
prepared in a private object without workers, as a legally reachable state,
to check overflow rejection without billions of acquisitions.

<a id="thread-reali-e-limiti"></a>

## Real threads and limits

Producers and consumers actually overlapping on a small queue: every
accepted message must be delivered once, maintaining each
producer's order. Rejections transfer no ownership. Workers created
once per campaign and reused over multiple messages, private buffers, and real
compute work outside guard. One Serie must progress while another's guard
and token are occupied. Semaphores make adverse tests
deterministic; harness-only retries and joins have explicit caps. No
success inferred from a delay or a merely prefilled queue.

Strict build, lint, traceability, links, and integrated check; two C1
readings and decision table. Separate instrumented coverage, with self-test and
full denominator. Targeted mutants in new copies: unchanged baseline
mandatory, classifier with exact-line smoke and failed compilation
always invalid. FIFO, wrap, full, contention, owner,
generation, cumulative quota, and target span verified; all tests preserved.

Successful-path allocations: five replicates of 4,096 cycles with preallocated queues,
messages, and targets, warmup 128 and GC outside measurement. Fixtures with
capacity 1 and batches of 32 messages; every cycle acquires, enqueues, extracts, and
releases, and verifies an expected observable result. Counter self-test
with baseline and positive control 16 × 1 MiB. Zero measured heap allocation required,
no throughput threshold or engine-scalability promise.

This block does not implement ready-Serie list, wakeups, adaptive pool,
controller, publication, acknowledgments, or Serie FAULTED handling. It does not close
the lost-wakeup protocol or complete-engine requirements.
