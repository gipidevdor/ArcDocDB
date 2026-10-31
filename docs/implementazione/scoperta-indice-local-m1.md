# Index-image discovery in the local M1 service

REQ-IPC-001, REQ-IPC-002, REQ-IPC-003, REQ-IDX-010, REQ-REC-001.
This connects the existing [ADR-0070 engine contract](../adr/0070-scoperta-readonly-immagini-m1.md)
to [the local service](production-unix-m1.md). It adds no wire opcode, durable
format, maintenance scheduler or new source of authority.

`serve-local` accepts `:index-discovery`, NIL by default, or an immutable
`arcdocdb.engine:crea-opzione-scoperta-indice` configuration. Wrong types and
CREATE combined with discovery are rejected before clock calls, buffer
reservation, namespace locks or engine startup. The engine checks the policy,
recovers canonical data and verifies the chosen derived image before the service
opens its listener. A failure returns no READY notification and leaves no socket;
normal server cleanup releases namespace and engine resources.

The executable server accepts the optional flag `--discover-index`:

```sh
sbcl --script tools/local-server.lisp DATA SOCKET ARCHIVE32 SERIES32 --discover-index
```

This uses the engine factory's bounded default profile: 4096-byte pages, two
cache frames, at most 4096 directory names and 64 candidates, 16 MiB discovery
payload, 256 MiB per image and 16777216 verification visits. See the
[engine contract](scoperta-indice-m1.md) for payload exclusions and canonical
startup limits. Other page/cache/budget profiles are available through the
library API. No configuration is read from peer messages or Lisp expressions.
The flag may occur once, in either order with `--version 1|2`; `--create` is
incompatible. Without the flag, service behavior uses the engine's normal automatic selection
([ADR-0073](../adr/0073-indice-automatico-operativo-m1.md)). Discovery explicitly
selects the legacy sealed-image profile; it does not replace the automatic
operational disk index.

An eligible footer only selects a candidate: complete verification against
canonical replay is mandatory. Missing/stale candidates retain the canonical
resident index. A selected image with invalid content refuses startup. The
first admitted write retires the startup image under the existing engine
contract. Neither the service nor this option enables delta maintenance,
removes old images, chooses a backend by available RAM or qualifies capacity
beyond RAM. Canonical recovery may already have checkpointed before a derived
image is refused; no rollback of those effects is promised.

## Verification decisions

| Decision | Independent checks |
|---|---|
| NIL or typed immutable policy | NIL remains accepted; T, integer and string refused before clock/namespace |
| CREATE and discovery conflict | discovery alone, CREATE alone, both orders combined; library conflict |
| Discover flag and not already seen | absent, first flag, duplicate flag, unrecognized trailing value |
| CLI argument count | existing lower/upper argument validation retained; new optional flag fits finite bound |
| Listener after verified image | library observer sees RECOVERING/paged and absent node; READY sees socket; shutdown removes owned node |

Two readings cover argument ownership and bounded profile propagation, then
startup admission and resource cleanup. Product-process tests seed canonical
data and a derived image through engine APIs, run CLI GET/PUT/DELETE, restart
with a stale image, and compare derived bytes unchanged. Independent v1/v2
cases damage a selected image body while preserving its footer, require no
listener/READY, and reopen canonical data with default resident startup.
[Evidence and limits](../../spikes/results/2026-10-31-local-index-discovery/report.md).
