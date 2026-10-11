# Verifica EBR e compiti di lettura

La campagna del 2026-10-11 verifica i contratti già implementati di
[epoche e reclaim](epoche-e-reclaim.md) e [compiti di lettura](compiti-lettura.md).
Il prodotto, le API e i formati rimangono quelli della base integrata `2a0011f`.
Il [metodo preregistrato](../../spikes/results/2026-10-11-reader-verification/metodo.lisp)
congela 34 casi EBR, 30 casi di lettura e otto mutanti prima delle esecuzioni
registrate. I controlli esplorativi degli autori non sono evidenza qualificata.

## Casi e osservazioni

Le aspettative sulle epoche e sulle identità sono liste e interi indipendenti.
Le suite osservano le API pubbliche; le immagini private servono alla
conservazione dello stato dopo un rifiuto o a FI esplicite su fixture isolate.
I test di lettura usano registri CSN, snapshot ed epoche reali, token originali
e tempi logici espliciti. I buffer hanno sentinelle prima e dopo il campo scritto.

| Decisioni | Testimonianze previste |
|---|---|
| EBR-D01..D02 | Capacità minime/massime, rifiuti, contatori e crediti di epoca |
| EBR-D03..D04 | Identità zero/vecchie, riuso dei ticket, metadati e stato faulted |
| EBR-D05..D08 | Generazione/credito esauriti, duplicati, pubblicazione e riferimenti conservati |
| READ-D01 | Quattro parole residue variate separatamente e snapshot residuo |
| READ-D02..D03 | Generazione zero, registro estraneo e binding valido |
| READ-D04 | Generazione/CSN della lettura corrente e buffer conservato |
| Conclusione/abbandono | Snapshot terminato o scaduto, tempo regredito, rilascio del pin e fault irreversibile |

Due thread reali competono per lo stesso claim; un reader completa con il
mutex di manutenzione posseduto da un altro thread. La migrazione termina
il primo compito, avanza l'epoca e ammette un secondo worker con uno slot
proprio. Semafori e join hanno budget finiti e nessuna attesa avviene in
un'epoca di lettura attiva. La sequenza scadenza/reclaim è un interleaving
logico fra API pubbliche, distinto dalle gare interne.

La lettura indipendente conferma il mapping parziale; restano slot fuori
range, alcune combinazioni dei metadati, credito nullo in pubblicazione
e anomalie della ricerca dei posti. Soglia stretta e claim esclusivo sono
verifiche aggiuntive, non testimonianze MC/DC delle decisioni EBR-D01..D08.

## Strumento e criteri

Il runner copia 26 file prodotto e sette file di test, usa FASL privati e
processi distinti. Il baseline deve passare esattamente tutti i 64 nomi,
in ordine EBR poi lettura. Ogni mutante esegue soltanto il test nominato:
la rilevazione richiede exit 1 e fallimento runtime di quel test. Avvisi di
compilazione, segnali, timeout e exit nonzero dopo `:complete` sono errori
del worker. Due fixture reali provano SIGKILL 9 ed exit 7 dopo completamento;
il controllo CLI negativo conserva il rifiuto COD-61 come esito fallito.

Gli scope di copertura `epochs` e `read` hanno directory e FASL separati,
eseguono la rispettiva suite e conservano stato SB-COVER e HTML. Numeratori,
denominatori e percorsi non attribuiti saranno riportati dopo le esecuzioni.
L'espansione INLINE limita l'attribuzione dei contatori ai file originari.

## Stato e limiti

Le esecuzioni registrate e la CI del commit pubblicato sono **in attesa**.
La chiusura richiede letture indipendenti, baseline, mutanti, controlli
integrati e verifica della conservazione dei byte delle evidenze.

Restano fuori dalle prove la finestra interna INLINE, l'ingresso che
restituisce NIL dopo un cambio d'epoca e l'interruzione interna del cleanup.
Non si attesta memoria debole, MC/DC, zero heap, latency, qualifica C1
completa o chiusura di fase. GET, SegmentManager, durability e crash
recovery richiedono integrazione e campagne ulteriori.
