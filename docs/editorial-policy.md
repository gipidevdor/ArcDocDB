# Editorial policy

The manual presents ArcDocDB's implemented behavior, intended architecture and
verification records as distinct kinds of material. Its source is the repository;
publication adds navigation and typography without creating a competing specification.

## Language and terminology

Use American English, active sentences and descriptive headings. Prefer direct
technical explanations to promotional claims. Use the same term for the same
concept, following the [glossary](glossario.md).

Domain names such as **Archivio**, **Serie**, **Documento** and **Registri** retain
their Italian spelling. API names, paths, command options, record markers and
identifiers are literal references: format them as code rather than translating
them. Legacy anchors remain valid when a heading is edited.

Use a decimal point in English prose and commas for grouped thousands:
`1.25 ms`, `4,096 documents`, `16,777,216 bytes`. A space separates a value from
its unit. Distinguish bytes from bits and decimal `MB` from binary `MiB`.
Do not round evidence to make a result look better. Preserve significant digits,
units and the measured denominator.

Versions, addresses, tuples, hashes and source code are not prose numbers.
Original output, quoted legal terms and sealed evidence retain their exact bytes.
Editorial normalization must not change a measurement's value or reinterpret
an ambiguous separator without checking its context.

## Authority and status

The [source hierarchy](riferimenti.md#convenzioni) controls normative meaning.
An editorial correction does not accept a design proposal, change a requirement
or qualify an implementation. Accepted ADRs retain their decision and scope.

Implementation guides state the profile they describe. Design references describe
the intended engine. Methods, reviews and results retain their dates, revisions
and limits. Page classification is a reading aid, not a new source of authority.

Use *lock-free* only with its precise algorithmic scope and progress argument.
Keep it distinct from immutable data, absence of application locks and wait-free
progress. A local benchmark is a measurement in a stated environment, not a
guarantee of throughput, tail latency or behavior on another platform.

## Sources, corrections and preservation

Use meaningful link labels, cite the relevant source and prefer primary
documentation for external technical or legal facts. Keep historical revision
links intact when they identify original evidence. Current project contact and
navigation links use the canonical repository.

Correct the source document and rebuild the edition. Changes that affect a
normative contract follow the repository's ADR and traceability process. Do not
rewrite failed runs or archived raw evidence to match a later result. Corrections
to numerical presentation preserve the value, precision and provenance.

The generated manifest identifies source hashes. Local previews with uncommitted
changes are labeled as previews; a Git revision alone does not certify a review.
No generated date is presented as a human review date.

## Publication checks

`make docs` checks source and search coverage, page structure, local links and
anchors, legal-notice integrity and selected editorial/accessibility rules.
Negative fixtures verify that damaged artifacts are rejected. The edition is
generated twice when checking local byte reproducibility.

Automated rules do not establish flawless English, legal compliance, WCAG
conformance or correct behavior of the full database. Those claims require the
corresponding evidence and, for questions of legal applicability, competent
professional assessment. Remaining review work must be stated accurately.

The publication notices cover [rights and contact](legal/README.md),
[privacy](legal/privacy.md), [third-party material](legal/third-party.md) and
[accessibility](legal/accessibility.md). Review them when hosting, data flows,
browser dependencies or publication features change.
