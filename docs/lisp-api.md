# Use ArcDocDB from Common Lisp

For the local M1 service, use the exported interface in `arcdocdb.local`.
The client performs the handshake and exchanges one complete request per call.
Keep the client on its owning thread and close it with `unwind-protect`.

## Run the checked example

From the repository root, using the supported SBCL version:

```sh
make docs-examples
```

The [complete runnable example](../examples/local-roundtrip.lisp) creates private,
temporary storage and runtime directories. It starts the service, connects through
a Unix socket and checks these operations through exported APIs:

1. PUT a document and receive its commit sequence number.
2. GET the key using both an independent copy and a reusable caller buffer.
3. GET its current version into the same buffer and conditionally update using that token.
4. Stop the service and reopen the same storage with the same identities.
5. GET the persisted document, then DELETE it and check that GET reports absence.

The example uses canonical CBOR for the integer `42`, binary key bytes and fixed
identities belonging only to its disposable directory. It removes that directory
after success and preserves it for diagnosis after failure. This checks a clean
service restart; it does not qualify power-loss durability.

Temporary paths are created under the user's home directory and canonicalized.
The service requires protected ancestors as well as a private runtime directory;
a world-writable temporary ancestor does not satisfy that namespace contract.

`make docs` runs the same example as a publication check. There is no separate
copy of its executable code in this guide.

## Read the contracts

The generated `arcdocdb.local` package page lists the connection, request and
cleanup operations. Follow a symbol to its source-derived signature and contract.
`client-get` returns either `:found` with copied document bytes, or `:absent` with
`nil`. Mutations return a commit sequence number on success. A lost mutation
response can produce `outcome-unknown`; the client does not retry transparently.

<a id="caller-owned-read-buffers"></a>
## Reuse a read buffer

`(client-get-into client key target :start start)` returns `:found` and the
document byte count, or `:absent` and `0`. Allocate `target` once as a simple
`(unsigned-byte 8)` array with at least 60,000 bytes remaining from `start`
(default `0`). A successful result occupies exactly that prefix; surrounding
bytes stay unchanged. Absence leaves the whole buffer unchanged.

Keep the key and target stable and exclusive through the call. The target must
differ from the key and the client's private input/output arrays. Output shape,
capacity, key, ID and outgoing-frame refusals precede transmission and ID
consumption. The ordinary GET wire operation works with the existing server and
requires no capability negotiation. RAM/paged selection remains transparent.
The client may retain coalesced wire bytes in its fixed input buffer; each
response still requires its own request, correlation and fresh deadline checks.

This path validates the complete response and document, then copies into caller
storage without allocating a document vector. The response envelope is consumed
within the call; no wire view escapes. Error handling and numeric conversions
retain their existing allocation behavior. Only a successful return authorizes the copied prefix: an error,
deadline or nonlocal exit after copying can leave unconfirmed bytes in the
target. Authoritative rejection keeps the client reusable; other incomplete
reads close without retry. The [checked example](../examples/local-roundtrip.lisp)
exercises both APIs, restart and absence.

## Grouped and conditional operations

To share a strong flush across writes from one client, connect with
`:write-groups t`, then call
`(client-write-group client operations results :count count)`.
`operations` is a stable simple vector of 1..8 descriptors made with
`arcdocdb.engine:crea-operazione-scrittura`, selecting `:put` or `:delete`.
`results` is an exclusive simple `(unsigned-byte 64)` array with at least
`count` slots. Success returns `count` and fills that prefix with distinct
strong CSNs; its tail is unchanged. The whole response is checked before
copying. Each operation has an independent SEAL, so an interrupted group can
recover a prefix. An unknown outcome requires application reconciliation
before retry. See the [negotiation and limits](adr/0083-explicit-unix-write-groups.md).

For multiple point reads, connect with `:read-groups t` and call
`(client-get-group client keys :count count)`. `keys` is a stable simple vector
with a selected prefix of 1..8 binary keys. The returned new simple vector
contains private document octets or `nil` for absence, in the same order,
including duplicate keys. A CBOR null document remains an octet vector containing
`#xf6`, distinct from absence. The complete response must fit the negotiated frame;
overflow rejects the whole group. No partial result, split or retry is exposed.
The serial actor drains earlier writes and completes every GET before sending,
reusing cache and automatic primary storage. This is one current serial view,
without historical MVCC. Both group options can be enabled together.
[Read-group contract](adr/0084-explicit-unix-read-groups.md).

<a id="caller-owned-group-read-buffers"></a>
### Reuse grouped read output

With the same `:read-groups t` connection, call
`(client-get-group-into client keys target lengths :count count :start start)`.
It returns `count` and the total document-byte count. Reserve 65,536 bytes in a
simple `(unsigned-byte 8)` target from `start` (default `0`), and at least `count`
entries in an exclusive simple `(unsigned-byte 64)` lengths array. Present
documents occupy consecutive slices in key order; each length is its positive
byte count, or zero for absence. Duplicate keys produce duplicate slices. A
CBOR null document has length one. An all-absent group leaves target unchanged
and writes zero lengths. Unselected bytes and length entries stay unchanged.

