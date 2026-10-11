(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-SOURCE-BUNDLE :VERSION "v1" :SOURCES
 ((:PATH
   #A((113) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/src/execution/package.lisp")
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
   #A((113) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/src/execution/handoff.lisp")
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
   #A((117) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/src/series/worker-package.lisp")
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
   #A((116) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/src/series/routing-types.lisp")
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
   #A((116) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/src/series/routing-build.lisp")
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
   #A((117) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/src/series/routing-select.lisp")
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
   #A((99) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/arcdocdb.asd")
   :BYTES 11133 :SHA256 "a4852ba400f91c52af42df0143b921fbcb1895479d4e250f16d57ad8d65f7fb9"
   :GIT-BLOB "a4f52276482413bc0fec55229ccf93d72ffc3338" :TEXT
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
                             (:file \"cbor-write\")))
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
                             (:file \"inventory-query\"))))
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
                             (:file \"cbor-write-threads\") (:file \"cbor-write-roundtrip\")))
               (:module \"csn\" :serial t
                :components ((:file \"support\") (:file \"registry\") (:file \"threads\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"capture\")))
               (:module \"epochs\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"read\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
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
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
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
   #A((119) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/tests/series/worker-routing.lisp")
   :BYTES 27183 :SHA256 "f2b9b0cf5cc0400732864c12fb0483431a7d2ea1f1dfdafe5b1f3dbb4d4fe151"
   :GIT-BLOB "36306cfb66daa5ea7c88522584840d9d43ac2169" :TEXT
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
    (routing-phase-refusal table (list table))
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
           (displaced (make-array 1 :displaced-to valid-writers))
           (oversize (make-array 65537 :initial-element nil)))
      (dolist (pair (list (list nil valid-controllers) (list valid-writers nil)
                          (list (list writer) valid-controllers)
                          (list valid-writers (list controller))
                          (list \"x\" valid-controllers) (list adjustable valid-controllers)
                          (list displaced valid-controllers)
                          (list #() #()) (list oversize oversize)
                          (list valid-writers (vector controller controller))))
        (bridge-refusal (list f writer (first pair) (second pair))
                        (lambda () (arcdocdb.execution.series:crea-registro-worker-serie
                                     (first pair) (second pair)))
                        'invalid-argument :worker-serie-routing-configuration)))))

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
   #A((118) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/tools/worker-routing-bench.lisp")
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
   #A((117) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/docs/implementazione/README.md")
   :BYTES 6350 :SHA256 "992c370f55c979a7a5e5179cd993052640de7863230b37f9754c33b938661571" :GIT-BLOB
   "a5a34218ad23a073ef21f5e8c372f4bcd43c3779" :TEXT "# Implementazione

Fondazioni introdotte dopo la richiesta dell'autore del 2026-10-08 di iniziare la scrittura
del codice. L'autorizzazione non equivale alla chiusura dei criteri della Fase 0 o alla
qualifica del motore completo.

| Modulo | Contratto e verifica | Codice |
|---|---|---|
| Fondazioni binarie | [Record v1/v2, CRC32C e lotti SEAL](fondazioni-binarie.md) | [`src/foundation/`](../../src/foundation/) |
| Testo UTF-8 | [Validazione limitata, pura e parallela](utf8.md) | [`src/codec/utf8.lisp`](../../src/codec/utf8.lisp) |
| Testate CBOR | [Lettura pura in sei valori](cbor-header.md) | [`src/codec/cbor-header.lisp`](../../src/codec/cbor-header.lisp) |
| Testate CBOR minime | [Larghezze di argomenti e float, senza decodifica](cbor-minimo.md) | [`src/codec/cbor-minimal.lisp`](../../src/codec/cbor-minimal.lisp) |
| Scrittura delle testate CBOR | [MT0..6 minimi, destinazione privata e preflight](cbor-scrittura.md) | [`src/codec/cbor-write.lisp`](../../src/codec/cbor-write.lisp) |
| Struttura CBOR | [Item completo, UTF-8 e budget con scratch per worker](cbor-struttura.md) | [`src/codec/cbor-scan.lisp`](../../src/codec/cbor-scan.lisp) |
| Item CBOR con testate minime | [Un attraversamento, limiti e scratch privato](cbor-minimo-struttura.md) | [`src/codec/cbor-scan-minimal.lisp`](../../src/codec/cbor-scan-minimal.lisp) |
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
| Worker e Serie | [Doppia lease, debito batch e ordine dell'handoff](worker-serie.md) | [`src/series/worker-run.lisp`](../../src/series/worker-run.lisp) |
| Routing dei worker | [Ordinali immutabili, registro copiato e selezione diretta](routing-worker.md) | [`src/series/routing-select.lisp`](../../src/series/routing-select.lisp) |
| Verifica del controller | [Prove strutturate, copertura e misure parallele](controller-serie-risultati.md) | [`tests/series/`](../../tests/series/) |
| Slot dell'indice v2 | [Payload compatto, seqlock e rilocazione](slot-indice-v2.md) | [`src/index/`](../../src/index/) |
| Indice primario v2 | [Chiavi, gruppi Swiss e pubblicazione della directory](indice-primario.md) | [`src/index/primary-read.lisp`](../../src/index/primary-read.lisp) |
| Hash delle chiavi | [XXH64 tipizzato, seme immutabile e mappe fisiche](hash-chiavi.md) | [`src/hash/`](../../src/hash/) |
| Cache dei record | [Insiemi associativi, CLOCK e copie verificate](cache-record.md) | [`src/cache/`](../../src/cache/) |
| Percorso GET | [Candidato, fonte readonly, cache e conferma snapshot](get-record.md) | [`src/get/`](../../src/get/) |
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Verifica snapshot e CSN | [Metodo preregistrato, decisioni e limiti](snapshot-verifica.md) | Registro e adattatore già presenti in `src/mvcc/` |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Verifica EBR e lettura | [Suite, metodo, mutanti e limiti](lettura-verifica.md) | [`tests/epochs/`](../../tests/epochs/) e [`tests/read/`](../../tests/read/) |
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
  (:PATH
   #A((99) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/CHANGELOG.md")
   :BYTES 13025 :SHA256 "e0fdb669469b9578adbe3700de2d229e27f3fb8e1ba9c8790320f046520bccc0"
   :GIT-BLOB "15c5abac8d4ecacbed2f5f4371a70ee303b5deaf" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Routing preallocato dei writer pronti alla Serie: ordinali immutabili,
  registro con associazioni verificate e tabella privata per worker.
  Selezione diretta in tempo costante, anche dopo ricircolo a coda piena,
  senza scritture condivise per messaggio; pool e coordinatore restano aperti.

- Collegamento preallocato worker/Serie: doppia lease, token monotoni, debito
  batch e rilascio Serie prima del worker, con retry limitato alla fine e
  conservazione dei guasti originali. Include 26 prove, due letture C1,
  copertura completa nel denominatore e cinque misure locali del percorso
  seriale; pool e coordinatore Archivio restano da integrare.

- Hash delle chiavi XXH64 tipizzato: ritorno in due u32, seme esplicito
  immutabile nell'indice, mappe verificate degli slot fisici per rebuild/split,
  propagazione dei guasti interni. Include 46 nuove regressioni, mutazioni,
  misure seriali/parallele e registri strutturati; lifecycle del seme e GET
  integrato ancora aperti.

- Nucleo GET con contesto preallocato per worker: hash col seme dell'indice e lookup sotto EBR,
  capacità segmento con header verificato, cache e I/O readonly, prova
  OUTCOME letta dallo stesso file e risposta privata fino alla conferma
  snapshot. Ricerca storica richiesta esplicitamente sui casi non risolvibili
  dall'indice corrente; resolver, pool, protocollo e qualifica C1 aperti.

- Cache dei record per Serie: classi preallocate, insiemi di otto posti,
  CLOCK limitato, ricerca senza lock e inserimento opportunistico. Ogni hit
  verifica CRC, chiave, CSN e prova prepared; corruzione della cache distinta
  dall’input del segmento. Verificatore comune con CSN in due u32,
  budget e contratti documentati; GET integrato e qualifica C1 aperti.

- Indice primario v2 in memoria: controlli Swiss a gruppi di 16, chiavi binarie
  in arena, lookup con budget comune e conferma root anche sul miss, upsert e
  cancellazione/rilocazione condizionale nel writer, crescita arena e piani monouso di pubblicazione
  directory, con hash delle chiavi e costruttore verificato split/rebuild.
  Lifecycle del seme e GET integrato ancora aperti;
  include contratti, tracciabilità ed evidenze statiche, qualifica C1 aperta.

- Banco di slot v2 dell'indice: parole u64 contigue, lettura in buffer privato
  con otto tentativi, pubblicazione e rimozione sotto seqlock, rilocazione
  condizionale, credito di scrittura e congelamento permanente. Include
  contratti, decisioni da coprire ed evidenze statiche; qualifica C1 aperta.

- Contesto di lettura preallocato per worker: ingresso EBR a tentativo singolo,
  snapshot controllato prima e dopo il lookup, anche sul miss, e cleanup del
  pin prima della migrazione. Collegato ai registri CSN/snapshot/epoche;
  indice, cache e pool restano da integrare, qualifica concorrente aperta.

- Dominio EBR per Archivio: annunci dei worker distanti 128 byte, ingresso
  senza mutex a tentativo singolo, ticket preallocati e crediti di epoca prima
  dello swap. Frontiera condivisa da più ritiri e claim esclusivo del reclaim;
  integrazione con segmenti/pool e qualifica concorrente restano aperte.

- Registro snapshot per Archivio: soglia annunciata prima della cattura del CSN,
  contesti preallocati con generazione, controlli di lettura senza mutex,
  deadline e scadenze con budget. Interfaccia in buffer per i reader;
  qualifica concorrente, controller ed EBR restano da integrare.

- Registro CSN per Archivio con orizzonte monotono e budget finito;
  l’implementazione attiva è `arcdocdb.csn`, con token slot/high/low.
- Ricostruzione in memoria del manifest dal prefisso sigillato di `control.log`:
  ACTIVE, CLOSED con esiti, rimozioni esplicite e limite degli ID. Workspace
  indipendenti per Serie; nessuna riconciliazione o scrittura dei file.

- Validazione UTF-8 pura su span immutabili, con budget massimo di 16 MiB,
  conteggio dei valori scalari ed errori tipizzati con offset. Utilizzabile
  in parallelo dai worker prima del writer; il parser CBOR resta da integrare.
  Diciassette test, nove mutanti rilevati e zero heap nei 25 campioni locali;
  prove concorrenti ed evidenze grezze conservate.

- Code MPSC locali preallocate e gettone del writer con quota cumulativa:
  contesa e saturazione distinte, FIFO e rifiuto dei gettoni vecchi.
  Diciassette test, inclusi producer/consumer su thread reali e calcolo
  sovrapposto tra Serie; otto mutanti rilevati e zero heap nelle misure locali.

- Verifica in memoria dei segmenti compattati CLOSED v1/v2: identità, CRC,
  soli PUT/TOMBSTONE ordinari, limite valido autorevole e budget byte/record.
  Conteggi fisici restituiti dopo il controllo integrale; 15 test indipendenti,
  otto mutanti rilevati e misure locali delle allocazioni conservate.

- Tabella delle decisioni multiserie inclusa nella compilazione e nei test ordinari:
  ricostruzione dal prefisso sigillato, duplicati idempotenti o discordanti,
  budget finiti, query scalari e copie possedute dei partecipanti. Non applica
  i prepared e non realizza il recovery completo del database.

- SPK-08 bitmap: kernel scalari byte/u64 equivalenti, oracoli indipendenti,
  90 campioni locali e disassemblati conservati. Packing escluso e nessuna
  promozione a ottimizzazione del motore.

- SPK-07: due reader/due slot in SC, 28 mutanti rilevati; crash sui byte
  v1/v2, 49.120 casi e 303.432 interruzioni/ripartenze equivalenti. Frontiera
  esterna e limiti del modello dichiarati; tutti i tentativi conservati.

- SPK-08: maschere scalar/SWAR esatte e kernel NEON/SSE2 a safety 3;
  70 campioni seriali su Apple M4, zero byte consed osservati nei cicli.
  SSE2 e indice concorrente restano da verificare; report leggibili senza
  caricare i package sperimentali, originali integralmente conservati.

- Scansione recovery in memoria dei log v1/v2: prefisso verificato, coda e
  corruzione testimoniata da SEAL successivo, EOF esplicito e budget distinti
  dagli errori dei dati; 19 test, inclusi 20.256 casi di alterazione dei bit.

- SPK-06: modello finito del controllore di carico, quote e timer; 24 confronti
  locali tra letture e copie concorrenti, con verifica integrale, intervalli
  di sovrapposizione e campioni grezzi conservati. Compaction del motore e
  feedback reale restano da verificare.

- SPK-05: letture pread e mmap di file immutabili, CRC/chiave/stamp verificati,
  errori I/O e worker espliciti; 36 confronti locali per variante e profilo
  senza allocazioni osservate nel ciclo finale. Varianti e fallimenti conservati.

- SPK-04: writer sperimentale su pool, code limitate, modelli di parcheggio
  e ripartenza delle letture; controlli e 54 benchmark diagnostici conservati,
  con limiti e tentativi falliti espliciti.

- SPK-10: quattro moduli sperimentali Common Lisp per codec v1/v2, indice a
  cinque parole, CBOR iterativo e modello di migrazione; integrazione in memoria
  dei limiti massimi. Nessun codice di produzione, gate v2 ancora aperto.
- Registro strutturato di prove e benchmark, inclusi fallimenti e diagnostiche;
  blob dei sorgenti prima/dopo, risultati decodificati e output originali.
  `make check` registra l'intera verifica; la CI conserva gli artefatti.
- Campagne locali conservate: indice v1 fino a 10 milioni di documenti,
  profiling di allocazione e controlli/benchmark v2 separati.

- ADR-0050: root dell'indice ricontrollata anche su miss, costi e budget della
  directory separati dagli slot; nessuna promessa di pausa indipendente dalla Serie.
- ADR-0048: documenti da 16 MiB effettivi, profondità 100, chiavi fino a 65.535 byte e layout v2; tre requisiti progettati, gate di verifica e migrazione. ADR-0049 propone il percorso oltre RAM senza dichiararlo disponibile.

- Suite eseguibile della Fase 0 per SPK-01, SPK-02, SPK-03, SPK-07 e SPK-09; harness
  `tools/run-spikes.lisp`, compilazione senza avvisi, processi isolati, comandi e output
  grezzo; `make spikes-check` in CI e `make spikes-bench` per misure locali in serie.
- ADR-0046 e INV-M6: SPK-07 trova un controesempio nell'anello dell'orizzonte; il registro
  preallocato dei veri CSN pendenti lo sostituisce. I requisiti del motore restano progettati.
- ADR-0047: lettura dei prepared con prova autorevole del CSN (OUTCOME o manifest), oltre a
  CRC, chiave e flag. Una location verso un'altra versione della stessa chiave è rifiutata.

- Specifica originale, documentazione tematica (16 documenti), invarianti (`INV-…`),
  glossario.
- Valutazione architetturale: analisi critica, stime, registro dei rischi, piano degli spike.
- Progetto consolidato: [architettura](docs/architettura.md),
  [formati su disco](docs/formati-su-disco.md), [limiti dimensionali](docs/limiti.md).
- 30 ADR (0001–0030): le 26 questioni aperte sono chiuse; ADR-0028 e ADR-0030 attendono la
  conferma dell'autore.
- Sistema ASDF minimo, smoke test, `tools/check-links.lisp`, CI.
- Licenza BSD-2-Clause.
- **Software critico (ADR-0031…0035):** gerarchia delle priorità con l'affidabilità sopra le
  prestazioni; otto nuovi invarianti (INV-A1…A8); analisi dei guasti con 24 modi di guasto;
  standard di codifica (regole `COD-…`); piano di verifica; registro delle deviazioni.
- **Tracciabilità controllata da strumento:** 90 requisiti in `requisiti.lisp`, matrice generata,
  `make trace`.
- Strumenti in Common Lisp: build senza avvisi (`tools/build.lisp`), linter con auto-verifica
  (`tools/lint.lisp`), controllo della tracciabilità (`tools/check-trace.lisp`).
- SPK-09 (costo dei controlli di affidabilità).

- **Analisi progettuale** ([docs/analisi-progettuale.md](docs/analisi-progettuale.md)) e ADR
  0036–0045: dieci leggi di progetto — la prima: **il parallelismo è un principio fondante**,
  con l'elenco chiuso di ciò che le Serie condividono — tabella dei punti di atomicità, sedici
  rilievi `AP-…`; quattordici nuovi invarianti (INV-F2, F3, V5, M4, M5, S7, C11, I3, P5, P6,
  A9…A12), 107 requisiti, 27 modi di guasto, rischio residuo RES-05.

### Cambiato

- Snapshot collegati all'unico registro `arcdocdb.csn` dell'Archivio; rimosso
  l'allocatore CSN duplicato del ramo. Coordinamento snapshot senza attese,
  revoca della soglia provvisoria su `:csn-busy` e invalidazione terminale
  al guasto. API del registro canonico e sue evidenze conservate.

- Guide del repository consolidate, note degli esperimenti uniformate al metodo
  tecnico e specifica originale rinominata; requisiti ed evidenze conservati (ADR-0051).

- ADR-0028 e ADR-0030 confermati dall'autore il 2026-10-08, incluse le revisioni su minimi
  di prestazione, backup, restore verificato, verificatore offline e scrubbing.

- **Correzioni di progetto dall'analisi (nessun codice toccato, formati mai implementati):**
  - uno snapshot nasce quando l'orizzonte di visibilità lo ha raggiunto: prima poteva vedere
    comparire un lotto in volo (ADR-0038);
  - coda o corruzione di un log si decidono con la frontiera durevole dei SEAL: prima un crash
    ordinario con più lotti in volo portava la Serie in `FAULTED`; il recovery non tronca più
    (ADR-0037);
  - tombstone scartati con il filtro di esistenza: la regola per lineage faceva riapparire
    documenti eliminati dopo un MERGE di segmenti non adiacenti (ADR-0042);
  - l'esito di una multiserie sta nello stesso segmento dei record che risolve: prima un CLEAN
    poteva perderlo (ADR-0041);
  - primary index a frammenti: nessun raddoppio che triplica la memoria e ferma il writer; slot
    a 4 parole; stima corretta a ~75–80 byte per documento (ADR-0043).
- **Semplificazioni:** la versione di un documento è il CSN; una sola cornice di record con due
  CRC (24 byte); quattro tipi di record nei segmenti; control log con il solo record EDIT;
  `multiserie.log` con il solo record DECISION; nessun file `.bloom`, nessun lineage, nessuno
  stato `creating`; cache senza ri-etichettatura; EBR solo per i file (ADR 0038–0044).
- **Modello di esecuzione:** compiti a completamento, attese come parcheggi, ogni chiamata
  bloccante nel pool di I/O (ADR-0045).

- **Linguaggio visivo rifatto** ([assets/README.md](assets/README.md)): identità monocroma con un
  solo colore, l'ambra, riservato a ciò che può cambiare; nuovo marchio; illustrazione dei
  segmenti e diagramma del percorso di scrittura e lettura in vettoriale, chiaro e scuro; README
  riscritto; anteprima per i social. Il controllo dei link verifica anche i percorsi delle
  immagini.

- ADR-0032 sostituisce in parte ADR-0015: il contatore seqlock passa da 8 a 64 bit, con tentativi
  limitati e ripiego sul writer, perché l'argomento a 8 bit si reggeva sui tempi e non era una
  garanzia per costruzione. Costo: +8 byte per entry (56 B).
- ADR-0028 (proposta) distingue obiettivi e minimi vincolanti di prestazione; ADR-0030
  (proposta) porta backup e verificatore offline nella v1.
")
  (:PATH
   #A((125) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/docs/implementazione/routing-worker.md")
   :BYTES 4213 :SHA256 "7c1e8a5ef5fdddab0f5175a964d205d69a96823e239c733b59165c1d3e99d03e" :GIT-BLOB
   "fbf08bfbd7671689268a2b6e5c4507b5294c132c" :TEXT "# Routing preallocato dal writer alla Serie

Fondazione C1 per REQ-CON-001/002/004/005 e REQ-AFF-008;
ADR-0005, ADR-0033 e ADR-0045. Il routing connette il writer già
preso dalla lista pronta al suo [collegamento worker/Serie](worker-serie.md).
Il [metodo preregistrato](routing-worker-metodo.md) delimita le prove.

Il caller assegna all'avvio un `routing-index` immutabile al writer.
L'indice è locale al registro, da 0 a 65535; `NIL` conserva il contratto
dei writer esistenti che non usano questo routing. Non esiste un contatore
globale per attribuire gli indici. Un registro ha da 1 a 65536 associazioni
dense: il writer nello slot i deve avere indice i. I controller del registro
sono distinti per identità EQ, così due writer non rappresentano la stessa
Serie nel medesimo registro. Una sola associazione logica per Serie fra
registri diversi resta una precondizione di configurazione del caller.

| API | Contratto |
|---|---|
| `crea-writer-programmabile :routing-index` | Costruzione all'avvio; indice `NIL` oppure intero nel budget dichiarato. Nessuna attribuzione implicita. |
| `indice-routing-writer writer` | Legge l'ordinale immutabile, senza assumere obblighi o lease. |
| `crea-registro-worker-serie writers controllers` | Copia i vettori del caller, valida tipo, lunghezza, ordinali e unicità dei controller; produce un registro condivisibile immutabile. Nessun claim. |
| `crea-tabella-worker-serie context registro` | Owner corrente, worker IDLE; prealloca un collegamento locale per ogni associazione. Non acquisisce writer o Serie. |
| `collega-writer-worker-serie tabella` | Worker CLAIMED; seleziona lo slot dell'ordinale corrente, controlla identità writer/contesto e collegamento IDLE, restituisce il collegamento. Nessun begin o pop. |

Il registro copia i vettori e mantiene privata la loro rappresentazione:
modificare gli input dopo la factory non cambia le associazioni. Il registro
può essere letto da più worker; ciascuno possiede la propria tabella e i propri
collegamenti sul thread che ha creato il contesto. Nessun collegamento migra
fra thread. La tabella contiene O(N) collegamenti per worker e deve essere
contabilizzata nel budget di memoria all'avvio: il limite massimo ammesso
non è una raccomandazione di dimensionamento.

La selezione usa l'ordinale del writer CLAIMED e un solo accesso indicizzato.
Verifica anche EQ del writer: un writer estraneo con lo stesso numero non
può selezionare una Serie valida per caso. Dopo un ricircolo a ring pieno il
worker può avere un altro writer; il caller ripete la selezione sul nuovo
CLAIMED, senza conservare come corrente il collegamento del tratto precedente.
Ripetere la selezione finché il collegamento è IDLE restituisce lo stesso
oggetto e non crea un nuovo obbligo o una seconda capacità.

La selezione riuscita precede `inizia-worker-serie`; pop, ack, chiusura e
ricircolo usano i contratti già esistenti. Il routing non consulta la salute
del controller, così resta possibile il drenaggio I/O già consentito su una
Serie FAULTED. Non trasferisce una lease e non applica i payload.

Owner estraneo è rifiutato prima del confine, senza avvelenare gli oggetti.
Fase worker errata resta un rifiuto ordinario. Un ordinale assente o fuori
tabella, un writer estraneo, una tabella privata incoerente o un collegamento
già impegnato sono invece difetti della configurazione/protocollo dopo claim:
il worker diventa FAULTED e conserva writer, home e obbligo, insieme alla
condizione originale. Nessun controller viene marcato senza una sua lease;
fermare e coordinare l'Archivio sulla diagnosi resta compito del caller.
Non sono promessi rollback, pubblicazione, cessione o riuso automatici.

Il lookup normale è O(1), senza scansioni, hash, allocazioni, scritture
condivise, thread, attese, callback o I/O. La costruzione è separata dal
percorso caldo e può usare un hash EQ per verificare i controller distinti.
La scansione bounded della lista pronta resta O(K), al più 64 partizioni,
ed è già implementata dal worker. Questo componente non realizza il pool,
wake/park, admission, adattamento EWMA/AIMD, retirement o shutdown.
Non introduce cambiamenti durevoli né qualifica il motore completo.
")
  (:PATH
   #A((132) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/docs/implementazione/routing-worker-metodo.md")
   :BYTES 4391 :SHA256 "ef5a5c090db1723dad999943456f6d18d71e0a3c85d9bff3505f213765bb9e01" :GIT-BLOB
   "c29d1646576d70e3127c3ed2cb82aa699f4bfef7" :TEXT "# Metodo preregistrato del routing worker/Serie

Base iniziale `92decf4265554cd4959e32a1c881cf00758bb6a1`.
Metodo fissato prima delle campagne dedicate al routing nuovo.
Ambito: estensione immutabile del writer programmabile, registro condiviso,
tabella locale e lookup, dichiarazioni package/ASDF, test e C4 di misura.
Il [contratto](routing-worker.md) mantiene espliciti i confini non integrati.

Verifiche previste:

- Ordinale `NIL` compatibile con writer esistenti, 0 e 65535 validi;
  valori fuori tipo/budget rifiutati all'avvio prima della pubblicazione.
- Registro da 1 a 65536 slot, input di tipo/lunghezza coerenti,
  ordinale esattamente uguale allo slot; controller duplicati EQ rifiutati.
  Copie private: modificare entrambi gli input dopo la factory non cambia
  il lookup. Registri indipendenti possono usare gli stessi numeri.
- Tabella creata sul thread owner del contesto IDLE, collegamenti locali
  preallocati, distinti fra worker e riferiti allo stesso registro.
  Owner e fase errati non consumano obblighi o lease.
- Catena reale accettazione, pubblicazione ready, claim, lookup, doppia lease,
  FIFO, pop, ack, fine e ricircolo. Il ricircolo full deve cambiare writer e
  quindi collegamento senza ripetere il tratto del precedente writer.
- Lookup ripetuto su CLAIMED/IDLE restituisce lo stesso collegamento senza
  mutare il grafo di stato; nessuna lease Serie è acquisita dal lookup.
- Writer estraneo con ordinale valido, writer senza ordinale e indice oltre
  la tabella diventano fault terminali del worker dopo claim. Stessa
  condizione EQ conservata e propagata; writer/home/obbligo restano disponibili
  alla diagnosi. Nessuna mutazione di alcun controller non acquisito.
- FI quiescente della tabella privata: slot o binding incoerente, contesto
  estraneo, collegamento non IDLE. Il rifiuto precede begin/pop e non libera
  o marca una Serie di cui il routing non possiede la lease.
- Due worker reali, due Serie e stesso registro: collegamenti locali distinti,
  due Serie contemporaneamente ACTIVE. Semafori e deadline sono nel solo
  harness. Si distingue il controllo d'identità dall'esclusione già provata
  dal bridge; la fixture non misura throughput o equità del pool.
- Serie FAULTED selezionabile per il drenaggio già previsto dal controller.
  Nessun gate di salute aggiunto al lookup; nuova pubblicazione resta regolata
  dal controller. Nessuna prova di arresto globale Archivio è dedotta.
- Due letture C1 sui dodici punti, inventario di tutte le decisioni e dei
  controlli delegati, comprese eventuali decisioni composte condizione per
  condizione. Copertura nativa e HTML con denominatore completo, tutte le
  identità dei percorsi mancanti e nessuna esclusione approvata.
- Allocazione locale su ciclo completo con due writer, due controller,
  un worker, ready con una partizione/capacità1 e tabella preallocati.
  Ogni ciclo alterna il writer e compone enqueue, publish, claim, due lookup
  EQ/indice atteso, begin/lease, pop/ack ed end idle. Due cicli di startup
  popolano le identità fuori sensore. Warmup128, cinque campioni da4096 cicli,
  GC/stampa fuori misura. Sink indipendente del driver:
  `12+17+19+13+11+13+3+25+7+23=143`,
  campione `N*143+N*(N-1)/2`; token bridge e lease Serie monotoni per writer,
  token batch monotono nel worker. Controlli baseline, heap positivo16×1MiB,
  sink errato e clock sotto risoluzione dimostrano il rilevamento del C4.
- C4 compilato integralmente con warning e style-warning fatali, self-test
  del FASL, rilevamento heap/sink errato e CLI invalida. La sola eccezione
  runtime ASDF è `sb-kernel:redefinition-warning`, già prevista dal build;
  nessuna eccezione agli avvisi di compilazione del nuovo strumento.
- Build e test mirati prima del controllo generale; `make check` una volta
  sul codice finale congelato, salvo cambiamenti o failure reali.

Ogni campagna usa `tools/record-command.lisp`, con stdout/stderr, argv,
ambiente, snapshot iniziale/finale e tentativi falliti conservati. Le campagne
usano copie congelate e cache separate. Dati grandi compressi senza perdita,
catalogo e verifica dei byte conservati; nessun raw viene ricostruito.

Le misure locali distinguono startup e percorso normale. Non si deducono
heap nullo universale, throughput, P99, fairness, scalabilità o chiusura dei
gate della Fase0. Stati globali dei requisiti restano `progettato`.
")
  (:PATH
   #A((135) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/docs/implementazione/routing-worker-revisione.md")
   :BYTES 4177 :SHA256 "c740088bf5b9781c0840505b83fd10e4fcde825ec2d985576809dad1840f095d" :GIT-BLOB
   "79c5e7d4c453900a9b045dc1aa84e827f8ed6e46" :TEXT "# Revisione del routing worker/Serie

Prima lettura C1 del 2026-10-11: contratto, sorgenti di prodotto e
dipendenze esecuzione/Serie. Revisore: agente `next_execution_audit`.
La seconda lettura e il confronto con test, copertura e misure restano da
completare. Questa è una lettura di agente, non una attestazione umana.
Base iniziale `92decf4265554cd4959e32a1c881cf00758bb6a1`.

| Punto C1 | Prima lettura | Seconda lettura / evidenza |
|---|---|---|
| 1. REQ e ADR | REQ-CON-001/002/004/005 e REQ-AFF-008; ADR-0005/0033/0045. Routing del writer già CLAIMED al binding locale, senza scheduler implicito. | Da completare sul sorgente qualificato. |
| 2. Invarianti sensibili ai test | Ordinal immutabile e locale, registry dense 1..65536, controller distinti EQ, input copiati, owner worker, CLAIMED, writer EQ, link del contesto/coppia e IDLE. | Da confrontare con fixture e risultati. |
| 3. Errori tipizzati | Configurazione invalida prima della pubblicazione; fase/owner ordinari; errore routing dopo claim rende FAULTED il worker e conserva l'obbligo. Segnalato RW-REV-01 sul confine delle ragioni recuperabili. | Da completare dopo correzione e regressione. |
| 4. Cicli e attese | Due cicli di costruzione, ciascuno limitato dalla dimensione verificata N≤65536. Nessun ciclo nel lookup, nessuna attesa/ricorsione/thread/callback. | Da confermare sul sorgente finale. |
| 5. Allocazione calda | Slot e riferimenti immutabili, tabella locale preallocata, handler worker `dynamic-extent`. Hash EQ soltanto startup. Lettura statica non attesta heap nullo. | Misure preregistrate da leggere. |
| 6. Dati verificati all'uscita | Range prima di `svref`; EQ prima di restituire link; owner/fase e shape verificati dai helper. Getter ordinale non attribuisce membership o lease. | Da confrontare con stati prima/dopo dei test. |
| 7. Decisioni composte | Una nuova decisione composta nella factory writer: `or` tra NIL e tipo integer0..65535. Altre decisioni scalari, cicli e boundary elencati nell'inventario. | Coppie indipendenti e audit nativo da leggere. |
| 8. Proprietà condivisa | Registro privato dopo copie, condiviso in sola lettura. Contesto/tabella/link locali al thread. Lookup non legge salute, owner o ring del controller. | Da confermare nelle prove di owner e parallelismo. |
| 9. Tracciabilità e check | REQ sulle nuove definizioni; package/ASDF caricano routing dopo il bridge. Requisiti globali restano `progettato`. | Check completo sul codice finale da eseguire. |
| 10. Regole e deviazioni | Safety3, slot typed/read-only, ftype/docstring, pre/post, corpi≤60righe, complessità locale≤10. Nessuna syscall o deviazione nuova individuata. | C4 strict compile/FASL e fullcheck da leggere. |
| 11. Serializzazione e INV-P6 | Nessun lock, wait, hash o scrittura globale nel lookup per tratto. O(1); coda pronta e lease restano nei protocolli già esistenti. | Concorrenza di due worker/Serie da leggere; nessuna misura di scalabilità promessa. |
| 12. Atomicità durevole | Cambia soltanto configurazione in memoria e selezione di un oggetto. Non scrive WAL, non elimina dati, non conferma effetti. Nessun nuovo punto durevole. | Da confermare senza inferire recovery/shutdown completo. |

## Osservazioni della prima lettura

| ID | Osservazione | Stato |
|---|---|---|
| RW-REV-01 / P2 | L'allowlist `:worker-state` dell'API selezione racchiude anche i helper di lookup. Un errore `resource-exhausted :worker-state` inatteso proveniente dal lookup potrebbe restare recuperabile per coincidenza di ragione con il rifiuto di fase. La prima lettura non ha individuato un ramo naturale attuale che lo produca; il rischio riguarda contenimento di guasto e coupling futuro. | Proposto boundary lookup interno con allowlist vuote dopo il controllo CLAIMED, più FI della ragione coincidente; da rileggere. |

Il routing non possiede una lease Serie quando fallisce: non marca un
controller che potrebbe appartenere a un altro worker. La diagnosi e il
writer/home/obbligo conservati devono essere presi in carico dal futuro
coordinatore Archivio. Il fail-stop locale non dimostra arresto globale,
quiescenza, pool, shutdown o riuso sicuro dopo un errore.
")))
