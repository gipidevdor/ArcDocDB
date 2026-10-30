<a id="toolchain-ci"></a>

# CI toolchain

The [CI producer](../../workflows/ci.yml) and
[publisher](../../workflows/ci-results.yml) install SBCL 2.6.9 using this
[local action](action.yml). The [lock](../../ci-toolchain.lock.lisp) records
archives, SHA-256 hashes, recipes, bootstrap, and action pins. A change requires
updating lock, action, and static checks together. Class C4;
REQ-VAL-001 and REQ-AFF-012.

<a id="distribuzioni-e-bootstrap"></a>

## Distributions and bootstrap

| Runner | Verified distribution | SHA-256 |
|---|---|---|
| `ubuntu-24.04`, x86-64 | Official SBCL 2.6.9 binary | `39fac28407405841003e4c2abfbe0d96abd93b7701e8b61cdd35e713943b46d6` |
| `macos-15`, arm64 | Official SBCL 2.6.9 sources | `c6fd1d735570eb4ff34caf9609988ca77ed0bd12b55d09a4fed075be890da513` |
| macOS arm64 bootstrap | Official SBCL 2.4.0 binary | `1d01fac2d9748f769c9246a0a11a2c011d7843337f8f06ca144f5a500e10c117` |

The three digests were obtained on 2026-10-17 from bytes downloaded from
SourceForge, without executing archives. The
[official table](https://www.sbcl.org/platform-table.html) lists 2.4.0 as the
available macOS arm64 binary. The recipe follows the
[2.6.9 instructions](https://github.com/sbcl/sbcl/blob/68a6b27d7ec8a8be45024d5e62db4f316e5ac7ea/INSTALL).
Annotated tag `sbcl-2.6.9` was resolved through the API to commit
`68a6b27d7ec8a8be45024d5e62db4f316e5ac7ea`; the source distribution is
identified by its byte digest, distinct from the Git object ID.

The [standard GitHub labels](https://docs.github.com/en/actions/reference/runners/github-hosted-runners)
checked on 2026-10-17 assign `macos-15` to arm64 for both public and private
repositories. Intel uses `macos-15-intel`; `macos-15-arm64` is the image name
in runner-images, not a listed standard label.
The matrix keeps `macos-15`, and setup rejects a different architecture.
The setup verify step has a 30-minute timeout; macOS jobs have 65 minutes
total for installation, tests, and upload (Linux retains 30 minutes).

On macOS, bootstrap is installed in a private temporary prefix and
`SBCL 2.4.0` is checked, then verified sources are built with:

- architecture `arm64`, `CC=clang`, deployment target `15.0`;
- default and bootstrap heap of 2048 MiB, two make processes;
- `--with-sb-thread --without-sb-core-compression`, standard contrib modules;
- bootstrap with `--no-sysinit --no-userinit --disable-debugger`.

Core compression is excluded from the macOS recipe to avoid a native zstd
dependency. C compiler, SDK, and image come from the runner: source and
bootstrap are pinned, resulting build bytes are measured on the runner.
No bit-for-bit reproducible build is claimed.
Every download is verified before extraction, with timeout, retries, and
byte limit; other OSes or architectures are rejected. No FASL or toolchain
cache is shared between jobs.

<a id="record-e-integrazione"></a>

## Records and integration

The action exposes `prefix` and `record` outputs, adds the binary to
`GITHUB_PATH`, and sets `SBCL_HOME`. `ARCDOCDB_CI_TOOLCHAIN_RECORD` names
`installation.lisp`, a wire record in `RUNNER_TEMP` with version, OS,
architecture, recipe, distribution/bootstrap digests, and actual installed
binary and core digests. On macOS it also contains the digest of
`compiler.txt`, original `clang --version` stdout in the same directory.
The lock is named by `ARCDOCDB_CI_TOOLCHAIN_LOCK` in workflows.
The workflow module exposes `CI-WORKFLOW-INSTALLATION-SCHEMA(record)` to
validate the record read with `ci-read`; loading it before reading registers
expected wire keywords without interpreting producer code.

The coordinator acquires `ARCDOCDB_CI_TOOLCHAIN_RECORD` and copies it to
`out/work/installation.lisp`, then selects provenance to include in its
`out/packet/`. `out/work/` and temporary files are not uploaded. CPU, RAM,
kernel, image release, ASDF version, flags, and actual test-process heap
remain recorder/coordinator responsibilities. Failed setup does not produce
a successful installation record and keeps the job red.

<a id="workflow-e-controlli-statici"></a>

## Workflows and static checks

Full checkout/upload/download pins were verified through official tag APIs:
[checkout v4.2.2](https://api.github.com/repos/actions/checkout/git/ref/tags/v4.2.2),
[upload v4.6.2](https://api.github.com/repos/actions/upload-artifact/git/ref/tags/v4.6.2), and
[download v4.3.0](https://api.github.com/repos/actions/download-artifact/git/ref/tags/v4.3.0).
All three directly targeted commit objects; no further peel was needed.
Producer is read-only, uses separate artifacts per run/attempt/job, requests
30-day retention, and uploads only the job's `packet/`, including on failure.
A missing-file warning does not turn failed setup into success. `seal`
downloads only its own attempt into a separate temporary directory.

Publisher starts from a fresh `refs/heads/main` checkout without persistent
credentials. Only publish/reconcile commands receive `GH_TOKEN`; the CLI
verifies IDs, GitHub metadata, payloads, and attempts and handles retries.
Manual entry is allowed only from main and proposes `dry_run=true`;
workflow_run considers every conclusion, and recovery is scheduled every
six hours with limit 100. Benchmark producer starts on every main push and
manual request. Automatic pushes depend on actual repository permissions;
the coordinator must verify effective retention against the recovery window.

`ARCDOCDB.CI::CI-WORKFLOW-SELF-TEST(out)` reads sources and lock, checks the
adopted YAML text contract, and uses in-memory fixtures to verify some
rejections. It returns a count plist and writes only `workflow-self-test.lisp`
into `out`. It neither interprets general YAML, invokes programs, nor proves
runner execution. Loading the module does not start self-test. Compilation
and the GitHub campaign remain for the coordinator after writer freeze.
