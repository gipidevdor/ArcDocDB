<a id="verifica-del-recovery-active"></a>

# ACTIVE recovery verification

Dedicated tests are in `tests/recovery-active/`, loaded after CONTROL
and recovery fixtures. They use the public read, resolution,
serialization, and publication path, with an injected backend and real files.

The [preregistered method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-active-verifica/README.md)
distinguishes tests, fault injection, C1 readings, coverage, and parallel measurements.
The [report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-active-verifica/report.md)
preserves actual outcomes and limits: suite success does not by itself close
C1 qualification or Recovery Manager integration.

The ARV-D01..14 table in [active-recuperato.md](active-recuperato.md)
remains the decision reference. Fixtures check bytes and values
with independent oracles, distinguish zero CSN from absence, and require
preservation of the physical tail. The suite does not attest that the
DECISION table comes from the Archivio: that association remains a caller
precondition until integration of the authoritative reader.

Repeatable commands, each through the evidence recorder:

```sh
make check
sbcl --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/get-series-capture.lisp --raw-root spikes/out/active-verifica-coverage-R1/ -- sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-coverage.lisp --report spikes/out/active-verifica-coverage-R1/ recovery-active
```

The second command requires a new directory; it preserves HTML and
SB-COVER state. Its counts concern forms and branches and do not demonstrate MC/DC.

The [final integration verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-active-integrazione/report.md)
separately preserves the graph check that also includes the
pool/Serie step that reached `main` after the initial campaign.
