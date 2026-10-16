# Campagna: piano CSN dell'Archivio

## Metodo preregistrato

Contratto: [piano CSN](../../../docs/implementazione/csn-archivio-recovery.md).
Sorgente congelato prima delle esecuzioni; ogni record conserva commit,
blob prima/dopo, stato, exit code e output originali.

Controlli locali pianificati:

1. Compilazione forzata del solo prodotto, warning/style-warning fatali;
   nessun caricamento del sistema dei test o `test-op`.
2. Linter del prodotto, rigenerazione/controllo della matrice e link.
3. Disassemblaggio dei nuovi calcoli e del costruttore del risultato
   ACTIVE; nessuna invocazione funzionale delle nuove API.
4. Controllo delle evidenze presenti al momento dell'esecuzione.
5. Collector ufficiale su ingressi espliciti, quattro worker, hash e
   inventario chiuso verificato in un processo distinto. Osservazioni e
   record del collector conservati fuori dall'archivio chiuso.

Due letture dell'autore: autorità/provenienza e confini/costi. Non sono
revisione indipendente. ACR-D01…D11 restano obblighi aperti. Nessun test
locale, MC/DC, mutante, fault injection o benchmark pianificato.
Esecuzioni fallite conservate; nessuna promozione C1 dal successo della
build, della statica o della raccolta.

## Risultati

Sorgente prodotto `6bdf06d8`: compilazione forzata senza avvisi riuscita;
stile, tracciabilità, link, disassemblaggio e controllo delle evidenze
riusciti. Tutti i record identificano i blob effettivi e la stabilità della
variante. Il controllo delle evidenze riguarda l'insieme presente prima
della nuova raccolta; non viene attribuito agli archivi aggiunti dopo.

I sette processi e i sette sidecar sono conservati nell'
[archivio chiuso](../2026-10-16-archive-csn-plan-originals/archive-index.lisp),
con i tre helper C4. Le osservazioni
del collector restano esterne, in questa campagna. Nessun nuovo dato viene
aggiunto all'archivio dopo il controllo del suo inventario chiuso.

Collector riuscito con quattro worker e 19 ingressi pianificati; verifica
dell'inventario in un processo separato con exit 0. Record del collector,
sidecar, rapporto e output del checker sono conservati anche in quattro
copie esterne controllate per dimensioni e SHA256. L'audit conserva il
sorgente dell'helper; non dichiara un confronto letterale byte per byte.
La diagnostica dell'helper conta quattro copie senza mutare la lista
dell'audit. Nessun test locale o benchmark di prodotto è stato eseguito.

## Due letture dell'autore

1. Autorità: vista per EQ e UUID distinti, Registri presente per EQ,
   contesto Archivio esatto, marker della tabella realmente usata da ACTIVE.
   Il marker non conserva entry o tabelle; CLOSED usa solo prove locali
   canoniche. Il catalogo completo resta una precondizione esplicita.
2. Confini e costo: byte di riferimenti prima di copia/hash, somma globale
   inclusi ACTIVE prima dei gate CLOSED, nessun incremento CSN, assenza
   distinta da zero e high/low completi. Output senza vettori/reader/FD,
   nessun nuovo I/O o lavoro sul percorso delle richieste. Costi di heap
   e GC non misurati; nessuna conclusione di prestazione.

Le letture non sostituiscono la revisione indipendente né i casi
ACR-D01…D11. Catalogo persistente, registro unico, ambiente runtime e
ammissione restano da collegare. La CI automatica resta distinta dalla
qualifica dedicata dei nuovi calcoli.
