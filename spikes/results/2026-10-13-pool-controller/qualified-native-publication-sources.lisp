(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-QUALIFIED-NATIVE-PUBLICATION-SOURCES :VERSION
 "45eb1537ee5dfbbaf9850c704aa359bfcf3b4588" :SOURCES
 ((:PATH #A((49) BASE-CHAR . "spikes/out/pool-qualified-native-publication.lisp") :BYTES 1473
   :SHA256 "ef2ef17250b5959fa04477f78d08f9beea3b018c9c51fac6227fbb6ac5eb7b2e" :GIT-BLOB
   "386a6f9807be33490f3ba98d8da1fb870c86668a" :TEXT
   "(pushnew :pool-controller-publication-library *features*)
(load \"spikes/out/pool-controller/publish.lisp\")
(let* ((source #p\"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/pool-qualified-coverage/\")
       (target (merge-pathnames \"qualified-coverage/\" *pool-publication-directory*))
       (*pool-development-roots* (list source))
       (*pool-development-required* (append (list (merge-pathnames \"coverage-state.lisp\" source)
                                                  (merge-pathnames \"coverage-audit.lisp\" source))
                                           (directory (merge-pathnames \"*.html\" source))))
       (plan (pool-development-plan)))
 (unless (and (= 9 (length (getf plan :paths))) (= 9 (length *pool-development-required*)))
  (error \"Qualified coverage requires nine original files.\"))
 (when (probe-file target) (error \"Qualified destination exists; no overwrite.\"))
 (ensure-directories-exist (merge-pathnames \"placeholder\" target))
 (pool-development-write plan target)
 (worker-save-source-bundle
  '(\"spikes/out/pool-qualified-native-publication.lisp\" \"docs/implementazione/controllore-pool-risultati.md\")
  (merge-pathnames \"qualified-native-publication-sources.lisp\" *pool-publication-directory*)
  :pool-controller-qualified-native-publication-sources :version \"45eb1537ee5dfbbaf9850c704aa359bfcf3b4588\")
 (format t \"Nine original qualification files conserved losslessly, including native state and six HTML pages.~%\"))
")
  (:PATH #A((50) BASE-CHAR . "docs/implementazione/controllore-pool-risultati.md") :BYTES 7906
   :SHA256 "99e62923c222cdcf434d1a69d227e20661cda26ea0f97a6f7938d9bae2b98656" :GIT-BLOB
   "26a193abf723f9dee7b687d5d3e4d9c6b1c8c80f" :TEXT "# Verifica del controllore del pool

Il componente C3 calcola un target bounded, con EWMA intere, AIMD e
permanenza delle condizioni. [Contratto](controllore-pool.md),
[metodo](controllore-pool-metodo.md), [decisioni](controllore-pool-decisioni.md),
[prima lettura](controllore-pool-revisione.md) e
[seconda lettura](controllore-pool-revisione-2.md) delimitano la verifica.
La base della campagna congelata è `4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`.

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
I nove artefatti originali della qualificazione — stato nativo, audit,
indice e sei pagine — sono conservati nel
[bundle qualificato](../../spikes/results/2026-10-13-pool-controller/qualified-coverage/),
con testo integrale, SHA256, byte e Git blob dei singoli file.

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

## Integrazione e conservazione

Il commit del componente `b984e3d` è integrato con `main` a
`3106a498d10b7d876ce62f02afc3bd87f1bdeaa8`, nel merge `6aca985`.
Entrambe le voci del changelog sono conservate; i sei sorgenti del
controllore e le 23 fixture restano quelli qualificati.

| Controllo della versione combinata | Record | Esito |
|---|---|---|
| Build con avvisi fatali e tutti i test | `4000907488-command-66476-0` | OK; 994 prove nominate e 2 smoke |
| Lint | `4000907488-command-66477-0` | OK; 171 file, zero violazioni |
| Tracciabilità | `4000907488-command-66478-0` | OK; 117 requisiti, 65 invarianti, 13 FI, 52 ADR |
| Link | `4000907488-command-66479-0` | OK; 2614 link, zero rotti |
| Cataloghi ed evidenze conservate | `4000907488-command-66482-0` | OK |

Tutti questi processi sono STABLE/exit 0 su 743 sorgenti e documenti.
Il build combinato dura 25,170712 s. Il totale delle prove nominate del
controllo generale comprende anche i self-test degli strumenti esterni
al build; i due conteggi non descrivono suite diverse del controllore.

Il publisher `4000906724-command-45635-0` conserva byte originali e
payload compressi senza cambiare gli esiti. Il self-test
`4000907085-command-56510-0` passa otto controlli: copia positiva,
rifiuto di una destinazione esistente con byte invariati, inventario dei
raw, esclusione esplicita dei FASL, rifiuto di estensioni sconosciute e
rifiuto di un piano invalido prima delle scritture. Il successivo
`4000907539-command-68065-0` conserva questi record e i controlli statici.

Una verifica indipendente confronta bytes, SHA256 e Git blob dei 50 entry
del primo manifesto, oltre alla validità dei reader: zero problemi.
La stampa originale dell'audit mostra erroneamente 1/50 per una lista
distruttivamente invertita dopo averla salvata; il report originale
contiene tutte le 50 prove. Script, output originale e proiezione corretta
sono conservati insieme, senza riscrivere quel tentativo.
I bundle distinguono sorgenti congelati, documenti finali e versione
integrata; ogni nuovo sigillo aggiunge un manifesto esclusivo.

La successiva integrazione della PR #10, `baaa68c636e0be84854af2e5d12a01dab0cf80cb`,
aggiunge 42 fixture OUTCOME senza cambiare il codice di prodotto.
Il merge `1b9fe8062fcd944b560638ece288225d3d5843cd` passa nuovamente il build
con avvisi fatali: record `4000907892-command-73441-0`, 1036 prove nominate
e due smoke, 24,306801 s. Il record `4000907893-command-73469-0` verifica
lint, tracciabilità e 2642 link senza errori. Entrambi sono OK/STABLE/exit 0
su 750 sorgenti e documenti. La copertura e le misure del controllore
restano quelle della campagna congelata, con sorgenti invariati.
Anche i cataloghi dopo questo merge passano: record
`4000908000-command-75169-0`, OK/STABLE/exit 0 su 750 sorgenti e documenti.

## Limiti

Le soglie iniziali non sono calibrate sul carico del database. La misura
riguarda il calcolo del target, con tempo e campioni iniettati: non verifica
throughput, P99 del motore, sensori reali, fairness o stabilità del feedback.
Se actual non raggiunge target, il controllore resta pending anche quando
P99 peggiora. Revoca, scadenza e rifiuti dell'attuatore sono lavoro futuro.
Avvio, park/wake senza notifiche perdute, admission, retirement, shutdown,
pool I/O e coordinatore Archivio restano aperti; REQ-THR-001 e gli altri
requisiti globali mantengono lo stato progettato.
")))
