# Integrazione documentale e proposta ID — 2026-10-15

[Contratto](../../../docs/implementazione/id-segmento-recovery.md) ·
[Verifica completa](../2026-10-15-recovery-segment-id-verifica/README.md) ·
[Registro originale](processes/documentation/report.lisp) ·
[Inventario chiuso](archive-index.lisp)

Il merge 08b5b73c integra la progettazione full text fino a de7a157e:
ADR-0054, contratto, formato e tracciabilità. Nessun codice full text è
implementato da questi documenti. La proposta ID e il recupero CSN restano
quelli del controllo completo c8a1adab: il confronto di sorgenti, test,
strumenti, sistema e configurazione è vuoto, con exit 0.

`make trace links` è OK / exit 0 / STABLE. Il registro e il sidecar
originali conservano i conteggi correnti di requisiti, invarianti, FI, ADR
e link dopo il merge; nessuna promozione di stato o qualifica è introdotta.
I documenti integrati sono conservati con suffisso .md.txt.

Il controllo completo precedente resta valido per il codice invariato:
1.734 test nominati, due smoke e dieci spike, oltre ai controlli statici
e delle evidenze. La proposta ID ha 11/11 mutanti rilevati e 10/10 rami
nel nuovo file, con 71/77 forme e indipendenza della revisione ancora aperta.
Non si estende questa misura al planner, al recupero CSN o al full text.

Manifest esplicito, quattro worker, inventario chiuso e checker indipendente.
Gli artefatti Lisp sono dati da leggere con READ-EVAL NIL, mai da valutare.
