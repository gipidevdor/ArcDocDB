(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :GIT-DIFF :BASE-COMMIT
 "105ae0dd28a6ae3e7ee60ab1477815a49b1b350b" :ORIGINAL-COMMIT
 "6ecb4a40c8b2b985b25f0443baed315f302b7d65" :ARGV
 ("git" "show" "--format=" "6ecb4a40c8b2b985b25f0443baed315f302b7d65" "--"
  "src" "docs" "CHANGELOG.md" "arcdocdb.asd")
 :TEXT "diff --git a/CHANGELOG.md b/CHANGELOG.md
index 73a6bc0..b7d29d3 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,12 @@ non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).
 
 ### Aggiunto
 
+- Preparazione del nuovo segmento writer: preflight senza effetti, identità
+  readonly/append prima della write, header canonico durevole, rilettura esatta
+  e fsync del parent. Adattatore ACTIVE con prova obbligatoria e verifica del
+  registro CSN della vista; errori senza retry o risultati parziali. Decisione
+  EDIT, apertura/rotazione del server e qualifica C1 restano da integrare.
+
 - Controllore locale del numero di worker di calcolo: EWMA intere,
   crescita additiva, riduzione moltiplicativa e permanenza delle condizioni.
   Campioni e tempo iniettati, target distinto dai worker effettivi,
