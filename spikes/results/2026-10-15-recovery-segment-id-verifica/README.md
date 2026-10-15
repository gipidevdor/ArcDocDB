# Verifica integrata della proposta ID — 2026-10-15

[Contratto e decisioni](../../../docs/implementazione/id-segmento-recovery.md) ·
[Prove dedicate](../2026-10-15-recovery-segment-id/README.md) ·
[Registro completo](processes/full-check/report.lisp) ·
[Inventario chiuso](archive-index.lisp)

`make check`: OK / exit 0 / STABLE, 484,751351 s e 1.012 sorgenti.
Commit verificato: c8a1adab7da1adf171e1beaf41cc71ac2e801601. Comprende
57b0ffa4 (proposta ID) e il recupero CSN pubblicato fino a f50efd9e.
Sorgenti, test, strumenti, sistema e configurazione restano quelli verificati;
la documentazione dei risultati viene aggiornata dopo il controllo.

- 1.734 test nominati e due smoke test; 125 test recovery.
- Prova verticale: 16 scenari positivi, due negativi, 71 processi, 26 SIGKILL.
- 249 file di prodotto senza violazioni; linter e controlli negativi superati.
- 126 requisiti, 66 invarianti, 13 FI, 53 ADR: zero errori di tracciabilità.
- 501 Markdown e 3.432 link, nessuno rotto prima di questa raccolta.
- Controlli di conservazione e raccolta passati, inclusi i 59 casi del collector.
- Catalogo precedente verificato: 141 cataloghi, 3.732 riferimenti,
  43.853 file conservati, 1.173.798.611 byte.
- Dieci spike completati; tutti i 14 file originali del run sono conservati.

Il registro completo e il sidecar restano originali. Il descriptor rimanda
al payload gzip senza perdita e verificato. I 1.463.392 caratteri stderr
sono conservati: compilazione rigorosa riuscita senza warning o style-warning.
Il tempo è quello dell'esecuzione locale dei controlli, non un benchmark.
La suite preesistente non chiude le prove dedicate o MC/DC del recupero CSN.
Per la proposta ID: 11/11 mutanti rilevati; 71/77 forme e 10/10 rami nel
solo nuovo file, nessuna esclusione e nessuna revisione indipendente dichiarata.

Conservato anche il primo `make check`, interrotto per integrare il recupero
CSN: FAILED / exit 143 / STABLE, 35,596026 s. Nessun risultato positivo è
attribuito a quel tentativo. Il controllo finale è una nuova esecuzione
sulla versione integrata. Il log transitorio dei link documentali contiene
un link allora mancante perché la prima raccolta era ancora in costruzione:
il controllo completo successivo lo verifica senza errori.

Le osservazioni del collector inizialmente rifiutato e della raccolta
riuscita rimangono separate. Il piccolo helper di riepilogo ha inizialmente
omesso il caricamento ASDF: sorgente e diagnostica sono conservati, insieme
al helper corretto. Questa lettura C4 non modifica registri o prove originali.

Manifest esplicito, quattro worker, inventario chiuso e checker indipendente.
Nessuna qualifica del Recovery Manager completo, del full text o delle prestazioni.
Gli artefatti Lisp sono dati da leggere con READ-EVAL NIL, mai da valutare.
