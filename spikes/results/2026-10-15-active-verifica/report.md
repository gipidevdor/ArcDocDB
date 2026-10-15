# Recovery ACTIVE e guardie CONTROL — 2026-10-15

## Esito e revisioni

**59 nuovi test ACTIVE passati**, più **due test CONTROL** dedicati alle
guardie residue indicate dall'autore. La suite CONTROL conta ora 138 test.
Formati v1/v2, casi negativi, FI private seriali e file nativi reali sono
separati dagli esperimenti di prestazione.

Il controllo completo [`make check`](4001073535-command-71042-0-report.lisp)
è passato su `50e145a3`, dopo l'integrazione del `main` `2cf3c38d`.
Successivamente è cambiato solo il bootstrap del driver C4 e il suo metodo:
il benchmark e i 128 self-test finali sono su `3698797c`.
Il [confronto registrato](4001074233-command-13873-0-report.lisp) conferma
che prodotto, test, ASDF, build, copertura, Makefile e tracciabilità sono
identici a quelli del controllo completo. Anche
[`lint`, `trace` e link](4001074233-command-13872-0-report.lisp) sono stati
rieseguiti con successo sul grafo finale. Non si attribuisce il primo
`make check` a una revisione diversa da quella che ha eseguito.

La campagna aggiunge prove e strumenti. Il codice di prodotto è identico
al `main` integrato, come attesta anche il
[confronto di `src/`](4001073702-command-81755-0-report.lisp).

## Il punto evidenziato nel report CONTROL

Il [nuovo report](control-coverage.lisp) conserva gli stessi quattro file e
lo stesso denominatore della [campagna precedente](../2026-10-14-control-transizione/report.md).

| File CONTROL/recovery | Forme prima → ora | Rami prima → ora |
|---|---:|---:|
| `control/recovery-read` | 196/212 → **200/212** | 19/20 → **20/20** |
| `control/recovery-types` | 9/20 → 9/20 | 0/2 → 0/2 |
| `control/recovery-publication` | 23/26 → 23/26 | 2/2 → 2/2 |
| `recovery/manifest-transition` | 113/118 → 113/118 | 16/16 → 16/16 |

La nuova prova del lettore privato forza chunk zero: errore tipizzato,
scratch sentinella invariato, nessuna lettura o modifica delle capacità.
Il secondo test passa dinamicamente al costruttore un argomento invalido
per volta, controlla `type-error` e verifica le combinazioni valide di
versione/stato. Le istanze private non vengono usate per pubblicare.

SB-COVER continua a non marcare alcune dichiarazioni, specifiche dei tipi
e forme generate del costruttore BOA. Il test dei tipi è passato anche se
il contatore associato alla specifica dello slot resta 0/2. Non si deduce
da quel numero che il controllo runtime sia assente, né si esclude la forma
dal denominatore. Non sono stati ricaricati i sorgenti per colorare
`in-package` o `declaim`. **Nessuna eccezione di copertura è approvata.**

## ACTIVE: casi e oracoli

- Lettura completa readonly dallo stesso FD: header una volta, corpo per
  chunk, short read e EOF anticipato; identità fisiche, UUID/ID/CRC,
  riservati, versione e origine writer verificati prima dell'interpretazione.
- Budget e capacità insufficienti rifiutati con condizioni specifiche;
  nessun risultato parziale. Lo scanner cerca i SEAL testimoni fino a EOF
  prima della semantica, anche con un conflitto nel prefisso precedente.
- Prepared ripetuti nello stesso lotto, attraversamento di lotti,
  OUTCOME prematuri, duplicati, conflitti e occorrenze fisiche conteggiate.
  Locale/DECISION/presumed abort, partecipanti e CSN discordanti coprono
  la tabella pubblica di risoluzione, inclusi zero e u64 completo.
- Chiusure ordinate, query nei vuoti della ricerca binaria, serializer
  confrontato con byte indipendenti e sentinelle; poison dello scratch e
  della tabella originaria dopo la consegna dimostra l'indipendenza osservata
  del risultato, senza pretendere una prova di reachability del GC.
- File reali: CONTROL, decision log e ACTIVE nativi; nuovo segmento e
  checkpoint dalle factory. CLOSED/P/esiti errati e FD chiusi sono rifiutati
  prima del claim. Dopo rename, il guasto fsync conserva condizione originale,
  gettone terminale e byte; il vecchio ACTIVE e la sua coda restano intatti.

Header, record, SEAL e byte attesi usano packing bytewise e CRC bitwise
dei test. Le normali fixture chiamano le factory e API pubbliche; le FI
private sono dichiarate e ripristinate serialmente.

## Copertura ACTIVE grezza

