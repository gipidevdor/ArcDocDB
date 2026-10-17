# Rapporti CI nei processi isolati

Metodo preregistrato il 2026-10-17, prima della correzione.
Il run GitHub 39028943515 ha verifiche ordinarie riuscite, ma coverage fallita
leggendo `verify-linux/result.lisp`: nel processo fresco mancano keyword
prodotte da altri moduli. Il vocabolario trusted deve includere SKIPPED,
METRICS-STATUS ed EXECUTION senza dipendere dai moduli già caricati.

La correzione estende soltanto l'elenco finito di keyword del wire C4.
Il parser conserva FIND-SYMBOL, i limiti e il rifiuto dei token non noti;
nessun INTERN su ingresso o caricamento del prodotto come rimedio.

Regressioni: un nuovo SBCL carica solo DATA e legge/riscrive il rapporto
canonico rappresentativo byte per byte; un altro rifiuta una keyword
sconosciuta costruita senza INTERN. Entrambi conservano argv, exit code,
stdout/stderr e file d'ingresso, con timeout e cleanup limitati. Prima
la regressione positiva deve fallire; dopo la correzione devono riuscire
anche replay dell'originale Linux, self-test CI e verifica Linux reale.

Il job seal del run originale ha conservato la raccolta chiusa, incompleta
e fallita: il suo exit non zero è coerente con coverage assente. Questa
semantica resta invariata; nessuna riclassificazione dei run storici.

REQ-VAL-001, REQ-AFF-012. Percorso C4, nessun codice di prodotto modificato.

## Budget del riepilogo di copertura

Secondo controllo preregistrato prima della correzione del producer. Il
riepilogo storico misura 26.473 byte; aggiungendo soltanto le 349 righe
EXPECTED-FILES originali, il risultato sealed richiederebbe almeno 68.380
caratteri, oltre i 65.536 byte ammessi. È una fixture di limite inferiore,
non una nuova misura di copertura né una modifica del run fallito.

Il riepilogo compatto deve contenere il conteggio dei file attesi; il piano
e il rapporto raw conservano tutte le righe originali. La regressione usa
600 file, impacchetta un risultato sealed entro il limite e rilegge il raw
compresso confrontandolo con l'originale. Verifica separatamente che una
prova ordinaria mancante resti incompleta dopo la compattazione. Prima
il caso di impacchettamento deve fallire; dopo entrambi devono passare.
Nessun aumento dei budget e nessun cambiamento degli esiti seal.
