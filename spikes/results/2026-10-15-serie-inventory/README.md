# Inventario della directory della Serie — 2026-10-15

[Contratto](../../../docs/implementazione/inventario.md#raccolta-dalla-directory) ·
[Metodo preregistrato](../../../docs/implementazione/inventario-directory-metodo.md) ·
[Letture statiche](../../../docs/implementazione/inventario-directory-revisione.md) ·
[Inventario chiuso](archive-index.lisp)

## Risultato locale

Il [terzo controllo completo](processes/r3-inner/report.lisp) è OK,
exit 0, STABLE sul commit `dc225d5b74479435773bfbbe56c3c22d22f6495b`.
Il wrapper esterno è [conservato separatamente](processes/r3-outer/report.lisp).
L'output originale contiene i 19 nuovi nomi `INVENTORY-DIRECTORY`, ciascuno
riuscito: 13 prove iniettate o di unità e sei native. Comprende anche
le suite precedenti, i controlli degli strumenti e i dieci spike.
Non vengono pubblicati nuovi conteggi globali delle suite.

Le prove verificano inventario vuoto e completo, ID u64, budget esatti e
insufficienti, nomi non canonici, copie Latin1, callback incomplete,
alias hardlink, symlink/FIFO/directory, riuso del parent e ancoraggio
al FD dopo la rinomina della directory. La matrice pura degli esiti di
cleanup non è fault injection di syscall native.

| Tentativo originale | Esito |
|---|---|
| [R1](processes/r1-inner/report.lisp), `88a8cdd7` | FAILED, exit 2: tipo troppo stretto del suffisso letterale; nessun test eseguito |
| [R2](processes/r2-inner/report.lisp), `cd19ff7c` | FAILED, exit 2: copia in `base-char` incapace di rappresentare il byte 255 |
| [R3](processes/r3-inner/report.lisp), `dc225d5b` | OK, exit 0: copie in array di `character` e parser `simple-string` |

Il [tentativo del contatore statico precedente](processes/counter/report.lisp)
resta FAILED, exit 1. Lo strumento invariato non gestisce il runner verticale
manuale aggiunto upstream: non fornisce un denominatore per questa campagna.
È un limite dello strumento C4, distinto dai due errori di prodotto.

## Integrazione e limiti

Il commit `43db74c07e13f8e4d0e1eee30f205ec4cbc640d7` integra il lavoro con
`332784e8cc8f51493c1d056f78b136a820e5aa94`, conservando le API per ID e CSN.
Il [controllo successivo](processes/integration-check/report.lisp) di lint,
tracciabilità e collegamenti è OK. La CI completa Linux/macOS sulla
versione integrata resta una verifica distinta da R3 locale.

La raccolta readonly passa al planner soltanto dopo EOF, chiusura del
cursore e validazione dei nomi e delle identità. L'esclusività del
namespace è una precondizione del controller. Questo incremento non
esegue rinomine/rimozioni, non legge header o CRC e non coordina ancora
il recovery completo della Serie o l'ammissione del traffico. Restano
aperte qualifica C1 completa, MC/DC, mutazioni e misure di prestazione.

## Conservazione

Il manifest elenca file e processi esplicitamente. Il collector esistente
usa quattro worker e un checker indipendente dell'inventario chiuso;
il rapporto della raccolta resta esterno a questo archivio. I registri,
le diagnostiche e i fallimenti mantengono i byte e gli stati originali.
Le copie delle tre varianti sorgente sono ricostruite da Git prima della
raccolta, con blob e SHA-256: non sono snapshot acquisiti durante i run.
I payload compressi si leggono con `tools/read-evidence.lisp`, READ-EVAL
NIL ed EOF obbligatorio; non si caricano come codice. Le cache ASDF
restano fuori dall'archivio pubblicato.
