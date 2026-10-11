(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-SOURCE-BUNDLE :VERSION "code-tested-by-merged-build"
 :SOURCES
 ((:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/package.lisp")
   :BYTES 1181 :SHA256 "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30" :GIT-BLOB
   "dcdf82cb17b20f6d4e96cc94d3f1522520c3a236" :TEXT
   ";;;; Esecuzione locale: coda bounded e lease esplicita del singolo writer.
;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.execution
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation)
  (:export #:coda-writer #:crea-coda-writer #:accoda-messaggio
           #:acquisisci-writer #:preleva-messaggi #:rilascia-writer
           #:writer-programmabile #:crea-writer-programmabile #:indice-routing-writer #:accoda-lavoro-writer
           #:inizia-tratto-writer #:preleva-lavori-writer #:termina-tratto-writer
           #:lista-writer-pronti #:crea-lista-writer-pronti
           #:pubblica-writer-pronto #:preleva-writer-pronto #:ricircola-writer-pronto
           #:contesto-worker-writer #:crea-contesto-worker-writer
           #:stato-worker-writer #:writer-worker-writer #:errore-worker-writer #:prendi-writer-worker
           #:inizia-tratto-worker #:preleva-lavori-worker #:conferma-lavori-worker
           #:termina-tratto-worker #:ricircola-worker
           #:adotta-writer-worker #:cede-writer-worker))
")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256 "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a" :GIT-BLOB
   "34c8add62a6df92446be5234ef013893ebcf6879" :TEXT
   ";;;; Consegna locale del writer: la guard del ring protegge anche lo scheduling.
;;; OWNER: ogni wrapper e la sua coda privata appartengono a una sola Serie.
;;; SHARED: stato/count sotto la stessa guard; owner/generation con protocollo lease.
;;; Nessuno stato fra Serie: :schedule trasferisce un obbligo al chiamante.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defconstant +max-writer-routing-index+ 65535)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defstruct (writer-programmabile (:constructor %make-writer-programmabile (queue routing-index))
                                (:copier nil))
  \"Pre: coda privata, mai esposta né usata tramite le API basse. Post: writer IDLE.
Le API trasferiscono obblighi :SCHEDULE, non creano thread né inviano notifiche.
Routing-index read-only non è una lease e non identifica da solo un Archivio.\"
  (queue (error 'invariant-violation :reason :writer-scheduling)
         :type coda-writer :read-only t)
  (state :idle :type (member :idle :ready :running))
  (routing-index nil :type (or null (integer 0 65535)) :read-only t))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile) (or null (integer 0 65535))) indice-routing-writer))
(defun indice-routing-writer (writer)
  \"Pre: writer valido. Post: ordinal immutabile fissato all'avvio, o NIL legacy.
Nessuna acquisizione o mutazione; l'indice non prova la membership in un registro.\"
  (writer-programmabile-routing-index writer))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer) null) %check-writer-inattivo))
