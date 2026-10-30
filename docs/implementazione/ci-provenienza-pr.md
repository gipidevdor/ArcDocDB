<a id="provenienza-dei-sorgenti-delle-pr"></a>

# PR source provenance

C4 method preregistered on 2026-10-22 before correction.
REQ-VAL-001, REQ-AFF-012. No change to product or database formats.

GitHub exposes PR head in run and check-suite metadata, while
default checkout tests synthetic merge. In run 39818673128 these are
`258ffd35…` and `53bf6ef4…` respectively; publisher 39821678927 therefore rejects
a valid report. After merge, the temporary reference disappears
and run association with PR may be empty.

Direct path retains comparison with head/check suite. Additional
PR path requires GitHub APIs to recognize commit as a merge
validly signed by web-flow, with two parents and second parent equal
to run head. PRs associated with that head must belong to the
same repository and retain exactly that head. A merge reported
by GitHub for one of those PRs supplies the content anchor.

Comparison uses immutable inventory of paths, modes, and Git blobs, with
only the existing exclusion of `spikes/results/ci/`. Documentation,
tests, tools, and workflows must also match. No producer checkout or LOAD;
limits and rejection of symlinks/submodules remain active. Anchor
comparison neither rereads blob bytes nor recalculates physical statistics.

Evidence retains declared checkout SHA, run head, PR number,
GitHub anchor SHA, SOURCE-ID, and POLICY-ID. Method declares
**source equivalence**, not SHA equality or cryptographic attestation
of execution. Producer level remains UNTRUSTED-PR;
results do not become C1/MC/DC qualifications. If head changed or no
anchor with identical sources exists, publication remains rejected.
Publisher adds only PR read permission; producer
permissions and trusted main checkout remain unchanged.

Before/after regressions: equivalent merge, exclusion of CI data only,
invalid signature/signer/parents, differing documentation and policy, duplicate/
missing/other-repository PR metadata, bounded API inventory, false declared
identity, and divergent run context. Simulated APIs operate on
private Git objects; a separate replay uses original APIs and artifacts
from run 39818673128. Positive case must fail before fix.

A second regression exercises reconciler's first receipt with
a real push to a local bare repository: ancestors of
`reconciliation/runs/` must be created, preserving state and receipt. No GitHub push
in fixtures or relaxation of CI-SAVE checks.

<a id="risultati-del-2026-10-22"></a>

## Results dated 2026-10-22

On `1edd2085`, 22 new publication tests produce the two expected
errors: synthetic merge rejected and first-receipt parent absent.
Other 20 tests and 333 previous CI checks pass. On `3dfadeb3`,
all 355 tests pass. On `59c38ae3`, with two additional
checks on PR read-only permission, full `make check`
passes, including **357 CI tests** and eleven spikes. Records attest
stable sources during every run.

Preparation-only replay of original run `39818673128`, attempt 1,
succeeds with actual APIs and packages. It retains synthetic SHA
`53bf6ef451bf7751b8b774adf8001226f8185372`, head
`258ffd35563847e5f7da86d995b97afad473a1bc`, and PR #21 merge anchor
`c46bc4c1dda191a31cf806c6f519f08aaa186df6`, with identical SOURCE-ID and POLICY-ID.
Replay performs no push; producer remains UNTRUSTED-PR.

A first full check, started alongside replay, fails
in link checking: it enumerates publisher's temporary checkout
as it is removed at replay completion. Failed record
remains preserved; successful full check is a later run
started after replay closed. These two commands must not
overlap when sharing the same working directory.

The [sealed archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-ci-publisher-provenance/catalogo.lisp)
preserves six recorded processes, before/after results, original
downloaded packages, selected API responses, and sources used.
Two bundles retain private-fixture Git objects; an incremental
pack retains original synthetic merge, with both parents
explicit as prerequisites. Logs and Lisp data are read as data,
never through LOAD. Local success does not yet attest publisher
execution in integrated workflow on main.

Sources: [pull_request event](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows#pull_request),
[PRs associated with a commit](https://docs.github.com/en/rest/commits/commits#list-pull-requests-associated-with-a-commit),
[merge_commit_sha semantics](https://docs.github.com/en/rest/pulls/pulls#get-a-pull-request),
[signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification).