The fixed grant covers aggregate documents above 60,000 bytes without reserving
one maximum-sized buffer per key. Selected keys and private client buffers must
not alias caller outputs. Complete preflight precedes ID consumption and I/O;
complete response/document validation precedes copying. Only successful return
authorizes both outputs: late error, deadline or nonlocal exit can leave
unconfirmed bytes and lengths. A whole-group rejection preserves both outputs
and READY; other incomplete reads close without retry. No document/result vector
is allocated by this copy path, and the response envelope is consumed within the
call. See the [scope and measured allocation](../spikes/results/2026-11-01-client-scoped-envelope/report.md). The
[checked example](../examples/local-roundtrip.lisp) uses one target for both APIs.


To prevent overwriting a newer value, connect with `:versions t` and call
`(client-get-version client key)`. It returns `:found`, private document octets
and the positive u64 commit CSN, or `:absent`, `nil` and `0`. Pass the token to
`(client-put-if client key document expected)` or
`(client-delete-if client key expected)`. The result is `:applied` and a new
strong CSN, or `:conflict` and the current live CSN (`0` if absent). Expected
`0` means insert only if currently absent; a stale positive version still
conflicts after delete/reinsert. Conflicts consume no CSN or flush. These
capability options can be combined. Lost mutation responses remain
`outcome-unknown`; do not retry without reconciling application intent.
[Conditional operation contract](adr/0085-conditional-current-writes.md).

<a id="caller-owned-versioned-read-buffers"></a>
### Reuse versioned read output

With the same `:versions t` connection,
`(client-get-version-into client key target :start start)` returns exactly
`:found`, copied byte count and the verified positive u64 CSN, or `:absent`,
`0` and `0`. It uses the same exclusive simple octet buffer, full 60,000-byte
grant, alias restrictions and successful-return rules as
[ordinary caller-buffer GET](#caller-owned-read-buffers). Complete response,
token and document checks precede copying; absence leaves the target unchanged.

The version and document come from one canonical engine read. Pass the token to
`client-put-if` or `client-delete-if`; a competing update can cause a conflict,
which must be handled by the caller. The client allocates no intermediate document
vector and retains no target reference. There is no additional capability, wire
operation, retry or historical snapshot. The persistent `client-get-version`
continues to return an independent document copy. RAM/paged selection remains
transparent. The [checked example](../examples/local-roundtrip.lisp) exercises
this read/token/conditional-write path and verifies the version after reopening.

The service can share a strong flush across already-ready independent conditional
mutations and ordinary writes from different clients. Conditions depending on an
earlier queued key drain those writes first. There is no wait to form a batch,
new option or client retry. Conflicts consume no CSN/flush; each applicable write
still has an independent SEAL and acknowledgment. A group is not a transaction.
[Same-turn conditional grouping](adr/0086-conditional-same-turn-group-commit.md).

For independent conditional writes from one client, connect with
`:conditional-groups t` and call
`(client-write-group-if client operations expected tokens applied :count count)`.
The selected 1..8 existing write descriptors must have distinct binary keys.
`expected` is a stable simple u64 array; `tokens` is a separate exclusive simple
u64 output array and `applied` an exclusive simple u8 output array. Both outputs
need at least `count` slots and must not overlap inputs or private client scratch.
The return value is the applied count. An applied byte of `1` has a new strong
CSN; `0` has the current live CSN, or zero for absence. Result tails are unchanged.
All members and the original deadline are checked before copying either prefix.
Conflicts consume no CSN, and an all-conflict group does not enter writer
maintenance. Capacity rejection never splits the group. No result is authorized
after an incomplete exchange; reconcile unknown outcomes before a deliberate
retry. This capability is independent of `:versions` and can be combined with all
other options. Applied members share a strong flush with independent SEALs; the
group is not a transaction.
[Explicit conditional group contract](adr/0087-explicit-conditional-unix-groups.md).

For embedding within one serial actor, `arcdocdb.engine` exposes the M1 core.
Its handles have thread ownership and lifecycle requirements. Consult the
[current profile](implementazione/README.md), the
[local service guide](implementazione/production-unix-m1.md) and the
[code reference coverage](code-reference.md) before selecting an interface.
Package export status alone does not establish thread safety or production maturity.

### Embed conditional write groups

Within the owning serial actor, call
`(arcdocdb.engine:scrivi-gruppo-documenti-se-versione engine operations expected
tokens applied :count count)`. Reuse the same descriptors and simple u64/u8
array layout as the conditional Unix client. The selected 1..8 keys must be
distinct. Default count selects the whole simple operation vector.

Success returns the applied count, writing `1/new strong CSN` or
`0/current live CSN` into the output prefixes. Expected zero tests absence;
output tails and expected tokens stay unchanged. All-conflict groups perform no
writer maintenance or flush. A capacity refusal preserves both outputs and
never splits the group. Each applied record has an independent SEAL; interrupted
admission may recover a prefix. This is not a transaction or automatic retry.
The Unix dispatcher uses this same public engine boundary.
[Full engine contract](implementazione/production-engine-bootstrap.md#conditional-engine-groups).