Da [coverage.lisp](coverage.lisp), produttore concluso e stabile, hit azzerate
dopo il caricamento e prima della sola suite ACTIVE.

| File `recovery-active/` | Forme coperte/totali | Rami coperti/totali |
|---|---:|---:|
| build | 140/160 | 9/12 |
| closure | 90/95 | 6/6 |
| frames | 174/206 | 16/22 |
| publication | 67/75 | 7/8 |
| query | 83/97 | 10/12 |
| read | 123/141 | 16/20 |
| resolve | 145/166 | 20/24 |
| types | 5/27 | 0/2 |

Questa è la prima suite funzionale dedicata, **non copertura C1 completa
o MC/DC**. Restano guardie difensive e forme generate/non marcate. Le FI
non attestano che un decoder corretto possa produrre risultati impossibili.

## Misure parallele

[Metodo preregistrato](../../../docs/implementazione/active-recuperato-metodo.md),
[produttore](4001074170-command-10643-0-report.lisp) e
[report originale](active-verifica-bench-B/report.lisp).

Completate **18 finestre**, v1/v2 × 1/2/4 worker × tre repliche:
**42 record worker, 8.400 recovery verificati, 201.600 record logici e
109.200 query di chiusura**. Ogni worker esegue 200 chiamate e otto warmup
esclusi. Tutte le finestre riportano quiescenza ed esito `:ok`.

Il singolo file sintetico occupa 768 byte, con 24 record e 12 prepared
divisi in quattro locali, quattro derivati e quattro abort. Ogni recovery
verifica frontiere, statistiche, CSN zero/u64, 13 query e assenza di effetti.
Fixture, capacità e scratch sono privati per worker; rendezvous dopo il
primo risultato verificato, con attese e join limitati.

Il wall delle singole finestre va da **5.167 a 52.548 tick**, con un milione
di tick al secondo. Include avvio thread, gate, join, oracoli e harness.
Heap misurato sull'intero processo; il percorso di apertura alloca.
Le altre nostre esecuzioni pesanti erano terminate; il carico esterno della
macchina resta non controllato e sono stati osservati altri job SBCL.
Il campione non autorizza conclusioni su P99, I/O disco o scalabilità del DB.

Il bootstrap finale registra 57 avvisi di ridefinizione ASDF, con 16 messaggi
nel risultato e tutti gli originali in stderr. Solo quel sottotipo viene
muffled nel caricamento ASDF; gli altri warning restano fatali. La policy
ha casi negativi nei 128 self-test finali.

## Fallimenti conservati

| Tentativo | Revisione | Esito originale |
|---|---|---|
| Coverage A | `22265d93` | Parentesi in eccesso nella suite semantica, compilazione fallita |
| Coverage B | `e156def4` | Budget della fixture CONTROL insufficiente per esaminare la coda |
| Coverage C | `b1898e3b` | Create della fixture su nome canonico: rifiuto `io-temporary-name` |
| Coverage D | `50e145a3` | Tutti i 59 test ACTIVE passati |
| Benchmark A | `50e145a3` | Bootstrap interrotto da ridefinizione ASDF; zero finestre, raw `:incomplete` |
| Benchmark B | `3698797c` | Tutte le 18 finestre completate |

Le riparazioni riguardano fixture/driver C4. I record falliti conservano
comando, revisione/blob, output e causa originale; i sorgenti delle prove
sono nella storia Git. Il [driver A](benchmark-attempt-A-source.txt) è
conservato anche come testo. Un fallimento non viene promosso a prova positiva.

## Conservazione e limiti aperti

Il [catalogo](catalogo.lisp) seleziona soltanto produttori chiusi e raw
esplicitamente attribuiti. Include anche i processi negativi di snapshot e
reader del controllo completo e i dieci risultati SPK individuali.
Le [chiusure](retention.lisp) conservano separatamente pubblicazione,
audit e controllo delle evidenze, senza autocertificazione ricorsiva.
Record grandi e stato SB-COVER sono compressi senza perdita; cache/FASL
ricostruibili sono esclusi da Git e rimossi con il worktree temporaneo.

La [lettura del coordinatore](revisione-autore.md) distingue ispezione ed
esecuzioni. La [lettura indipendente](revisione-indipendente.md) non è stata
consegnata per il limite di utilizzo degli agenti; l'evento è registrato in
[coordinamento.lisp](coordinamento.lisp). **La qualifica C1 resta aperta.**

Nessuna prova di power loss, esclusività verso processi esterni, GC reachability,
recovery completo dell'Archivio o ammissione del traffico. Il nuovo ingresso
autorevole del decision log, integrato da `main`, ha le proprie evidenze
statiche; questa campagna esercita il reader ACTIVE a tabella esplicita.
