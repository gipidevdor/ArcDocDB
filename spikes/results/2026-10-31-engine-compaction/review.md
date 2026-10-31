# Compaction integration review

The unit of replacement is the complete serial M1 canonical prefix, including
ACTIVE. This deliberately excludes arbitrary partial merges: full coverage is
the proof that discarded older values/tombstones cannot reappear elsewhere.
A maximum-CSN witness survives even with zero live keys. Output IDs precede the
fresh ACTIVE, retaining global replay ordering without assigning new data CSNs.

Publication ordering is data flush → independent output proof → CONTROL replace
and parent synchronization → source-name stabilization → old-reader retirement
→ canonical reread → index location relocation → new controller adoption →
positive REMOVED unlink and parent synchronization → CONTROL pruning. Recovery
repeats canonical validation and completes removal/pruning before admission.
No pre-decision source is deleted. No missing path alone authorizes deletion.
An exception after an uncertain kernel effect or a nonlocal exit faults the
handle and leaves durable decisions for recovery; maintenance is not retried
inside the request.

Location relocation is separate from ordinary PUT/DELETE. The disk implementation
compares existing CSN/location/length for the exact key, changes only location,
and path-copies within the existing bounded AVL scratch. Missing/stale requests
return NIL, unchanged location does not append, and incomplete effects fault the
derived index. The resident path reuses the existing exact-version relocation.
No relaxation of the monotonic data-CSN rule was retained from development.

Memory is bounded by configured scratch/file size, two record/read-ahead windows
and segment metadata, not by number of live keys. File descriptors are retired
before a replacement source set is opened; finished output append capabilities
close immediately. No-op planning restores its exact resource list markers.
The preserved source FD/header/inode and exclusive private directory are the
physical-removal assumptions. Hostile external namespace mutation remains outside
the existing engine contract.

The operational limit is explicit: current-only synchronous maintenance blocks
the actor running it and performs independent canonical scans at multiple proof
boundaries. A warm GET benchmark cannot certify loaded socket latency or future
background progress. Active snapshot/EBR borrowers reject before any effects;
concurrent/historical compaction needs a different retention/publication design.
Pre-decision orphan cleanup is not inferred from the new REMOVED authority.
