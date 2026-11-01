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
2. GET the key and compare the returned bytes with the document.
3. Stop the service and reopen the same storage with the same identities.
4. GET the persisted document, then DELETE it and check that GET reports absence.

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
