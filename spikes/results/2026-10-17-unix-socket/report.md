# Socket Unix: prova locale e controlli di integrazione

Campagna del 2026-10-17. Conserva gli originali di SPK-11 e dei controlli
intermedi di integrazione. Il [metodo preregistrato](../../SPK-11-unix-socket/README.md)
e il [contratto M16 proposto](../../../docs/implementazione/sessione-locale.md)
restano distinti dal listener di prodotto, ancora da realizzare.

## Risultati del trasporto

La variante finale passa sei scenari con processi SBCL distinti: invii e
letture di un byte, frame accorpati e risposte invertite, documento CBOR
da 16 MiB con chiave da 65.535 byte, lunghezza zero, lunghezza oltre 17 MiB
e peer chiuso durante il corpo. Il decoder rifiuta le lunghezze invalide
prima di allocare il corpo. Le partizioni dei frame piccoli, le troncature
e i controlli negativi sono conservati nel risultato originale.

Il nome occupato da listener, orfano, file o link resta intatto; l'arresto
non rimuove il sostituto. La diagnostica nativa macOS mostra che un bind
grezzo può seguire un link pendente: la variante finale controlla prima il
namespace posseduto. I buffer alien temporanei del contrib SBCL restano
ammessi nello spike; il futuro percorso di prodotto richiede l'adattatore
I/O preallocato e iniettabile.

## Registri originali

Ogni riga indica il direttorio `processes/command-N/`, con report originale,
eventuale payload gzip e ricevuta di conservazione. Exit code, sorgenti,
ambiente, argv e output restano nei file, senza correzioni retroattive.

| N | Esecuzione | Esito originale |
|---|---|---|
| 0 | Documentazione delle API locali SBCL | OK |
| 1 | Primo harness SPK-11: caricamento ASDF troppo ampio | Fallito su avviso di ridefinizione |
| 2 | Compilazione dello spike isolato | Fallita: parentesi mancante |
| 3 | Compilazione I/O | Fallita: accessor errno non esportato |
| 4 | Primo controllo dei nomi | Fallito: assunzione sul bind grezzo |
| 5 | Diagnostica del link pendente | Fallita, con identità del nodo conservata nel log |
| 6 | Variante finale SPK-11 | OK, sorgenti stabili |
| 7 | Generazione della matrice | Exit 0, SOURCE-CHANGED atteso per il file generato |
| 8 | Primo `make check` | OK, sorgenti stabili; undici spike |
| 9 | Test/lint/trace/link del prodotto composto | OK, sorgenti stabili |
| 10 | Piano CI nel checkout locale | Fallito sul controllo dei file ignorati |
| 11 | Conservazione temporanea dei metadati Finder | OK; operazione locale |
| 12 | Piano CI nel checkout ripulito | OK, sorgenti stabili |
| 13 | Ripristino dei metadati Finder | OK, identità dei byte verificata |
| 14 | `make check` con catalogo CI, cache e riserve full text | OK, sorgenti stabili; undici spike |
| 15 | Self-test sulle ultime correzioni degli strumenti CI | OK, sorgenti stabili |
| 16 | Audit di tutti i worktree | Fallito: nuovo turno umano PUT/WAL ancora in lavorazione |

Il record 16 dimostra che il controllo non dichiara chiusa l'integrazione
con un worktree ancora modificato. Il nuovo lavoro non è cancellato o
qualificato da questa campagna. L'audit conclusivo dell'integrazione ha
un perimetro distinto e sarà conservato separatamente.

Le ultime sei modifiche dei soli strumenti CI sono verificate dal record
15; sorgenti del prodotto e test restano identici al record 14. Non si
attribuisce un unico run a revisioni diverse. Le prove locali della CI
hanno inoltre il proprio [archivio e report](../2026-10-17-ci-implementazione/report.md).

## Conservazione e limiti

[Indice chiuso](archive-index.lisp), [catalogo](catalogo.lisp), manifest e
strumento di raccolta conservano byte, dimensioni e SHA-256 dei file copiati.
Gli originali dei due harness completi sono in `raw/spikes-*/`. I sorgenti
finali dello spike e dell'harness sono in `sources/`; per le varianti fallite
restano hash e log originali, senza sostenere che ogni sorgente intermedio
sia incluso. Il produttore della raccolta è conservato in `raw/`.

È una verifica locale su macOS/SBCL, non una misura di throughput o latenza.
Restano handshake/dispatcher M16, accesso con UID distinti, Linux, pool del
prodotto, gate di recovery, perdita della risposta dopo commit e qualifica C1.
REQ-IPC-001…REQ-IPC-004 rimangono progettati. Nessun risultato locale viene
presentato come esecuzione GitHub o prestazione del database.