(defun %check-writer-inattivo (queue)
  \"Pre: guard posseduta, stato IDLE o READY. Post: nessuna lease e quota zero.
INVARIANT-VIOLATION per guard, owner o quota incompatibili con il passaggio.\"
  (unless (eq (coda-writer-guard queue) sb-thread:*current-thread*)
    (error 'invariant-violation :reason :writer-guard))
  (unless (null (coda-writer-owner queue))
    (error 'invariant-violation :reason :writer-scheduling))
  (unless (zerop (coda-writer-extracted queue))
    (error 'invariant-violation :reason :writer-scheduling))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile) null) %check-programmabile))
(defun %check-programmabile (writer)
  \"Pre: guard della coda privata posseduta. Post: ring e stato/owner coerenti.
INVARIANT-VIOLATION per guard errata o stato che non rappresenta il lavoro.\"
  (let* ((queue (writer-programmabile-queue writer))
         (count (coda-writer-count queue)) (owner (coda-writer-owner queue)))
    (unless (eq (coda-writer-guard queue) sb-thread:*current-thread*)
      (error 'invariant-violation :reason :writer-guard))
    (%check-queue queue)
    (case (writer-programmabile-state writer)
      (:idle
       (unless (zerop count) (error 'invariant-violation :reason :writer-scheduling))
       (%check-writer-inattivo queue))
      (:ready
       (unless (plusp count) (error 'invariant-violation :reason :writer-scheduling))
       (%check-writer-inattivo queue))
      (:running
       (unless owner (error 'invariant-violation :reason :writer-scheduling)))
      (otherwise (error 'invariant-violation :reason :writer-scheduling))))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (&key (:capacity t) (:quantum t) (:routing-index t)) writer-programmabile)
                crea-writer-programmabile))
(defun crea-writer-programmabile (&key (capacity 1024) (quantum 64) routing-index)
  \"Pre: capacity/quantum nei limiti di CREA-CODA-WRITER. Post: wrapper IDLE
con ring esclusivo preallocato; routing-index NIL oppure ordinal 0..65535.
INVALID-ARGUMENT per configurazione errata, prima di allocare la coda.\"
  (unless (or (null routing-index)
              (typep routing-index `(integer 0 ,+max-writer-routing-index+)))
    (error 'invalid-argument :reason :writer-configuration))
  (let* ((queue (crea-coda-writer :capacity capacity :quantum quantum))
         (writer (%make-writer-programmabile queue routing-index)) (thread (%acquisisci-guard queue)))
    (unwind-protect (progn (%check-programmabile writer) writer)
      (%rilascia-guard queue thread))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile t)
                         (values index (member :schedule :queued) &optional))
                accoda-lavoro-writer))
(defun accoda-lavoro-writer (writer message)
  \"Pre: payload posseduto dal chiamante. Post: accettazione FIFO; :SCHEDULE solo
su IDLE→READY, :QUEUED se già READY/RUNNING. Il chiamante conserva ed esegue una
sola volta l'obbligo :SCHEDULE; un retry della notifica non ripete l'accettazione.
RESOURCE-EXHAUSTED full/busy prima dell'accettazione; invarianti impongono fail-stop.\"
  (let* ((queue (writer-programmabile-queue writer)) (thread (%acquisisci-guard queue)))
    (unwind-protect
         (progn
           (%check-programmabile writer)
           (let* ((schedule (eq (writer-programmabile-state writer) :idle))
                  (count (%accoda-sotto-guard queue message)))
             (when schedule (setf (writer-programmabile-state writer) :ready))
             (%check-programmabile writer)
             (values count (if schedule :schedule :queued))))
      (%rilascia-guard queue thread))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile) index) inizia-tratto-writer))
(defun inizia-tratto-writer (writer)
  \"Pre: compito pronto assegnato dal chiamante. Post: READY→RUNNING con lease
del thread corrente; nessun messaggio estratto. RESOURCE-EXHAUSTED conserva lo
stato: busy richiede retry del compito; not-ready rifiuta un'assegnazione non
eleggibile/duplicata; generation è esaurimento permanente, senza wrap.\"
  (let* ((queue (writer-programmabile-queue writer)) (thread (%acquisisci-guard queue)))
    (unwind-protect
         (progn
           (%check-programmabile writer)
           (unless (eq (writer-programmabile-state writer) :ready)
             (error 'resource-exhausted :reason :writer-not-ready))
           (let ((lease (acquisisci-writer queue)))
             (setf (writer-programmabile-state writer) :running)
             (%check-programmabile writer)
             lease))
      (%rilascia-guard queue thread))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile t t t t)
                         (values index (member :messages :empty :yield) &optional))
                preleva-lavori-writer))
(defun preleva-lavori-writer (writer lease target start end)
  \"Pre: lease corrente del tratto e target privato. Post: prelievo FIFO bounded
e quota cumulativa come PRELEVA-MESSAGGI; le medesime condizioni al rifiuto.
La lease impedisce una fine-tratto concorrente; la coda interna resta privata.\"
  (preleva-messaggi (writer-programmabile-queue writer) lease target start end))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile t) (member :schedule :idle))
                termina-tratto-writer))
(defun termina-tratto-writer (writer lease)
  \"Pre: messaggi estratti elaborati, lease corrente. Post: quota/gettone rilasciati
e READY/:SCHEDULE se resta lavoro, IDLE/:IDLE se vuoto, sotto la guard del ring.
Il chiamante conserva l'obbligo :SCHEDULE. Busy conserva lease e stato: ritentare
solo il termine, senza rielaborare payload. INVALID-ARGUMENT lease; invarianti
impongono fail-stop. Nessuna notifica o attesa; nessun cambiamento durevole.\"
  (let ((queue (writer-programmabile-queue writer)))
    (%check-lease queue lease)
    (let ((thread (%acquisisci-guard queue)))
      (unwind-protect
           (progn
             (%check-programmabile writer)
             (let ((pending (plusp (coda-writer-count queue))))
               (rilascia-writer queue lease)
               (setf (writer-programmabile-state writer) (if pending :ready :idle))
               (%check-programmabile writer)
               (if pending :schedule :idle)))
        (%rilascia-guard queue thread)))))
")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256 "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7" :GIT-BLOB
   "d0316128bae48e4251a519d7daab25dbaf52f031" :TEXT
   ";;;; Collegamento locale preallocato, caricato dopo execution e il controller Serie.
;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.execution.series
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation #:error-reason)
  (:import-from #:arcdocdb.execution #:contesto-worker-writer #:writer-programmabile
                #:stato-worker-writer #:writer-worker-writer #:inizia-tratto-worker
                #:preleva-lavori-worker #:conferma-lavori-worker #:termina-tratto-worker)
  (:import-from #:arcdocdb.series #:controllore-serie #:acquisisci-controllore-serie
                #:rilascia-controllore-serie)
  (:export #:collegamento-worker-serie #:crea-collegamento-worker-serie
           #:registro-worker-serie #:crea-registro-worker-serie
           #:tabella-worker-serie #:crea-tabella-worker-serie #:collega-writer-worker-serie
           #:inizia-worker-serie #:lease-worker-serie #:preleva-worker-serie
           #:conferma-worker-serie #:termina-worker-serie
           #:stato-worker-serie #:errore-worker-serie))
")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256 "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1" :GIT-BLOB
   "e350df4e2fdc2f651ffbdb136bdbb266ccafcb1c" :TEXT
   ";;;; Routing per ordinal immutabile; nessun hash o ricerca nel percorso caldo.
;;; OWNER: registro costruito prima della pubblicazione; tabella del solo worker.
;;; SHARED: registro read-only tra worker, letto una volta per tratto (ADR-0045 §8).
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defconstant +max-worker-series-routes+ (1+ arcdocdb.execution::+max-writer-routing-index+))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (registro-worker-serie
             (:constructor %make-registro-worker-serie (writers controllers)) (:copier nil))
  \"Pre: vettori privati, mapping bijettivo e ordinal writer uguale allo slot.
Post: registro immutabile; nessun accesso allo stato vivo o alle lease della Serie.\"
  (writers #() :type simple-vector :read-only t)
  (controllers #() :type simple-vector :read-only t))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (tabella-worker-serie
             (:constructor %make-tabella-worker-serie (context registry links)) (:copier nil))
  \"Pre: contesto owner-only e un binding per ogni slot del registro.
Post: tabella preallocata, non migrabile; collegamenti mutabili solo sul worker.\"
  (context nil :type contesto-worker-writer :read-only t)
  (registry nil :type registro-worker-serie :read-only t)
  (links #() :type simple-vector :read-only t))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (registro-worker-serie) index) %routing-size))
(defun %routing-size (registry)
  \"Pre: registro costruito e pubblicato immutabile. Post: dimensione valida.
INVARIANT-VIOLATION per shape corrotta; non scansiona o muta gli elementi.\"
  (let ((size (length (registro-worker-serie-writers registry))))
    (unless (<= 1 size +max-worker-series-routes+)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (= size (length (registro-worker-serie-controllers registry)))
      (error 'invariant-violation :reason :worker-serie-routing))
    size))
")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256 "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d" :GIT-BLOB
   "6fbe5e4720187be3bcada2dcc9fc40026267da07" :TEXT
   ";;;; Costruzione bounded all'avvio; input copiati, controller unici per EQ.
;;; OWNER: caller esclusivo fino alla pubblicazione; nessun writer/Serie mutato.
;;; SHARED: hash temporaneo solo all'avvio, mai pubblicato o letto dal percorso caldo.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) index) %routing-input-size))
(defun %routing-input-size (writers controllers)
  \"Pre: input caller esclusivi. Post: SIMPLE-VECTOR pari, dimensione 1..65536.
INVALID-ARGUMENT shape/budget prima di copie o accessi agli elementi.\"
  (unless (typep writers 'simple-vector)
    (error 'invalid-argument :reason :worker-serie-routing-configuration))
  (unless (typep controllers 'simple-vector)
    (error 'invalid-argument :reason :worker-serie-routing-configuration))
  (let ((size (length writers)))
    (unless (<= 1 size +max-worker-series-routes+)
      (error 'invalid-argument :reason :worker-serie-routing-configuration))
    (unless (= size (length controllers))
      (error 'invalid-argument :reason :worker-serie-routing-configuration))
    size))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t index hash-table) null) %routing-input-entry))
(defun %routing-input-entry (writer controller ordinal seen)
  \"Pre: ordinal nel budget, hash EQ temporaneo. Post: coppia valida, Serie unica.
INVALID-ARGUMENT entry/ordinal/duplicato prima della pubblicazione; hash solo startup.\"
  (unless (typep writer 'writer-programmabile)
    (error 'invalid-argument :reason :worker-serie-routing-binding))
  (unless (eql (arcdocdb.execution:indice-routing-writer writer) ordinal)
    (error 'invalid-argument :reason :worker-serie-routing-binding))
  (unless (typep controller 'controllore-serie)
    (error 'invalid-argument :reason :worker-serie-routing-binding))
  (when (gethash controller seen)
    (error 'invalid-argument :reason :worker-serie-routing-binding))
  (setf (gethash controller seen) t)
  nil)

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) registro-worker-serie) crea-registro-worker-serie))
(defun crea-registro-worker-serie (writers controllers)
  \"Pre: avvio, input esclusivi, ordinal densi fissati dal caller senza contatore globale.
Post: mapping copiato, un writer/Serie per slot; INVALID-ARGUMENT shape/entry.
Nessuna lease o stato vivo letto; non ammette inserimenti o riuso degli ordinal.\"
  (let* ((size (%routing-input-size writers controllers))
         (own-writers (copy-seq writers)) (own-controllers (copy-seq controllers))
         (seen (make-hash-table :test 'eq :size size)))
    (dotimes (i size)
      (%routing-input-entry (svref own-writers i) (svref own-controllers i) i seen))
    (let ((registry (%make-registro-worker-serie own-writers own-controllers)))
      (unless (= (%routing-size registry) size)
        (error 'invariant-violation :reason :worker-serie-routing))
      registry)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer registro-worker-serie) tabella-worker-serie)
                crea-tabella-worker-serie))
(defun crea-tabella-worker-serie (context registry)
  \"Pre: thread del contesto IDLE, registro immutabile condiviso all'avvio.
Post: un link privato per slot; owner/fase typed, INVARIANT-VIOLATION shape.
Factory O(N), spazio O(N) per worker; non assume o trasferisce obblighi.\"
  (arcdocdb.execution::%richiedi-worker context :idle)
  (let* ((size (%routing-size registry)) (links (make-array size :initial-element nil)))
    (dotimes (i size)
      (setf (svref links i)
            (crea-collegamento-worker-serie context (svref (registro-worker-serie-writers registry) i)
                                          (svref (registro-worker-serie-controllers registry) i))))
    (unless (= (length links) size)
      (error 'invariant-violation :reason :worker-serie-routing))
    (%make-tabella-worker-serie context registry links)))
")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256 "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a" :GIT-BLOB
   "f280c35e8f7ed283d30e8f4a43bbf2f172600816" :TEXT
   ";;;; Risolve solo il writer CLAIMED: begin e doppia lease restano passi espliciti.
;;; OWNER: contesto e link locali; l'obbligo resta al worker anche dopo un fault.
;;; SHARED: registro immutabile letto per tratto; nessuna guard o scrittura globale.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (tabella-worker-serie writer-programmabile) index) %routing-ordinal))
(defun %routing-ordinal (table writer)
  \"Pre: owner e CLAIMED verificati. Post: ordinal bounded e writer EQ nello slot.
INVARIANT-VIOLATION unknown/stale/alias; nessun begin, pop o accesso Serie vivo.\"
  (let* ((registry (tabella-worker-serie-registry table)) (size (%routing-size registry))
         (ordinal (arcdocdb.execution:indice-routing-writer writer)))
    (unless (= (length (tabella-worker-serie-links table)) size)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (typep ordinal 'index)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (< ordinal size)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq writer (svref (registro-worker-serie-writers registry) ordinal))
      (error 'invariant-violation :reason :worker-serie-routing))
    ordinal))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (tabella-worker-serie writer-programmabile index) collegamento-worker-serie)
                %routing-link))
(defun %routing-link (table writer ordinal)
  \"Pre: ordinal e writer validati, owner esclusivo. Post: link IDLE della coppia.
INVARIANT-VIOLATION link/binding/fase privati corrotti; controller mai letto o mutato.\"
  (let ((link (svref (tabella-worker-serie-links table) ordinal)))
    (unless (typep link 'collegamento-worker-serie)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-context link) (tabella-worker-serie-context table))
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-writer link) writer)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-controller link)
                (svref (registro-worker-serie-controllers (tabella-worker-serie-registry table)) ordinal))
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-state link) :idle)
      (error 'invariant-violation :reason :worker-serie-routing))
    (%check-worker-serie link)
    link))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (tabella-worker-serie) collegamento-worker-serie) collega-writer-worker-serie))
(defun collega-writer-worker-serie (table)
  \"Pre: owner esclusivo, worker CLAIMED dal ring, ricircolo full o adozione.
Post: link preallocato corrispondente in O(1); lookup ripetibile senza effetti.
Fase/owner errati typed senza mutazione; routing incoerente rende il worker
FAULTED conservando obbligo e condizione originale, senza toccare Serie.\"
  (let ((context (tabella-worker-serie-context table)))
    (arcdocdb.execution::%passo-worker (context (:worker-state) ())
      (arcdocdb.execution::%richiedi-worker context :claimed)
      (arcdocdb.execution::%passo-worker (context () ())
        (let ((writer (writer-worker-writer context)))
          (%routing-link table writer (%routing-ordinal table writer)))))))
")
  (:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
   :BYTES 12069 :SHA256 "aa39fd58f4a23a5494ec218074afb431389e9d81a23f68455119284a24b142b7"
   :GIT-BLOB "fe960ce9218f07e111fb440f4af4137ae8440d9c" :TEXT
   ";;;; arcdocdb.asd — definizione di sistema ASDF.
;;;;
;;;; Fondazioni dello storage, autorizzate dall'autore il 2026-10-08.

(in-package #:asdf-user)

(defsystem \"arcdocdb\"
  :description \"Database server documentale general-purpose, append-only, in Common Lisp (SBCL).\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :version \"0.0.0\"
  :pathname \"src/\"
  :serial t
  :depends-on (\"sb-posix\")
  :components ((:file \"package\")
               (:module \"foundation\"
                :serial t
                :components ((:file \"package\") (:file \"conditions\")
                             (:file \"binary\") (:file \"crc32c\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"hash\" :serial t
                :components ((:file \"package\") (:file \"arithmetic\") (:file \"blocks\") (:file \"hash64\")))
               (:module \"codec\" :serial t
                :components ((:file \"package\") (:file \"utf8\")
                             (:file \"cbor-package\") (:file \"cbor-header\")
                             (:file \"cbor-float-minimal\") (:file \"cbor-minimal\")
                             (:file \"cbor-space\") (:file \"cbor-scan-input\")
                             (:file \"cbor-scan-stack\") (:file \"cbor-scan-items\")
                             (:file \"cbor-scan\") (:file \"cbor-scan-minimal\")
                             (:file \"cbor-write\") (:file \"cbor-string-write\")))
               (:module \"csn\" :serial t
                :components ((:file \"package\") (:file \"registry\")))
               (:module \"cache\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"core\")
                             (:file \"read\") (:file \"clock\") (:file \"write\")))
               (:module \"execution\" :serial t
                :components ((:file \"package\") (:file \"queue\") (:file \"writer\")
                             (:file \"handoff\") (:file \"ready-types\") (:file \"ready\")
                             (:file \"ready-recycle\")
                             (:file \"worker-types\") (:file \"worker-boundary\") (:file \"worker-claim\") (:file \"worker-run\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"package\") (:file \"formats\") (:file \"segment-header\")
                             (:file \"log-header\") (:file \"compaction-scan\")
                             (:file \"control-payload\") (:file \"payload-record\")
                             (:file \"payload-write\")))
               (:module \"io\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"native\")
                             (:file \"lifecycle\") (:file \"transfer\") (:file \"flush\")))
               (:module \"wal\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"builder\")
                             (:file \"group\") (:file \"executor\") (:file \"csn\")))
               (:module \"series\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"ownership\")
                             (:file \"events\") (:file \"io-events\") (:file \"publication\")
                             (:file \"query\") (:file \"retirement\")
                             (:file \"worker-package\") (:file \"worker-types\")
                             (:file \"worker-boundary\") (:file \"worker-run\")
                             (:file \"routing-types\") (:file \"routing-build\") (:file \"routing-select\")))
               (:module \"index\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"validation\") (:file \"read\") (:file \"write\") (:file \"relocate\")
                             (:file \"primary-package\") (:file \"primary-types\") (:file \"primary-core\")
                             (:file \"primary-build\") (:file \"primary-probe\") (:file \"primary-read\")
                             (:file \"primary-write\") (:file \"primary-relocate\")
                             (:file \"primary-arena\") (:file \"primary-directory\")
                             (:file \"rebuild-scan\") (:file \"rebuild-budget\")
                             (:file \"rebuild-copy\") (:file \"rebuild\")
                             (:file \"hash-seed\") (:file \"hash-digests\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"package\") (:file \"types\")
                             (:file \"snapshots-types\") (:file \"snapshots-core\") (:file \"snapshots-csn\")
                             (:file \"snapshots-register\") (:file \"snapshots-lifecycle\")
                             (:file \"snapshots-read\")))
               (:module \"epochs\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"read\") (:file \"retire\") (:file \"reclaim\")))
               (:module \"read\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"task\")))
               (:module \"get\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"lifecycle\") (:file \"lookup\") (:file \"target\") (:file \"segment\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"package\") (:file \"scan\")
                             (:file \"decisions-package\") (:file \"decisions-types\")
                             (:file \"decisions-sort\") (:file \"decisions-radix\") (:file \"decisions-build\")
                             (:file \"decisions-query\")
                             (:file \"manifest-package\") (:file \"manifest-types\")
                             (:file \"manifest-decode\") (:file \"manifest-fold\")
                             (:file \"manifest-build\") (:file \"manifest-query\")
                             (:file \"inventory-types\") (:file \"inventory-build\")
                             (:file \"inventory-query\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"scan\") (:file \"sort\")
                             (:file \"rows\") (:file \"build\") (:file \"read\")
                             (:file \"active-types\") (:file \"active-directory\")
                             (:file \"active-scan\") (:file \"active-build\")
                             (:file \"active-preflight\") (:file \"active-read\"))))
  :in-order-to ((test-op (test-op \"arcdocdb/tests\"))))

(defsystem \"arcdocdb/tests\"
  :description \"Test di ArcDocDB.\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :depends-on (\"arcdocdb\")
  :pathname \"tests/\"
  :serial t
  :components ((:file \"smoke\")
               (:module \"hash\" :serial t
                :components ((:file \"support\") (:file \"hash64\") (:file \"guards\") (:file \"threads\")))
               (:module \"foundation\"
                :serial t
                :components ((:file \"support\") (:file \"binary\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"codec\" :serial t
                :components ((:file \"support\") (:file \"utf8\") (:file \"threads\")
                             (:file \"cbor-support\") (:file \"cbor-header\") (:file \"cbor-threads\")
                             (:file \"cbor-minimal-support\") (:file \"cbor-minimal\")
                             (:file \"cbor-minimal-threads\") (:file \"cbor-minimal-edges\")
                             (:file \"cbor-structure-support\") (:file \"cbor-structure\")
                             (:file \"cbor-structure-threads\")
                             (:file \"cbor-minimal-scan-support\") (:file \"cbor-minimal-scan\")
                             (:file \"cbor-minimal-scan-threads\")
                             (:file \"cbor-write-support\") (:file \"cbor-write\")
                             (:file \"cbor-write-threads\") (:file \"cbor-write-roundtrip\")
                             (:file \"cbor-string-write-support\") (:file \"cbor-string-write\")
                             (:file \"cbor-string-write-threads\")))
               (:module \"csn\" :serial t
                :components ((:file \"support\") (:file \"registry\") (:file \"threads\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"capture\")))
               (:module \"epochs\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"read\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"get-performance\" :serial t
                :components ((:file \"support\") (:file \"paths\") (:file \"guards\") (:file \"threads\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"support\") (:file \"segment-header\") (:file \"log-header\")
                             (:file \"compaction-scan\")
                             (:file \"control-payload\")))
               (:module \"io\" :serial t
                :components ((:file \"support\") (:file \"transfer\") (:file \"native\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\")
                             (:file \"inventory-support\") (:file \"inventory\")))
               (:module \"wal\" :serial t
                :components ((:file \"support\") (:file \"builder\") (:file \"group\") (:file \"fault\")
                             (:file \"native\") (:file \"csn\") (:file \"csn-threads\")))
               (:module \"series\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"boundaries\") (:file \"threads\")
                             (:file \"worker-bridge\") (:file \"worker-routing\")))
               (:module \"index\" :serial t
                :components ((:file \"slot-support\") (:file \"slots\") (:file \"slot-threads\")
                             (:file \"primary-support\") (:file \"primary\") (:file \"primary-threads\")
                             (:file \"rebuild\") (:file \"hash-digests\"))))
  :perform (test-op (o c)
             (uiop:symbol-call '#:arcdocdb.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.hash64.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.foundation.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.utf8.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.structure.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.scan.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.string.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.storage.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.io.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)))
")
  (:PATH
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256 "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9"
   :GIT-BLOB "59722f73f21ad9d5ce59e1b4785c025054a57cc5" :TEXT
   ";;;; Routing ordinal: oracoli FIFO e identita indipendenti dagli indici del prodotto.
;;;; OWNER: contesto, tabella e links del singolo thread; registry solo dopo costruzione.
;;;; SHARED: registry immutabile, ready e controller nelle prove con handoff esplicito.
;;;; FI: accessor privati soltanto per preimage, corruzione dichiarata e cleanup.
(in-package #:arcdocdb.series.tests)

(defun routing-writer (items index &optional (quantum 1))
  \"Fixture C4: un solo obbligo SCHEDULE per writer, nessun routing implicito.\"
  (let ((writer (arcdocdb.execution:crea-writer-programmabile
                 :capacity (max 4 (length items)) :quantum quantum :routing-index index)))
    (loop for item in items for count from 1
          do (arcdocdb.execution.tests::handoff-check-enqueue
              writer item count (if (= count 1) :schedule :queued)))
    writer))

(defun routing-release (f)
  \"Cede la lease iniziale della fixture prima di qualunque begin del bridge.\"
  (rilascia-controllore-serie (series-fixture-controller f) (series-fixture-lease f))
  (setf (series-fixture-lease f) nil))

(defun routing-make (writers controllers &optional ready)
  \"Prealloca sul thread corrente; restituisce oggetti necessari agli oracoli.\"
  (let* ((queue (or ready (arcdocdb.execution:crea-lista-writer-pronti
                           :shards 1 :capacity 1)))
         (context (arcdocdb.execution:crea-contesto-worker-writer queue))
         (registry (arcdocdb.execution.series:crea-registro-worker-serie
                    writers controllers)))
    (values (arcdocdb.execution.series:crea-tabella-worker-serie context registry)
            context registry queue)))

(defun routing-lookup (table context writer)
  \"Ogni lookup ripetuto conserva l'intero grafo e restituisce lo stesso link.\"
  (let* ((before (series-image (list table)))
         (link (arcdocdb.execution.series:collega-writer-worker-serie table)))
    (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
    (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
    (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
    (is (series-image-equal before (series-image (list table))))
    (is (eq link (arcdocdb.execution.series:collega-writer-worker-serie table)))
    (is (series-image-equal before (series-image (list table))))
    link))

(defun routing-phase-refusal (table objects)
  \"Il lookup fuori CLAIMED rifiuta senza cambiare fasi, riferimenti o payload.\"
  (bridge-refusal objects
                  (lambda () (arcdocdb.execution.series:collega-writer-worker-serie table))
                  'resource-exhausted :worker-state))

(defun routing-fault (table context writer controllers &optional (reason :worker-serie-routing))
  \"Guasto di binding prima di acquire: causa EQ, obbligo conservato, Serie intatte.\"
  (let* ((before (series-image controllers))
         (writer-before (series-image (list writer)))
         (condition (arcdocdb.execution.tests::worker-capture-condition
                     (lambda () (arcdocdb.execution.series:collega-writer-worker-serie table))
                     'invariant-violation reason)))
    (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
    (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
    (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
    (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
    (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
    (is (series-image-equal before (series-image controllers)))
    (is (series-image-equal writer-before (series-image (list writer))))
    ;; La tabella puo contenere una shape FI enorme; l'immagine del worker resta
    ;; bounded dal contesto, mentre i vettori FI sono verificati iterativamente.
    (routing-phase-refusal table (list context writer))
    (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
    condition))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-writer-ordinal-and-legacy-default
  (let ((legacy (arcdocdb.execution:crea-writer-programmabile))
        (first (routing-writer nil 0)) (last (routing-writer nil 65535)))
    (is (null (arcdocdb.execution:indice-routing-writer legacy)))
    (is (= 0 (arcdocdb.execution:indice-routing-writer first)))
    (is (= 65535 (arcdocdb.execution:indice-routing-writer last)))
    (dolist (invalid '(-1 65536 1/2 0.0 :zero #()))
      (signals invalid-argument
        (arcdocdb.execution:crea-writer-programmabile :routing-index invalid)
        :writer-configuration))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-registry-maximum-shape-reaches-entry-validation
  ;; Nessun controller/writer falso viene costruito: al budget massimo passa
  ;; la validazione shape, quindi il primo NIL e rifiutato come entry.
  (let ((writers (make-array 65536 :initial-element nil))
        (controllers (make-array 65536 :initial-element nil)))
    (signals invalid-argument
      (arcdocdb.execution.series:crea-registro-worker-serie writers controllers)
      :worker-serie-routing-binding)
    (is (every #'null writers)) (is (every #'null controllers))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-registry-rejects-shape-and-budget-without-effects
  (with-series (f)
    (let* ((writer (routing-writer '(:kept) 0))
           (controller (series-fixture-controller f))
           (valid-writers (vector writer)) (valid-controllers (vector controller))
           (adjustable (make-array 1 :initial-element writer :adjustable t))
           (displaced (make-array 1 :displaced-to valid-writers)))
      (dolist (pair (list (list nil valid-controllers) (list valid-writers nil)
                          (list (list writer) valid-controllers)
                          (list valid-writers (list controller))
                          (list \"x\" valid-controllers) (list adjustable valid-controllers)
                          (list displaced valid-controllers)
                          (list #() #())
                          (list valid-writers (vector controller controller))))
        (bridge-refusal (list f writer (first pair) (second pair))
                        (lambda () (arcdocdb.execution.series:crea-registro-worker-serie
                                     (first pair) (second pair)))
                        'invalid-argument :worker-serie-routing-configuration)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-registry-oversize-refusal-has-iterative-preimage
  ;; Copie e confronto per cella, senza costruire liste profonde 65537 livelli.
  (with-series (f)
    (let* ((writer (routing-writer '(:kept) 0))
           (writers (make-array 65537 :initial-element writer))
           (controllers (make-array 65537 :initial-element (series-fixture-controller f)))
           (writer-copy (copy-seq writers)) (controller-copy (copy-seq controllers)))
      (bridge-refusal (list f writer)
                      (lambda () (arcdocdb.execution.series:crea-registro-worker-serie writers controllers))
                      'invalid-argument :worker-serie-routing-configuration)
      (is (= 65537 (length writers))) (is (= 65537 (length controllers)))
      (dotimes (i 65537)
        (is (eq (svref writer-copy i) (svref writers i)))
        (is (eq (svref controller-copy i) (svref controllers i)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-routing-corrupt-private-shape-rejects-before-lease
  ;; FI quiescente via costruttori privati, senza mutare gli slot read-only validi.
  ;; Registry/table malformati non sono mai pubblicati ad altri worker.
  (dolist (scenario '(:registry-empty :registry-oversize :controllers-short :links-short :links-long))
    (with-series (f)
      (routing-release f)
      (let ((writer (routing-writer '(:kept) 0)))
        (multiple-value-bind (table context registry ready)
            (routing-make (vector writer) (vector (series-fixture-controller f)))
          (declare (ignore ready))
          (let* ((large (when (eq scenario :registry-oversize)
                          (make-array 65537 :initial-element nil)))
                 (bad-registry
                   (case scenario
                     (:registry-empty (arcdocdb.execution.series::%make-registro-worker-serie #() #()))
                     (:registry-oversize (arcdocdb.execution.series::%make-registro-worker-serie large large))
                     (:controllers-short
                      (arcdocdb.execution.series::%make-registro-worker-serie (vector writer) #()))
                     (otherwise registry)))
                 (bad-links
                   (case scenario
                     (:links-short #())
                     (:links-long (vector (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) nil))
                     (otherwise (arcdocdb.execution.series::tabella-worker-serie-links table))))
                 (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                             context bad-registry bad-links)))
            (when (member scenario '(:registry-empty :registry-oversize :controllers-short))
              (bridge-refusal (list context writer f)
                              (lambda () (arcdocdb.execution.series:crea-tabella-worker-serie context bad-registry))
                              'invariant-violation :worker-serie-routing)
              (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
              (is (null (arcdocdb.execution:errore-worker-writer context))))
            (arcdocdb.execution:adotta-writer-worker context writer 0)
            (routing-fault bad-table context writer (list (series-fixture-controller f)))
            (when large
              (is (= 65537 (length large)))
              (dotimes (i 65537) (is (null (svref large i)))))
            (series-healthy f)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-AFF-001 REQ-AFF-008
(deftest test-REQ-AFF-001-routing-selects-faulted-serie-for-explicit-drain
  (dolist (scope '(:serie :archive))
    (with-series (f)
      (fault-controllore-serie (series-fixture-controller f) (series-fixture-lease f) scope)
      (routing-release f)
      (let ((writer (routing-writer '(:drain) 0)))
        (multiple-value-bind (table context registry ready)
            (routing-make (vector writer) (vector (series-fixture-controller f)))
          (declare (ignore registry ready))
          (arcdocdb.execution:adotta-writer-worker context writer 0)
          (let* ((controller (series-fixture-controller f))
                 (before (series-image (list controller)))
                 (link (routing-lookup table context writer)))
            (is (series-image-equal before (series-image (list controller))))
            (series-faulted f scope)
            (let ((token (bridge-begin link :active)))
              (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:drain) :messages))
              (bridge-end link token :idle))
            (series-faulted f scope)
            (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
            (is (null (arcdocdb.execution:errore-worker-writer context)))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-registry-entry-types-and-exact-ordinals
  (with-series (left :file-id 31)
    (with-series (right :file-id 32)
      (let* ((zero (routing-writer '(:zero) 0)) (one (routing-writer '(:one) 1))
             (legacy (arcdocdb.execution:crea-writer-programmabile))
             (c0 (series-fixture-controller left)) (c1 (series-fixture-controller right)))
        (dolist (pair (list (list (vector nil) (vector c0))
                            (list (vector :writer) (vector c0))
                            (list (vector zero) (vector nil))
                            (list (vector zero) (vector :controller))
                            (list (vector legacy) (vector c0))
                            (list (vector one) (vector c0))
                            (list (vector one zero) (vector c0 c1))
                            (list (vector zero zero) (vector c0 c1))))
          (bridge-refusal (list left right legacy zero one (first pair) (second pair))
                          (lambda () (arcdocdb.execution.series:crea-registro-worker-serie
                                       (first pair) (second pair)))
                          'invalid-argument :worker-serie-routing-binding))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-routing-registry-refuses-controller-alias-before-any-lease
  (with-series (f)
    (let ((writers (vector (routing-writer '(:zero) 0) (routing-writer '(:one) 1)))
          (controllers (vector (series-fixture-controller f) (series-fixture-controller f))))
      (bridge-refusal (list f writers controllers)
                      (lambda () (arcdocdb.execution.series:crea-registro-worker-serie
                                   writers controllers))
                      'invalid-argument :worker-serie-routing-binding))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-routing-registry-copies-input-vectors-and-preserves-identities
  (with-series (left :file-id 31)
    (with-series (right :file-id 32)
      (routing-release left) (routing-release right)
      (let* ((w0 (routing-writer '(:zero) 0)) (w1 (routing-writer '(:one) 1))
             (c0 (series-fixture-controller left)) (c1 (series-fixture-controller right))
             (writers (vector w0 w1)) (controllers (vector c0 c1))
             (input-before (series-image (list writers controllers))))
        (multiple-value-bind (table context registry ready) (routing-make writers controllers)
          (declare (ignore ready))
          (is (series-image-equal input-before (series-image (list writers controllers))))
          (is (not (eq writers (arcdocdb.execution.series::registro-worker-serie-writers registry))))
          (is (not (eq controllers (arcdocdb.execution.series::registro-worker-serie-controllers registry))))
          (setf (svref writers 0) nil (svref writers 1) :changed
                (svref controllers 0) c1 (svref controllers 1) c0)
          (arcdocdb.execution:adotta-writer-worker context w0 0)
          (let* ((link (routing-lookup table context w0)) (token (bridge-begin link :active)))
            (is (eq c0 (arcdocdb.execution.series::collegamento-worker-serie-controller link)))
            (bridge-ack link token (bridge-pop link token (vector :left nil :right) 1 2 '(:zero) :messages))
            (bridge-end link token :idle))
          (arcdocdb.execution:adotta-writer-worker context w1 0)
          (let* ((link (routing-lookup table context w1)) (token (bridge-begin link :active)))
            (is (eq c1 (arcdocdb.execution.series::collegamento-worker-serie-controller link)))
            (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:one) :messages))
            (bridge-end link token :idle)))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-table-construction-requires-idle-owner
  (with-series (f)
    (let ((writer (routing-writer '(:one) 0)))
      (multiple-value-bind (table context registry ready)
          (routing-make (vector writer) (vector (series-fixture-controller f)))
        (declare (ignore ready))
        (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
        (routing-phase-refusal table (list table f))
        (arcdocdb.execution:adotta-writer-worker context writer 0)
        (bridge-refusal (list table f)
                        (lambda () (arcdocdb.execution.series:crea-tabella-worker-serie context registry))
                        'resource-exhausted :worker-state)
        (is (eq writer (arcdocdb.execution:writer-worker-writer context)))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-ready-full-recycle-switches-series-and-preserves-fifo
  (with-series (left :file-id 31)
    (with-series (right :file-id 32)
      (routing-release left) (routing-release right)
      (let* ((a (vector :a)) (b (vector :b)) (x (vector :x)) (y (vector :y))
             (w0 (routing-writer (list a b) 0)) (w1 (routing-writer (list x y) 1)))
        (multiple-value-bind (table context registry ready)
            (routing-make (vector w0 w1) (vector (series-fixture-controller left)
                                               (series-fixture-controller right)))
          (declare (ignore registry))
          (arcdocdb.execution.tests::ready-check-publish ready 0 w0 1)
          (arcdocdb.execution.tests::worker-check-claim context w0 :claimed 0)
          (arcdocdb.execution.tests::ready-check-publish ready 0 w1 1)
          (let ((first nil) (second nil))
            (loop for writer in (list w0 w1 w0 w1) for item in (list a x b y)
                  for action in '(:schedule :schedule :idle :idle)
                  for step from 0
                  do (let* ((link (routing-lookup table context writer))
                            (token (bridge-begin link :active)))
                       (if (evenp step)
                           (if first (is (eq first link)) (setf first link))
                           (if second (is (eq second link)) (setf second link)))
                       (bridge-ack link token (bridge-pop link token (vector :left nil :right)
                                                         1 2 (list item) :messages))
                       (bridge-end link token action)
                       (case step
                         (0 (arcdocdb.execution.tests::worker-check-recycle context w1 :claimed 1))
                         (1 (arcdocdb.execution.tests::worker-check-recycle context w0 :claimed 1))
                         (2 (arcdocdb.execution.tests::worker-check-claim context w1 :claimed 0))))
                  finally (is (not (eq first second))))
            (arcdocdb.execution.tests::worker-check-claim context nil :empty 0)))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-routing-unknown-unrouted-and-out-of-range-retain-obligation
  (dolist (scenario '(:legacy :different-identity :out-of-range))
    (with-series (f)
      (routing-release f)
      (let* ((registered (routing-writer '(:registered) 0))
             (claimed (ecase scenario
                        (:legacy (arcdocdb.execution.tests::worker-test-writer '(:legacy)))
                        (:different-identity (routing-writer '(:other) 0))
                        (:out-of-range (routing-writer '(:range) 1)))))
        (multiple-value-bind (table context registry ready)
            (routing-make (vector registered) (vector (series-fixture-controller f)))
          (declare (ignore registry ready))
          (arcdocdb.execution:adotta-writer-worker context claimed 0)
          (routing-fault table context claimed (list (series-fixture-controller f)))
          (series-healthy f))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-routing-corrupt-link-is-detected-before-lease-or-pop
  (dolist (scenario '(:nil :wrong-writer :wrong-context :wrong-controller :active
                     :fault :writer-lease :series-lease))
    (with-series (left :file-id 31)
      (with-series (right :file-id 32)
        (routing-release left) (routing-release right)
        (let ((writer (routing-writer '(:kept) 0)))
          (multiple-value-bind (table context registry ready)
              (routing-make (vector writer) (vector (series-fixture-controller left)))
            (declare (ignore registry))
            (arcdocdb.execution:adotta-writer-worker context writer 0)
            (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
                   (link (svref links 0)))
              (ecase scenario
                (:nil (setf (svref links 0) nil))
                (:wrong-writer
                 (setf (svref links 0) (arcdocdb.execution.series:crea-collegamento-worker-serie
                                        context (routing-writer '(:wrong) 0)
                                        (series-fixture-controller left))))
                (:wrong-context
                 (setf (svref links 0) (arcdocdb.execution.series:crea-collegamento-worker-serie
                                        (arcdocdb.execution:crea-contesto-worker-writer ready)
                                        writer (series-fixture-controller left))))
                (:wrong-controller
                 (setf (svref links 0) (arcdocdb.execution.series:crea-collegamento-worker-serie
                                        context writer (series-fixture-controller right))))
                (:active (setf (arcdocdb.execution.series::collegamento-worker-serie-state link) :active))
                (:fault (setf (arcdocdb.execution.series::collegamento-worker-serie-fault link)
                              (make-condition 'simple-error :format-control \"FI routing link\")))
                (:writer-lease
                 (setf (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link) 1))
                (:series-lease
                 (setf (arcdocdb.execution.series::collegamento-worker-serie-series-lease link) 1)))
              (routing-fault table context writer
                             (list (series-fixture-controller left) (series-fixture-controller right))
                             (case scenario
                               (:fault :worker-serie-state)
                               ((:writer-lease :series-lease) :worker-serie-lease)
                               (otherwise :worker-serie-routing)))
              (series-healthy left) (series-healthy right))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-lookup-rejects-running-batch-and-reschedule
  (with-series (f)
    (routing-release f)
    (let ((one (vector :one)) (two (vector :two)))
      (multiple-value-bind (table context registry ready)
          (routing-make (vector (routing-writer (list one two) 0))
                        (vector (series-fixture-controller f)))
        (declare (ignore registry ready))
        (let ((writer (svref (arcdocdb.execution.series::registro-worker-serie-writers
                              (arcdocdb.execution.series::tabella-worker-serie-registry table)) 0)))
          (arcdocdb.execution:adotta-writer-worker context writer 0)
          (let* ((link (routing-lookup table context writer)) (token (bridge-begin link :active))
                 (target (vector nil)))
            (routing-phase-refusal table (list table f target))
            (let ((batch (bridge-pop link token target 0 1 (list one) :messages)))
              (routing-phase-refusal table (list table f target))
              (bridge-ack link token batch))
            (bridge-end link token :schedule)
            (routing-phase-refusal table (list table f target))
            (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
            (routing-phase-refusal table (list table f target))
            (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
            (is (eq link (routing-lookup table context writer)))
            (let ((next (bridge-begin link :active)))
              (bridge-ack link next (bridge-pop link next target 0 1 (list two) :messages))
              (bridge-end link next :idle))))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-routing-lookup-rejects-finishing-without-changing-debt
  (with-series (f)
    (routing-release f)
    (let ((writer (routing-writer '(:one) 0)))
      (multiple-value-bind (table context registry ready)
          (routing-make (vector writer) (vector (series-fixture-controller f)))
        (declare (ignore registry ready))
        (arcdocdb.execution:adotta-writer-worker context writer 0)
        (let* ((link (routing-lookup table context writer)) (token (bridge-begin link :active))
               (queue (arcdocdb.execution::writer-programmabile-queue writer)))
          (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:one) :messages))
          (arcdocdb.execution.tests::with-execution-guard (queue)
            (signals resource-exhausted
              (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
            (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
            (routing-phase-refusal table (list table f)))
          (bridge-end link token :idle))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-routing-foreign-owner-factory-and-lookup-preserve-all-fields
  (with-series (f)
    (let ((writer (routing-writer '(:one) 0)))
      (multiple-value-bind (table context registry ready)
          (routing-make (vector writer) (vector (series-fixture-controller f)))
        (declare (ignore ready))
        (arcdocdb.execution:adotta-writer-worker context writer 0)
        (let ((deadline (series-deadline 5)) (threads nil))
          (unwind-protect
               (progn
                 (push (series-worker
                        \"routing foreign owner\"
                        (lambda ()
                          (bridge-refusal (list table f)
                                          (lambda () (arcdocdb.execution.series:crea-tabella-worker-serie
                                                       context registry))
                                          'invalid-argument :worker-owner)
                          (bridge-refusal (list table f)
                                          (lambda () (arcdocdb.execution.series:collega-writer-worker-serie table))
                                          'invalid-argument :worker-owner)
                          :ok)) threads)
                 (series-join (first threads) deadline)
                 (routing-lookup table context writer))
            (series-stop-workers threads)))))))

(defun routing-parallel-worker (registry ready acquired release deadline results slot expected)
  \"Un contesto e tabella per thread; lease tenuta fino all'arrivo di entrambi.\"
  (let* ((context (arcdocdb.execution:crea-contesto-worker-writer ready))
         (table (arcdocdb.execution.series:crea-tabella-worker-serie context registry)))
    (multiple-value-bind (writer status cursor) (arcdocdb.execution:prendi-writer-worker context)
      (is (eq :claimed status)) (is (zerop cursor))
      (let* ((index (arcdocdb.execution:indice-routing-writer writer))
             (link (routing-lookup table context writer)) (token (bridge-begin link :active)))
        (is (member index '(0 1)))
        (setf (svref results slot) (list :active index link table))
        (sb-thread:signal-semaphore acquired)
        (series-wait release deadline)
        (bridge-ack link token (bridge-pop link token (vector :left nil :right)
                                          1 2 (list (svref expected index)) :messages))
        (bridge-end link token :idle)
        :ok))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-routing-shared-registry-ready-two-series-active-in-parallel
  (with-series (left :file-id 31)
    (with-series (right :file-id 32)
      (routing-release left) (routing-release right)
      (let* ((items (vector (vector :left-item) (vector :right-item)))
             (writers (vector (routing-writer (list (svref items 0)) 0)
                              (routing-writer (list (svref items 1)) 1)))
             (registry (arcdocdb.execution.series:crea-registro-worker-serie
                        writers (vector (series-fixture-controller left)
                                        (series-fixture-controller right))))
             (ready (arcdocdb.execution:crea-lista-writer-pronti :shards 1 :capacity 2))
             (acquired (sb-thread:make-semaphore)) (release (sb-thread:make-semaphore))
             (results (vector nil nil)) (deadline (series-deadline 5)) (threads nil))
        (dotimes (i 2) (arcdocdb.execution.tests::ready-check-publish ready 0 (svref writers i) (1+ i)))
        (unwind-protect
             (progn
               ;; Il secondo claim parte dopo il primo: nessun retry implicito su ready busy.
               (push (series-worker \"routing shared registry first\"
                                    (lambda () (routing-parallel-worker registry ready acquired release
                                                                       deadline results 0 items))) threads)
               (series-wait acquired deadline)
               (push (series-worker \"routing shared registry second\"
                                    (lambda () (routing-parallel-worker registry ready acquired release
                                                                       deadline results 1 items))) threads)
               (series-wait acquired deadline)
               (is (eq :active (first (svref results 0))))
               (is (eq :active (first (svref results 1))))
               (is (= 0 (second (svref results 0)))) (is (= 1 (second (svref results 1))))
               (is (not (eq (third (svref results 0)) (third (svref results 1)))))
               (is (not (eq (fourth (svref results 0)) (fourth (svref results 1)))))
               (sb-thread:signal-semaphore release 2)
               (dolist (thread threads) (series-join thread deadline))
               (dolist (f (list left right))
                 (setf (series-fixture-lease f) (acquisisci-controllore-serie (series-fixture-controller f)))
                 (series-counts f 0 0 0) (series-healthy f)))
          (sb-thread:signal-semaphore release 2)
          (series-stop-workers threads))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-routing-lookup-reason-cannot-bypass-terminal-boundary
  ;; FI quiescente: lookup solo CLAIMED, nessuna lease posseduta; restore sempre.
  ;; :WORKER-STATE e ordinario soltanto nel gate di fase, non nel lookup interno.
  (dolist (helper '(arcdocdb.execution.series::%routing-ordinal
                    arcdocdb.execution.series::%routing-link))
    (with-series (f)
      (routing-release f)
      (let ((writer (routing-writer '(:kept) 0)))
        (multiple-value-bind (table context registry ready)
            (routing-make (vector writer) (vector (series-fixture-controller f)))
          (declare (ignore registry ready))
          (arcdocdb.execution:adotta-writer-worker context writer 0)
          (let* ((original (make-condition 'resource-exhausted :reason :worker-state))
                 (saved (fdefinition helper))
                 (before (series-image (list f writer)))
                 (home (arcdocdb.execution::contesto-worker-writer-home context)))
            (unwind-protect
                 (progn
                   (setf (fdefinition helper)
                         (lambda (&rest arguments) (declare (ignore arguments)) (error original)))
                   (is (eq original
                           (arcdocdb.execution.tests::worker-capture-condition
                            (lambda () (arcdocdb.execution.series:collega-writer-worker-serie table))
                            'resource-exhausted :worker-state)))
                   (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
                   (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
                   (is (= home (arcdocdb.execution::contesto-worker-writer-home context)))
                   (is (eq original (arcdocdb.execution:errore-worker-writer context)))
                   (is (series-image-equal before (series-image (list f writer))))
                   (routing-phase-refusal table (list table f writer))
                   (is (eq original (arcdocdb.execution:errore-worker-writer context))))
              (setf (fdefinition helper) saved))))))))
")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/worker-routing-bench.lisp")
   :BYTES 24370 :SHA256 "9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec"
   :GIT-BLOB "062e8dbbfb0fc912af22d037091d8b1b64f07b1e" :TEXT
   ";;;; C4: percorso seriale routing worker/Serie, preregistrato prima di qualsiasi campagna.
;;;; Un payload 5 per ciclo; enqueue/publish/claim/routing/start/lease/pop/ack/end; nessun I/O nel ciclo.
;;;; Cinque repliche ordinate di 4096 cicli, ciascuna dopo 128 warmup e GC completa.
;;;; Fixture, API, target e contatori preallocati; heap/ticks raw, nessuna soglia temporale.
;;;; Oracolo indipendente per ciclo: 12+17+19+13+11+13+3+25+7+23 = 143.
;;;; --self-test oppure --bench directory-nuova/; fonti congelate per la campagna.
;;;; Per caricare il FASL senza CLI: feature :arcdocdb-worker-routing-bench-library.
;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
;;; OWNER: un thread possiede fixture, contesto, collegamento e sensore; nessuno SHARED.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (require :sb-md5)
  (require :sb-posix))
(defpackage #:arcdocdb.worker-routing.bench (:use #:cl))
(in-package #:arcdocdb.worker-routing.bench)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defconstant +iterations+ 4096)
(defconstant +warmup+ 128)
(defconstant +replicas+ 5)
(defconstant +cycle-token+ 143)

(defun fingerprints ()
  \"ASD, prodotto, fixture e sensore: confronto di stabilità, non autenticità.\"
  (loop for path in (append '(#p\"arcdocdb.asd\" #p\"tools/worker-routing-bench.lisp\")
                            (sort (append (directory \"src/**/*.lisp\")
                                          (directory \"tests/**/*.lisp\"))
                                  #'string< :key #'namestring))
        collect (list :file (enough-namestring path)
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file path) 'list)))))

(defun load-product ()
  \"Compila prodotto e fixture prima della misura; warning/style-warning di compilazione fatali.
Come tools/build.lisp, la sola ridefinizione runtime di macro tra compile/load ASDF
non è un difetto di compilazione; nessuna eccezione nel COMPILE-FILE del C4 stesso.\"
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (let ((*standard-output* *error-output*))
    (handler-bind ((warning (lambda (condition)
                             (unless (typep condition 'sb-kernel:redefinition-warning)
                               (error \"COD-01: avviso non ammesso: ~A.\" condition)))))
      (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
      (asdf:load-system \"arcdocdb/tests\" :force t))))

(defun api (package name &optional (visibility :external))
  \"Risolve le API prima del clock; un nome mancante o non esportato è errore del sensore.\"
  (multiple-value-bind (symbol actual) (find-symbol name package)
    (unless (and symbol (eq actual visibility) (fboundp symbol))
      (error \"COD-60: API ~A:~A non disponibile.\" package name))
    (symbol-function symbol)))

(defun with-controller (thunk)
  \"Fixture mock I/O posseduta; lease iniziale rilasciata prima di invocare THUNK.\"
  (funcall (api \"ARCDOCDB.SERIES.TESTS\" \"CALL-WITH-SERIES-FIXTURE\" :internal)
           (lambda (fixture)
             (let* ((controller (funcall (api \"ARCDOCDB.SERIES.TESTS\" \"SERIES-FIXTURE-CONTROLLER\" :internal)
                                        fixture))
                    (lease (funcall (api \"ARCDOCDB.SERIES.TESTS\" \"SERIES-FIXTURE-LEASE\" :internal) fixture))
                    (lease-symbol (find-symbol \"SERIES-FIXTURE-LEASE\" \"ARCDOCDB.SERIES.TESTS\")))
               (funcall (api \"ARCDOCDB.SERIES\" \"RILASCIA-CONTROLLORE-SERIE\") controller lease)
               (funcall (fdefinition (list 'setf lease-symbol)) nil fixture)
               (funcall thunk controller lease)))
           :capacity 1 :csn-capacity 1))

(defun with-cycle (thunk)
  \"Due Serie vive in fixture distinte; un worker alterna i due writer sul ring.\"
  (with-controller
   (lambda (first-controller first-lease)
     (with-controller
      (lambda (second-controller second-lease)
        (funcall thunk (cycle-function (vector first-controller second-controller)
                                       (vector first-lease second-lease))))))))

(defun enqueue-claim-function (writers worker ready table identities)
  \"API e identita risolte a startup; due lookup verificano riuso dello stesso link.\"
  (let ((enqueue (api \"ARCDOCDB.EXECUTION\" \"ACCODA-LAVORO-WRITER\"))
        (publish (api \"ARCDOCDB.EXECUTION\" \"PUBBLICA-WRITER-PRONTO\"))
        (claim (api \"ARCDOCDB.EXECUTION\" \"PRENDI-WRITER-WORKER\"))
        (routing-index (api \"ARCDOCDB.EXECUTION\" \"INDICE-ROUTING-WRITER\"))
        (route (api \"ARCDOCDB.EXECUTION.SERIES\" \"COLLEGA-WRITER-WORKER-SERIE\"))
        (worker-writer (api \"ARCDOCDB.EXECUTION\" \"WRITER-WORKER-WRITER\"))
        (worker-state (api \"ARCDOCDB.EXECUTION\" \"STATO-WORKER-WRITER\"))
        (state (api \"ARCDOCDB.EXECUTION.SERIES\" \"STATO-WORKER-SERIE\")))
    (lambda (index)
      (let ((writer (svref writers index)) (sink 0))
        (declare (type fixnum sink))
        (multiple-value-bind (count action) (funcall enqueue writer 5)
          (unless (and (= count 1) (eq action :schedule))
            (error \"COD-60: enqueue non trasferisce un obbligo unico.\"))
          (incf sink (+ count 11)))
        (unless (= 1 (funcall publish ready 0 writer))
          (error \"COD-60: pubblicazione non trasferisce l'obbligo al ring.\"))
        (incf sink 17)
        (multiple-value-bind (actual status next) (funcall claim worker)
          (unless (and (eq writer actual) (eq status :claimed) (= next 0)
                       (eq writer (funcall worker-writer worker))
                       (eq :claimed (funcall worker-state worker)))
            (error \"COD-60: prelievo non consegna il writer atteso.\")))
        (incf sink 19)
        (let ((link (funcall route table)))
          (unless (and (= index (funcall routing-index writer))
                       (eq link (funcall route table)) (eq :idle (funcall state link)))
            (error \"COD-60: indice/routing/identita o fase del link incoerenti.\"))
          (if (null (svref identities index))
              (setf (svref identities index) link)
              (unless (eq link (svref identities index))
                (error \"COD-60: routing non riusa il link preallocato.\")))
          (values link (+ sink 13)))))))

(defun transfer-function (target bridge-tokens series-leases batch-counter)
  \"Un batch per ciclo; token per link, lease per Serie e token batch del worker monotoni.\"
  (let ((start (api \"ARCDOCDB.EXECUTION.SERIES\" \"INIZIA-WORKER-SERIE\"))
        (lease (api \"ARCDOCDB.EXECUTION.SERIES\" \"LEASE-WORKER-SERIE\"))
        (pop (api \"ARCDOCDB.EXECUTION.SERIES\" \"PRELEVA-WORKER-SERIE\"))
        (ack (api \"ARCDOCDB.EXECUTION.SERIES\" \"CONFERMA-WORKER-SERIE\"))
        (end (api \"ARCDOCDB.EXECUTION.SERIES\" \"TERMINA-WORKER-SERIE\"))
        (state (api \"ARCDOCDB.EXECUTION.SERIES\" \"STATO-WORKER-SERIE\")))
    (lambda (link index)
      (let ((sink 0))
        (declare (type fixnum sink))
        (multiple-value-bind (token status reason) (funcall start link)
          (unless (and (= token (incf (the fixnum (svref bridge-tokens index))))
                       (eq status :active) (null reason))
            (error \"COD-60: token/stato di avvio incoerenti.\"))
          (incf sink 11)
          (unless (= (funcall lease link token) (incf (the fixnum (svref series-leases index))))
            (error \"COD-60: lease Serie non monotona.\"))
          (incf sink 13)
          (multiple-value-bind (count status batch) (funcall pop link token target 1 2)
            (unless (and (= count 1) (eq status :messages)
                         (= batch (incf (the fixnum (svref batch-counter 0))))
                         (eql 5 (svref target 1)) (eq :outside (svref target 0))
                         (eq :outside (svref target 2)))
              (error \"COD-60: batch/payload/span incoerenti.\"))
            (incf sink (+ (* 3 count) (* 5 (the fixnum (svref target 1)))))
            (unless (null (funcall ack link token batch))
              (error \"COD-60: conferma batch non restituisce NIL.\"))
            (incf sink 7))
          (unless (and (eq :idle (funcall end link token)) (eq :idle (funcall state link)))
            (error \"COD-60: termine non rilascia il collegamento.\"))
          (incf sink 23))
        sink))))

(defun cycle-function (controllers initial-leases)
  \"Registro e tabella preallocati; due cicli startup fissano identita prima del sensore.\"
  (let* ((create-writer (api \"ARCDOCDB.EXECUTION\" \"CREA-WRITER-PROGRAMMABILE\"))
         (create-ready (api \"ARCDOCDB.EXECUTION\" \"CREA-LISTA-WRITER-PRONTI\"))
         (create-worker (api \"ARCDOCDB.EXECUTION\" \"CREA-CONTESTO-WORKER-WRITER\"))
         (create-registry (api \"ARCDOCDB.EXECUTION.SERIES\" \"CREA-REGISTRO-WORKER-SERIE\"))
         (create-table (api \"ARCDOCDB.EXECUTION.SERIES\" \"CREA-TABELLA-WORKER-SERIE\"))
         (writers (vector (funcall create-writer :capacity 1 :quantum 1 :routing-index 0)
                          (funcall create-writer :capacity 1 :quantum 1 :routing-index 1)))
         (ready (funcall create-ready :shards 1 :capacity 1))
         (worker (funcall create-worker ready))
         (registry (funcall create-registry writers controllers))
         (table (funcall create-table worker registry))
         (identities (vector nil nil)) (cursor (vector 0))
         (claim (enqueue-claim-function writers worker ready table identities))
         (transfer (transfer-function (make-array 3 :initial-element :outside)
                                      (vector 0 0) (copy-seq initial-leases) (vector 0))))
    (flet ((cycle ()
             (let ((index (svref cursor 0)))
               (setf (svref cursor 0) (- 1 (the fixnum index)))
               (multiple-value-bind (link sink) (funcall claim index)
                 (+ (the fixnum sink) (the fixnum (funcall transfer link index)))))))
      (unless (and (= +cycle-token+ (cycle)) (= +cycle-token+ (cycle))
                   (not (eq (svref identities 0) (svref identities 1))))
        (error \"COD-60: startup non fissa due identita distinte e il sink atteso.\"))
      #'cycle)))

(defun sample-record (replica iterations warmup token)
  \"Tutti i campi esistono prima di warmup, heap e clock; oracolo calcolato indipendentemente.\"
  (list :replica replica :status :running :stage :warmup :iterations iterations
        :warmup-iterations warmup :completed-iterations 0 :heap-bytes nil :raw-ticks nil
        :seconds nil :time-quality :pending :sink nil :diagnostic nil
        :expected-sink (logand most-positive-fixnum
                              (+ (* iterations token) (/ (* iterations (1- iterations)) 2)))))

(defun sample (function iterations token progress &key (warmup +warmup+) (clock #'get-internal-real-time))
  \"Misura bounded, GC prima del clock; anche l'errore conserva cicli e raw parziali.\"
  (unless (and (<= 1 iterations +iterations+) (<= 0 warmup +warmup+)
               (typep token '(integer 0 #.most-positive-fixnum)))
    (error \"COD-60: parametri fuori dal budget preregistrato.\"))
  (dotimes (i warmup) (funcall function))
  (sb-ext:gc :full t)
  (setf (getf progress :stage) :measured)
  (let ((before (funcall clock)) (heap-before (sb-ext:get-bytes-consed)) (sink 0) (failure nil))
    (declare (type fixnum sink))
    (handler-case
        (dotimes (i iterations)
          (setf sink (logand most-positive-fixnum (+ sink i (the fixnum (funcall function))))
                (getf progress :completed-iterations) (1+ i)))
      (error (condition) (setf failure condition)))
    (let ((heap (- (sb-ext:get-bytes-consed) heap-before)) (ticks (- (funcall clock) before)))
      (setf (getf progress :heap-bytes) heap (getf progress :raw-ticks) ticks
            (getf progress :sink) sink (getf progress :time-quality)
            (if (zerop ticks) :below-resolution :measured)
            (getf progress :seconds) (when (plusp ticks) (/ ticks (float internal-time-units-per-second 1d0))))
      (when failure (error failure))
      (unless (and (>= heap 0) (>= ticks 0) (= sink (getf progress :expected-sink)))
        (error \"COD-60: heap/clock negativo o sink ~D diverso da ~D.\" sink (getf progress :expected-sink)))
      (setf (getf progress :status) :ok (getf progress :stage) :complete)))
  progress)

(defun campaign (report checkpoint)
  \"Cinque campioni nello stesso contesto; checkpoint prima e dopo ogni misura.\"
  (with-cycle
   (lambda (function)
     (dotimes (replica +replicas+)
       (let ((progress (sample-record replica +iterations+ +warmup+ +cycle-token+)))
         (setf (getf report :current-replica) replica
               (getf report :samples) (append (getf report :samples) (list progress)))
         (funcall checkpoint)
         (sample function +iterations+ +cycle-token+ progress)
         (funcall checkpoint)
         (unless (zerop (getf progress :heap-bytes))
           (setf (getf progress :status) :failed
                 (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
           (error \"COD-30: heap osservato positivo nella replica ~D.\" replica))))))
  (setf (getf report :current-replica) nil)
  report)

(defun make-report ()
  \"Metadati, formula e limiti espliciti; il sensore non qualifica parallelismo o I/O.\"
  (list :schema-version 1 :kind :worker-routing-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version)
        :workers 1 :writers 2 :series 2 :startup-cycles 2 :shards 1
        :writer-capacity 1 :ready-capacity 1 :serie-capacity 1 :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+ :payload 5
        :timer-units-per-second internal-time-units-per-second :expected-cycle-token +cycle-token+
        :token-formula \"12+17+19+13+11+13+3+5*5+7+23=143; sample=N*143+N*(N-1)/2\"
        :limits '(:success-path-only :serial-owner :alternating-two-writers-and-series
                  :preallocated-inputs :mock-io-startup-only
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-throughput-p99-scaling-or-time-threshold
                  :no-contention-pool-device-durability-or-release-qualification
                  :no-startup-allocation-claim)))

(defun acquire-directory (path)
  \"Directory esclusiva 0700; rifiuta una destinazione precedente senza scriverla.\"
  (let ((directory (uiop:ensure-directory-pathname (merge-pathnames path (uiop:getcwd)))))
    (ensure-directories-exist
     (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
    (sb-posix:mkdir (namestring directory) #o700)
    directory))

(defun write-report (report directory)
  \"Checkpoint esclusivo nella directory reclamata; ultimo rapporto leggibile conservato.\"
  (with-open-file (stream (merge-pathnames \"report.next.lisp\" directory)
                          :direction :output :if-exists :supersede)
    (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
  (uiop:rename-file-overwriting-target (merge-pathnames \"report.next.lisp\" directory)
                                     (merge-pathnames \"report.lisp\" directory)))

(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"CLI, load e sensori conservati; fallimenti mantengono replica e contatori già raccolti.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun fresh-self-test-directory ()
  \"Fixture temporanea esclusiva; limite esplicito di mille collisioni.\"
  (loop for attempt below 1000
        for directory = (merge-pathnames
                         (format nil \"arcdocdb-worker-routing-bench-~D-~D-~D/\"
                                 (get-universal-time) (sb-posix:getpid) attempt)
                         (uiop:temporary-directory))
        do (handler-case (progn (sb-posix:mkdir (namestring directory) #o700)
                                (return-from fresh-self-test-directory directory))
             (sb-posix:syscall-error (condition)
               (unless (= sb-posix:eexist (sb-posix:syscall-errno condition)) (error condition)))))
  (error \"COD-60: impossibile acquisire directory della fixture.\"))

(defun read-self-test-report (directory)
  \"Legge soltanto la fixture prodotta dal sensore; nessuna valutazione del dato.\"
  (let ((*read-eval* nil))
    (with-open-file (stream (merge-pathnames \"report.lisp\" directory)) (read stream))))

(defun self-test-reporter ()
  \"Destinazione precedente intatta; campione completo e raw parziale sopravvivono all'errore.\"
  (let ((root (fresh-self-test-directory)))
    (unwind-protect
         (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                (failed (merge-pathnames \"failed/\" root)))
           (write-report '(:sentinel :unchanged) existing)
           (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                    :product-loader (constantly nil)
                                                    :tester (constantly :passed)) :status))
                        (equal (read-self-test-report existing) '(:sentinel :unchanged)))
             (error \"COD-60: report precedente non conservato.\"))
           (run-driver (list \"--bench\" (namestring failed))
                       :product-loader (constantly nil) :tester (constantly :passed)
                       :runner (lambda (report checkpoint)
                                 (setf (getf report :current-replica) 1 (getf report :samples)
                                       (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                             (list :status :running :raw-ticks 7 :heap-bytes 11
                                                   :diagnostic nil)))
                                 (funcall checkpoint)
                                 (error \"fixture: replica interrotta\")))
           (let* ((saved (read-self-test-report failed)) (samples (getf saved :samples)))
             (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                          (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                          (eq :failed (getf (second samples) :status))
                          (= 7 (getf (second samples) :raw-ticks))
                          (= 11 (getf (second samples) :heap-bytes)))
               (error \"COD-60: campione precedente o raw del fallimento persi.\"))))
      ;; La cancellazione C4 riguarda soltanto la directory acquisita da questa fixture.
      (uiop:delete-directory-tree root :validate t)))
  :passed)

(defun self-test-partial-sample ()
  \"Errore del ciclo misurato: clock/heap/sink e numero completato sono preservati.\"
  (let ((progress (sample-record 0 4 0 0)) (calls 0) (clock 0))
    (unless (handler-case
                (progn (sample (lambda ()
                                 (incf calls)
                                 (when (= calls 2) (error \"fixture: misura interrotta\"))
                                 0)
                               4 0 progress :warmup 0 :clock (lambda () (incf clock 7)))
                       nil)
              (error (condition)
                (setf (getf progress :status) :expected-rejection
                      (getf progress :diagnostic) (princ-to-string condition)) t))
      (error \"COD-60: ciclo difettoso non interrotto.\"))
    (unless (and (= calls 2) (= 1 (getf progress :completed-iterations))
                 (= 0 (getf progress :sink)) (= 7 (getf progress :raw-ticks))
                 (>= (getf progress :heap-bytes) 0) (eq :measured (getf progress :stage)))
      (error \"COD-60: raw parziale della misura non conservato.\"))
    progress))

(defun self-test ()
  \"Prove sensore: allocazione positiva, sink errato, clock nullo, ciclo API e CLI invalida.\"
  (let* ((baseline (sample-record 0 +iterations+ +warmup+ 0))
         (positive (sample-record 0 16 0 1048576)) (probe nil)
         (wrong (sample-record 0 2 0 0)) (zero (sample-record 0 2 0 0))
         (composed (sample-record 0 4 0 +cycle-token+)))
    (sample (lambda () 0) +iterations+ 0 baseline)
    (unless (zerop (getf baseline :heap-bytes)) (error \"COD-60: contatore baseline non nullo.\"))
    (sample (lambda ()
              (setf probe (make-array 1048576 :element-type '(unsigned-byte 8) :initial-element 0))
              (length probe)) 16 1048576 positive :warmup 0)
    (unless (and (= 1048576 (length probe)) (>= (getf positive :heap-bytes) (* 16 1048576)))
      (error \"COD-60: allocazione deliberata non rilevata.\"))
    (unless (handler-case (progn (sample (lambda () 1) 2 0 wrong :warmup 0) nil)
              (error (condition)
                (setf (getf wrong :status) :expected-rejection
                      (getf wrong :diagnostic) (princ-to-string condition)) t))
      (error \"COD-60: sink errato non respinto.\"))
    (sample (lambda () 0) 2 0 zero :warmup 0 :clock (constantly 0))
    (unless (and (eq :below-resolution (getf zero :time-quality)) (null (getf zero :seconds)))
      (error \"COD-60: clock nullo convertito in durata.\"))
    (with-cycle (lambda (function) (sample function 4 +cycle-token+ composed :warmup 0)))
    (let ((called nil))
      (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
        (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                     (null called))
          (error \"COD-60: CLI invalida eseguita.\"))))
    (list :status :ok :baseline baseline :positive-control positive :wrong-sink-probe wrong
          :zero-clock-probe zero :composed-api-probe composed :invalid-cli :rejected
          :existing-destination-and-partial-raw (self-test-reporter)
          :measured-partial-raw (self-test-partial-sample))))

(defun main ()
  \"CLI C4: rapporto leggibile, errore esplicito e exit nonzero per ogni fallimento.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&worker-routing-bench.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))

(unless (member :arcdocdb-worker-routing-bench-library *features*) (main))
")
  (:PATH
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256 "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170" :GIT-BLOB
   "14bb99d6529c3d741f60472d2c3e822dbb0f590e" :TEXT
   ";;; OWNER: writer con lease alloca il delta e lo adotta nel ring prima dell'I/O.
;;; SHARED: CAS/ring del controller esistente; nessuna modifica a worker, scheduler o WAL.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-IDX-001
(declaim (ftype (function (integer integer integer integer integer) null) verifica-budget-attivo))
(defun verifica-budget-attivo (pages puts records bytes budget)
  \"Pre: configurazione esplicita prima dei compiti. Post: budget finiti rappresentabili.
INVALID-ARGUMENT prima di creare capacità o array; non cambia limiti dei documenti.\"
  (unless (and (<= 1 pages +active-max-pages+) (<= 1 puts #xffffffff)
               (<= 1 records arcdocdb.wal::+max-lotto-records+)
               (<= arcdocdb.wal::+seal-total+ bytes arcdocdb.wal::+max-lotto-bytes+)
               (<= 0 budget most-positive-fixnum))
    (error 'invalid-argument :reason :active-configuration))
  nil)

;;; REQ: REQ-WAL-006 REQ-FOR-001 REQ-AFF-008
(declaim (ftype (function (controllore-serie t segmento-get
                         &key (:max-pages integer) (:max-puts integer) (:batch-records integer)
                              (:batch-bytes integer) (:budget-payload integer)) sorgente-get-attiva)
                crea-sorgente-get-attiva))
(defun crea-sorgente-get-attiva (controller lease segment
                                &key (max-pages 65536) (max-puts 1048576) (batch-records 65536)
                                     (batch-bytes 67108864) (budget-payload 67108864))
  \"Pre: lease, nuovo ACTIVE con header verificato nel pool I/O; append/readonly dello STESSO file.
Post: sorgente locale pronta, nessun I/O/frontiera/pubblicazione. Header/id/versione confrontati.
INVALID-ARGUMENT per associazione/root già avviata; salute/invarianti propagano dal controller.
Il caller conserva FD e associazione fisica fino al reclaim, che non è attestato dal solo header.\"
  (verifica-budget-attivo max-pages max-puts batch-records batch-bytes budget-payload)
  (arcdocdb.series::%check-owner controller lease) (arcdocdb.series::%require-healthy controller)
  (let ((log (arcdocdb.series::controllore-serie-log controller)))
    (verifica-log-segmento log)
    (unless (and (zerop (segmento-get-high segment)) (plusp (segmento-get-low segment))
                 (= (segmento-get-origin segment) +writer-origin+)
                 (= (segmento-get-low segment) (arcdocdb.wal::log-io-file-id log))
                 (= (segmento-get-version segment) (arcdocdb.wal::log-io-version log)))
      (error 'invalid-argument :reason :active-source-identity)))
  (unless (and (eq (mode-file (segmento-get-file segment)) :input)
               (eq (stato-file (segmento-get-file segment)) :open))
    (error 'invalid-argument :reason :active-source-file))
  (unless (and (null (arcdocdb.series::controllore-serie-planned-root controller))
               (zerop (arcdocdb.series::controllore-serie-count controller))
               (= (arcdocdb.series::controllore-serie-next-offset controller) +segment-header-bytes+))
    (error 'invalid-argument :reason :active-source-started))
  (%make-sorgente-get-attiva controller segment max-pages max-puts batch-records batch-bytes budget-payload))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva (or null radice-get-attiva) index u32) null)
                verifica-delta-attivo))
(defun verifica-delta-attivo (source previous start puts)
  \"Pre: root pianificata/lotto verificati. Post: contiguità, cardinalità e picco autorizzati prima degli array.
Picco = payload precedente + 24/new PUT + quattro vettori da 128 byte; nessuna copia dei vecchi PUT.
Esclude altre radici trattenute/eventi/oggetti: budget complessivo resta al controller.
INVALID-ARGUMENT per fonte/offset, RESOURCE-EXHAUSTED per saturazione, senza adozione.\"
  (when previous
    (unless (eq (radice-get-attiva-source previous) source)
      (error 'invalid-argument :reason :active-root-source)))
  (unless (= start (if previous (radice-get-attiva-end previous) +segment-header-bytes+))
    (error 'invalid-argument :reason :active-root-frontier))
  (when (>= (if previous (radice-get-attiva-count previous) 0) (sorgente-get-attiva-max-pages source))
    (error 'resource-exhausted :reason :active-page-budget))
  (when (> puts (- (sorgente-get-attiva-max-puts source) (if previous (radice-get-attiva-puts previous) 0)))
    (error 'resource-exhausted :reason :active-put-budget))
  (when (> (+ (if previous (payload-radice-get-attiva previous) 0) (* +active-row-payload+ puts)
              (* +active-directory-levels+ +active-node-payload+)) (sorgente-get-attiva-budget source))
    (error 'resource-exhausted :reason :active-payload-budget))
  nil)

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva (or null radice-get-attiva) lotto u32 t) radice-get-attiva)
                costruisci-delta-attivo))
(defun costruisci-delta-attivo (source previous batch puts content)
  \"Pre: delta ammesso e buffer sealed stabile. Post: root privata condividendo solo pagine immutabili.
Costruisce una pagina, quattro vettori e una root per lotto, senza catena di root precedenti.
Invarianti o allocazione incompleta non espongono la root e non adottano il lotto.\"
  (verifica-delta-attivo source previous (inizio-lotto batch) puts)
  (let* ((rows (make-array (* puts +row-words+) :element-type '(unsigned-byte 32) :initial-element 0))
         (end (+ (inizio-lotto batch) (lunghezza-lotto batch)))
         (rank (if previous (radice-get-attiva-count previous) 0)))
    (copia-put-attivi source batch rows)
    (multiple-value-bind (directory added)
        (appendi-pagina-attiva (if previous (radice-get-attiva-directory previous) nil) rank
                              (%make-mappa-segmento-get (sorgente-get-attiva-segment source) end rows)
                              +active-directory-shift+)
      (%make-radice-get-attiva source directory (1+ rank)
                              (+ puts (if previous (radice-get-attiva-puts previous) 0))
                              (+ added (if previous (radice-get-attiva-nodes previous) 0)) end content))))

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-IDX-001 REQ-AFF-001
(declaim (ftype (function (sorgente-get-attiva t lotto (or null radice-get-attiva) t
                          (member :async :group :strong)) (values commit-serie index radice-get-attiva &optional))
                registra-lotto-get-attivo))
(defun registra-lotto-get-attivo (source lease batch previous content level)
  \"Pre: lease e lotto SEALED con token CSN, prima dell'I/O; content/grafo del caller immutabili.
Post: evento/generation catturati e root pianificata; NON ancora acquisibile dai reader.
Il normale PUBBLICA-COMMIT-SERIE verifica copertura/durability e CAS prima di esporre la root.
Rifiuti pre-adozione conservano lotto/CSN al caller; interruzione nell'adozione => fail-stop Archivio.\"
  (let ((controller (sorgente-get-attiva-controller source)))
    (arcdocdb.series::%check-owner controller lease) (arcdocdb.series::%require-healthy controller)
    (arcdocdb.series::%check-admission controller batch previous level)
    (arcdocdb.series::%capture-token controller batch)
    (handler-case
        (let* ((puts (verifica-lotto-attivo source batch))
               (root (costruisci-delta-attivo source previous batch puts content)))
          (multiple-value-bind (event generation) (registra-commit-serie controller lease batch previous root level)
            (values event generation root)))
      ;; Il buffer sealed è del writer: integrità/forma impossibili sono un guasto interno.
      (corruption-detected (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition))
      (invariant-violation (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition)))))
")
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256 "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b" :GIT-BLOB
   "70341c7c32b364603d38bdc42e8b3af1cc631773" :TEXT
   ";;; OWNER: writer costruisce al più quattro nuovi vettori, senza mutare quelli pubblicati.
;;; SHARED: struttura persistente per Serie; reader percorre soltanto riferimenti immutabili.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-008 REQ-AFF-002
(declaim (ftype (function ((or null simple-vector)) null) verifica-nodo-attivo))
(defun verifica-nodo-attivo (node)
  \"Pre: nodo NIL o vettore interno. Post: geometria di sedici figli validata prima dell'accesso.
INVARIANT-VIOLATION per forma impossibile; nessuna mutazione o attesa.\"
  (unless (or (null node) (= (length node) +active-directory-width+))
    (error 'invariant-violation :reason :active-directory-shape))
  nil)

;;; REQ: REQ-IDX-001 REQ-AFF-008 REQ-AFF-002
(declaim (ftype (function ((or null simple-vector) (integer 0 65535) mappa-segmento-get
                          (member 0 4 8 12)) (values simple-vector index &optional))
                appendi-pagina-attiva))
(defun appendi-pagina-attiva (node rank page shift)
  \"Pre: rank libero, shift 12/8/4/0 e nodo immutabile. Post: nuovo cammino, vecchio intatto.
Ricorsione ESATTAMENTE quattro livelli al massimo; sedici copie/level, nessuna scansione storica.
Secondo valore: nuovi nodi nella vista, esclude copie che sostituiscono nodi già esistenti.
INVARIANT-VIOLATION per foglia occupata/geometria; array privati non esposti su errore.\"
  (verifica-nodo-attivo node)
  (let* ((slot (ldb (byte 4 shift) rank))
         (copy (if node (copy-seq node) (make-array +active-directory-width+ :initial-element nil)))
         (added (if node 0 1)))
    (declare (type simple-vector copy) (type index added))
    (if (zerop shift)
        (progn
          (when (svref copy slot) (error 'invariant-violation :reason :active-directory-occupied))
          (setf (svref copy slot) page))
        (multiple-value-bind (child delta)
            (appendi-pagina-attiva (svref copy slot) rank page (- shift 4))
          (setf (svref copy slot) child) (incf added delta)))
    (unless (<= added +active-directory-levels+)
      (error 'invariant-violation :reason :active-directory-growth))
    (values copy added)))

;;; REQ: REQ-IDX-001 REQ-AFF-002 REQ-CMP-007
(declaim (ftype (function (contesto-get radice-get-attiva (integer 0 65535)) mappa-segmento-get)
                pagina-attiva))
(defun pagina-attiva (context root rank)
  \"Pre: CANDIDATE, root acquisita sotto EBR, rank nella vista. Post: pagina esatta in quattro accessi.
Forma/figlio/foglia impossibili rendono GET FAULTED; nessun I/O, allocazione esplicita o retry.\"
  (unless (< rank (radice-get-attiva-count root)) (guasto-get context :active-page-rank))
  (let ((node (radice-get-attiva-directory root)))
    (declare (type t node))
    (loop for shift of-type fixnum from +active-directory-shift+ downto 0 by 4
          do (unless (and (typep node 'simple-vector) (= (length node) +active-directory-width+))
               (guasto-get context :active-directory-shape))
             (setf node (svref node (ldb (byte 4 shift) rank))))
    (unless (typep node 'mappa-segmento-get) (guasto-get context :active-page-type))
    node))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get radice-get-attiva u32) mappa-segmento-get) trova-pagina-attiva))
(defun trova-pagina-attiva (context root offset)
  \"Pre: root pubblicata sotto EBR. Post: prima pagina con fine maggiore dell'offset.
Al più diciassette confronti, ciascuno con quattro accessi; poi lookup PUT separato.
Location oltre frontiera/mancante è un guasto, mai assenza del documento.\"
  (unless (<= +segment-header-bytes+ offset (1- (radice-get-attiva-end root)))
    (guasto-get context :active-location-frontier))
  (let ((left 0) (right (radice-get-attiva-count root)))
    (declare (type (integer 0 65536) left right))
    (loop repeat +active-page-attempts+
          do (when (= left right)
               (unless (< left (radice-get-attiva-count root)) (guasto-get context :active-page-absent))
               (return-from trova-pagina-attiva (pagina-attiva context root left)))
             (let* ((middle (+ left (floor (- right left) 2))) (page (pagina-attiva context root middle)))
               (if (<= (mappa-segmento-get-end page) offset) (setf left (1+ middle)) (setf right middle))))
    ;; N=65536 può usare tutti i diciassette confronti: controllare anche la convergenza finale.
    (unless (and (= left right) (< left (radice-get-attiva-count root)))
      (guasto-get context :active-page-search-bound))
    (pagina-attiva context root left)))
")
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256 "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9" :GIT-BLOB
   "bd75d3a4b7483900689417ae3eb2dd65e76c8468" :TEXT
   ";;; OWNER: writer con lease verifica il lotto OPEN prima di assegnare CSN o adottare un evento.
;;; SHARED: nessuna prenotazione/radice mutata; header del solo lotto locale.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-005 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto) u32) conta-put-aperti-attivi))
(defun conta-put-aperti-attivi (source batch)
  \"Pre: OPEN esclusivo senza token, count/byte entro budget. Post: header/forma ordinari e count esatti.
Al più count header, nessuna verifica body o attestazione di commit; CSN verrà fissato dal SEAL.
Prepared/OUTCOME validi rifiutati prima del CSN; integrità completa ripetuta solo dopo la chiusura.\"
  (let ((pos 0) (puts 0) (buffer (arcdocdb.wal::lotto-buffer batch))
        (end (lunghezza-lotto batch)) (version (segmento-get-version (sorgente-get-attiva-segment source))))
    (declare (type u32 pos puts))
    (dotimes (i (arcdocdb.wal::lotto-count batch))
      (multiple-value-bind (next kind flags ks vs ve)
          (checked-header buffer pos end version +max-document-bytes+)
        (declare (ignore ks vs ve)) ; lunghezze/forma già controllate, non esiti.
        (unless (< pos next (1+ end)) (error 'invariant-violation :reason :active-open-progress))
        (when (logtest flags +prepared+) (error 'invalid-argument :reason :active-prepared-unsupported))
        (case kind
          (#.+put+ (incf puts)) (#.+tombstone+ nil)
          (#.+outcome+ (error 'invalid-argument :reason :active-outcome-unsupported))
          (otherwise (error 'invariant-violation :reason :active-open-kind)))
        (setf pos next)))
    (unless (= pos end) (error 'invariant-violation :reason :active-open-count))
    puts))

;;; REQ: REQ-WAL-005 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto index) null) verifica-misure-aperte-attive))
(defun verifica-misure-aperte-attive (source batch start)
  \"Pre: OPEN senza token. Post: ID/versione, count, byte compreso SEAL e spazio segmento ammessi.
Rifiuti prima del CSN; nessun buffer/evento/indice mutato, nessun I/O o allocazione di array.\"
  (let* ((segment (sorgente-get-attiva-segment source))
         (size (+ (lunghezza-lotto batch) arcdocdb.wal::+seal-total+)))
    (unless (and (= (arcdocdb.wal::lotto-file-id batch) (segmento-get-low segment))
                 (= (arcdocdb.wal::lotto-version batch) (segmento-get-version segment)))
      (error 'invalid-argument :reason :active-batch-identity))
    (when (zerop (arcdocdb.wal::lotto-count batch)) (error 'invalid-argument :reason :active-open-empty))
    (when (> (arcdocdb.wal::lotto-count batch) (sorgente-get-attiva-batch-records source))
      (error 'resource-exhausted :reason :active-batch-record-budget))
    (when (> size (sorgente-get-attiva-batch-bytes source))
      (error 'resource-exhausted :reason :active-batch-byte-budget))
    (unless (<= +segment-header-bytes+ start (- +segment-max-bytes+ size))
      (error 'resource-exhausted :reason :active-segment-budget)))
  nil)

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-IDX-001 REQ-AFF-008 REQ-AFF-001
(declaim (ftype (function (sorgente-get-attiva t lotto (or null radice-get-attiva)) u32)
                verifica-capienza-get-attiva))
(defun verifica-capienza-get-attiva (source lease batch previous)
  \"Pre: lease esclusiva, lotto OPEN senza token; chiamare PRIMA di sigilla-lotto-con-csn.
Post: ring, forma supportata, contiguità e picco ammessi; ritorna numero PUT, niente prenotazione.
Mantenere lease, contenuto e previous stabili fino a sigillatura/adozione, che ricontrolla tutto.
Rifiuti senza CSN/evento; integrità/invarianti interne => FAULTED Archivio, causa originale propagata.\"
  (let ((controller (sorgente-get-attiva-controller source)))
    (arcdocdb.series::%check-owner controller lease) (arcdocdb.series::%require-healthy controller)
    (handler-case
        (arcdocdb.wal::esigi-lotto batch :open)
      (invariant-violation (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition)))
    (when (arcdocdb.wal::lotto-csn-registry batch) (error 'invalid-argument :reason :active-open-bound))
    (unless (eq previous (arcdocdb.series::controllore-serie-planned-root controller))
      (error 'invalid-argument :reason :active-root-order))
    (when (= (arcdocdb.series::controllore-serie-count controller)
             (length (arcdocdb.series::controllore-serie-slots controller)))
      (error 'resource-exhausted :reason :serie-full))
    (when (= (arcdocdb.series::controllore-serie-event-generation controller) most-positive-fixnum)
      (error 'resource-exhausted :reason :serie-event-generation))
    (handler-case
        (let ((start (arcdocdb.series::controllore-serie-next-offset controller)))
          (verifica-misure-aperte-attive source batch start)
          (let ((puts (conta-put-aperti-attivi source batch)))
            (verifica-delta-attivo source previous start puts)
            puts))
      (corruption-detected (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition))
      (invariant-violation (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition)))))
")
  (:PATH
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256 "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0" :GIT-BLOB
   "49bbcd30fdf96963702148cd675d5d3066189309" :TEXT
   ";;; OWNER: worker GET nel proprio EBR acquisisce la radice pubblicata, mai quella pianificata.
;;; SHARED: sola lettura controller locale/directory/righe; nessun lock o scrittura inter-Serie.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get sorgente-get-attiva)
                         (values segmento-get u32 u8 null &optional)) risolvi-candidato-attivo-get))
(defun risolvi-candidato-attivo-get (context source)
  \"Pre: CANDIDATE sotto EBR, sorgente associata al segmento del candidato.
Post: solo root effettivamente pubblicata dal controller con barriera acquire, prova NIL per ordinario.
Niente file-size/posizione scritta/H come frontiera; il resolver comune verifica riga, CSN, FD e range.
Errori/uscite non locali liberano EBR; salute controller propagata, invarianti rendono GET FAULTED.\"
  (esigi-stato-get context :candidate)
  (let ((complete nil))
    (unwind-protect
         (progn
           (unless (eq (segmento-get-owner (sorgente-get-attiva-segment source)) (contesto-get-view context))
             (error 'invalid-argument :reason :active-source-owner))
           (let ((root (leggi-radice-serie (sorgente-get-attiva-controller source))))
             (unless (and (typep root 'radice-get-attiva) (eq (radice-get-attiva-source root) source))
               (guasto-get context :active-published-root))
             (let ((page (trova-pagina-attiva context root (ldb (byte 32 0) (aref (contesto-get-content context) 1)))))
               (multiple-value-bind (segment end flags proof) (risolvi-candidato-get context page)
                 (when proof (guasto-get context :active-unexpected-proof))
                 (setf complete t)
                 (values segment end flags nil)))))
      (unless complete (abbandona-get context)))))

;;; REQ: REQ-CCH-002 REQ-IDX-001 REQ-WAL-006
(declaim (ftype (function (contesto-get sorgente-get-attiva)
                         (member :hit :miss :verify-failed :disabled :proof-required :buffer-required))
                sonda-cache-attiva-get))
(defun sonda-cache-attiva-get (context source)
  \"Pre: CANDIDATE dopo AVVIA-GET sotto EBR. Post: sonda GET con pagina ordinaria pubblicata.
Nessun I/O/heap esplicito; il risultato resta provvisorio fino a copia e CONCLUDI-GET.\"
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-attivo-get context source)
    (declare (ignore proof)) ; NIL già verificato: nessun esito d'errore scartato.
    (sonda-cache-get context segment end flags)))

;;; REQ: REQ-CCH-002 REQ-IDX-001 REQ-CON-004 REQ-WAL-006
(declaim (ftype (function (contesto-get sorgente-get-attiva)
                         (values (member :cache :segment :buffer-required)
                                 (member :hit :miss :verify-failed :disabled :not-attempted)
                                 (member :inserted :present :busy :unavailable :bypassed :not-attempted)
                                 boolean boolean &optional)) leggi-record-attivo-get))
(defun leggi-record-attivo-get (context source)
  \"Pre: nuovo AVVIA-GET nel pool I/O e sorgente acquisita nella nuova epoca.
Post: lettura/cache dal FD readonly, byte soltanto entro la pagina pubblicata del candidato.
Non migra pin né autorizza risposta; copia e verifica finale con tempo fresco restano obbligatorie.\"
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-attivo-get context source)
    (leggi-record-get context segment end flags :outcome-offset proof)))
")
  (:PATH
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256 "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067" :GIT-BLOB
   "5ae454c03e8a9b9196653c8b28df0727e480d142" :TEXT
   ";;; OWNER: writer possiede il lotto SEALED prima dell'adozione/dispatch; copia solo metadati.
;;; SHARED: nessun indice/FD modificato; la verifica in memoria non prova write o fsync.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (octets u32 (member 1 2) u32) u32) conta-put-attivi))
(defun conta-put-attivi (buffer end version records)
  \"Pre: lotto interamente verificato/stabile, count SEAL noto. Post: numero PUT ordinari.
Prepared/OUTCOME validi sono rifiutati esplicitamente come integrazione non ancora supportata.
Al più records+1 header; RESOURCE/INVALID/INVARIANT propagati, nessuna copia del valore.\"
  (let ((pos 0) (puts 0))
    (declare (type u32 pos puts))
    (dotimes (i (1+ records))
      (multiple-value-bind (next kind flags) (prossima-cornice-resolver buffer pos end version)
        (when (logtest flags +prepared+)
          (error 'invalid-argument :reason :active-prepared-unsupported))
        (case kind
          (#.+put+ (incf puts)) (#.+tombstone+ nil)
          (#.+outcome+ (error 'invalid-argument :reason :active-outcome-unsupported))
          (#.+seal+
           (unless (and (= i records) (= next end))
             (error 'invariant-violation :reason :active-seal-position))
           (return-from conta-put-attivi puts))
          (otherwise (error 'invariant-violation :reason :active-frame-kind)))
        (setf pos next)))
    (error 'invariant-violation :reason :active-scan-bound)))

;;; REQ: REQ-WAL-005 REQ-FOR-003 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto) u32) verifica-lotto-attivo))
(defun verifica-lotto-attivo (source batch)
  \"Pre: lease e token già controllati, lotto sealed esclusivo. Post: CRC/SEAL/CSN esatti e PUT contati.
Legge soltanto il nuovo lotto: non rilegge l'ACTIVE e non assume EOF o durability.
Errori tipizzati prima dell'adozione; i byte non vengono trattenuti nel risultato.\"
  (verifica-ritiro-lotto batch)
  (let* ((segment (sorgente-get-attiva-segment source)) (size (lunghezza-lotto batch))
         (start (inizio-lotto batch)) (buffer (arcdocdb.wal::lotto-buffer batch)))
    (unless (and (= (arcdocdb.wal::lotto-file-id batch) (segmento-get-low segment))
                 (= (arcdocdb.wal::lotto-version batch) (segmento-get-version segment)))
      (error 'invalid-argument :reason :active-batch-identity))
    (unless (<= +segment-header-bytes+ start (- +segment-max-bytes+ size))
      (error 'resource-exhausted :reason :active-segment-budget))
    (when (> size (sorgente-get-attiva-batch-bytes source))
      (error 'resource-exhausted :reason :active-batch-byte-budget))
    (multiple-value-bind (next stamp durable count)
        (verifica-lotto buffer 0 size (segmento-get-low segment) :version (segmento-get-version segment)
                        :file-offset start :max-records (sorgente-get-attiva-batch-records source)
                        :max-bytes (sorgente-get-attiva-batch-bytes source))
      (unless (and (= next size) (= count (arcdocdb.wal::lotto-count batch)) (<= durable start))
        (error 'invariant-violation :reason :active-batch-result))
      (multiple-value-bind (slot high low) (leggi-csn-lotto batch)
        (declare (ignore slot)) ; identità del token già verificata dal controller, non un esito.
        (unless (and (= high (ldb (byte 32 32) stamp)) (= low (ldb (byte 32 0) stamp)))
          (error 'invariant-violation :reason :active-batch-csn)))
      (conta-put-attivi buffer size (segmento-get-version segment) count))))

;;; REQ: REQ-IDX-001 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto resolver-words) null) copia-put-attivi))
(defun copia-put-attivi (source batch rows)
  \"Pre: lotto ordinario già verificato, buffer stabile, righe private esattamente dimensionate.
Post: offset assoluti/size/flag/CSN copiati, proof zero; nessun riferimento a byte/evento riusabili.
Al più count+1 header; INVARIANT-VIOLATION per count/range, nessuna pubblicazione parziale.\"
  (unless (zerop (mod (length rows) +row-words+))
    (error 'invariant-violation :reason :active-row-shape))
  (let ((pos 0) (used 0) (buffer (arcdocdb.wal::lotto-buffer batch))
        (end (lunghezza-lotto batch)) (start (inizio-lotto batch))
        (version (segmento-get-version (sorgente-get-attiva-segment source))))
    (declare (type u32 pos) (type index used))
    (loop repeat (1+ (arcdocdb.wal::lotto-count batch))
          do (multiple-value-bind (next kind flags) (prossima-cornice-resolver buffer pos end version)
               (when (= kind +seal+)
                 (unless (and (= next end) (= used (length rows)))
                   (error 'invariant-violation :reason :active-row-count))
                 (return-from copia-put-attivi nil))
               (when (= kind +put+)
                 (unless (<= (+ used +row-words+) (length rows))
                   (error 'invariant-violation :reason :active-row-count))
                 (setf (aref rows (+ used +row-offset+)) (+ start pos)
                       (aref rows (+ used +row-size+)) (- next pos)
                       (aref rows (+ used +row-flags+)) flags
                       (aref rows (+ used +row-csn-low+)) (leggi-u32 buffer (+ pos +stamp-offset+))
                       (aref rows (+ used +row-csn-high+)) (leggi-u32 buffer (+ pos +stamp-offset+ 4)))
                 (incf used +row-words+))
               (setf pos next)))
    (error 'invariant-violation :reason :active-scan-bound)))
")
  (:PATH
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256 "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee" :GIT-BLOB
   "17e5ad4e2206e280c3f7324adc5c8a1e50e232e0" :TEXT
   ";;; OWNER: writer con lease costruisce; ogni radice e pagina completata è immutabile.
;;; SHARED: radice locale della Serie via CAS esistente; GET non modifica il grafo.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(defconstant +active-directory-width+ 16)
(defconstant +active-directory-levels+ 4)
(defconstant +active-directory-shift+ 12)
(defconstant +active-max-pages+ 65536)
(defconstant +active-page-attempts+ 17)
(defconstant +active-node-payload+ 128) ; sedici riferimenti, runtime SBCL a 64 bit.
(defconstant +active-row-payload+ (* 4 +row-words+))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(defstruct (sorgente-get-attiva
             (:constructor %make-sorgente-get-attiva
                 (controller segment max-pages max-puts batch-records batch-bytes budget)) (:copier nil))
  \"Pre: controller e FD readonly del medesimo nuovo ACTIVE, associazione fisica del caller.
Post: capacità/configurazione possedute e immutabili, nessuna frontiera inventata.
Creazione prima dei compiti; il FD vive fino al reclaim EBR dell'ultima radice.\"
  (controller nil :type controllore-serie :read-only t)
  (segment nil :type segmento-get :read-only t)
  (max-pages 1 :type (integer 1 65536) :read-only t)
  (max-puts 1 :type u32 :read-only t)
  (batch-records 1 :type u32 :read-only t)
  (batch-bytes 56 :type u32 :read-only t)
  (budget 0 :type index :read-only t))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(defstruct (radice-get-attiva
             (:constructor %make-radice-get-attiva (source directory count puts nodes end content)) (:copier nil))
  \"Pre: delta verificato copiato e directory persistente privata; root non ancora pubblicata.
Post: niente riferimenti al lotto/evento riusabili o alla radice precedente.
Solo il CAS del controller dopo copertura WAL autorizza il reader ad acquisire questa vista.\"
  (source nil :type sorgente-get-attiva :read-only t)
  (directory #() :type simple-vector :read-only t)
  (count 1 :type (integer 1 65536) :read-only t)
  (puts 0 :type u32 :read-only t)
  (nodes 4 :type index :read-only t)
  (end 64 :type u32 :read-only t)
  (content nil :type t :read-only t))

;;; REQ: REQ-WAL-006 REQ-IDX-001
(declaim (ftype (function (radice-get-attiva) t) contenuto-radice-get-attiva)
         (ftype (function (radice-get-attiva) index) payload-radice-get-attiva))
(defun contenuto-radice-get-attiva (root)
  \"Pre: root preparata o acquisita sotto EBR. Post: payload immutabile del caller.
Non attesta pubblicazione, coerenza dell'indice concreto o lifetime delle risorse esterne.\"
  (radice-get-attiva-content root))

;;; REQ: REQ-AFF-008 REQ-IDX-001
(defun payload-radice-get-attiva (root)
  \"Pre: root completa. Post: 24 byte/PUT più 128 byte/nodo nella vista, su SBCL 64 bit.
Esclude header/oggetti Lisp, radici ritirate, FD, lotto e payload del caller; non misura RSS.\"
  (+ (* +active-row-payload+ (radice-get-attiva-puts root))
     (* +active-node-payload+ (radice-get-attiva-nodes root))))
")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256 "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c" :GIT-BLOB
   "55028dae42a3ce1050d6872665c3c3ba6aa3f74d" :TEXT
   ";;; OWNER: controller associa manifest, vista e file CLOSED della stessa Serie.
;;; SHARED: mappe immutabili sotto EBR; nessuna scrittura condivisa sul GET.
;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-CMP-007 REQ-AFF-008
(defpackage #:arcdocdb.get.resolver
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:octets #:index #:u8 #:u32 #:u64 #:leggi-u32 #:check-range)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation #:corruption-detected)
  (:import-from #:arcdocdb.record #:+header-bytes+ #:+put+ #:+tombstone+
                #:+outcome+ #:+seal+ #:+prepared+ #:+stamp-offset+ #:+max-document-bytes+
                #:verifica-cornice #:verifica-lotto #:allowed-flags #:checked-header)
  (:import-from #:arcdocdb.storage.format #:+segment-header-bytes+
                #:+segment-max-bytes+ #:+writer-origin+ #:+compaction-origin+
                #:verifica-segmento-compattato)
  (:import-from #:arcdocdb.io #:file-io #:leggi-esatto #:mode-file #:stato-file)
  (:import-from #:arcdocdb.recovery.manifest #:manifest #:trova-segmento)
  ;; Ponte locale: soltanto l'adozione/pubblicazione esistente rende leggibile la radice ACTIVE.
  (:import-from #:arcdocdb.series #:controllore-serie #:commit-serie
                #:registra-commit-serie #:leggi-radice-serie)
  (:import-from #:arcdocdb.wal #:lotto #:inizio-lotto #:lunghezza-lotto
                #:verifica-ritiro-lotto #:leggi-csn-lotto #:verifica-log-segmento)
  ;; Interfacce interne del nucleo GET: stesso contratto e dominio EBR, senza duplicarlo.
  (:import-from #:arcdocdb.get #:vista-get-serie #:segmento-get #:contesto-get
                #:crea-segmento-get #:segmento-get-owner #:segmento-get-file
                #:segmento-get-low #:segmento-get-high #:segmento-get-origin
                #:segmento-get-version #:vista-get-serie-identity
                #:contesto-get-view #:contesto-get-content #:esigi-stato-get
                #:guasto-get #:verifica-target-get #:verifica-prova-target-get
                #:abbandona-get #:sonda-cache-get #:leggi-record-get)
  (:export #:mappa-segmento-get #:crea-mappa-segmento-get #:payload-mappa-segmento-get
           #:risolvi-candidato-get #:sonda-cache-risolta-get #:leggi-record-risolto-get
           #:sorgente-get-attiva #:crea-sorgente-get-attiva #:radice-get-attiva
           #:verifica-capienza-get-attiva #:registra-lotto-get-attivo
           #:contenuto-radice-get-attiva #:payload-radice-get-attiva
           #:risolvi-candidato-attivo-get #:sonda-cache-attiva-get #:leggi-record-attivo-get))
")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256 "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d" :GIT-BLOB
   "1177496e5baca7f7c698156e196c60fe1fe2566a" :TEXT
   ";;; OWNER: worker GET acquisisce la mappa dal controller sotto l'epoca corrente.
;;; SHARED: solo lettura di array posseduti dalla Serie; nessun lock, contatore o attesa.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get resolver-words u32) index) trova-riga-resolver))
(defun trova-riga-resolver (context rows offset)
  \"Pre: CANDIDATE sotto EBR, righe immutabili ordinate per offset. Post: base del PUT esatto.
Assenza non significa documento assente: location già pubblicata senza riga rende FAULTED.
Al più 33 passi su cardinalità u32; nessuna allocazione esplicita o I/O.\"
  (unless (zerop (mod (length rows) +row-words+)) (guasto-get context :resolver-row-shape))
  (let ((left 0) (right (floor (length rows) +row-words+)))
    (declare (type u32 left right))
    (loop repeat +binary-attempts+
          do (when (= left right) (guasto-get context :resolver-location-absent))
             (let* ((middle (+ left (floor (- right left) 2))) (base (* middle +row-words+))
                    (actual (aref rows (+ base +row-offset+))))
               (cond
                 ((< actual offset) (setf left (1+ middle)))
                 ((> actual offset) (setf right middle))
                 (t (return-from trova-riga-resolver base)))))
    (guasto-get context :resolver-row-search-bound)))

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get resolver-words index) null) verifica-parole-resolver))
(defun verifica-parole-resolver (context rows base)
  \"Pre: riga completa individuata sotto EBR. Post: lunghezza canonica e CSN in entrambe le word.
Ogni discordanza col candidato rende GET FAULTED; nessun boxing u64 necessario.\"
  (let ((content (contesto-get-content context)))
    (unless (and (= (aref rows (+ base +row-size+)) (ldb (byte 32 0) (aref content 3)))
                 (zerop (ldb (byte 32 32) (aref content 3))))
      (guasto-get context :resolver-candidate-size))
    (unless (and (= (aref rows (+ base +row-csn-low+)) (ldb (byte 32 0) (aref content 0)))
                 (= (aref rows (+ base +row-csn-high+)) (ldb (byte 32 32) (aref content 0))))
      (guasto-get context :resolver-candidate-csn)))
  nil)

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get mappa-segmento-get index)
                         (values u8 (or null u32) &optional)) verifica-riga-resolver))
(defun verifica-riga-resolver (context map base)
  \"Pre: riga individuata sotto la stessa epoca del candidato. Post: size/CSN/flag e prova concordi.
LIVE del primary non viene interpretato come flag storage; prova zero solo per ordinario.
Ogni discordanza rende GET FAULTED; il confine worker deve isolare la Serie.\"
  (let* ((rows (mappa-segmento-get-rows map))
         (flags (aref rows (+ base +row-flags+))) (proof (aref rows (+ base +row-proof+))))
    (verifica-parole-resolver context rows base)
    (unless (and (typep flags 'u8) (zerop (logand flags (logxor 255 (allowed-flags +put+)))))
      (guasto-get context :resolver-row-flags))
    (if (logtest flags +prepared+)
        (when (zerop proof) (guasto-get context :resolver-missing-outcome))
        (unless (zerop proof) (guasto-get context :resolver-unexpected-outcome)))
    (verifica-target-get context (mappa-segmento-get-segment map) (mappa-segmento-get-end map) flags)
    (let ((offset (if (zerop proof) nil proof)))
      (unless (eq (verifica-prova-target-get context (mappa-segmento-get-end map) flags offset)
                  (logtest flags +prepared+))
        (guasto-get context :resolver-proof-state))
      (values (the u8 flags) offset))))

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get mappa-segmento-get)
                         (values segmento-get u32 u8 (or null u32) &optional)) risolvi-candidato-get))
(defun risolvi-candidato-get (context map)
  \"Pre: CANDIDATE, mappa CLOSED o pagina ACTIVE pubblicata acquisita DOPO AVVIA-GET sotto EBR.
Post: capacità, valid-bytes, flag e offset OUTCOME/NIL, solo per posizione/CSN concordi.
Non autorizza il valore: GET verifica ancora CRC/chiave/CSN e prova durevole dal file.
Errori/uscite non locali liberano EBR; ordine errato rifiutato prima di assumere il cleanup.\"
  (esigi-stato-get context :candidate)
  (let ((complete nil))
    (unwind-protect
         (let* ((segment (mappa-segmento-get-segment map)) (content (contesto-get-content context))
                (location (aref content 1)))
           (declare (type u64 location))
           (unless (eq (segmento-get-owner segment) (contesto-get-view context))
             (error 'invalid-argument :reason :resolver-source-owner))
           (unless (and (zerop (segmento-get-high segment))
                        (= (segmento-get-low segment) (ldb (byte 32 32) location)))
             (guasto-get context :resolver-source-segment))
           (unless (and (eq (mode-file (segmento-get-file segment)) :input)
                        (eq (stato-file (segmento-get-file segment)) :open))
             (guasto-get context :resolver-source-lifetime))
           (let ((base (trova-riga-resolver context (mappa-segmento-get-rows map)
                                           (ldb (byte 32 0) location))))
             (multiple-value-bind (flags proof) (verifica-riga-resolver context map base)
               (setf complete t)
               (values segment (mappa-segmento-get-end map) flags proof))))
      (unless complete (abbandona-get context)))))

;;; REQ: REQ-CCH-002 REQ-FOR-004 REQ-CMP-007
(declaim (ftype (function (contesto-get mappa-segmento-get)
                         (member :hit :miss :verify-failed :disabled :proof-required :buffer-required))
                sonda-cache-risolta-get))
(defun sonda-cache-risolta-get (context map)
  \"Pre: CANDIDATE e mappa nella stessa epoca. Post: esito del nucleo GET con flag/frontiera risolti.
Nessun I/O; prepared richiede ancora prova dal pool I/O. Propaga errori e cleanup del GET.\"
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-get context map)
    (declare (ignore proof)) ; dato verificato dal resolver, nessun esito d'errore scartato.
    (sonda-cache-get context segment end flags)))

;;; REQ: REQ-CCH-002 REQ-FOR-004 REQ-CMP-007 REQ-CON-004
(declaim (ftype (function (contesto-get mappa-segmento-get)
                         (values (member :cache :segment :buffer-required)
                                 (member :hit :miss :verify-failed :disabled :not-attempted)
                                 (member :inserted :present :busy :unavailable :bypassed :not-attempted)
                                 boolean boolean &optional)) leggi-record-risolto-get))
(defun leggi-record-risolto-get (context map)
  \"Pre: nuovo AVVIA-GET nel pool I/O, nuova acquisizione della mappa sotto EBR.
Post: esiti del nucleo GET; OUTCOME riletto dal medesimo FD prima della cache prepared.
Propaga errori/cleanup; risposta privata fino a copia e CONCLUDI-GET con tempo fresco.\"
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-get context map)
    (leggi-record-get context segment end flags :outcome-offset proof)))
")
  (:PATH
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256 "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00" :GIT-BLOB
   "53438f156d3e1e15f3732ec840223231b308a7a5" :TEXT
   ";;; OWNER: pool I/O costruisce; controller pubblica e conserva fino al reclaim EBR.
;;; SHARED: array privati immutabili dopo il ritorno; nessun accessor pubblico.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-AFF-008
(defconstant +row-words+ 6)
(defconstant +row-offset+ 0)
(defconstant +row-size+ 1)
(defconstant +row-flags+ 2)
(defconstant +row-csn-low+ 3)
(defconstant +row-csn-high+ 4)
(defconstant +row-proof+ 5)
(defconstant +proof-words+ 5)
(defconstant +proof-txid-low+ 0)
(defconstant +proof-txid-high+ 1)
(defconstant +proof-csn-low+ 2)
(defconstant +proof-csn-high+ 3)
(defconstant +proof-offset+ 4)
(defconstant +radix-buckets+ 256)
(defconstant +binary-attempts+ 33)
(deftype resolver-words () '(simple-array (unsigned-byte 32) (*)))

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-CMP-007 REQ-AFF-008
(defstruct (mappa-segmento-get (:constructor %make-mappa-segmento-get (segment end rows)) (:copier nil))
  \"Pre: CLOSED attestato dal manifest oppure pagina di lotto ACTIVE verificato prima dell'adozione.
Post: tabella posseduta di soli PUT, ordinata per offset, immutabile e senza buffer sorgente.
Il controller pubblica prima delle location corrispondenti e protegge il FD con EBR.\"
  (segment nil :type segmento-get :read-only t)
  (end 0 :type u32 :read-only t)
  (rows #() :type resolver-words :read-only t))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (mappa-segmento-get) index) payload-mappa-segmento-get))
(defun payload-mappa-segmento-get (map)
  \"Pre: mappa completata. Post: payload degli array permanenti, 24 byte per PUT.
Esclude oggetti/header Lisp, capacità/FD e buffer del costruttore; non misura RSS.\"
  (* 4 (length (mappa-segmento-get-rows map))))
")))
