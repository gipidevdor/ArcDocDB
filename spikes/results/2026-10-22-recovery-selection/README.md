# Selezione delle versioni — 2026-10-22

[Contratto e decisioni](../../../docs/implementazione/selezione-versioni-recovery.md).

[Originali chiusi](../2026-10-22-recovery-selection-originals/archive-index.lisp) ·
[Riletture dell'autore](riletture.lisp)

Incremento isolato da pubblicazione dei temporanei, CI e full text:
workspace per worker che seleziona una versione committed della chiave
secondo ADR-0042, con tombstone provvisorio e ambiguità non consegnabile.
Nessun cambiamento delle decisioni o dei formati persistenti.

Sorgenti e metodo vengono committati prima delle esecuzioni. Compilazione
forzata del **solo prodotto**, warning/style-warning fatali. Trace-write
prima di trace; lint, trace, link e disassemblaggio dopo la compilazione.
Nessuna API nuova viene chiamata funzionalmente. Ogni processo viene
registrato con sorgenti prima/dopo; report, sidecar, helper e fallimenti
saranno conservati tramite collector ufficiale e inventario chiuso.

Due letture dell'autore: (1) selezione, tombstone, CSN/TXID e offset
fisici; (2) budget, ownership, stati terminali e consegna degli output.
Non sono revisione indipendente. Nessun test nuovo aggiunto o eseguito
localmente, nessuna FI, MC/DC, copertura o misura di prestazione.
SVR-D01…D10, qualifica C1 e integrazione del motore restano aperti.
Eventuale CI automatica del push osservata separatamente, senza
promuoverla a prova funzionale dedicata.

## Sorgente e risultati locali

Sorgente e metodo congelati prima dei comandi in
`b75e1cb094a33bb6ab49a996bb69e802e7ba5b78`, da `origin/main`
`56fc1c1a`. Nessun cambiamento di prodotto successivo alla compilazione.
Il contratto è poi precisato esplicitando che un gruppo di candidati
appartiene a una sola Serie; non è un controllo d'identità del reader.

Sei processi OK / exit 0 / STABLE sulla revisione: compile, trace-write,
lint, trace, links e disassemble. Compilazione del solo prodotto con
stdout/stderr vuoti. Lint: 359 file, zero violazioni. Trace: 135 requisiti,
69 invarianti, 13 FI e 56 ADR, zero errori. Link: 699 Markdown,
4057 collegamenti, zero rotti. Disassemblaggio ARM64 delle tredici
funzioni nuove conservato, senza chiamarle funzionalmente. La lettura
statica non viene presentata come misura di allocazioni o prestazione.

Collector ufficiale con quattro worker: sei report e sei sidecar, tre
helper e due file automatici, 17 ingressi pianificati e 19 file effettivi
con indice e catalogo. Checker separato dell'inventario chiuso con
exit 0; nessuna aggiunta successiva a quell'archivio. Record/sidecar del
collector e le due osservazioni sono conservati in quattro copie esterne,
con [audit di dimensioni e SHA256](conservazione-verifica.lisp) e helper
letterale. Non è dichiarato un confronto letterale byte per byte.

Due controlli conclusivi separati riguardano link e catalogo esterno,
non tutti i cataloghi storici. I loro report/sidecar e l'audit delle copie
sono conservati fuori dall'archivio chiuso. Il catalogo viene poi esteso
per nominarli: il controllo non è attribuito al proprio record aggiunto.

Le due riletture dell'autore distinguono regole di selezione e lifetime
del workspace. Sono ancora aperti tutti SVR-D01…D10, proprietà sulle
permutazioni, prove funzionali, FI, MC/DC, copertura e revisione
indipendente. Nessun test nuovo aggiunto o eseguito localmente, né
benchmark. Il selettore non raggruppa le chiavi, verifica l'intero
Archivio, pubblica l'indice o ammette traffico. Dati Lisp da leggere
con READ-EVAL NIL, mai da caricare come codice.
