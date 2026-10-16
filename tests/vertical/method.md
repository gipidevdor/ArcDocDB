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

## Estensione preregistrata: nuove scritture dopo il recovery

Il 2026-10-15, prima di modificare la fixture, si aggiunge una domanda:
la Serie recuperata può assegnare CSN successivi, scrivere nuovamente e
conservare questi effetti dopo un secondo SIGKILL?

Per ciascuno degli otto scenari precedenti, dopo il primo recovery un nuovo
processo verifica tutti i CLOSED, ricostruisce il massimo CSN da tutti i
record ordinari, tombstone inclusi, e verifica che ACTIVE sia vuoto. Chiude
le capacità dell'ispezione e crea un ambiente distinto: registro CSN,
snapshot, ambito GET e controller condividono la stessa nuova base.
Un checkpoint conserva anche l'ACTIVE vuoto e apre un segmento nuovo.
Seguono quattro commit: inserimento E, aggiornamento C, cancellazione A,
cancellazione E. Ogni effetto è letto subito; poi il processo subisce SIGKILL.
Due ulteriori processi eseguono recovery e verifica indipendente.

Gli attesi restano costanti: massimo e numero di record 9 oppure 12 dopo
rotazione; A/B/E assenti, C aggiornato, D presente solo dopo rotazione.
L'ultimo CSN è una tombstone, non una chiave viva. H deve coincidere con
l'ultimo CSN dopo ogni commit risolto. Tutti i byte preesistenti restano
immutati, inclusa la coda senza SEAL. Un negativo reinizializza intenzionalmente
il registro a zero: l'oracolo tipizzato deve intercettare il CSN riusato
prima di appendere dati, con uscita 1 e ACTIVE ancora di soli 64 byte.

Il budget dei nomi sale da quattro a otto ID; gli altri limiti restano.
La suite completa prevede 18 workload, 71 processi, 26 SIGKILL intenzionali
e due errori attesi. Nessuna misura di prestazione. È ancora una fixture C4
seriale, con una sola Serie, soli record ordinari e decision log vuoto;
non è un'API di recovery o un gate generale di ammissione dell'Archivio.

## Collegamento alla proposta ID di prodotto

Il 2026-10-15 la fixture sostituisce la ricerca del primo ID libero con
`scegli-id-segmento-recovery`: manifest autorevole e inventario completo
dei nomi `.tmp`/`.seg` nel suo namespace di otto ID. Verifica lo stato
`:ready`, il successore e il proprio budget; non applica le azioni del piano.
La prova resta C4, con gli stessi 18 workload e gli stessi oracoli costanti.
Il contratto e la verifica C1 della proposta ID sono separati dalla fixture.

## Collegamento alla directory posseduta — 2026-10-16

La fixture adotta nomi canonici di sedici cifre esadecimali minuscole,
seguiti da `.seg`/`.seg.tmp`. La scelta ID usa ora direttamente
`scegli-id-segmento-recovery-directory` sul parent posseduto, con una sola
enumerazione fino a EOF, senza costruire un inventario C4 cercando otto ID.
Limiti espliciti: 16 nomi segmento, otto segmenti vivi, 64 nomi complessivi,
8.192 byte complessivi dei nomi e 255 byte per nome. Il limite di otto ID
proposti resta un controllo distinto della fixture. Gli scenari, i processi,
i crash e gli oracoli restano quelli preregistrati; nessuna azione del piano
è eseguita. La raccolta reale controlla anche gli altri nomi dei processi,
ignorati dal parser storage ma inclusi nei budget.
