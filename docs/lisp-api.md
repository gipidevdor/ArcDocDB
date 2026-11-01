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

For embedding within one serial actor, `arcdocdb.engine` exposes the M1 core.
Its handles have thread ownership and lifecycle requirements. Consult the
[current profile](implementazione/README.md), the
[local service guide](implementazione/production-unix-m1.md) and the
[code reference coverage](code-reference.md) before selecting an interface.
Package export status alone does not establish thread safety or production maturity.
