<a id="decisioni-delle-code-dei-writer"></a>

# Writer-queue decisions

C1 inventory of sources `src/execution/queue.lisp` and `writer.lisp`,
registered before campaigns. Tests use public interface and a list-based
FIFO oracle; the only declared internal preparations are guard
acquired through CAS, alias of private vector, and generation near maximum.

| Point | Elementary conditions and outcomes | Planned test or limit |
|---|---|---|
| `%check-queue`: bounds | Capacity 1..65536, equal length, head and tail below capacity, count within capacity. Rejection `:writer-queue-invariant`. | Construction, empty/full ring, capacity 1/2/3/7, wrap, and oracle 9×1200 actions. Internal-corruption rejections not all reached by API. |
| `%check-queue`: relation | `tail = (head + count) mod capacity`. | Before/after every enqueue and drain; wrap mutant. Defensive rejection separate from input checks. |
| `%acquisisci-guard` | CAS returns NIL or occupied guard; thread-guard postcondition. | Success, deterministic busy, concurrent producers. False postcondition requires protocol corruption. |
| `%rilascia-guard` | Expected owner before CAS; CAS old value equals thread. | Cleanup after success, full, and busy. Defensive rejections not induced by altering shared fields. |
| `crea-coda-writer` | Separately for capacity and quantum: index type and range 1..65536. | Incorrect types, zero, negative, beyond limit; minimums, default, and maximum, quantum independent of capacity. |
| `accoda-messaggio` | count equals capacity: full; otherwise FIFO acceptance. | Full preserves payload/ring, capacity 1, NIL, wrap, FIFO/wrap/boundary mutants. |
| `%check-lease`: identity | Index type, positive, current-thread owner, exact generation. | Type/zero, current token, reentry, foreign thread, old token after new acquisition, double release. Thread/generation mutants. |
| `%check-lease`: quota | Quantum 1..65536, extracted ≤ quantum. | Cumulative/exact/exhausted quota and quantum greater than capacity. Internal rejections not covered through arbitrary writes. |
| `%libera-owner` | Expected owner and CAS old value equals thread. | Normal release and generation-exhaustion cleanup. Defensive rejections not induced by altering owner. |
| `acquisisci-writer`: CAS | NIL or occupied writer. | Two contending threads, same-thread reentry; only one ownership assigned. |
| `acquisisci-writer`: invariants | Current owner and extracted zero. | Success after release; defensive rejections not all reached by API. |
| `acquisisci-writer`: generation | Generation equals maximum fixnum or legal increment. | Private preparation at max−1, last acquisition, and two later rejections without wrap/retained ownership. |
| `%check-target`: vector | SIMPLE-VECTOR and different from ring. | Invalid types, specialized/adjustable vector, declared alias; valid private vector. |
| `%check-target`: span | start/end index, start < end, end ≤ length. | Type, negative, empty, reversed, past end; unaligned and exact spans with sentinels. |
| `preleva-messaggi`: remaining | Zero: `0, :yield` before CAS; positive: ring access. | Quota across multiple calls and yield with already-occupied guard; mutant zeroing extracted. |
| `preleva-messaggi`: taken | Minimum of count, span, and quota. | Each of three limits binding; mutant ignoring end. Copies ≤65536, target outside span unchanged. |
| `preleva-messaggi`: postcondition | taken ≤ remaining and extracted ≤ quantum. | Valid paths and quota mutant; defensive rejections not all induced. |
| `preleva-messaggi`: status | taken zero: `:empty`; positive: `:messages`. | Empty, NIL drain, producers open during consumption. |
| `acquisisci-writer`: cleanup | committed false: release owner; true: retain ownership. | Generation exhaustion and successful acquisition. |

This inventory does not declare full MC/DC. Raw coverage retains
the entire denominator, including forms unmarked by instrumentation and defensive
branches. Both C1 readings and targeted mutants do not replace an approved
exception or qualification of engine, wakeups, and adaptive pool.
