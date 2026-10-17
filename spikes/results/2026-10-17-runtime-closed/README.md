# CLOSED nel nuovo runtime — 2026-10-17

[Contratto e decisioni](../../../docs/implementazione/adozione-closed-runtime.md) ·
[Originali](../2026-10-17-runtime-closed-originals/archive-index.lisp) ·
[Due riletture dell'autore](riletture.lisp)

## Metodo e sorgente

Sorgente prodotto congelato e committed prima dei processi:
`ceafca1dabdc77d99bc647ab6d845726cc700a62`. Metodo e RCL-D01…D10 nel documento
implementativo della stessa revisione. Il lavoro riguarda l'adattatore delle
mappe CLOSED: niente modifiche ai formati o ai percorsi GET, scrittura e WAL.

Compilazione forzata del solo sistema prodotto, warning e style-warning
fatali; non viene caricato il sistema di test. Poi stile, tracciabilità,
link, disassemblaggio delle cinque funzioni senza chiamarle e controllo C4
delle evidenze già presenti. I processi indipendenti possono sovrapporsi;
il disassemblaggio parte dopo la fine della compilazione. Il tempo wall
dei comandi non è una misura delle prestazioni del database.

## Esiti locali

Sette processi OK, exit 0 e sorgenti STABLE; stdout/stderr originali e
sidecar conservati integralmente. Compilazione con stdout/stderr vuoti.

| Processo | Esito osservato |
|---|---|
| trace-write | Matrice invariata, processo riuscito |
| compile | Prodotto caricato con compilazione forzata, nessun avviso |
| lint | 317 file, zero violazioni |
| trace | 135 requisiti, 69 invarianti, 13 FI, 55 ADR; zero errori |
| links | 560 Markdown, 3884 link; zero rotti |
| disassemble | Cinque funzioni; output ARM64 originale, nessuna chiamata funzionale |
| evidence | 229 cataloghi, 3918 riferimenti, 46731 file; esito OK |

Il controllo evidence precede questa raccolta e non è attribuito agli
archivi aggiunti dopo. Il collector comune ha poi verificato i nuovi
originali con quattro worker: 19 file pianificati, 21 file nell'inventario
chiuso, compresi indice e catalogo. Il checker finale è un processo separato
con exit 0. Nessuna aggiunta successiva all'archivio chiuso.

Quattro copie esterne conservano record del collector, suo sidecar,
rapporto e output del checker. Dimensioni e SHA256 verificati prima/dopo
la copia; [audit e helper letterale](conservazione-verifica.lisp).
Nessuna dichiarazione di confronto letterale byte per byte.

Due controlli conclusivi separati verificano i link con la nuova raccolta
e il catalogo esterno presente a quel momento. I loro record e sidecar
sono conservati in altre quattro copie con [audit dedicato](final-conservazione-verifica.lisp).
Non appartengono all'archivio chiuso, che resta invariato; il catalogo viene
poi esteso per nominarli. Il controllo completo della nuova versione resta
alla CI automatica dopo il push.

## Riletture e limiti

1. Autorità e lifetime: binding runtime canonico; due scope per EQ; UUID;
   gate completo del CONTROL prima dei wrapper; mappa della vista esatta,
   medesimo file-io EQ, ID/P/versione/origine. Il proprietario conserva i FD
   per tutti i borrower; nessun close o trasferimento implicito.
2. Costo e pubblicazione: preflight dei due vettori e 20*N prima del gate;
   nessuna iterazione sui PUT, nessun I/O; nuovi wrapper e stesse righe
   readonly. Directory privata con copia dei riferimenti, senza vecchie
   viste o token; primary, chiusura ACTIVE, fonti ed ammissione separati.
   Disassemblaggio letto come riscontro statico, senza dedurre allocazioni
   misurate, throughput, latenza, GC o qualifica funzionale.

Sono due letture dell'autore, non una revisione indipendente. Nessun nuovo
test aggiunto o eseguito localmente, né FI, MC/DC, copertura, modello o
benchmark. RCL-D01…D10, confine generale COD-24, revisione indipendente e
qualifica C1 restano aperti. La CI automatica generale rimane distinta
dalle prove dedicate mancanti. Dati Lisp da leggere con READ-EVAL NIL,
mai da caricare come codice.
