# Legame PUT/WAL full text — 17 ottobre 2026

Perimetro: [API e limiti](../../../docs/implementazione/full-text-put.md),
[metodo e decisioni](../../../docs/implementazione/full-text-put-metodo.md).
NNTP Usenet in Common Lisp resta il primo impiego; fixture con Message-ID e subject/body.

Due tentativi di sviluppo si sono fermati in compilazione: il
[primo](../2026-10-17-fulltext-put-package-failure/catalogo.lisp) per l'uso esterno
di un simbolo interno del codec, il [secondo](../2026-10-17-fulltext-put-reader-failure/catalogo.lisp)
per una parentesi in piu nel test concorrente. Registri originali, senza modifiche,
con esito fallito e sorgenti stabili, conservati entrambi.

La [prova mirata](report.lisp), `make fulltext-check lint trace`, ha stato `:ok`,
sorgenti `:stable`, exit code 0 e durata 35,891765 secondi. Superati 91 test full text,
di cui 16 nuovi PUT/WAL, dodici mutanti semantici e lint. Due misure separate,
ID 1 e UINT64_MAX, hanno zero byte consed per mille operazioni
preparazione/riserva/append/query dopo cento warm-up su SBCL 2.6.9 arm64.
Non sono misure di latenza, throughput o RSS.

La seconda lettura ha poi portato la saturazione dell'incarnazione nel preflight
pubblico di riuso del lotto, prima della mutazione del controller di Serie.
Le verifiche finali sono conservate separatamente a completamento della raccolta.

L'incremento prepara memoria del lotto, senza I/O, assegnazione CSN, pubblicazione
documento/posting prima di H/ACK, esiti 2PC, vista MVCC o reclaim. Pool/log/configurazioni
canonici restano obbligo del runtime. Requisiti complessivi progettati;
nessuna qualifica C1, MC/DC o fault injection completa, nessuna nuova CI remota
in questa raccolta. Integrazione e pubblicazione spettano alla chiusura coordinata.
