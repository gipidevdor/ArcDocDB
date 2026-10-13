# Verifica del controllore del pool

Il componente C3 calcola un target bounded, con EWMA intere, AIMD e
permanenza delle condizioni. [Contratto](controllore-pool.md),
[metodo](controllore-pool-metodo.md), [decisioni](controllore-pool-decisioni.md),
[prima lettura](controllore-pool-revisione.md) e
[seconda lettura](controllore-pool-revisione-2.md) delimitano la verifica.
La base integrata è `4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`.

## Campagna congelata

Tutti gli esiti positivi sono OK/STABLE/exit 0 su 740 sorgenti e documenti
invariati nella copia congelata. Il catalogo dei byte originali è
[`2026-10-13-pool-controller`](../../spikes/results/2026-10-13-pool-controller/).
Le due letture e la preregistrazione precedono questi processi.

| Processo | Record | Esito |
|---|---|---|
| Copertura e 23 fixture | `4000906285-command-38489-0` | 344/348 espressioni, 50/50 rami |
| Compilazione e self-test del sensore | `4000906285-command-38487-0` | OK; controlli positivi e rifiuti attesi |
| Cinque repliche della misura | `4000906340-command-39064-0` | OK; zero byte heap in ciascuna replica |
| Controllo generale | `4000906339-command-39039-0` | OK; 998 prove nominate e 2 smoke |

Il controllo generale dura 200,078223 s: comprende build, lint e relativo
self-test, self-test dei runner snapshot/reader, tracciabilità, link,
self-test delle evidenze, cataloghi e dieci esperimenti F0. I 460160 byte
stderr sono note di compilazione: il build tratta warning e style-warning
come errori. I dieci esperimenti sono COMPLETE e conservati con i loro
raw, compreso il master `4000906505-check-41362-0`. La durata del controllo
non è una misura del percorso caldo.

## Copertura completa del package

| File | Espressioni hit/totale | Rami hit/totale |
|---|---:|---:|
| package | 1/1 | 0/0 |
| types, compresi helper generati | 25/25 | 10/10 |
| build | 74/78 | 4/4 |
| read | 46/46 | 10/10 |
| policy | 93/93 | 16/16 |
| update | 105/105 | 10/10 |
| Totale | 344/348, 98,85% | 50/50, 100% |

Nativo e HTML coincidono per tutti i sei file. Le quattro espressioni
mancanti di build restano nel denominatore: indici nativi 78..81, percorsi
`(2 2 5)`, `(5 2 5)`, `(6 2 5)`, `(7 2 5)`, inizializzatori degli argomenti
facoltativi della factory. Il minimo C3 del 95% è superato senza
esclusioni; non si deduce MC/DC da questi conteggi. Il reader compila
senza avvisi e verifica fixture positive, negative e soglia esatta.

## Misura del percorso normale

Ogni replica usa 4096 cicli, con 128 cicli di warmup. Un ciclo comprende
160 aggiornamenti grow/shrink e relativi getter, più due coppie update/read
per pending e hold. Le attese delle sette uscite e del target provengono
da un oracolo calcolato prima della misura. GC completa e avvio sono fuori
dal tratto misurato; tutta la verifica del risultato è nel tratto.

| Replica | Tick grezzi | Secondi | Byte heap |
|---|---:|---:|---:|
| 0 | 83427 | 0,083427 | 0 |
| 1 | 82384 | 0,082384 | 0 |
| 2 | 85044 | 0,085044 | 0 |
| 3 | 82709 | 0,082709 | 0 |
| 4 | 85129 | 0,085129 | 0 |

SBCL 2.6.9, ARM64, Apple M4; carico esterno non controllato. Il self-test
rileva 16777472 byte di allocazione deliberata, rifiuta sink e target
errati, distingue un clock sotto risoluzione da una durata numerica e
conserva risultato parziale e campioni precedenti dopo un errore. La misura
attesta questi percorsi post-avvio, non un'assenza universale di allocazioni.

## Tentativi preliminari

Le prove funzionali iniziali passano; i tentativi di copertura hanno
evidenziato due problemi del metodo: perdita dei segni di caricamento
dopo GC e mancato esercizio del confronto EQUALP generato. Il runner
conserva lo startup usando SAVE-COVERAGE dopo ciascun caricamento. Le
fixture verificano oggetti uguali e differenze nei campi. Tutti i conteggi
precedenti, inclusi quelli sotto il minimo C3, rimangono tentativi falliti.
L'esperimento di caricamento diretto dei sorgenti non è stato adottato.
Il primo controllo generale (`4000906285-command-38488-0`) è
FAILED/STABLE/exit 2 prima della compilazione, per un percorso relativo
nella configurazione della cache. Il record conserva la diagnosi originale;
il secondo processo usa un percorso assoluto e non ne riscrive l'esito.

## Limiti

Le soglie iniziali non sono calibrate sul carico del database. La misura
riguarda il calcolo del target, con tempo e campioni iniettati: non verifica
throughput, P99 del motore, sensori reali, fairness o stabilità del feedback.
Se actual non raggiunge target, il controllore resta pending anche quando
P99 peggiora. Revoca, scadenza e rifiuti dell'attuatore sono lavoro futuro.
Avvio, park/wake senza notifiche perdute, admission, retirement, shutdown,
pool I/O e coordinatore Archivio restano aperti; REQ-THR-001 e gli altri
requisiti globali mantengono lo stato progettato.
