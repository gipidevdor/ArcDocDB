# Attivazione seriale delle immagini M1 — 2026-10-29

Correttezza e crash di processo locali; non qualifica di power loss, RSS,
quota totale oltre RAM o selezione automatica dell'indice.

[ADR-0066](../../../docs/adr/0066-attivazione-seriale-immagini-m1.md),
[contratto e decisioni](../../../docs/implementazione/attivazione-indice-m1.md).
REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6. Base Git `59e6c74`, working tree
modificato: i manifest prima/dopo identificano la revisione effettiva.

## Risultati registrati

`make check` completo: **OK**, exit 0 e sorgenti **STABLE**. Build senza avvisi,
48 test motore, 70 test delle pagine e tutta la suite di prodotto; lint, trace,
link, full text, evidenze, undici esperimenti e self-test CI superati.
[Registro completo](check-run/report.lisp),
[payload originale compresso](check-run/report.lisp.gz),
[conservazione](check-run/conservazione.lisp).

| Comando | Esito | Originali |
|---|---|---|
| `sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-29-engine-image-activation/targeted.lisp` | OK, STABLE; 10 nuovi test, 6 casi SIGKILL con processi indipendenti v1/v2 | [targeted-run/report.lisp](targeted-run/report.lisp) |
| `sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-29-engine-image-activation/allocation.lisp` | OK, STABLE; quattro finestre da 10000 GET e un ritiro: zero byte Lisp in ogni finestra | [allocation-run/report.lisp](allocation-run/report.lisp) |

Il produttore prepara i file reali; l'API di attivazione li verifica e cambia
il backend senza riavvio. Si confrontano GET e byte dei file prima/dopo,
frontiere invariate, vecchia capacita' chiusa e descrittori nativi contati
con F_GETFD su 1024 ID (fuori dalle misure). V1/v2 e taglie 4/16/64 KiB,
cache con un frame, otto sostituzioni ripetute per variante e riavvio senza
opzione dimostrano scelta privata e FD limitati. Il vecchio reader a cache
calda rifiuta il file chiuso senza modificare l'output.

Le prove verificano preflight e quota comprensiva della vecchia cache,
owner/non rientro, candidati mancanti/corrotti/obsoleti, taglia errata e
visite esaurite. Prima dello swap il vecchio FD/root restano intatti e il
candidato locale viene chiuso; la richiesta ammessa fallita rende FAULTED.
Dopo swap il nuovo file resta posseduto fino al cleanup dell'handle.
Guardie di startup/binding/fonte e stato finale sono esercitate separatamente,
con revisione/token alterati o stato/health forzati nei callback C4.

I FD fittizi servono soltanto ai test di ownership e close falliti, non ad
attestare il contenuto di immagini. Un wrapper su un vero FD ne esegue il
close ma restituisce un errore: il primo PUT viene fermato prima del consumo
CSN o di effetti WAL, tutti i byte canonici restano uguali. Il modulo IO
consuma la capacita' prima del close e non ritenta esiti ambigui.

Sei casi SIGKILL v1/v2 coprono prima della pubblicazione, dopo lo swap e dopo
flush della prima scrittura. Ogni verifica avviene in un nuovo processo:
senza opzione il backend torna residente, con opzione il file verificato e'
riusabile finche' i dati non cambiano; dopo la scrittura la vecchia fonte
e' rifiutata e il dato committed viene recuperato dai WAL. I due derivati
restano byte per byte immutati. Nessun test di interruzione dell'alimentazione.

[allocation.lisp](allocation.lisp) misura GET completi su file nativi,
chiave di 16 byte, valore di 23 byte e CSN piccoli, fuori da SB-COVER.
Preparazione, attivazione e 1000 chiamate di warmup per finestra escluse.
Le finestre coprono prima attivazione, sedici sostituzioni, residente dopo
ritiro e residente dopo una scrittura. Il ritiro isolato viene chiamato con
owner BUSY e nessun GET in volo, come nel writer; comprende il close nativo.
Non si estende la misura ad attivazione/verifica, PUT completo, tutti i dati,
GC/RSS o throughput/latency.

## Revisione C1

Prima lettura: stesso verificatore dello startup, fonte e revisione correnti,
quota del vecchio e nuovo payload, prova associata esattamente al file.
Swap esclusivo senza borrower/callback intermedia, nessun nuovo CSN o record.

Seconda lettura: uno slot posseduto separato dalla lista dei file canonici,
massimo due FD delle immagini durante il passaggio. Ownership prima dei
close, candidato chiuso solo se non trasferito, close del precedente dopo
pubblicazione. Ritiro prima di WAL, causa primaria e guasti cleanup conservati,
nessun rollback verso una capacita' consumata. Startup incompleto e close
finale rilasciano lo slot. Nessun nuovo lock/stato condiviso fra Serie.
La tabella COD-54 e i limiti sono nel contratto collegato sopra.

## Diagnostica intermedia

[attempt-2-test-parentheses.log.gz](attempt-2-test-parentheses.log.gz): una
parentesi in eccesso nel dispatcher C4 dei processi, corretta prima dei run
registrati. Il log non e' uno snapshot completo dei sorgenti intermedi;
i record finali conservano sorgenti/ambiente/comandi effettivamente verificati.

## Limiti

Il residente resta presente e limita il writer. L'attivazione e' una richiesta
del controller e non una decisione durevole di catalogo; al riavvio la selezione
resta esplicita. Le quote qui verificate sono payload applicativi, esclusi
oggetti/header/GC e RSS. Restano aperti selezione automatica, delta writer,
snapshot, catalogo e qualifica oltre RAM. Non si garantisce continuazione
sull'handle dopo un errore ammesso, anche se la vecchia root e' intatta.
