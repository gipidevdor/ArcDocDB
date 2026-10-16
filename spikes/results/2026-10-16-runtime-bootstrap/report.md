# Verifica del bootstrap runtime Archivio — 2026-10-16

Sorgenti congelati e committed in `e0c47315187e750ea42b84009cc500ea248372fe`,
dopo chiusura di tutti e tre gli agenti. Il metodo e le due letture statiche
precedono i run: [metodo](inputs/method.md.txt), [revisione](inputs/review.md.txt).
I risultati riguardano il bootstrap dei registri; Recovery Manager e gate
del traffico restano da implementare.

## Prove funzionali

**27/27 funzioni di test composte superate** nella diagnostica e nella
campagna di copertura. Quindici funzioni funzionali, due concorrenti, tre
native e sette di FI seriale. Le matrici interne non sono contate come
funzioni aggiuntive.

- Piano completo pubblico v1/v2; massimo da Serie, CLOSED o DECISION,
  zero assente/presente, riporto u32 ed esaurimento u64 senza wrap.
- Configurazioni e tipi invalidi prima del binding; limiti massimi simultanei;
  una sola famiglia pubblicata per oggetto Archivio canonico, anche con piani distinti.
- Nuovo ambito GET, snapshot dello stesso CSN, EBR preallocato; GET corrente e
  con snapshot restituiscono i byte attesi, rifiutando viste/snapshot del bootstrap.
- Worker reali con limiti finiti: due/quattro tentativi, una sola pubblicazione;
  CSN condivisi, risoluzione fuori ordine e attivazione snapshot dopo la frontiera.
- FD nativi readonly v1/v2: base esatta M e prima assegnazione M+1, registri con
  capacità proprie e fonti invariate, nessun I/O della factory; binding e getter
  utilizzabili anche dopo la chiusura delle fonti del piano già completo.
- FI dichiarate: binding estraneo, piano non normalizzato/conteggi incoerenti,
  snapshot legato ad altro CSN, vecchio ambito, high/low e H incoerenti.

## Copertura osservata

Contatori azzerati dopo il load; eseguita soltanto la suite runtime. Cache
FASL separata da `make check`. [HTML originale](coverage/product/cover-index.html).

| File | Forme raggiunte/totali | Rami raggiunti/totali |
|---|---:|---:|
| runtime/build | 94/102 | 16/16 |
| runtime/preflight | 60/64 | 16/16 |
| runtime/query | 23/30 | 2/2 |
| runtime/types | 1/5 | 0/0 |
| **Modulo** | **178/201** | **34/34** |
| recovery-archive/types, contesto | 12/29 | 1/6 |
| **Cinque file grezzi** | **190/230** | **35/40** |

Il ramo CAS perdente è stato osservato in questa esecuzione; la partenza
comune dei worker non ne garantisce la copertura ad ogni scheduling.
Nessuna forma o ramo residuo è escluso dal denominatore. Restano forme
non raggiunte e rami del contesto Archivio; vedere gli HTML originali.
**Forme/rami SBCL non sono MC/DC né qualifica C1 completa.** Il self-test
controlla selezione dello scope e rilevamento del ramo mancante.

## Comandi e conservazione

| Record | Esito e ambito |
|---|---|
| [trace-write](processes/trace-write/report.lisp) | OK, matrice già coerente |
| [diagnostica](processes/diagnostic/report.lisp) | OK, 27/27; helper autenticato prima/dopo nel capture |
| [self-test copertura](processes/coverage-self-test/report.lisp) | OK |
| [copertura](processes/coverage/report.lisp) | OK, 27/27 |
| [controllo completo](processes/check/report.lisp) | OK: build/test, lint, trace/links, evidenze e dieci spike |
| [prima raccolta](processes/collection-first/report.lisp) | Rifiuto atteso dal contratto: descriptor C4 intenzionalmente invalido selezionato per errore |

Tutti i comandi usano il recorder; revisione, blob prima/dopo, ambiente,
stdout/stderr ed esiti rimangono originali. La diagnostica conserva anche
un riepilogo strutturato per ciascun test. Nessun fallimento della nuova
suite nella campagna. Fallimenti intenzionali dei figli nei self-test
sono distinti da fallimenti dei comandi.

Il controllo completo include il verificatore parallelo delle evidenze:
48 casi e 756 controlli nel suo self-test. I log dei worker della scansione
storica reale e i risultati strutturati dei casi C4 sono in `raw/`; gli snapshot `.lisp.txt`
mantengono i byte originali. Fixture intenzionalmente invalide ricostruibili
dai sorgenti Git, cache, espansioni temporanee gzip e marker di sessione
sono esclusi, inclusi i protocolli volutamente malformati dei finti worker.
La prima selezione comprendeva uno di questi protocolli in `stdout.lisp`:
il collector lo ha rifiutato in planning, prima di creare la destinazione.
Record, manifest originale e diagnostica di quel fallimento sono conservati;
la seconda selezione applica l'esclusione delle fixture negative ricostruibili.
I report dei self-test, i log dei figli snapshot/reader e
gli output dei dieci spike sono conservati separatamente.

Il collector comune copia ingressi espliciti con quattro worker e hash
prima/dopo; un processo indipendente controlla l'inventario chiuso. Il
manifest e l'indice enumerano esattamente i file conservati. Il produttore
e i controlli finali risiedono nella raccolta sorella, senza append in questo archivio.

## Limiti

Unicità per oggetto Archivio canonico; catalogo, esclusione fisica, validità
temporale del piano, riconciliazione e pubblicazione restano del controller.
La capsula non revoca il vecchio ambiente né trasferisce pin/ritiri.
Recuperabilità dopo interruzione precisamente fra CAS riuscito e ritorno:
argomento statico, prova dinamica dedicata aperta.

Nessun benchmark nuovo o attestazione su throughput, P99, RSS, heap zero,
scalabilità, power loss, Linux o piattaforma di riferimento. Tempi del
recorder includono compilazione e fixture su Apple M4/SBCL 2.6.9/Darwin,
con carico esterno non controllato. I gate generali del motore restano aperti.
