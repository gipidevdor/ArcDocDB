<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/img/mark-dark.svg">
  <img src="assets/img/mark-light.svg" alt="" width="48" height="48">
</picture>

# ArcDocDB

An append-only document database in Common Lisp.

One writer per Serie. Immutable closed segments. Integrity checks on every read.
The first intended application is an NNTP server, connected through a local Unix socket.

## Status

**In development.** M1 provides a durable, single-Series core with startup, recovery,
PUT, GET and DELETE over a Unix socket.
[Capabilities and limits](docs/implementazione/README.md).

## Start

Use SBCL 2.6.9 on Linux x86-64 or macOS ARM64.
[Build environment](CONTRIBUTING.md#ambiente).

```sh
git clone https://github.com/gipidevdor/ArcDocDB.git
cd ArcDocDB
make check
```

This builds the code, runs tests and experiment checks, and verifies documentation.
To run the local service, follow the [M1 server and client guide](docs/implementazione/production-unix-m1.md#ingressi-eseguibili).

## Read

- [Implementation](docs/implementazione/README.md) — what works and what remains.
- [Architecture](docs/architettura.md) — the design and its contracts.
- [Documentation](docs/README.md) — specifications, decisions and verification, in Italian.

[BSD 2-Clause](LICENSE) · [Contributing](CONTRIBUTING.md) · [Security](SECURITY.md) · [CI](https://github.com/gipidevdor/ArcDocDB/actions/workflows/ci.yml) · [Changes](CHANGELOG.md)
