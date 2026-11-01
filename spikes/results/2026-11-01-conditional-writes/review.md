# Implementation review

Reviewed the final candidate before full qualification. Product and non-result
test/tool/documentation files remain frozen during those commands.

- The current CSN is captured while the GET candidate is admitted, then returned
  only after existing canonical record/CSN verification and completion. Legacy
  GET retains exactly two values. Extraction into a bounded helper keeps the
  verification path readable without duplicating validation.
- Conditional mutations check the authoritative current index under BUSY,
  release only their private probe scratch, and synchronously enter the existing
  strong writer on a match. There is no callout between probe and writer entry.
  The serial owner excludes concurrent/asynchronous API reentry. Existing
  preflight compaction preserves versions; maintenance/commit callbacks run
  under their existing BUSY guards. Tests exercise reentry during rotation.
- Mismatches return before writer capacity checks, rotation, maintenance, CSN
  allocation and append. Image/frontier and independent flush oracles check this
  even with a full legacy index or saturated ACTIVE. Lookup cache counters are
  allowed to change. Failures inside an admitted index probe fault the engine.
- Zero tests current absence, not an absence generation; positive CSNs prevent
  stale replacement after reinsertion. No transaction write set, exactly-once
  or historical isolation claim is made.
- Opcode 6 drains earlier collected writes, rechecks the original deadline and
  completes independently. Whole request validation precedes engine work. The
  resource catch encloses only the engine mutation, preventing encoder failures
  after strong commit from becoming false busy rejections.
- Capability parsing accepts only strictly increasing subsets of 4/5/6 and
  exactly matches WELCOME flags. Every connection reset clears the new flag.
  Previous 4/5 capability fixtures retain their bytes; former unknown-6 negative
  fixtures now use 7. Client failure classification uses the suboperation, so
  versioned read failures never become unknown mutation outcomes.
- Client result parsing verifies full shape, positive success token, zero/null
  absence, canonical embedded document and trailing end before copying. Common
  exchange verifies correlation and a fresh deadline before exposure. Existing
  close/nonlocal cleanup ownership is reused.

Development review found a balanced reader form that nested the first new engine
test in its helper. The missing top-level registration was detected by comparing
the expected eight engine tests with focused output; the form boundary was fixed
and all eight execute in the final focused record. A standalone reader check is
therefore insufficient qualification. Other development edits corrected reader
balance before strict compilation; no product runtime fixture failed in development.
The first benchmark completed all engine cases, then rejected an absolute server
script path before launching a Unix child. Preserve its exact driver variant and
failed command; use the runner's required relative path for the final campaigns.
The optional metrics printer also required reader/binding form corrections;
retain both variants and failed records. These do not change samples, analysis,
the measurement drivers or any qualified product source.

The serial benchmark compares API costs in the final implementation, not a prior
revision. It checks unchanged strong flush frequency and no conflict/read
flushes. Functional coverage and local timing do not establish host power-loss
durability or complete transaction support.