diff --git a/arcdocdb.asd b/arcdocdb.asd
index 805d52b..4b131aa 100644
--- a/arcdocdb.asd
+++ b/arcdocdb.asd
@@ -104,7 +104,10 @@
                              (:file \"active-scan\") (:file \"active-build\")
                              (:file \"active-preflight\") (:file \"active-read\")))
                (:module \"get-directory\" :serial t
-                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"read\"))))
+                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"read\")))
+               (:module \"active\" :serial t
+                :components ((:file \"package\") (:file \"types\") (:file \"preflight\")
+                             (:file \"prepare\") (:file \"source\"))))
   :in-order-to ((test-op (test-op \"arcdocdb/tests\"))))
 
 (defsystem \"arcdocdb/tests\"
diff --git a/docs/implementazione/README.md b/docs/implementazione/README.md
index f4c6041..0c63316 100644
--- a/docs/implementazione/README.md
+++ b/docs/implementazione/README.md
@@ -28,6 +28,7 @@ qualifica del motore completo.
 | Controllore del pool | [Target limitato, EWMA, AIMD e isteresi](controllore-pool.md) | [`src/scheduler/`](../../src/scheduler/) |
 | Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
 | Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
+| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
 | Lotti WAL | [Formazione, SEAL e group commit](wal.md) | [`src/wal/`](../../src/wal/) |
 | CSN dei lotti WAL | [Chiusura, token e risoluzione](wal-csn.md) | [`src/wal/csn.lisp`](../../src/wal/csn.lisp) |
 | Controller della Serie | [Pubblicazione FIFO, token e ritiro I/O](controller-serie.md) | [`src/series/`](../../src/series/) |
diff --git a/docs/implementazione/associazione-file.md b/docs/implementazione/associazione-file.md
index 7f46537..413e9df 100644
--- a/docs/implementazione/associazione-file.md
+++ b/docs/implementazione/associazione-file.md
@@ -76,6 +76,10 @@ Il nuovo percorso esplicito la verifica nel prodotto. La registrazione concreta
 di apertura/rotazione del server deve ancora adottarlo; il costruttore non apre
 automaticamente file e non rende sicuro un percorso che ignori questa prova.
 
+Il [preparatore del nuovo segmento writer](inizializzazione-active.md) richiede
+la prova prima della prima write e nell'adozione della sorgente ACTIVE,
+insieme a flush, rilettura dell'header e fsync del parent.
+
 ## Decisioni e stato delle evidenze
 
 | ID | Decisione composta | Esiti da coprire separatamente |
diff --git a/docs/implementazione/get-active.md b/docs/implementazione/get-active.md
index 30775c4..c66615b 100644
--- a/docs/implementazione/get-active.md
+++ b/docs/implementazione/get-active.md
@@ -30,6 +30,8 @@ attraverso le API ACTIVE del reader.
    versione del log e configurazione. Passando `:associazione-file prova`,
    verifica anche le due capacità effettive senza I/O. Omettere la prova conserva
    l'obbligo originario del caller; il solo header non lo assolve.
+   Il [preparatore del nuovo writer](inizializzazione-active.md) fornisce una
+   factory che richiede la prova, dopo header durevole e verifica della rilettura.
 3. Sul lotto OPEN, chiamare `verifica-capienza-get-attiva` **prima** del
    ponte WAL–CSN. La preflight verifica ring, contiguità, forma supportata,
    spazio segmento e budget; restituisce il numero PUT, senza assegnare CSN
diff --git a/docs/implementazione/inizializzazione-active.md b/docs/implementazione/inizializzazione-active.md
new file mode 100644
index 0000000..1fef0b8
--- /dev/null
+++ b/docs/implementazione/inizializzazione-active.md
@@ -0,0 +1,118 @@
+# Inizializzazione di un nuovo segmento writer
+
+`arcdocdb.active` prepara l'header di un nuovo `.seg.tmp` e collega il risultato
+al [resolver ACTIVE](get-active.md). Esegue la preparazione del file prevista da
+[ADR-0040](../adr/0040-manifest-a-record-unico.md#2-prepara-decidi-completa): header,
+flush del file e sincronizzazione della directory. L'**EDIT durevole** rimane
+la decisione che apre il segmento nel manifest; questo modulo non lo scrive.
+
+## API e responsabilità
+
+| API | Risultato |
+|---|---|
+| `prepara-segmento-attivo(view, input, append, directory, id, created-at, header, scratch, :version)` | log, capacità GET e prova di identità, dopo flush e rilettura |
+| `log-segmento-attivo-preparato(prepared)` | log canonico per costruire un solo controller della Serie |
+| `crea-sorgente-get-preparata(controller, lease, prepared, :limiti…)` | sorgente ACTIVE con associazione fisica obbligatoria, senza I/O |
+| `verifica-capienza-lettura(file, count)` | preflight del budget readonly, senza buffer, offset o syscall |
+
+Il controller riserva il namespace e l'identificativo, crea il nuovo append con
+`crea-temporaneo` (**O_EXCL**, mai riapertura di un segmento esistente), apre la
+capacità readonly e la directory parent autorevole. Le capacità e i due buffer
+sono esclusivi fino al ritorno della preparazione, eseguita nel pool I/O.
+`created-at` è fornito dal chiamante come u64; il modulo non legge un orologio.
+
+L'associazione dei due file è [verificata tramite device/inode](associazione-file.md).
+La directory deve essere il parent effettivo del nome riservato: è una
+precondizione del controller, non deducibile dai due inode. I tre file devono
+usare la medesima istanza di backend, compreso `nil` per il percorso nativo.
+I callback restano fidati e rispettano ownership e stabilità dei buffer.
+
+## Ordine degli effetti
+
+1. Verificare formato v1/v2, ID positivo u32, due range di almeno 64 byte,
+   assenza di alias, capacità aperte, budget di lettura/append e frontiere
+   append scritta/durevole entrambe zero. Nessun effetto I/O o sui buffer.
+2. Verificare l'identità fisica readonly/append e creare il log privato.
+   Un callback `identity` assente o un'identità diversa impedisce la scrittura.
+3. Preparare l'header canonico **writer**, con Serie, ID, versione, timestamp,
+   riservati zero e CRC. Scrivere esattamente 64 byte nel nuovo append.
+4. Sincronizzare il file; verificare il ritorno a 64.
+5. Rileggere con `crea-segmento-get` attraverso la capacità readonly associata:
+   verificare header/CRC/Serie/ID/formato. Confrontare tutti i 64 byte con quelli
+   scritti, inclusi timestamp, origine e riservati.
+6. Sincronizzare la directory parent. Ricontrollare apertura delle capacità
+   e frontiere del file entrambe a 64, prima di restituire il risultato.
+7. Il writer esegue la decisione EDIT e il completamento previsti da ADR-0040.
+   Solo dopo questa decisione ammette traffico sul nuovo ACTIVE.
+
+Il controller usa il log restituito, root iniziale `nil` e `next-offset = 64`.
+Con la sua lease, `crea-sorgente-get-preparata` confronta il log effettivo e il
+registro CSN dell'Archivio con quello degli snapshot nella vista GET; richiede
+il file ancora fermo al solo header. La factory ACTIVE esistente riceve sempre
+la prova di identità, senza syscall, mutex o letture di H.
+
+Il caller costruisce **un solo controller per log** e impedisce altri writer,
+close/dup2 concorrenti e modifiche esterne. Il risultato non è un token di
+unicità del catalogo. Gli header non sono record WAL, non ricevono CSN e non
+attestano il commit di un documento. La durabilità del file e della directory
+non sostituisce la decisione di apertura dell'EDIT.
+
+## Guasti e cleanup
+
+Configurazione, range, alias, capienza e file già iniziato sono rifiutati
+prima di fstat/write/flush. I buffer troppo piccoli non producono header
+parziali. Con formati validi, fstat fallita o backend non verificabile precede
+la preparazione dell'header.
+
+Append e flush falliti applicano il normale stato `FAULTED` del
+[confine I/O](io.md). Read/CRC/rilettura discordante o fsync della directory
+falliti impediscono il ritorno del risultato. Le condizioni originali propagano:
+nessun handler generico, retry degli errori, troncamento o rollback.
+
+Il caller conserva la proprietà delle capacità su ogni uscita. Gestisce
+quarantena e cleanup al proprio confine, senza ignorare l'errore o aprire il
+segmento nel catalogo. Dopo progresso positivo, ripetere la preparazione sullo
+stesso file viene rifiutato perché la posizione non è più zero; write/flush
+guasti sono inoltre terminali. Un crash lascia un temporaneo da riconciliare
+secondo [manifest e inventario](inventario.md), non autorizza a eliminarlo senza
+la prova richiesta. Il modulo non elimina, rinomina o chiude file.
+
+| Rifiuto locale | Condizione / reason |
+|---|---|
+| ID non rappresentabile dal percorso ACTIVE | `invalid-argument / :active-initialization-id` |
+| buffer alias | `invalid-argument / :active-initialization-alias` |
+| backend diversi | `invalid-argument / :active-initialization-backend` |
+| append non vuoto o avanzato dopo preparazione | `invalid-argument / :active-initialization-started` |
+| controller usa altro log | `invalid-argument / :active-initialization-log` |
+| registro CSN diverso | `invalid-argument / :active-initialization-csn` |
+| header riletto diverso | `corruption-detected / :active-initialization-readback` |
+| ritorni/frontiere interni impossibili | `invariant-violation / :active-initialization-*` |
+
+## Costi e decisioni da qualificare
+
+Al massimo due fstat, due flush e un range write/read di 64 byte ciascuno.
+Short I/O positivo usa al massimo 64 passi per range; gli errori non vengono
+ritentati. Il confronto ha 64 iterazioni massime. Due buffer del caller,
+almeno 128 byte totali, e pochi oggetti di apertura; il risultato non trattiene
+buffer o liste di record. GET e commit dei documenti non aggiungono operazioni
+per questa preparazione. Non sono misure di latenza o allocazione.
+
+| ID | Decisione | Casi da verificare |
+|---|---|---|
+| AIN-D01 | header/scratch/identità non alias | ogni alias separato; buffer distinti |
+| AIN-D02 | backend readonly = append = directory | ogni associazione diversa; nativo; backend identico |
+| AIN-D03 | append scritto = 0 e durevole = 0 | ciascuna frontiera non zero; entrambe zero |
+| AIN-D04 | post-I/O scritto = 64 e durevole = 64 | ciascuna frontiera diversa; entrambe esatte |
+| AIN-D05 | uguaglianza dei 64 byte riletti | primo/centrale/ultimo byte, timestamp, CRC, origine, riservati |
+| AIN-D06 | frontiere ancora a 64 all'adozione | append avanzato, frontiera durevole diversa, capacità invariata |
+| AIN-D07 | log del controller identico al preparato | altro oggetto log con stessi numeri; log canonico |
+| AIN-D08 | registro CSN della Serie identico a quello della vista | altro Archivio; registro canonico |
+
+Qualifica C1, casi funzionali, fault injection in ciascun passo, stress concorrente
+e misure dinamiche restano aperti. Le letture statiche dell'autore non sono
+revisione indipendente e non promuovono i requisiti del motore.
+[Catalogo locale](../../spikes/results/2026-10-13-active-init/catalogo.lisp).
+
+Resta da collegare il preparatore all'esecutore di apertura/rotazione e alla
+decisione EDIT del catalogo. I limiti prepared/OUTCOME del resolver ACTIVE
+ordinario e la pubblicazione dell'indice concreto restano quelli documentati.
diff --git a/docs/implementazione/io.md b/docs/implementazione/io.md
index a1b3490..e2a938e 100644
--- a/docs/implementazione/io.md
+++ b/docs/implementazione/io.md
@@ -21,6 +21,7 @@ Il pool e il motore delle transazioni restano moduli da integrare.
 | `stato-file` | open, faulted o closed |
 | `mode-file` | modo immutabile input, append o directory; nessun descrittore esposto |
 | `verifica-capienza-append` | verifica totale del gruppo e massimo chunk prima della prima write |
+| `verifica-capienza-lettura` | verifica modo/stato e numero di byte ammesso prima di effetti su altri file |
 | `associa-file`, `verifica-associazione-file` | [prova di identità fisica](associazione-file.md) readonly/append, creata nel pool I/O e verificata senza syscall |
 | `posizione-scritta`, `posizione-durevole` | frontiere del nuovo file, osservate dal proprietario |
 
diff --git a/src/active/package.lisp b/src/active/package.lisp
new file mode 100644
index 0000000..fbd3a32
--- /dev/null
+++ b/src/active/package.lisp
@@ -0,0 +1,18 @@
+;;; OWNER: il controller prepara un nuovo temporaneo nel pool I/O, prima del catalogo.
+;;; SHARED: nessuna pubblicazione, token CSN o scrittura condivisa tra Serie.
+;;; REQ: REQ-STO-003 REQ-FOR-001 REQ-FOR-002 REQ-AFF-001 REQ-AFF-008
+(defpackage #:arcdocdb.active
+  (:use #:cl)
+  (:import-from #:arcdocdb.binary #:octets #:u64 #:check-range)
+  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation #:corruption-detected)
+  (:import-from #:arcdocdb.record #:format-limits)
+  (:import-from #:arcdocdb.storage.format #:+segment-header-bytes+ #:scrivi-header-segmento)
+  (:import-from #:arcdocdb.io #:file-io #:associazione-file #:associa-file #:verifica-associazione-file
+                #:verifica-capienza-lettura #:verifica-capienza-append #:append-esatto #:durable-flush
+                #:posizione-scritta #:posizione-durevole)
+  (:import-from #:arcdocdb.get #:vista-get-serie #:segmento-get #:crea-segmento-get)
+  (:import-from #:arcdocdb.wal #:log-io #:crea-log-io)
+  (:import-from #:arcdocdb.series #:controllore-serie)
+  (:import-from #:arcdocdb.get.resolver #:sorgente-get-attiva #:crea-sorgente-get-attiva)
+  (:export #:segmento-attivo-preparato #:prepara-segmento-attivo
+           #:log-segmento-attivo-preparato #:crea-sorgente-get-preparata))
diff --git a/src/active/preflight.lisp b/src/active/preflight.lisp
new file mode 100644
index 0000000..81802dc
--- /dev/null
+++ b/src/active/preflight.lisp
@@ -0,0 +1,40 @@
+;;; OWNER: un compito esclusivo prima del primo byte scritto nel temporaneo.
+;;; SHARED: sole letture di metadati locali; bridge ai controlli interni I/O, senza FD esportati.
+(in-package #:arcdocdb.active)
+(declaim (optimize (safety 3) (speed 2) (debug 2)))
+
+;;; REQ: REQ-AFF-008 REQ-FOR-001 REQ-STO-003
+(declaim (ftype (function (vista-get-serie file-io file-io file-io u64 integer octets octets) null)
+                verifica-preparazione-attiva))
+(defun verifica-preparazione-attiva (view input append directory segment-id version header scratch)
+  \"Pre: namespace riservato, capacità esclusive e buffer privati. Post: preflight senza effetti I/O.
+ID positivo u32, formato noto, due range da 64 byte, nessun alias; append scritto/durevole a zero.
+INVALID-ARGUMENT/RESOURCE-EXHAUSTED/IO-FAULT/UNSUPPORTED-FORMAT prima di header e syscall.\"
+  (format-limits version)
+  (unless (<= 1 segment-id #xffffffff)
+    (error 'invalid-argument :reason :active-initialization-id))
+  (check-range header 0 +segment-header-bytes+) (check-range scratch 0 +segment-header-bytes+)
+  (when (or (eq header scratch) (eq header (arcdocdb.get::vista-get-serie-identity view))
+            (eq scratch (arcdocdb.get::vista-get-serie-identity view)))
+    (error 'invalid-argument :reason :active-initialization-alias))
+  (verifica-capienza-lettura input +segment-header-bytes+)
+  (verifica-capienza-append append +segment-header-bytes+ +segment-header-bytes+)
+  (arcdocdb.io::esigi-aperto directory :directory)
+  (unless (and (eq (arcdocdb.io::file-backend input) (arcdocdb.io::file-backend append))
+               (eq (arcdocdb.io::file-backend input) (arcdocdb.io::file-backend directory)))
+    (error 'invalid-argument :reason :active-initialization-backend))
+  (unless (and (zerop (posizione-scritta append)) (zerop (posizione-durevole append)))
+    (error 'invalid-argument :reason :active-initialization-started))
+  nil)
+
+;;; REQ: REQ-AFF-001 REQ-STO-003
+(declaim (ftype (function (file-io file-io associazione-file) null) verifica-frontiera-iniziale))
+(defun verifica-frontiera-iniziale (input append association)
+  \"Pre: capacità esclusive e prova dal pool I/O. Post: stesse capacità aperte e solo header durevole.
+IO-FAULT/INVALID-ARGUMENT per prova; INVARIANT-VIOLATION per frontiere diverse da 64.
+Non verifica il catalogo, un eventuale SEAL o la presenza di altre capacità esterne.\"
+  (verifica-associazione-file association input append)
+  (unless (and (= (posizione-scritta append) +segment-header-bytes+)
+               (= (posizione-durevole append) +segment-header-bytes+))
+    (error 'invariant-violation :reason :active-initialization-frontier))
+  nil)
diff --git a/src/active/prepare.lisp b/src/active/prepare.lisp
new file mode 100644
index 0000000..b2a326e
--- /dev/null
+++ b/src/active/prepare.lisp
@@ -0,0 +1,42 @@
+;;; OWNER: un compito del pool I/O; header stabile e scratch esclusivo fino al ritorno.
+;;; SHARED: nessun indice/catalogo pubblicato; cleanup delle capacità resta al controller.
+(in-package #:arcdocdb.active)
+(declaim (optimize (safety 3) (speed 2) (debug 2)))
+
+;;; REQ: REQ-FOR-001 REQ-FOR-002 REQ-AFF-002
+(declaim (ftype (function (octets octets) null) verifica-rilettura-header))
+(defun verifica-rilettura-header (header scratch)
+  \"Pre: due range completi stabili, dopo lettura/CRC. Post: uguaglianza esatta dei 64 byte.
+CORRUPTION-DETECTED per differenza, inclusi created-at, versione e riservati; nessuna mutazione.\"
+  (check-range header 0 +segment-header-bytes+) (check-range scratch 0 +segment-header-bytes+)
+  (unless (loop for i below +segment-header-bytes+ always (= (aref header i) (aref scratch i)))
+    (error 'corruption-detected :reason :active-initialization-readback :offset 0))
+  nil)
+
+;;; REQ: REQ-STO-003 REQ-FOR-001 REQ-FOR-002 REQ-AFF-001 REQ-AFF-002 REQ-AFF-008
+(declaim (ftype (function (vista-get-serie file-io file-io file-io u64 u64 octets octets
+                         &key (:version integer)) segmento-attivo-preparato) prepara-segmento-attivo))
+(defun prepara-segmento-attivo (view input append directory segment-id created-at header scratch
+                               &key (version 2))
+  \"Pre: pool I/O, temporaneo nuovo O_EXCL, namespace riservato; DIRECTORY è il parent autorevole.
+Post: header canonico scritto, file sincronizzato, riletto/CRC/identità/byte verificati, fsync parent.
+Restituisce il wrapper completo; nessun EDIT, rinomina, pubblicazione o conferma al client.
+Guasti tipizzati propagati senza retry/rollback/close; nessun risultato parziale. Il caller fa cleanup.
+Punto di atomicità dell'apertura è il futuro EDIT durevole, non questi flush di preparazione.\"
+  (verifica-preparazione-attiva view input append directory segment-id version header scratch)
+  (let* ((association (associa-file input append))
+         (log (crea-log-io append :segment segment-id :version version)))
+    (unless (= (scrivi-header-segmento header 0 (arcdocdb.get::vista-get-serie-identity view)
+                                      segment-id created-at :version version) +segment-header-bytes+)
+      (error 'invariant-violation :reason :active-initialization-header))
+    (unless (= (append-esatto append header 0 +segment-header-bytes+) +segment-header-bytes+)
+      (error 'invariant-violation :reason :active-initialization-write))
+    (unless (= (durable-flush append) +segment-header-bytes+)
+      (error 'invariant-violation :reason :active-initialization-flush))
+    (let ((segment (crea-segmento-get view input segment-id scratch)))
+      (verifica-rilettura-header header scratch)
+      (unless (zerop (durable-flush directory))
+        (error 'invariant-violation :reason :active-initialization-directory))
+      (arcdocdb.io::esigi-aperto directory :directory)
+      (verifica-frontiera-iniziale input append association)
+      (%make-segmento-attivo-preparato log segment association))))
diff --git a/src/active/source.lisp b/src/active/source.lisp
new file mode 100644
index 0000000..56f258d
--- /dev/null
+++ b/src/active/source.lisp
@@ -0,0 +1,45 @@
+;;; OWNER: writer con lease adotta le capacità già preparate, fuori dal pool I/O.
+;;; SHARED: nessuna pubblicazione o syscall; obblighi del catalogo restano al controller.
+(in-package #:arcdocdb.active)
+(declaim (optimize (safety 3) (speed 2) (debug 2)))
+
+;;; REQ: REQ-MVC-008 REQ-FOR-001
+(declaim (ftype (function (controllore-serie segmento-attivo-preparato) null)
+                verifica-registro-preparato))
+(defun verifica-registro-preparato (controller prepared)
+  \"Pre: capacità complete, legami immutabili. Post: writer e snapshot usano lo stesso registro CSN.
+INVALID-ARGUMENT per altro Archivio; nessuna lettura di frontiere, mutex o modifica del registro.\"
+  (let* ((view (arcdocdb.get::segmento-get-owner (segmento-attivo-preparato-segment prepared)))
+         (scope (arcdocdb.get::vista-get-serie-scope view))
+         (snapshots (arcdocdb.get::ambito-get-snapshots scope)))
+    (unless (eq (arcdocdb.series::controllore-serie-registry controller)
+                (arcdocdb.mvcc::registro-snapshot-csns snapshots))
+      (error 'invalid-argument :reason :active-initialization-csn)))
+  nil)
+
+;;; REQ: REQ-FOR-001 REQ-IDX-001 REQ-WAL-006 REQ-MVC-008 REQ-AFF-008
+(declaim (ftype (function (controllore-serie t segmento-attivo-preparato
+                         &key (:max-pages integer) (:max-puts integer) (:batch-records integer)
+                              (:batch-bytes integer) (:budget-payload integer)) sorgente-get-attiva)
+                crea-sorgente-get-preparata))
+(defun crea-sorgente-get-preparata (controller lease prepared
+                                  &key (max-pages 65536) (max-puts 1048576) (batch-records 65536)
+                                       (batch-bytes 67108864) (budget-payload 67108864))
+  \"Pre: lease, controller unico sul log preparato, stesso registro CSN, root nil e next-offset 64.
+Post: sorgente ACTIVE con prova obbligatoria sulle capacità effettive, senza syscall/pubblicazione.
+Errori di factory/lease/salute propagati; INVALID-ARGUMENT per altro log o file già avanzato.
+Il controller ha già ottenuto la decisione del catalogo prima di ammettere traffico.\"
+  (arcdocdb.series::%check-owner controller lease)
+  (arcdocdb.series::%require-healthy controller)
+  (unless (eq (arcdocdb.series::controllore-serie-log controller)
+              (segmento-attivo-preparato-log prepared))
+    (error 'invalid-argument :reason :active-initialization-log))
+  (verifica-registro-preparato controller prepared)
+  (let ((file (arcdocdb.wal::log-io-file (segmento-attivo-preparato-log prepared))))
+    (unless (and (= (posizione-scritta file) +segment-header-bytes+)
+                 (= (posizione-durevole file) +segment-header-bytes+))
+      (error 'invalid-argument :reason :active-initialization-started)))
+  (crea-sorgente-get-attiva controller lease (segmento-attivo-preparato-segment prepared)
+                          :max-pages max-pages :max-puts max-puts :batch-records batch-records
+                          :batch-bytes batch-bytes :budget-payload budget-payload
+                          :associazione-file (segmento-attivo-preparato-association prepared)))
diff --git a/src/active/types.lisp b/src/active/types.lisp
new file mode 100644
index 0000000..91238be
--- /dev/null
+++ b/src/active/types.lisp
@@ -0,0 +1,21 @@
+;;; OWNER: I/O costruisce il risultato completo; il controller adotta un solo log.
+;;; SHARED: wrapper immutabile prima dei compiti, senza buffer o puntatori nativi.
+(in-package #:arcdocdb.active)
+(declaim (optimize (safety 3) (speed 2) (debug 2)))
+
+;;; REQ: REQ-FOR-001 REQ-AFF-001 REQ-STO-003
+(defstruct (segmento-attivo-preparato
+             (:constructor %make-segmento-attivo-preparato (log segment association)) (:copier nil))
+  \"Pre: nuovo header writer durevole, riletto e uguale; directory sincronizzata dal proprietario.
+Post: tre riferimenti immutabili, senza trattenere buffer; nessun EDIT o ACTIVE pubblicato.
+Il caller conserva le capacità e adotta un solo controller per log, dopo la decisione del catalogo.\"
+  (log nil :type log-io :read-only t)
+  (segment nil :type segmento-get :read-only t)
+  (association nil :type associazione-file :read-only t))
+
+;;; REQ: REQ-WAL-002 REQ-AFF-001
+(declaim (ftype (function (segmento-attivo-preparato) log-io) log-segmento-attivo-preparato))
+(defun log-segmento-attivo-preparato (prepared)
+  \"Pre: risultato completo, capacità ancora possedute. Post: log canonico per un solo controller.
+Non certifica salute corrente, pubblicazione nel catalogo o durata dei reader.\"
+  (segmento-attivo-preparato-log prepared))
diff --git a/src/io/package.lisp b/src/io/package.lisp
index 93d47c8..bdcd811 100644
--- a/src/io/package.lisp
+++ b/src/io/package.lisp
@@ -8,4 +8,4 @@
            #:associazione-file #:associa-file #:verifica-associazione-file
            #:apri-lettura #:crea-temporaneo #:apri-directory #:chiudi
            #:leggi-esatto #:append-esatto #:durable-flush #:mode-file #:verifica-capienza-append
-           #:stato-file #:posizione-scritta #:posizione-durevole))
+           #:stato-file #:posizione-scritta #:posizione-durevole #:verifica-capienza-lettura))
diff --git a/src/io/transfer.lisp b/src/io/transfer.lisp
index 93acbd6..39ad572 100644
--- a/src/io/transfer.lisp
+++ b/src/io/transfer.lisp
@@ -15,6 +15,17 @@ INVALID-ARGUMENT/RESOURCE-EXHAUSTED prima di qualsiasi syscall.\"
       (error 'resource-exhausted :reason :io-byte-budget :offset start))
     count))
 
+;;; REQ: REQ-AFF-008 REQ-AFF-002
+(declaim (ftype (function (file-io index) null) verifica-capienza-lettura))
+(defun verifica-capienza-lettura (file count)
+  \"Pre: capacità readonly posseduta. Post: range di COUNT byte ammesso, senza syscall.
+IO-FAULT/INVALID-ARGUMENT per capacità; RESOURCE-EXHAUSTED per limite trasferimento.
+Non verifica buffer, offset, disponibilità fisica dei byte o integrità dei dati.\"
+  (esigi-aperto file :input)
+  (when (> count (file-max-transfer file))
+    (error 'resource-exhausted :reason :io-byte-budget))
+  nil)
+
 ;;; REQ: REQ-AFF-001 REQ-AFF-008
 (declaim (ftype (function (file-io t index keyword index) index) progresso))
 (defun progresso (file result remaining operation transferred)
"
 :QUALIFICATION NIL :LIMITS
 (:SOURCE-RECONSTRUCTION-ONLY :EXCLUDES-EVIDENCE-ARTIFACTS
  :NO-PRODUCT-FUNCTION-EXECUTION))
