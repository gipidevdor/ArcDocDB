# Nucleo full text — evidenze del 16 ottobre 2026

Perimetro: [analisi, run posizionale e cornice](../../../docs/implementazione/full-text.md).
I requisiti complessivi della Serie restano progettati; nessun risultato certifica
ancora writer, snapshot, generazioni o codec semantico completo del `.idx`.

| Prova | Registro |
|---|---|
| `make check` completo: 560,407 secondi, sorgenti stabili, 10 spike | [repository](../2026-10-16-fulltext-repository-check/report.lisp) |
| Dopo merge di `origin/main` a `110e79f1`: build/test, lint, trace, link e fulltext-check, sorgenti stabili | [integrazione](../2026-10-16-fulltext-integration/report.lisp) |
| 24 test, corpus Unicode, scansione indipendente e quattro controlli negativi | [core](report.lisp) |
| Lint, tracciabilita e link prima della documentazione finale | [statici](../2026-10-16-fulltext-static/report.lisp) |
| Rigenerazione identica delle tabelle | [Unicode](../2026-10-16-fulltext-unicode/report.lisp) |
| Self-test dello strumento | [self-test](../2026-10-16-fulltext-selftest/report.lisp) |
| Copertura diagnostica, senza test di allocazione strumentati | [processo](../2026-10-16-fulltext-coverage/report.lisp), [stato e HTML originali](../2026-10-16-fulltext-coverage/coverage.lisp) |

Nella copertura, Word_Break e lookup delle proprieta hanno il 100% dei rami osservati;
le guardie interne e diversi limiti del builder non hanno copertura completa.
Non e una misura MC/DC o una qualifica C1. Le inizializzazioni delle tabelle sono
avvenute prima del reset delle hit e non sono conteggiate come coperte.

I tentativi di sviluppo sono conservati nelle directory `2026-10-16-fulltext-dev-*`.
Il [generatore](../2026-10-16-fulltext-generation/report.lisp) ha exit code interno zero
e stato `SOURCE-CHANGED`, perche scrive deliberatamente il sorgente generato: non e
una verifica riuscita su sorgenti stabili. Il successivo controllo `--check` e stabile.
Sono conservati anche l'[errore di parentesi iniziale](../2026-10-16-fulltext-compile-failure/report.lisp)
(log non avvolto, privo di snapshot), il [rifiuto lint](../2026-10-16-fulltext-lint-failure/report.lisp)
del nome locale `read` dopo build/test riusciti e l'[errore di caricamento dello strumento](../2026-10-16-fulltext-tool-failure/report.lisp)
prima di aggiungere `require :sb-cover`.

I registri sono dati, mai codice da caricare. I descriptor compressi mantengono hash
e dimensioni del payload originale; lettura tramite:

```sh
sbcl --script tools/read-evidence.lisp spikes/results/2026-10-16-fulltext-core/report.lisp
```
