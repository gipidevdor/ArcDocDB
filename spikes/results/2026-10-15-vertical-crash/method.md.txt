# Prova verticale con arresto del processo

> **Proposta** — Campagna C4 di integrazione, preregistrata il 2026-10-15.

Domanda: i componenti pubblici consentono di scrivere, aggiornare e cancellare
documenti, leggerli e recuperarli in un processo nuovo dopo SIGKILL?

Una Serie, formati v1/v2, namespace temporaneo esclusivo 0700. Il writer usa
preparatore ACTIVE, WAL/CSN, controller, indice primario e GET del prodotto.
Il bootstrap e il coordinamento sono espliciti nella fixture C4: nessun server,
catalogo o Recovery Manager completo viene dichiarato implementato.

Quattro interruzioni per formato: dopo commit durevoli; dopo un frammento di
record senza SEAL; dopo preparazione del checkpoint prima della pubblicazione;
dopo pubblicazione, rotazione e nuovi commit sul secondo segmento. SIGKILL è
reale e non esegue cleanup Lisp. Un processo distinto apre CONTROL, decision
log e segmenti readonly, risolve ACTIVE, costruisce e pubblica il checkpoint,
ricostruisce l'indice dai prefissi verificati e legge i valori attesi.
Un terzo processo ripete apertura e verifica del checkpoint pubblicato.

Gli attesi sono costanti del workload: ultimo valore di A e C, assenza di B,
e, dopo rotazione, assenza di A, nuovo C e presenza di D. Non derivano da
indice, manifest o output del recovery. Un controllo negativo altera soltanto
l'atteso del verificatore: deve produrre esito non nullo. Byte e lunghezze dei
segmenti preesistenti devono restare identici dopo il recovery, coda inclusa.
Il temporaneo CONTROL non pubblicato viene conservato con un nome distinto.

Limiti: massimo 8 KiB per file, quattro segmenti, 32 record, un worker seriale,
60 secondi per processo figlio. UUID e namespace dell'Archivio sono fatti
della fixture. Il replay dell'indice e l'ordine dei passi appartengono al test;
sono limitati ai record ordinari e rifiutano prepared/OUTCOME. Le prove non
qualificano MVCC storico, concorrenza indice/radice, multiserie, compaction,
power loss, P99, throughput, GC o C1/MC/DC. Non si misurano prestazioni.

Esecuzione prevista attraverso `tools/record-command.lisp`, anche per tentativi
falliti; controllo completo finale con `make check`. La suite fa parte di ASDF;
il driver dedicato consente di ripeterla separatamente. I registri originali
e i blob dei sorgenti vengono conservati nella campagna dei risultati.
