<a id="contribuire"></a>

# Contributing

ArcDocDB is under development. Code, specification and evidence changes follow
the same integrity and verifiability contracts.

<a id="ambiente"></a>
## Environment

CI uses **SBCL 2.6.9**, Linux x86-64 and macOS ARM64:
[exact toolchain and recipes](.github/ci-toolchain.lock.lisp).
Local checks also require `make`, Git, `gzip`, `shasum` and POSIX utilities.
The GitHub CLI, `gh`, is used to inspect and publish CI results.

The product uses Common Lisp and SBCL contribs, with no external Lisp dependencies.

<a id="flusso"></a>
## Workflow

1. Read the [current status and limits](docs/implementazione/README.md) and [repository rules](docs/guida-al-repository.md).
2. Start with an [ADR](docs/adr/README.md) when changing a requirement or format.
   Replace an accepted ADR with a new decision.
3. Update the affected documents, invariants and verification in the same commit.
4. Use the [evidence register](docs/valutazione/registro-delle-prove.md) for tests and measurements.

<a id="verifica"></a>
## Verification

Before opening a pull request:

```sh
make check
```

This builds without warnings, runs tests and experiment checks, and validates
lint, links, traceability and evidence. `make spikes-bench` runs measurements separately.

Documentation is written in American English. Domain terms and API identifiers retain
their established spelling. [Coding standard](docs/affidabilita/standard-di-codifica.md) ·
[Glossary](docs/glossario.md) · [Visual language](assets/README.md) · [Security](SECURITY.md).
