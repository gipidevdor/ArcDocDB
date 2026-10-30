<a id="verifica-della-catena-pool-dispatcher-e-serie"></a>

# Verification of the pool, dispatcher, and Serie chain

C4 method preregistered on 2026-10-15 on base
`a34cede6fbc9215908d50aa85311d5d703660040`, before running new tests.
REQ-THR-001, REQ-CON-001/002/004/005, and REQ-AFF-008; ADR-0031/0034/0045.
Product sources unchanged. Tests combine
[dispatcher step](pool-step.md), [starting](pool-begin.md), and
[Serie bridge](worker-serie.md), using public APIs and real threads.

<a id="scenari-e-oracoli"></a>

## Scenarios and oracles

1. Two workers with contexts, ports, tables, and links created on respective threads,
   immutable routing register and shared ready queue. First retains Serie A
   lease; second completes **32 quanta** of Serie B before
   coordinator releases A. Repeat with A in ACTIVE/RUNNING and with BATCH debt.
   Oracle checks FIFO payload, token, count, state, and all five dispatcher
   values. B ends and is joined before A release.
2. Second worker retirement while it must recycle A after first quantum.
   Coordinator queues B and requests retirement through public register.
   Three-partition ready queue, homes 0 and 2, capacities 1 and 2: four scenarios.
   Full swaps A with B, completes B, and applies retirement only at next
   IDLE entry. Room publishes A, ends step, and retires without new claim.
   First worker claims and completes remaining work; every expected payload
   appears exactly once, in order. Register converges to one active worker.

C4 barriers fix event order, not replace product transfers.
No FI on values, functions, or lifecycle words.
Semaphores and joins have 15-second timeouts; loops have known
cardinality (2 modes, 32 quanta, 4 scenarios). Thread errors
propagate to test. Cleanup releases barriers, terminates and
joins fixture threads before closing in-memory backends.

<a id="verifica-e-limiti"></a>

## Verification and limits

Strict compilation without warnings/style-warnings, scheduler suite and full
suite through `make check`; original records preserved, including
failures. C4 rereading of fixture and oracles before final
qualification. No new hot code: earlier allocation and
coverage measurements are not reinterpreted as measurements of these tests.

Artificial pauses with lease/debt belong only to test fixture:
they are not a product task waiting. Result proves possibility
of progress on two distinct Serie in these synchronized orders, not speedup
on two cores, general fairness, universal race absence, or weak memory.
Symbolic/integer payloads checked and acknowledged by caller: no PUT
application, durable commit, real I/O, park/wake, or server loop qualified.
