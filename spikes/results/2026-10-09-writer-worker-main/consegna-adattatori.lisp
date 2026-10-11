(:SCHEMA-VERSION 1 :KIND :WORKER-UPSTREAM-INTEGRATION-CLOSURE :VERSION 1 :SOURCES
 ((:PATH #A((33) BASE-CHAR . "spikes/out/worker-main-close.lisp") :BYTES 952 :SHA256
   "084fa4c97b744fb387e980f0e4223ae1695f5ce0b6392a90a67e91d62b276630" :GIT-BLOB
   "89b34c875513864a11f1c198c6115225d3b3d263" :TEXT
   ";;;; Aggiunge il processo di conservazione concluso; nessuna nuova campagna.
(load \"spikes/out/worker-publication-functions.lisp\")
(setf *worker-publication-directory*
      #p\"spikes/results/2026-10-09-writer-worker-main/\")
(worker-copy-process \"4000702321-command-32005-0\" \"conservazione-processo\")
(worker-save-source-bundle
 '(\"spikes/out/worker-main-close.lisp\" \"spikes/out/worker-main-finish.lisp\"
   \"docs/implementazione/writer-worker-integrazione.md\"
   \"docs/implementazione/README.md\" \"docs/implementazione/writer-worker-risultati.md\")
 (merge-pathnames \"consegna-adattatori.lisp\" *worker-publication-directory*)
 :worker-upstream-integration-closure :version 1)
(worker-refresh-catalog
 \"a185aee95b2e40f267df26ec41024dafc0fb9b7a\"
 :historical-bases '(\"9f9f6bd3b7a219211c8f08fe9e5f2b669b849796\"
                     \"edb043b1234479cadab0f39b7adf1918786fa91e\"))
(format t \"Processo di conservazione concluso incluso; catalogo aggiornato.~%\")
")
  (:PATH #A((34) BASE-CHAR . "spikes/out/worker-main-finish.lisp") :BYTES 583 :SHA256
   "0347de44055cb424b74f557db55e9f39b37e6a5bbbc73d4e2050d93cecb36748" :GIT-BLOB
   "f84b1b3648f186b802ed0665a3acc0b85f1b10b2" :TEXT
   ";;;; Conserva il gate editoriale concluso, senza ricorsione dei gate.
(load \"spikes/out/worker-publication-functions.lisp\")
(setf *worker-publication-directory*
      #p\"spikes/results/2026-10-09-writer-worker-main/\")
(worker-copy-process (first (uiop:command-line-arguments)) \"links-evidence-processo\")
(worker-refresh-catalog
 \"a185aee95b2e40f267df26ec41024dafc0fb9b7a\"
 :historical-bases '(\"9f9f6bd3b7a219211c8f08fe9e5f2b669b849796\"
                     \"edb043b1234479cadab0f39b7adf1918786fa91e\"))
(format t \"Gate editoriale originale conservato; catalogo finale aggiornato.~%\")
")
  (:PATH #A((50) BASE-CHAR . "docs/implementazione/writer-worker-integrazione.md") :BYTES 3050
   :SHA256 "740c1196ea0ba7d80da702adc92bfbac9ac18adc0d078ca6fd03932fe522915e" :GIT-BLOB
   "c4eccbc17965badb595dda10ff152dc6912fc148" :TEXT "# Integrazione dei worker nella base comune

Il merge `a185aee95b2e40f267df26ec41024dafc0fb9b7a` unisce il worker
pubblicato `9f9f6bd3b7a219211c8f08fe9e5f2b669b849796` alla base
`edb043b1234479cadab0f39b7adf1918786fa91e`. Questa è la versione del
codice verificata dal controllo completo del 9 ottobre 2026.

Il [controllo dello scope](../../spikes/results/2026-10-09-writer-worker-main/scope-integrazione-processo.lisp)
conserva l'esportazione dei tre alberi Git e i confronti dei blob. Tutti i
4.100 path della base sono presenti: 4.096 hanno gli stessi byte. I quattro
file comuni modificati sono ASDF, indice della documentazione, package
execution e inventario delle eccezioni di copertura. I venti file execution,
test e tool worker sono identici alla versione pubblicata; anche i 140 path
aggiunti rispetto alla base coincidono con quella versione. Il
[bundle degli adattatori](../../spikes/results/2026-10-09-writer-worker-main/integrazione-adattatori.lisp)
conserva il confronto completo, i sorgenti degli adattatori e i relativi hash.

Il [record completo](../../spikes/results/2026-10-09-writer-worker-main/check-integrazione-processo.lisp)
è OK/STABLE, exit 0: 459 test in dodici suite più smoke, compilazione senza
avvisi, lint su 111 file senza errori, tracciabilità senza errori e 2.173 link
verificati. Il checker delle evidenze usa il valore Makefile predefinito di
2.048 MiB; i 4.096 MiB del processo esterno di registrazione non sostituiscono
quel valore. Il [master degli spike](../../spikes/results/2026-10-09-writer-worker-main/spikes-integrazione.lisp)
è COMPLETE: dieci spike completati con exit 0 e sorgenti stabili. Il catalogo
[delle copie originali](../../spikes/results/2026-10-09-writer-worker-main/catalogo.lisp)
conserva anche i registri di conservazione e il payload gzip originale.

Le letture statiche indipendenti dello scope e dei contratti confermano la
coesistenza dei worker con Serie, WAL, indice, snapshot, epoche e letture
nell'assemblaggio ASDF. Il controllo completo qualifica quell'assemblaggio.
La qualificazione specifica del worker resta quella dei
[risultati originali](writer-worker-risultati.md): 23 test dedicati,
12 mutanti rilevati e venti campioni locali senza allocazioni heap misurate.
Le campagne dedicate non sono state ripetute per questa integrazione; i loro
limiti e denominatori di copertura restano invariati.

Rimane aperto il collegamento operativo fra lease del worker e lease della
Serie. Il prossimo incremento deve acquisire entrambi prima del primo pop,
rilasciare la Serie prima di chiudere il writer e conservare gli obblighi
quando la seconda acquisizione o la chiusura restituisce busy. L'assemblaggio
verificato non prova quel protocollo, throughput o scalabilità del motore,
né chiude il gate C1 complessivo o dimostra MC/DC.

Alla ripresa dell'11 ottobre la primaria contiene ulteriori modifiche dello
scanner CBOR. La pubblicazione mantiene quindi esplicita la base qualificata
`edb043b`: l'esito qui conservato non qualifica automaticamente quei nuovi
sorgenti.
")
  (:PATH #A((30) BASE-CHAR . "docs/implementazione/README.md") :BYTES 4982 :SHA256
   "149bded89005734998f27c81e011836f3aefd044d9ec8e8d5efe2ca26c05a0e2" :GIT-BLOB
   "88b74d934261f44fe08ba081a3fecc37d0575b3c" :TEXT "# Implementazione

Fondazioni introdotte dopo la richiesta dell'autore del 2026-10-08 di iniziare la scrittura
del codice. L'autorizzazione non equivale alla chiusura dei criteri della Fase 0 o alla
qualifica del motore completo.

| Modulo | Contratto e verifica | Codice |
|---|---|---|
| Fondazioni binarie | [Record v1/v2, CRC32C e lotti SEAL](fondazioni-binarie.md) | [`src/foundation/`](../../src/foundation/) |
| Testo UTF-8 | [Validazione limitata, pura e parallela](utf8.md) | [`src/codec/utf8.lisp`](../../src/codec/utf8.lisp) |
| Testate CBOR | [Lettura pura in sei valori](cbor-header.md) | [`src/codec/cbor-header.lisp`](../../src/codec/cbor-header.lisp) |
| Testate CBOR minime | [Larghezze di argomenti e float, senza decodifica](cbor-minimo.md) | [`src/codec/cbor-minimal.lisp`](../../src/codec/cbor-minimal.lisp) |
| Struttura CBOR | [Item completo, UTF-8 e budget con scratch per worker](cbor-struttura.md) | [`src/codec/cbor-scan.lisp`](../../src/codec/cbor-scan.lisp) |
| CSN di Archivio | [Registro dei commit in corso e orizzonte](csn.md) | [`src/csn/`](../../src/csn/) |
| Metadati storage | [Header dei segmenti, EDIT e DECISION](metadati-storage.md) | [`src/storage/`](../../src/storage/) |
| Header dei log | [Identità e integrità di control e multiserie](header-log.md) | [`src/storage/log-header.lisp`](../../src/storage/log-header.lisp) |
| Segmenti compattati | [Prefisso CLOSED e record ordinari](segmenti-compattati.md) | [`src/storage/compaction-scan.lisp`](../../src/storage/compaction-scan.lisp) |
| Code dei writer | [MPSC locale, gettone e tratti limitati](code-writer.md) | [`src/execution/`](../../src/execution/) |
| Consegna dei writer | [Idle, pronto, in esecuzione e obbligo di scheduling](writer-handoff.md) | [`src/execution/handoff.lisp`](../../src/execution/handoff.lisp) |
| Lista dei writer pronti | [Ring preallocati, partizioni indipendenti e scansione limitata](writer-ready.md) | [`src/execution/ready.lisp`](../../src/execution/ready.lisp) |
| Ricircolo dei writer pronti | [Scambio FIFO atomico a ring pieno](writer-recycle.md) | [`src/execution/ready-recycle.lisp`](../../src/execution/ready-recycle.lisp) |
| Contesto worker | [Lease, batch confermati, retry e fault locale](writer-worker.md) | [`src/execution/worker-types.lisp`](../../src/execution/worker-types.lisp) |
| Integrazione dei worker | [Base comune, scope e controllo completo](writer-worker-integrazione.md) | [`arcdocdb.asd`](../../arcdocdb.asd) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Lotti WAL | [Formazione, SEAL e group commit](wal.md) | [`src/wal/`](../../src/wal/) |
| CSN dei lotti WAL | [Chiusura, token e risoluzione](wal-csn.md) | [`src/wal/csn.lisp`](../../src/wal/csn.lisp) |
| Controller della Serie | [Pubblicazione FIFO, token e ritiro I/O](controller-serie.md) | [`src/series/`](../../src/series/) |
| Verifica del controller | [Prove strutturate, copertura e misure parallele](controller-serie-risultati.md) | [`tests/series/`](../../tests/series/) |
| Slot dell'indice v2 | [Payload compatto, seqlock e rilocazione](slot-indice-v2.md) | [`src/index/`](../../src/index/) |
| Indice primario v2 | [Chiavi, gruppi Swiss e pubblicazione della directory](indice-primario.md) | [`src/index/primary-read.lisp`](../../src/index/primary-read.lisp) |
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Scansione recovery | [Prefisso dei log e testimonianze SEAL](scansione-log.md) | [`src/recovery/`](../../src/recovery/) |
| Decisioni multiserie | [Tabella TXID, CSN e partecipanti](decisioni-multiserie.md) | [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp) |
| Manifest della Serie | [Ripiegamento degli EDIT del control log](manifest-control-log.md) | [`src/recovery/`](../../src/recovery/) |
| Inventario recovery | [Piano di riconciliazione dei nomi dei segmenti](inventario.md) | [`src/recovery/inventory-build.lisp`](../../src/recovery/inventory-build.lisp) |
| Ordinamento delle decisioni | [Radix misurato e query concorrenti](decisioni-radix-risultati.md) | [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) |

Le evidenze hanno un ambito esplicito: un test del codec non verifica transazioni,
durability, recovery o prestazioni del database.

Gli [esiti dei processi nelle mutazioni CBOR](cbor-mutazioni-processi.md)
distinguono i rilevamenti dei mutanti dagli errori dei worker di verifica.
")
  (:PATH #A((47) BASE-CHAR . "docs/implementazione/writer-worker-risultati.md") :BYTES 11109
   :SHA256 "e6876db85e4098146ff711db8b0f38d65203c821c1813b2ea8958406b62b732c" :GIT-BLOB
   "2e58b4d0e459495430a6cd1e9540994d8a25a0da" :TEXT "# Risultati del contesto worker dei writer

Campagne del 2026-10-09 sulla base `cf60913`, con sorgenti congelati dopo
la prima lettura C1. Contratto in [writer-worker](writer-worker.md),
[metodo preregistrato](writer-worker-metodo.md),
[inventario completo](writer-worker-decisioni.md) e
[catalogo dei dati conservati](../../spikes/results/2026-10-09-writer-worker/catalogo.lisp).
Le qualificazioni riguardano questa composizione locale, non il pool completo.

## Correttezza e integrazione

Il processo `4000547204-command-93189-0` termina OK/STABLE/exit0:
387 test più smoke, compilazione senza warning o style-warning, lint su
63 file con zero violazioni, tracciabilità di 114 requisiti/65 invarianti/
13 scenari FI/52 ADR senza errori, 221 documenti e 2007 link senza rotture,
self-test della conservazione, verifica delle evidenze e dieci spike.
Il [record completo](../../spikes/results/2026-10-09-writer-worker/check-finale-processo.lisp)
conserva anche i rifiuti intenzionali delle fixture negative dei tool.

I test execution sono 89, di cui 23 nuovi. L'oracolo a liste indipendenti
esegue 8000 passi su otto combinazioni K1/4, capacità ready1/2 e quantum1/2,
13 writer, drain finale e uguaglianza payload accettati/consegnati.
Le fixture verificano quote cumulative, FIFO, buffer/sentinelle, home/cursor,
ack stale, busy con snapshot, latch finishing, ricircolo room/full,
adozione/cessione senza lease attive, overflow senza wrap e fault persistenti.
La regressione not-ready conserva la condizione originale e impedisce al
vecchio contesto di consumare una nuova ondata.

Una prova riusa quattro thread su sei ondate, con produttori vivi e 36
payload controllati mediante CRC, verificando progresso su uno shard mentre
un altro è occupato. Un'altra riusa due contesti proprietari concorrenti
su otto ondate, con un solo vincitore per obbligo. Queste prove non attestano
fairness, wake/park, shutdown o migrazione delle lease tra thread.

## Integrazione della base aggiornata

Dopo queste campagne la primaria integra l’inventario recovery in `e2f7a75`.
Il controllo distinto `4000548048-command-40192-0` è OK/STABLE/exit0:
400 test più smoke (execution89, recovery95), lint66/zero, tracciabilità
114/65/13/52 senza errori, 224 documenti/2017 link senza rotture e dieci spike.
Il [record integrato](../../spikes/results/2026-10-09-writer-worker/check-integrazione-processo.lisp)
e il [catalogo dei suoi spike](../../spikes/results/2026-10-09-writer-worker-integration/catalogo.lisp)
conservano il nuovo gate. Lo scope `4000548017-command-37007-0` confronta
i byte execution, test e tool worker con la copia qualificata: invariati;
ASDF e indice incorporano anche l’inventario. Le campagne worker già concluse
non sono rieseguite per cambiamenti della recovery indipendente. I due
master conservano i rispettivi descriptor/payload originali in directory
distinte, evitando collisioni dei nomi gzip. I documenti conclusivi sono
controllati separatamente dalla compilazione dei sorgenti congelati.

## Mutazioni e qualità degli strumenti

I due C4 sono compilati integralmente con COMPILE-FILE e self-test eseguiti
dai FASL, con avvisi fatali: `4000547221-command-94073-0` e
`4000547221-command-94074-0`, entrambi OK/STABLE/exit0. L'adapter conservato
ha un marker finale editoriale ereditato `RECYCLE-TOOL-STRICT-SELF-TEST-PASS`;
argv, sorgente compilata e risultati identificano esplicitamente worker.

La [campagna di mutazione](../../spikes/results/2026-10-09-writer-worker/mutazioni-dati.lisp)
`4000547268-command-97067-0` completa la baseline di 89 test e rileva
12/12 mutanti preregistrati. Ogni mutante ha exit1, segnale NIL e un vero
marker di avvio dei test; zero survived, compilation-failure, before-tests
o worker-error. Tutti i tredici log sono conservati con i bersagli esatti.

Il [catalogo del probe di revisione](../../spikes/results/2026-10-09-writer-worker-review/catalogo.lisp)
conserva separatamente il grande record processuale originale, con il
payload gzip originale. L’audit integrale e la sua proiezione compatta
sono entrambi conservati; il fallimento iniziale dell’adapter di proiezione
è dichiarato nell’inventario e non attribuito al prodotto.

La fixture OS separata usa SIGKILL reale: segnale9/exit137, classificazione
worker-error e detected0. Completamento autentico seguito da exit nonzero,
marker citati, warning/compilation failure, report parziali e destinazioni
preesistenti sono controllati dai self-test e non promossi a detection.

## Allocazione del percorso composto

La [campagna di allocazione](../../spikes/results/2026-10-09-writer-worker/allocazioni-dati.lisp)
`4000547268-command-97066-0` è OK/STABLE/exit0. Un contesto creato sul thread
proprietario, writer, ready ring e buffer sono preallocati. Ogni ciclo
compone enqueue, publish, claim, begin, pop/ack, end e recycle full/room;
identità dei writer, count/status/cursor e generazioni persistenti sono
verificati. Ruota il ruolo iniziale fra C+1 writer distinti per shard.

| Shard K | Capacità C | Chiamate/ciclo | Token | Sink per replica | Campioni completi | Heap osservato |
|---|---|---|---|---|---|---|
| 1 | 1 | 35 | 578 | 10754048 | 5 × 4096 cicli | 0 byte |
| 1 | 3 | 49 | 858 | 11900928 | 5 × 4096 cicli | 0 byte |
| 4 | 1 | 137 | 2520 | 18708480 | 5 × 4096 cicli | 0 byte |
| 4 | 3 | 193 | 4084 | 25114624 | 5 × 4096 cicli | 0 byte |

Warmup128 e GC fuori misura; controllo positivo 16777472 byte allocati,
baseline contatore zero, sink errato respinto e clockzero distinto da una
durata valida. La formula del metodo è ricalcolata rispetto alle operazioni
del driver. Tutti i tempi e campioni raw restano nei dati; carico esterno
non controllato, nessuna promessa di speedup, throughput, P99 o heapzero
universale. Startup ed errori sono fuori dal percorso normale misurato.
Il benchmark composto usa un worker; il parallelismo funzionale è verificato
dalle fixture con thread reali, non da una misura di scalabilità.

## Copertura e limiti

Copertura `4000547204-command-93188-0`, export
`4000547249-command-95826-0`, audit indipendente native/HTML/export
`4000547296-command-98426-0`: 1427/1660 espressioni e 199/230 esiti
su tutti gli undici file execution. I quattro nuovi file hanno 498/600
espressioni e 65/76 esiti. Le 233 espressioni e 31 alternative non marcate,
comprese quelle legacy, restano nel denominatore e nell'inventario.
Nessuna esclusione approvata o MC/DC dedotta da sb-cover; il gate C1 del
motore rimane aperto.

Il confine locale faulted è terminale e diagnostico: non realizza ancora
il controller FAULTED della Serie o il rilascio delle risorse dopo un fault.
Ack attesta il caller, senza verificare effetti WAL esterni. Catene full
rimangono sullo stesso shard; quote globali, admission, pool adattivo,
wakeup/park/shutdown e integrazione durevole restano lavoro successivo.
Empty è soltanto un'osservazione locale. Il probe iniziale
`4000545928-command-51771-0` è conservato come sviluppo precedente al codice
finale e non viene usato per qualificarlo.

## Conservazione finale delle evidenze

Il primo adapter di pubblicazione (`4000548817-command-74667-0`) ha respinto
una copia identica: confrontava con EQUALP oggetti riletti che contengono
simboli non internati. Il confronto corretto verifica byte originali e
decompressi, SHA256 e Git blob, con lettura validata e senza overwrite.
L’audit distinto `4000549512-command-14958-0` conserva quattordici fixture
positive/negative e il confronto di 46 copie canoniche, tutti passati.
Il marker finale dell’audit stampa un conteggio cosmetico errato; il report
contiene quindici risultati, verificati da `4000549715-command-34672-0`.
È conservato anche il tentativo iniziale dell’audit
`4000549424-command-9085-0`, fermato dal percorso relativo del payload
nella preparazione della fixture, senza coinvolgere il codice worker.

La ripresa `4000549781-command-39344-0` completa 69 coppie e cinque bundle,
poi esaurisce il limite heap predefinito del reader durante il catalogo
integrato. Le copie già valide rimangono originali. La sola chiusura usa
un limite heap di 4096 MiB e verifica nuovamente i file esistenti.
Questi tentativi riguardano la conservazione; i loro report e adapter
restano nei cataloghi e non qualificano la correttezza del prodotto.

## Verifica della consegna con il codec aggiornato

La base finale `e07d772` incorpora il controllo delle testate CBOR minime
pubblicato da un’altra chat. L’integrazione congelata esegue un solo nuovo
controllo completo, `4000550386-command-90070-0`: OK/STABLE/exit0, 415 test
più smoke su undici suite, nessun warning/style-warning, lint68/zero,
tracciabilità114/65/13/52 senza errori, 232 documenti/2044 link senza rotture,
self-test delle evidenze e dieci spike. I byte di execution, test e strumenti
worker rimangono quelli delle campagne qualificate; ASDF e indice conservano
sia i worker sia le aggiunte recovery e CBOR della primaria.

Il [record finale integrato](../../spikes/results/2026-10-09-writer-worker/check-consegna-processo.lisp)
e il [catalogo dei suoi spike](../../spikes/results/2026-10-09-writer-worker-final-integration/catalogo.lisp)
conservano gli originali. Cache di compilazione privata e limite heap
4096 MiB sono espliciti nell’argv; questo limite riguarda i processi di
verifica/conservazione. Il nuovo gate non estende le promesse delle misure
worker a throughput, latenza o scalabilità. La consegna mantiene tutte le
campagne precedenti e chiude separatamente i link e i cataloghi conclusivi.

La proiezione readonly finale conserva il tentativo
`4000550586-command-9874-0`, respinto da un’asserzione dell’adapter che
accettava soltanto il marker OK. SPK-07 usa il marker PASS, con exit0 e
sorgenti stabili. La proiezione corretta `4000550696-command-14941-0`
verifica i risultati effettivi e termina OK/STABLE/exit0; il controllo
completo non è stato ripetuto e nessun sorgente del prodotto è cambiato.

L’addendum C1 `4000550907-command-25363-0` è OK/STABLE/exit0:
venti file execution/test/tool identici, 3517 blob upstream conservati,
ASDF e indice con i soli inserimenti worker, 101 copie storiche integre.
I tre reader precedenti sono conservati: alias macOS var/private-var,
documento WT avanzato rispetto alla copia storica e differenza tra argv
make check e il reale env/make check-core. Le correzioni riguardano il reader;
non sono nuove prove del prodotto e non alterano i dati originari.
La consegna è sul ramo `codex/writer-worker` con base qualificata `e07d772`;
la primaria continua indipendentemente con le modifiche delle altre chat.
La successiva [integrazione nella base comune](writer-worker-integrazione.md)
conserva il controllo completo su `edb043b` e mantiene distinti gli ambiti
delle campagne originali e dell'assemblaggio aggiornato.

Il tentativo finale di conservazione `4000551045-command-31231-0` è
preservato: un helper del driver non era stato caricato. La ripresa definisce
il solo risolutore dei nomi flat e verifica le copie già presenti senza
sovrascriverle; non modifica il codice worker o i risultati delle campagne.
")))
