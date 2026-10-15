(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-CLOSURE-SOURCES :VERSION
 "7f1cc54477483039bd98bd8c3f6508416f5c0ced" :PART 1 :PARTS 1 :SOURCES
 ((:PATH #A((39) BASE-CHAR . "spikes/out/lifecycle-close-records.lisp") :BYTES 6209 :SHA256
   "d2955e271c7789a60d1c2ba25e0b39c42254770732655f59758ffede391af3b5" :GIT-BLOB
   "75de45b6baa47497aebc62012585a974574f2350" :TEXT
   ";;;; Chiusura esplicita, dopo la prima pubblicazione; nessuna esecuzione al LOAD library.
;;;; Il manifesto nuovo conserva gli stati originali e tutte le impronte delle copie.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(in-package #:cl-user)

(defun lifecycle-close-status-fields (data)
  \"Proiezione dei campi presenti: nessuna inferenza o promozione di uno stato assente.\"
  (loop for key in '(:schema-version :kind :status :source-consistency :exit-code :test-count)
        when (loop for field on data by #'cddr thereis (eq (first field) key))
          append (list key (getf data key))))

(defun lifecycle-close-record-plan (record root destination)
  (let* ((plan (pool-publication-record-plan record root destination))
         (source (getf plan :source))
         (target (getf plan :target)))
    (when (probe-file target) (error \"Chiusura non sovrascrive record presenti: ~A\" target))
    (dolist (leaf '(\"report.lisp\" \"conservazione.lisp\"))
      (multiple-value-bind (proof data)
          (worker-evidence-byte-proof (merge-pathnames leaf source))
        (setf (getf plan (if (string= leaf \"report.lisp\") :report-proof :conservation-proof))
              proof)
        (setf (getf plan (if (string= leaf \"report.lisp\") :report-status :conservation-status))
              (lifecycle-close-status-fields data))))
    plan))

(defun lifecycle-close-copy-record (plan)
  (dolist (entry '((\"report.lisp\" :report-proof) (\"conservazione.lisp\" :conservation-proof)))
    (unless (worker-evidence-proofs-equal-p
             (getf plan (second entry))
             (worker-evidence-byte-proof (merge-pathnames (first entry) (getf plan :source))))
      (error \"Record cambiato dopo il piano di chiusura: ~A\" (getf plan :source))))
  (let ((copied (pool-publication-copy-record plan)))
    (dolist (entry '((\"report.lisp\" :report-proof) (\"conservazione.lisp\" :conservation-proof)))
      (unless (and (worker-evidence-proofs-equal-p
                    (getf plan (second entry))
                    (worker-evidence-byte-proof
                     (merge-pathnames (first entry) (getf plan :target))))
                   (worker-evidence-proofs-equal-p
                    (getf plan (second entry))
                    (worker-evidence-byte-proof
                     (merge-pathnames (first entry) (getf plan :source)))))
        (error \"Bytes di chiusura diversi dagli originali pianificati: ~A\" (getf plan :target))))
    (append copied
            (list :original-report-status-fields (getf plan :report-status)
                  :original-conservation-status-fields (getf plan :conservation-status)
                  :copied-files (lifecycle-publication-files (getf plan :target))))))

(defun lifecycle-close-records (input-path stem records
                               &key (record-root (uiop:getcwd)) extra-sources)
  \"Aggiunge prove originali in directory nuove e produce un manifesto di chiusura esclusivo.\"
  (let* ((config (worker-read-raw-data input-path))
         (base (getf config :base))
         (destination (lifecycle-directory *lifecycle-publication-directory*))
         (root (lifecycle-directory record-root)))
    (unless (and (stringp base) (= 40 (length base))
                 (every (lambda (character) (digit-char-p character 16)) base)
                 (worker-leaf-p stem) records)
      (error \"Chiusura richiede base SHA40 dell'input, stem leaf e almeno un record.\"))
    (unless (= (length records)
               (length (remove-duplicates records :test #'string=
                                          :key (lambda (entry) (getf entry :name)))))
      (error \"Nomi dei record di chiusura duplicati.\"))
    (dolist (leaf (list (format nil \"~A.lisp\" stem) (format nil \"~A-file.lisp\" stem)))
      (when (probe-file (merge-pathnames leaf destination))
        (error \"Manifesto di chiusura già esistente: ~A\" leaf)))
    (let* ((plans (mapcar (lambda (record)
                           (lifecycle-close-record-plan record root destination)) records))
           (sources
             (worker-plan-source-bundles
              (remove-duplicates
               (append (list #p\"spikes/out/lifecycle-close-records.lisp\" input-path)
                       extra-sources) :test #'equal)
              (format nil \"~A-sources\" stem) :pool-worker-lifecycle-closure-sources :version base)))
      ;; Preflight delle collisioni anche per ogni bundle, prima della prima nuova copia.
      (dolist (plan sources)
        (when (probe-file (merge-pathnames (getf plan :leaf) destination))
          (error \"Bundle di chiusura già presente: ~A\" (getf plan :leaf))))
      (worker-validate-source-plans sources)
      (let ((copied (mapcar #'lifecycle-close-copy-record plans)))
        (pool-publication-write-plans sources destination)
        (worker-save-data
         (list :schema-version 1 :kind :pool-worker-lifecycle-closure-manifest
               :base base :input-source (worker-byte-record input-path)
               :processes copied :source-bundles (mapcar (lambda (plan) (getf plan :leaf)) sources)
               :limits '(:original-report-and-conservation-bytes :original-status-fields-only
                         :no-status-promotion :exclusive-new-process-directories
                         :sha256-bytes-git-blobs :original-gzip-payload-names))
         (merge-pathnames (format nil \"~A.lisp\" stem) destination))
        (lifecycle-publication-refresh-manifest
         base :stem (format nil \"~A-file\" stem) :directory destination)
        (format t \"Lifecycle closure: ~D original records copied and verified; manifest ~A.lisp.~%\"
                (length copied) stem)
        t))))

(unless (member :pool-worker-lifecycle-closure-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (and (>= (length args) 4) (evenp (- (length args) 2)))
      (error \"Uso: sbcl --script spikes/out/lifecycle-close-records.lisp input-plist stem name id [name id ...]\"))
    (lifecycle-close-records
     (pathname (first args)) (second args)
     (loop for (name id) on (cddr args) by #'cddr collect (list :name name :id id)))))
")
  (:PATH #A((44) BASE-CHAR . "spikes/out/pool-start-publication-input.lisp") :BYTES 1283 :SHA256
   "d6d6dc1bbd2c73ec17a753648275f5045d38ad281bac7e524a98b42d1ee4abaa" :GIT-BLOB
   "488942c470f6a6aef0e94d66e7bb518a514d85b0" :TEXT
   "(:base \"7f1cc54477483039bd98bd8c3f6508416f5c0ced\" :records ((:name \"development-01\" :id \"4001077803-command-50513-0\") (:name \"sensor-development\" :id \"4001077961-command-55299-0\") (:name \"reader-development\" :id \"4001078036-command-57183-0\") (:name \"development-02\" :id \"4001078088-command-58434-0\") (:name \"check-core\" :id \"4001078210-command-63054-0\") (:name \"coverage\" :id \"4001078210-command-63055-0\") (:name \"benchmark\" :id \"4001078210-command-63056-0\") (:name \"integrated\" :id \"4001078597-command-72887-0\")) :final-paths (\"src/dispatch/begin.lisp\" \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/package.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/start.lisp\" \"src/dispatch/step.lisp\" \"src/dispatch/types.lisp\" \"arcdocdb.asd\" \"tests/scheduler/pool-start.lisp\" \"tools/measure-pool-start.lisp\" \"spikes/out/pool-start/coverage-run.lisp\" \"spikes/out/pool-start/dispatch-coverage-reader.lisp\" \"spikes/out/pool-start/reader-run.lisp\" \"spikes/out/pool-start/tool-run.lisp\" \"docs/implementazione/pool-prepara.md\" \"docs/implementazione/pool-prepara-metodo.md\" \"docs/implementazione/pool-prepara-revisione.md\" \"CHANGELOG.md\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-prepara-risultati.md\") :spike-directory \"spikes/out/4001078480-check-70936-0/\")
")
  (:PATH #A((23) BASE-CHAR . "src/dispatch/begin.lisp") :BYTES 1658 :SHA256
   "4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d" :GIT-BLOB
   "1f54e226a0b7d5c796ef09b6336866e1a74b78b1" :TEXT
   ";;;; Avvio esplicito di un obbligo gia acquisito, senza consultare il pool.
;;; OWNER: dispatcher, contesto e link locali al medesimo thread, non rientrante.
;;; SHARED: routing immutabile e lease della sola Serie per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values arcdocdb.execution.series:collegamento-worker-serie index
                                 (member :active :closing)
                                 (member nil :serie-busy :serie-lease-generation) &optional))
                inizia-obbligo-pool))
(defun inizia-obbligo-pool (dispatcher)
  \"Pre: owner corrente, worker CLAIMED e link associato IDLE, nessuna rientranza.
Post: link corrente e token/fase/ragione originali di un solo begin del bridge.
Binding prima del routing; writer busy conserva CLAIMED/link IDLE senza token;
Serie busy/esaurita restituisce CLOSING/token da chiudere esplicitamente.
Nessun gate, ACK, claim, ricircolo, pop, retry o cleanup; errori C1 propagati
con capacita e causa conservate dai confini originali, senza fault marking C3.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (let ((link (arcdocdb.execution.series:collega-writer-worker-serie table)))
      (multiple-value-bind (token state reason)
          (arcdocdb.execution.series:inizia-worker-serie link)
        (values link token state reason)))))
")
  (:PATH #A((23) BASE-CHAR . "src/dispatch/build.lisp") :BYTES 1176 :SHA256
   "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
   "d1f2397592a8ba9c3af21394f191017e9fd2219c" :TEXT
   ";;;; Costruzione separata dal percorso caldo, prima di qualsiasi obbligo.
;;; OWNER: factory sul thread che possiede porta e contesto, senza reentrancy.
;;; SHARED: solo riferimenti immutabili, nessuna pubblicazione o lettura di comandi.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) dispatcher-writer-pool) crea-dispatcher-writer-pool))
(defun crea-dispatcher-writer-pool (port table)
  \"Pre: porta e tabella preallocate, stesso contesto libero, owner corrente.
Post: dispatcher immutabile senza acquisire lavoro o applicare comandi.
INVALID-ARGUMENT tipo/owner/binding; RESOURCE-EXHAUSTED fase non-IDLE;
barriera C1 read-only sull'IDLE completo, nessun nuovo fault marking C3.\"
  (%check-dispatcher-binding port table)
  (let ((context (arcdocdb.scheduler::porta-worker-pool-context port)))
    (unless (eq (arcdocdb.execution:stato-worker-writer context) :idle)
      (error 'resource-exhausted :reason :worker-state))
    (arcdocdb.execution::%richiedi-worker context :idle))
  (%make-dispatcher-writer-pool port table))
")
  (:PATH #A((23) BASE-CHAR . "src/dispatch/claim.lisp") :BYTES 2713 :SHA256
   "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
   "f7717c94b765165eae4144042308e3639644ed5e" :TEXT
   ";;;; Nuova presa governata; gli obblighi esistenti hanno un ingresso indipendente.
;;; OWNER: dispatcher, contesto e collegamenti locali al medesimo worker.
;;; SHARED: solo API pool/ready/routing esistenti per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive) index
                                 (member :unchanged :activated :retired :busy :faulted) &optional))
                prendi-collegamento-pool))
(defun prendi-collegamento-pool (dispatcher)
  \"Pre: owner corrente, worker IDLE libero. Post: link preallocato solo dopo CLAIMED,
oppure NIL/esito/cursore/azione originali del gate. Nessun begin, lease o pop.
Binding rifiutato prima del gate; errori delegati mantengono confini e obblighi.
Un fault di routing conserva il claim e l'ACK già riuscito, senza rollback.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (multiple-value-bind (writer status cursor action)
        (arcdocdb.scheduler:prendi-writer-pool port)
      (case status
        (:claimed
         (unless writer (error 'invariant-violation :reason :pool-dispatcher-state))
         (values (arcdocdb.execution.series:collega-writer-worker-serie table)
                 status cursor action))
        ((:empty :busy :inactive)
         (when writer (error 'invariant-violation :reason :pool-dispatcher-state))
         (values nil status cursor action))
        (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool) arcdocdb.execution.series:collegamento-worker-serie)
                collega-obbligo-pool))
(defun collega-obbligo-pool (dispatcher)
  \"Pre: owner corrente, CLAIMED già assunto da busy begin, ricircolo o adozione.
Post: link corrente preallocato, selezione ripetibile senza nuove capacità.
Non legge comandi/active e non conferma ritiro: il caller completa l'obbligo.
Binding/owner e routing delegati; fase/fault preservati dai confini C1 esistenti.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (arcdocdb.execution.series:collega-writer-worker-serie table)))
")
  (:PATH #A((25) BASE-CHAR . "src/dispatch/package.lisp") :BYTES 595 :SHA256
   "6b791437e5b6c7c21dc9cf1be85b81ec0498725c307512b5978d4c8ed04e7255" :GIT-BLOB
   "db21c798588ff4a88be5b69b5fbe72bc84811a46" :TEXT
   ";;;; Dispatcher logico, caricato dopo il routing e il governo del pool.
;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.scheduler.dispatch
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation)
  (:export #:dispatcher-writer-pool #:crea-dispatcher-writer-pool
           #:prendi-collegamento-pool #:collega-obbligo-pool #:ricircola-collegamento-pool
           #:inizia-obbligo-pool #:passo-dispatcher-pool #:prepara-tratto-pool))
")
  (:PATH #A((25) BASE-CHAR . "src/dispatch/recycle.lisp") :BYTES 2612 :SHA256
   "9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0" :GIT-BLOB
   "adcd65ee5fd683d70a40b89b31a2edf7fc93994c" :TEXT
   ";;;; Risolve un obbligo RESCHEDULE prima di consultare nuovamente il pool.
;;; OWNER: dispatcher, contesto e link del thread creatore, senza reentrancy.
;;; SHARED: una partizione ready home per tratto (ADR-0045 §8), poi routing immutabile.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (notinline %check-recycle-status))
(declaim (ftype (function (t) (member :claimed :published)) %check-recycle-status))
(defun %check-recycle-status (status)
  \"Pre: ritorno del delegato, verificato come T senza propagare assunzioni ftype.
Post: status noto; INVARIANT-VIOLATION inatteso senza mutare contesto o ready.
NOTINLINE mantiene il controllo al confine anche con FI fuori tipo del delegato.\"
  (case status
    ((:claimed :published) status)
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :published) index &optional))
                ricircola-collegamento-pool))
(defun ricircola-collegamento-pool (dispatcher)
  \"Pre: owner corrente, RESCHEDULE con obbligo unico e bridge precedente chiuso.
Post: una sola operazione ready: NIL/PUBLISHED/count e IDLE, oppure link IDLE del
nuovo CLAIMED/count. Count della partizione, non cursore; nessun begin implicito.
Non legge il pool né conferma ritiro; busy conserva obbligo e retry esplicito.
Binding prima del trasferimento; errori C1 conservano i propri confini.
Routing fallito dopo full conserva lo scambio, senza rollback o nuovo fault C3.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (multiple-value-bind (writer outcome count)
        (arcdocdb.execution:ricircola-worker
         (arcdocdb.scheduler::porta-worker-pool-context port))
      (let ((status (%check-recycle-status outcome)))
        (case status
          (:claimed
           (unless writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values (arcdocdb.execution.series:collega-writer-worker-serie table) status count))
          (:published
           (when writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values nil status count))
          (otherwise (error 'invariant-violation :reason :pool-dispatcher-state)))))))
")
  (:PATH #A((23) BASE-CHAR . "src/dispatch/start.lisp") :BYTES 3259 :SHA256
   "087fd623a51a89d4f5fe4d917ba7f563c8062b6e24ead3618d7f2501e0335b5d" :GIT-BLOB
   "9b1964850e91e273ef21f9e371bdd2cd81673825" :TEXT
   ";;;; Un solo passo di selezione e, sul solo CLAIMED, un tentativo di avvio.
;;; OWNER: dispatcher, contesto e link sul thread creatore, senza reentrancy.
;;; SHARED: ready/pool per tratto e lease della sola Serie; nessun nuovo stato.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (notinline %prepara-tratto-esito))
(declaim (ftype (function (t t (member :claim :current :recycle) (or null index)
                           (member nil :unchanged :activated :retired :busy :faulted))
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 index (member :active :closing :empty :busy :inactive :published)
                                 (member nil :serie-busy :serie-lease-generation)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                %prepara-tratto-esito))
(defun %prepara-tratto-esito (link status origin detail action)
  \"Pre: un solo passo concluso dall'owner non rientrante, metadati originali.
Post: CLAIMED avviato una volta; altri esiti senza token o lavoro implicito.
Link/status T e NOTINLINE mantengono la difesa operativa fuori ftype.
INVARIANT-VIOLATION coppia/status; guasti C1 propagati senza rollback o cleanup.\"
  (case status
    (:claimed
     (unless (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
       (error 'invariant-violation :reason :pool-dispatcher-state))
     (multiple-value-bind (token state reason)
         (arcdocdb.execution.series:inizia-worker-serie link)
       (values link token state reason origin detail action)))
    ((:empty :busy :inactive :published)
     (unless (null link) (error 'invariant-violation :reason :pool-dispatcher-state))
     (values nil 0 status nil origin detail action))
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 index (member :active :closing :empty :busy :inactive :published)
                                 (member nil :serie-busy :serie-lease-generation)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                prepara-tratto-pool))
(defun prepara-tratto-pool (dispatcher)
  \"Pre: owner non rientrante, IDLE/CLAIMED/RESCHEDULE e bridge precedente chiuso.
Post: selezione e al piu un begin, sette valori con token/fase/ragione originali.
Una pubblicazione termina subito. Nessun secondo routing, pop, ACK, end o retry.
Binding/fasi/guasti delegati; CLOSING e capacita dopo errore restano al caller.\"
  (multiple-value-bind (link status origin detail action) (passo-dispatcher-pool dispatcher)
    (%prepara-tratto-esito link status origin detail action)))
")
  (:PATH #A((22) BASE-CHAR . "src/dispatch/step.lisp") :BYTES 3096 :SHA256
   "0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de" :GIT-BLOB
   "a4089abcd78bb811ca8279361af027e9822722c0" :TEXT
   ";;;; Un passo di governo: prima gli obblighi, nuova admission solo da IDLE.
;;; OWNER: dispatcher e contesto locali al thread creatore, senza reentrancy.
;;; SHARED: soli ingressi pool/ready/routing esistenti per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (notinline %passo-dispatcher-fase))
(declaim (ftype (function (dispatcher-writer-pool t)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive :published)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                %passo-dispatcher-fase))
(defun %passo-dispatcher-fase (dispatcher phase)
  \"Pre: binding verificato, fase osservata accettata come T senza assunzioni C1.
Post: un solo ingresso operativo, cinque valori senza confondere cursor/count.
Fasi note non ammesse RESOURCE-EXHAUSTED; inattesa INVARIANT-VIOLATION.
NOTINLINE conserva la difesa fuori ftype; nessun controllo dopo acquisizione.\"
  (case phase
    (:idle
     (multiple-value-bind (link status cursor action) (prendi-collegamento-pool dispatcher)
       (values link status :claim cursor action)))
    (:claimed
     (values (collega-obbligo-pool dispatcher) :claimed :current nil nil))
    (:reschedule
     (multiple-value-bind (link status count) (ricircola-collegamento-pool dispatcher)
       (values link status :recycle count nil)))
    ((:running :batch :finishing :faulted)
     (error 'resource-exhausted :reason :worker-state))
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive :published)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                passo-dispatcher-pool))
(defun passo-dispatcher-pool (dispatcher)
  \"Pre: owner corrente, fase IDLE/CLAIMED/RESCHEDULE coerente, bridge gia chiuso.
Post: claim/current/recycle esclusivi, al piu un trasferimento ready; nessun begin.
Binding prima della lettura fase; rifiuti/fault delegati senza rollback o cleanup.
Pubblicazione termina il passo; nessuna nuova presa o ACK impliciti dopo recycle.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (%passo-dispatcher-fase
     dispatcher (arcdocdb.execution:stato-worker-writer
                 (arcdocdb.scheduler::porta-worker-pool-context port)))))
")
  (:PATH #A((23) BASE-CHAR . "src/dispatch/types.lisp") :BYTES 1872 :SHA256
   "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
   "09b357c8f46c67d8e57994e1fa37affdd25a1695" :TEXT
   ";;;; Binding immutabile tra porta del pool e routing locale dello stesso worker.
;;; OWNER: dispatcher e tabella del thread creatore; nessuna migrazione o reentrancy.
;;; SHARED: nessuna nuova struttura condivisa o scrittura globale per operazione.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (dispatcher-writer-pool
             (:constructor %make-dispatcher-writer-pool (port table)) (:copier nil))
  \"Pre: porta e tabella sul medesimo contesto IDLE, owner corrente verificato.
Post: binding preallocato immutabile; nessun claim, lease o comando applicato.\"
  (port nil :type arcdocdb.scheduler:porta-worker-pool :read-only t)
  (table nil :type arcdocdb.execution.series:tabella-worker-serie :read-only t))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) null) %check-dispatcher-binding))
(defun %check-dispatcher-binding (port table)
  \"Pre: factory o dispatcher privato. Post: owner e identità del contesto validi.
INVALID-ARGUMENT configuration/owner/binding prima di ACK, claim o routing.
Nessuna lettura di fase, parole pool, ready, lease o controller vivo.\"
  (unless (typep port 'arcdocdb.scheduler:porta-worker-pool)
    (error 'invalid-argument :reason :pool-dispatcher-configuration))
  (unless (eq (arcdocdb.scheduler::porta-worker-pool-owner port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-worker-owner))
  (unless (typep table 'arcdocdb.execution.series:tabella-worker-serie)
    (error 'invalid-argument :reason :pool-dispatcher-configuration))
  (unless (eq (arcdocdb.scheduler::porta-worker-pool-context port)
              (arcdocdb.execution.series::tabella-worker-serie-context table))
    (error 'invalid-argument :reason :pool-dispatcher-binding))
  nil)
")
  (:PATH #A((12) BASE-CHAR . "arcdocdb.asd") :BYTES 19321 :SHA256
   "2b069c81bd728ec946569cdfbc5d6ad650109402f3ff50e0f4e9cba8a69bc944" :GIT-BLOB
   "276ef61fbbeccbab7acf5bdbfc6bb78a58252538" :TEXT
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
                             (:file \"cbor-write\") (:file \"cbor-string-write\")
                             (:file \"cbor-simple-write\")
                             (:file \"cbor-float-narrow\") (:file \"cbor-float-write\")
                             (:file \"cbor-array-input\") (:file \"cbor-array-write\")
                             (:file \"cbor-map-input\") (:file \"cbor-map-write\")
                             (:file \"cbor-tag-input\") (:file \"cbor-tag-write\")
                             (:file \"cbor-item-read\")))
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
               (:module \"scheduler\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"read\") (:file \"policy\") (:file \"update\")
                             (:file \"lifecycle-types\") (:file \"lifecycle-read\")
                             (:file \"lifecycle-build\") (:file \"lifecycle-worker\")
                             (:file \"lifecycle-update\") (:file \"pool-claim\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"package\") (:file \"formats\") (:file \"segment-header\")
                             (:file \"log-header\") (:file \"compaction-scan\")
                             (:file \"control-payload\") (:file \"payload-record\")
                             (:file \"payload-write\")))
               (:module \"io\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"identity-types\")
                             (:file \"native\") (:file \"native-namespace\") (:file \"lifecycle\") (:file \"identity\")
                             (:file \"rename\") (:file \"namespace\") (:file \"transfer\") (:file \"flush\")))
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
               (:module \"dispatch\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"claim\")
                             (:file \"recycle\") (:file \"begin\") (:file \"step\") (:file \"start\")))
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
                             (:file \"manifest-build\") (:file \"manifest-query\") (:file \"manifest-transition\")
                             (:file \"inventory-types\") (:file \"inventory-build\")
                             (:file \"inventory-query\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"scan\") (:file \"sort\")
                             (:file \"rows\") (:file \"build\") (:file \"read\")
                             (:file \"active-types\") (:file \"active-directory\")
                             (:file \"active-scan\") (:file \"active-build\") (:file \"active-init\")
                             (:file \"active-preflight\") (:file \"active-read\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"read\")
                             (:file \"sources-types\") (:file \"sources-read\")))
               (:module \"active\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"preflight\")
                             (:file \"prepare\") (:file \"source\")))
               (:module \"control\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"dependency\")
                             (:file \"build\") (:file \"preflight\") (:file \"transfer\") (:file \"prepare\")
                             (:file \"publication\") (:file \"publication-read\")
                             (:file \"recovery-types\") (:file \"recovery-read\") (:file \"recovery-publication\")))
               (:module \"recovery-active\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"read\") (:file \"frames\")
                             (:file \"resolve\") (:file \"build\") (:file \"query\")
                             (:file \"closure\") (:file \"publication\")))
               (:module \"recovery-archive\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"read\")
                             (:file \"build\") (:file \"query\") (:file \"active\")))
               (:module \"recovery-checkpoint\" :serial t
                :components ((:file \"package\") (:file \"preflight\") (:file \"order\")
                             (:file \"sections\") (:file \"build\")))
               (:module \"recovery-closed\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"read\") (:file \"verify\")
                             (:file \"resolve\") (:file \"build\") (:file \"publication\"))))
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
                             (:file \"cbor-string-write-threads\")
                             (:file \"cbor-simple-write-support\") (:file \"cbor-simple-write\")
                             (:file \"cbor-simple-write-threads\")
                             (:file \"cbor-float-write-support\") (:file \"cbor-float-write\")
                             (:file \"cbor-float-write-threads\")
                             (:file \"cbor-array-write-support\") (:file \"cbor-array-write\")
                             (:file \"cbor-array-write-threads\")
                             (:file \"cbor-map-write-support\") (:file \"cbor-map-write\")
                             (:file \"cbor-map-write-threads\")
                             (:file \"cbor-tag-write-support\") (:file \"cbor-tag-write\")
                             (:file \"cbor-tag-write-threads\")
                             (:file \"cbor-item-read-support\") (:file \"cbor-item-read\")
                             (:file \"cbor-item-read-threads\")))
               (:module \"csn\" :serial t
                :components ((:file \"support\") (:file \"registry\") (:file \"threads\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"capture\")))
               (:module \"epochs\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"read\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"get\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"segment\")))
               (:module \"get-performance\" :serial t
                :components ((:file \"support\") (:file \"paths\") (:file \"guards\") (:file \"threads\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"read\") (:file \"threads\")
                             (:file \"series-support\") (:file \"series-read\")
                             (:file \"lifetime-support\") (:file \"lifetime\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"support\") (:file \"sort\") (:file \"construction\") (:file \"read\")))
               (:module \"get-active\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"preflight\")
                             (:file \"directory\") (:file \"read\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"lifecycle\")
                             (:file \"pool-claim\") (:file \"dispatch\") (:file \"pool-recycle\")
                             (:file \"pool-begin\") (:file \"pool-step\")
                             (:file \"pool-chain-support\") (:file \"pool-chain\") (:file \"pool-start\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"support\") (:file \"segment-header\") (:file \"log-header\")
                             (:file \"compaction-scan\")
                             (:file \"control-payload\")))
               (:module \"io\" :serial t
                :components ((:file \"support\") (:file \"transfer\") (:file \"native\")
                             (:file \"rename\") (:file \"rename-native\") (:file \"flush-failure\")
                             (:file \"transfer-failure\")))
               (:module \"control\" :serial t
                :components ((:file \"support\") (:file \"publication\") (:file \"native\")
                             (:file \"recovery-read\") (:file \"recovery-publication\") (:file \"recovery-guards\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\") (:file \"manifest-transition\")
                             (:file \"inventory-support\") (:file \"inventory\")))
               (:module \"recovery-active\" :serial t
                :components ((:file \"support\") (:file \"read\") (:file \"semantics\") (:file \"publication\")))
               (:module \"recovery-archive\" :serial t
                :components ((:file \"support\") (:file \"read\") (:file \"query\")
                             (:file \"active\") (:file \"native\") (:file \"guards\")))

               (:module \"recovery-active-checkpoint\" :serial t
                :components ((:file \"support\") (:file \"semantics\") (:file \"guards\")
                             (:file \"publication\")))
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
             (uiop:symbol-call '#:arcdocdb.cbor.simple.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.float.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.array.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.map.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tag.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.item.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.directory.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.resolver.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.scheduler.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.storage.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.io.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.control.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.archive.tests '#:run)

             (uiop:symbol-call '#:arcdocdb.recovery.active.checkpoint.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)))
")
  (:PATH #A((31) BASE-CHAR . "tests/scheduler/pool-start.lisp") :BYTES 23464 :SHA256
   "a6647dc88a69d58437ee8d738bf14b7d2dea94f17b24067a4fb3b4532f9a0bdd" :GIT-BLOB
   "ec19bb409799e7956e40c34cc9264d02033cfb22" :TEXT
   ";;;; Selezione e un solo begin: sette risultati e obblighi reali conservati.
;;;; OWNER: fixture e FI quiescenti sul creatore; foreign-owner su thread distinto.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-start-check (dispatcher link token state reason origin detail action)
  (is (equal (list link token state reason origin detail action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:prepara-tratto-pool dispatcher))))
  token)

(defun pool-start-observe (routes begins thunk)
  \"Conta il solo ingresso; vieta seconda selezione, routing e lavoro implicito.\"
  (let ((names #(arcdocdb.scheduler.dispatch:passo-dispatcher-pool
                 arcdocdb.execution.series:collega-writer-worker-serie
                 arcdocdb.execution.series:inizia-worker-serie
                 arcdocdb.execution.series:preleva-worker-serie
                 arcdocdb.execution.series:conferma-worker-serie
                 arcdocdb.execution.series:termina-worker-serie
                 arcdocdb.scheduler.dispatch:inizia-obbligo-pool))
        (expected (vector 1 routes begins 0 0 0 0)) (calls (make-array 7 :initial-element 0)))
    (labels ((protect (index)
               (if (= index 7) (funcall thunk)
                   (let ((original (fdefinition (svref names index))))
                     (pool-claim-function-fi
                      (svref names index)
                      (lambda (&rest args) (incf (svref calls index)) (apply original args))
                      (lambda () (protect (1+ index))))))))
      (multiple-value-prog1 (protect 0) (is (equalp expected calls))))))

(defun pool-start-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers (lambda () (arcdocdb.scheduler.dispatch:prepara-tratto-pool dispatcher))
   type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-start-activation-claim-and-one-begin-with-original-metadata
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :left-items '(:a1))
    (declare (ignorable controllers))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 (svref writers 0))))
      (pool-start-observe
       1 1 (lambda () (pool-start-check dispatcher link 1 :active nil :claim 2 :activated)))
      (is (eq :running (arcdocdb.execution:stato-worker-writer context)))
      (is (equal '(3 3 nil) (lifecycle-words port)))
      (is (= 1 (arcdocdb.execution::coda-writer-count
                (arcdocdb.execution::writer-programmabile-queue (svref writers 0)))))
      (pool-begin-complete link 1 :a1 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-start-empty-busy-inactive-never-route-or-begin
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3)
    (declare (ignorable controllers))
    (pool-start-observe 0 0 (lambda ()
                             (pool-start-check dispatcher nil 0 :empty nil :claim 1 :unchanged)))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 (svref writers 0))))
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 1))
     (lambda ()
       (pool-start-observe 0 0 (lambda ()
                                (pool-start-check dispatcher nil 0 :busy nil :claim 2 :unchanged)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 2)
    (pool-dispatch-finish (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 2)
    (pool-dispatch-finish (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable context controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-start-observe 0 0 (lambda ()
                               (pool-start-check dispatcher nil 0 :inactive nil :claim 0 :unchanged)))
      (is (equalp before (pool-dispatch-image port table writers))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-start-current-prioritizes-obligation-over-inactive-or-retirement
  (dolist (retire '(nil t))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active retire :left-items '(:a1))
      (declare (ignorable ready controllers))
      (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
      (when retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2))
      (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0))
            (words (lifecycle-words port)))
        (pool-start-observe 1 1 (lambda ()
                                 (pool-start-check dispatcher link 1 :active nil :current nil nil)))
        (is (equal words (lifecycle-words port)))
        (pool-begin-complete link 1 :a1 :idle)
        (when retire
          (pool-start-check dispatcher nil 0 :inactive nil :claim 0 :retired))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-start-full-begins-new-writer-and-preserves-pending-retirement
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((right (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)))
      (pool-start-observe 1 1 (lambda ()
                               (pool-start-check dispatcher right 1 :active nil :recycle 1 nil)))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-begin-complete right 1 :b1 :idle))
    (pool-start-check dispatcher nil 0 :inactive nil :claim 0 :retired)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-start-room-stops-after-publication-without-second-claim-or-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :capacity 2 :shards 3 :start 1)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-start-observe 0 0 (lambda ()
                             (pool-start-check dispatcher nil 0 :published nil :recycle 2 nil)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (pool-start-check dispatcher nil 0 :inactive nil :claim 0 :retired)
    (loop for ordinal in '(1 0) for item in '(:b1 :a2)
          do (arcdocdb.execution.tests::worker-check-claim context (svref writers ordinal) :claimed 0)
             (pool-dispatch-finish (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) item :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-start-writer-busy-preserves-claimed-and-consumes-no-token
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (lifecycle-queue-busy
     (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
     (lambda () (pool-start-refusal dispatcher port table writers
                                    'resource-exhausted :writer-queue-busy)))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-start-check dispatcher link 1 :active nil :current nil nil)
      (pool-begin-complete link 1 :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-start-writer-busy-after-claim-keeps-transfer-and-activation-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :left-items '(:a1))
    (declare (ignorable controllers))
    (let* ((writer (svref writers 0))
           (link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (lifecycle-queue-busy
       (arcdocdb.execution::writer-programmabile-queue writer)
       (lambda ()
         (pool-start-observe
          1 1 (lambda ()
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:prepara-tratto-pool dispatcher))
                 'resource-exhausted :writer-queue-busy)))))
      (is (equal '(3 3 nil) (lifecycle-words port)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
      (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-generation link)))
      (pool-start-check dispatcher link 1 :active nil :current nil nil)
      (pool-begin-complete link 1 :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-start-routing-fault-after-claim-never-begins-or-rolls-back-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable writers))
    (let ((unknown (pool-claim-writer '(:unknown) 2))
          (before (map 'list #'pool-dispatch-series-image controllers)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 unknown)))
      (let ((cause
              (pool-start-observe
               1 0 (lambda ()
                     (arcdocdb.execution.tests::worker-capture-condition
                      (lambda () (arcdocdb.scheduler.dispatch:prepara-tratto-pool dispatcher))
                      'invariant-violation :worker-serie-routing)))))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq cause (arcdocdb.execution:errore-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (equal '(3 3 nil) (lifecycle-words port)))
        (is (equalp before (map 'list #'pool-dispatch-series-image controllers)))
        (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                   (arcdocdb.execution.series::tabella-worker-serie-links table)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-start-ready-busy-keeps-reschedule-and-ring
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda () (pool-start-refusal dispatcher port table writers
                                    'resource-exhausted :ready-queue-busy)))
    (pool-start-check dispatcher nil 0 :published nil :recycle 1 nil)
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-start-check dispatcher link 2 :active nil :claim 0 :unchanged)
      (pool-begin-complete link 2 :a2 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-start-serie-busy-or-generation-exhausted-returns-live-closing-token
  (dolist (scenario '(:busy :generation))
    (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
      (let* ((controller (svref controllers 0))
             (link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0))
             (held (when (eq scenario :busy) (arcdocdb.series:acquisisci-controllore-serie controller)))
             (saved (arcdocdb.series::controllore-serie-lease-generation controller)))
        (unwind-protect
             (progn
               (when (eq scenario :generation)
                 (setf (arcdocdb.series::controllore-serie-lease-generation controller)
                       most-positive-fixnum))
               (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
               (pool-start-observe
                1 1 (lambda ()
                      (pool-start-check dispatcher link 1 :closing
                                        (if held :serie-busy :serie-lease-generation)
                                        :claim 0 :unchanged)))
               (is (eq :running (arcdocdb.execution:stato-worker-writer context)))
               (is (eq :closing (arcdocdb.execution.series:stato-worker-serie link)))
               (is (plusp (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
               (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
               (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link 1))))
          (if held (arcdocdb.series:rilascia-controllore-serie controller held)
              (setf (arcdocdb.series::controllore-serie-lease-generation controller) saved)))
        (pool-start-check dispatcher nil 0 :published nil :recycle 1 nil)
        (pool-start-check dispatcher link 2 :active nil :claim 0 :unchanged)
        (pool-begin-complete link 2 :a1 :idle)))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-start-local-generation-limit-before-either-lease
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (let* ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0))
           (saved (arcdocdb.execution.series::collegamento-worker-serie-generation link)))
      (unwind-protect
           (progn
             (setf (arcdocdb.execution.series::collegamento-worker-serie-generation link)
                   most-positive-fixnum)
             (pool-start-refusal dispatcher port table writers
                                 'resource-exhausted :worker-serie-generation))
        (setf (arcdocdb.execution.series::collegamento-worker-serie-generation link) saved))
      (pool-start-check dispatcher link 1 :active nil :current nil nil)
      (pool-begin-complete link 1 :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-start-active-batch-finishing-and-faulted-refuse-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-start-check dispatcher link 1 :active nil :claim 0 :unchanged)
      (flet ((refuse () (pool-start-refusal dispatcher port table writers
                                           'resource-exhausted :worker-state)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link 1 :a1)))
          (refuse) (arcdocdb.execution.series:conferma-worker-serie link 1 batch))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted (arcdocdb.execution.series:termina-worker-serie link 1)
                    :writer-queue-busy)
           (refuse)))
        (is (eq :idle (arcdocdb.execution.series:termina-worker-serie link 1)))
        (let ((original (make-condition 'invariant-violation :reason :worker-state)))
          (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
                (arcdocdb.execution::contesto-worker-writer-fault context) original)
          (refuse) (is (eq original (arcdocdb.execution:errore-worker-writer context))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-start-binding-before-selection-or-acquisition
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context controllers))
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-start-observe
       0 0 (lambda () (pool-start-refusal bad port table writers
                                          'invalid-argument :pool-dispatcher-binding))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-start-real-foreign-owner-refuses-before-routing
  (let ((worker (lifecycle-fixture-start t)))
    (multiple-value-bind (controller file) (pool-claim-series 95)
      (unwind-protect
           (let* ((writers (vector (pool-claim-writer '(:kept) 0)))
                  (registry (arcdocdb.execution.series:crea-registro-worker-serie
                             writers (vector controller)))
                  (dispatcher
                    (lifecycle-call
                     worker (lambda (owned)
                              (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                               (lifecycle-fixture-port owned)
                               (arcdocdb.execution.series:crea-tabella-worker-serie
                                (lifecycle-fixture-context owned) registry))))))
             (pool-start-observe
              0 0 (lambda ()
                    (signals invalid-argument
                      (arcdocdb.scheduler.dispatch:prepara-tratto-pool dispatcher) :pool-worker-owner))))
        (lifecycle-fixtures-stop (list worker)) (arcdocdb.io:chiudi file)))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-start-defensive-status-and-link-pairs-are-operational
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (dolist (row (list (list nil :claimed) (list :bad :claimed)
                        (list link :empty) (list link :busy) (list link :inactive)
                        (list link :published) (list nil :future) (list nil nil)
                        (list nil 7) (list nil :running)))
        (pool-claim-function-fi
         'arcdocdb.scheduler.dispatch:passo-dispatcher-pool
         (lambda (value) (declare (ignore value))
           (values (first row) (second row) :claim 0 :unchanged))
         (lambda () (pool-start-observe
                     0 0 (lambda () (pool-start-refusal dispatcher port table writers
                                                        'invariant-violation :pool-dispatcher-state)))))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-start-unexpected-acquire-keeps-first-c1-cause-and-writer-lease
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0))
           (writer (svref writers 0))
           (cause (make-condition 'arcdocdb.conditions:io-fault :reason :pool-start-acquire
                                  :operation :series))
           (before (map 'list #'pool-dispatch-series-image controllers)) (lease nil))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (unwind-protect
           (let ((caught
                   (pool-claim-function-fi
                    'arcdocdb.series:acquisisci-controllore-serie
                    (lambda (value) (declare (ignore value)) (error cause))
                    (lambda () (arcdocdb.execution.tests::worker-capture-condition
                                (lambda () (arcdocdb.scheduler.dispatch:prepara-tratto-pool dispatcher))
                                'arcdocdb.conditions:io-fault :pool-start-acquire)))))
             (setf lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
             (is (eq cause caught)) (is (plusp lease))
             (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
             (is (eq :faulted (arcdocdb.execution.series:stato-worker-serie link)))
             (is (eq cause (arcdocdb.execution:errore-worker-writer context)))
             (is (eq cause (arcdocdb.execution.series:errore-worker-serie link)))
             (is (equalp before (map 'list #'pool-dispatch-series-image controllers)))
             (pool-start-refusal dispatcher port table writers 'resource-exhausted :worker-state)
             (is (eq cause (arcdocdb.execution:errore-worker-writer context))))
        (when lease (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer lease))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-start-invalid-dispatcher-is-typed-and-does-not-touch-fixture
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error
        (funcall (fdefinition 'arcdocdb.scheduler.dispatch:prepara-tratto-pool) :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))
")
  (:PATH #A((29) BASE-CHAR . "tools/measure-pool-start.lisp") :BYTES 12728 :SHA256
   "72dad0204d67d2d2596ee60dc252f939fc1bec2b82eeac8f19854299e48e73cf" :GIT-BLOB
   "e6be453833925b89cdc49303b99a23374f3b2689" :TEXT
   ";;;; C4: EMPTY e quattro tratti ACTIVE completi; non isola il costo dell'adapter.
;;;; Cinque fixture fresche per campagna, 4096 cicli e 128 warmup per replica.
;;;; --self-test | --bench directory-nuova/. Library: :arcdocdb-pool-start-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: fixture e sensore sul thread C4; nessun coordinatore concorrente.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-STEP.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-step-measure-library *features*)))
      (load \"tools/measure-pool-step.lisp\"))))
(defpackage #:arcdocdb.pool-start.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:acquire-directory #:write-report #:load-product
                #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-start.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defun fingerprints ()
  (append (arcdocdb.pool-step.measure::fingerprints)
          (list (list :file \"tools/measure-pool-start.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-start.lisp\") 'list))))))

(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  (arcdocdb.pool-step.measure::api name package))

(defun verify-preparation (function dispatcher expected token state reason origin detail action)
  \"Oracolo scalare dei sette risultati, incluso token0 degli esiti senza begin.\"
  (multiple-value-bind (link actual-token actual-state actual-reason actual-origin actual-detail actual-action)
      (funcall function dispatcher)
    (unless (and (eq expected link) (eql token actual-token) (eq state actual-state)
                 (eq reason actual-reason) (eq origin actual-origin) (eql detail actual-detail)
                 (eq action actual-action))
      (error \"COD-60: risultati prepara-tratto-pool difformi.\"))))

(defun create-empty-cycle ()
  (multiple-value-bind (dispatcher context ready writer link file)
      (arcdocdb.pool-step.measure::make-dispatch t 0)
    (declare (ignore context ready writer link))
    (let ((prepare (api \"PREPARA-TRATTO-POOL\")))
      (values (lambda ()
                (verify-preparation prepare dispatcher nil 0 :empty nil :claim 1 :unchanged)
                (verify-preparation prepare dispatcher nil 0 :empty nil :claim 2 :unchanged)
                (verify-preparation prepare dispatcher nil 0 :empty nil :claim 3 :unchanged)
                (verify-preparation prepare dispatcher nil 0 :empty nil :claim 0 :unchanged)
                12)
              12 (lambda () (arcdocdb.pool-step.measure::close-fixture file))))))

(defun create-active-cycle ()
  \"Quattro payload reali: enqueue/publish/prepare/pop/ACK/end, interamente nel clock.\"
  (multiple-value-bind (dispatcher context ready writer link file)
      (arcdocdb.pool-step.measure::make-dispatch t 0)
    (declare (ignore context))
    (let ((prepare (api \"PREPARA-TRATTO-POOL\"))
          (enqueue (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (publish (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\"))
          (take (api \"PRELEVA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (ack (api \"CONFERMA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (finish (api \"TERMINA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (target (vector :left nil :right)) (generation 0))
      (declare (type fixnum generation))
      (values
       (lambda ()
         (dotimes (index 4)
           (multiple-value-bind (count action) (funcall enqueue writer :start-C4)
             (unless (and (= 1 count) (eq :schedule action)) (error \"COD-60: enqueue ACTIVE.\")))
           (unless (= 1 (funcall publish ready 0 writer)) (error \"COD-60: publish ACTIVE.\"))
           (incf generation)
           (verify-preparation prepare dispatcher link generation :active nil :claim 1 :unchanged)
           (multiple-value-bind (count status batch) (funcall take link generation target 1 2)
             (unless (and (= 1 count) (eq :messages status) (plusp batch)
                          (eq :left (svref target 0)) (eq :start-C4 (svref target 1))
                          (eq :right (svref target 2)))
               (error \"COD-60: payload/count/token ACTIVE.\"))
             (unless (null (funcall ack link generation batch)) (error \"COD-60: ACK ACTIVE.\")))
           (unless (eq :idle (funcall finish link generation)) (error \"COD-60: end ACTIVE.\")))
         28)
       28 (lambda () (arcdocdb.pool-step.measure::close-fixture file))))))

(defun campaign (report checkpoint)
  (arcdocdb.pool-step.measure::campaign-group :empty #'create-empty-cycle report checkpoint)
  (arcdocdb.pool-step.measure::campaign-group :active-cycle #'create-active-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)

(defun make-report ()
  (list :schema-version 1 :kind :pool-start-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:empty :fixtures 5 :shards 4 :preparations-per-cycle 4 :token 12)
                    (:active-cycle :fixtures 5 :shards 4 :preparations-per-cycle 4 :payloads-per-cycle 4
                     :includes-enqueue-publish-pop-ack-end t :token 28))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; ACTIVE-CYCLE=28\"
        :limits '(:fresh-fixture-per-replica :factory-api-resolution-and-gc-excluded
                  :complete-active-cycle-in-clock :not-adapter-only-cost
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-concurrent-coordinator :no-recycle-or-refusal-latency-measured
                  :fixture-backend-close-on-failure :no-product-rollback-or-cleanup
                  :no-physical-worker-lifecycle-or-whole-engine-qualification)))

(defun self-test-oracle ()
  (dolist (row '((:bad 17 :active nil :claim 1 :unchanged)
                 (:link 18 :active nil :claim 1 :unchanged)
                 (:link 17 :closing nil :claim 1 :unchanged)
                 (:link 17 :active :serie-busy :claim 1 :unchanged)
                 (:link 17 :active nil :current 1 :unchanged)
                 (:link 17 :active nil :claim 2 :unchanged)
                 (:link 17 :active nil :claim 1 :activated)))
    (unless (handler-case
                (progn
                  (verify-preparation (lambda (value) (declare (ignore value)) (values-list row))
                                      nil :link 17 :active nil :claim 1 :unchanged)
                  nil)
              (error () t))
      (error \"COD-60: oracolo sette risultati non rileva errore.\")))
  :passed)

(defun self-test ()
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :seven-values (self-test-oracle) :cli-and-partial (self-test-reporter)
        :empty (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-empty-cycle)
        :active-cycle (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-active-cycle)))

(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver step compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
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

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)

(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-start.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-start-measure-library *features*) (main))
")
  (:PATH #A((39) BASE-CHAR . "spikes/out/pool-start/coverage-run.lisp") :BYTES 2793 :SHA256
   "3b869030b495ae7a0532685f614670ca347bc392137bbf0687623862e402c4c2" :GIT-BLOB
   "4f94c4f0dbd730c8e3eeb0fd10466b5429b3ff29" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :dispatch-coverage-reader-library *features*)
;; Keep startup code-component marks across ASDF GC without modifying any observed bit.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/dispatch/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments)) (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool dispatch coverage: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (condition) (error condition)))
                 (style-warning (lambda (condition) (error condition))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-start/dispatch-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (condition)
                           (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path)
                                            (search \"/src/dispatch/\" path)))))
    (unless html (error \"COD-60: dispatch source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"AUDIT-DISPATCH-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory)
                     (merge-pathnames \"coverage-dispatch-audit.lisp\" directory))))
")
  (:PATH #A((51) BASE-CHAR . "spikes/out/pool-start/dispatch-coverage-reader.lisp") :BYTES 9397
   :SHA256 "561ef6d1dbb9b17e8221d3085ebec6202940c033cbb94ae047c765a1b032939d" :GIT-BLOB
   "6d1f8d41ac644ac2bf3d8575728b04f30cc9722d" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole eight-file dispatch scope.
;;;; The legacy audit remains original; metadata-only dispatch audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-DISPATCH-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.dispatch.coverage.reader (:use #:cl))
(in-package #:arcdocdb.dispatch.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\" \"src/dispatch/step.lisp\" \"src/dispatch/start.lisp\"))

(defun dispatch-source-identity (path)
  \"All dispatch-directory files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"dispatch source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (uiop:string-prefix-p \"src/dispatch/\" identity)
          identity)))))

(defun call-dispatch-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (original-html (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'dispatch-source-identity
                      (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows)
                      #'dispatch-html-count-rows)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original
            (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows) original-html))))


(defun dispatch-html-count-rows (html)
  \"Namespace-only adapter: unchanged native/TD/count parser, original dispatch heading/identities.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (arcdocdb.lifecycle.coverage.reader::reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (arcdocdb.lifecycle.coverage.reader::html-cells row))
                           (identity (and (= 1 (length cells)) (dispatch-source-identity (first cells)))))
                      (setf directory (when (equal identity \"src/dispatch/\") identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (arcdocdb.lifecycle.coverage.reader::html-data-counts row directory))
                           (identity (first counts)))
                      (arcdocdb.lifecycle.coverage.reader::reader-require
                       (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun adapter-self-test ()
  \"Original library malformed input/gate tests plus independent dispatch inventory/path fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-dispatch-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/dispatch/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/begin.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/start.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/step.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/types.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/dispatch/build.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/claim.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/recycle.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='begin'>begin.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='r'>recycle.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='start'>start.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='s'>step.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/begin.lisp\" 1 1 0 0) (\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 1 1 0 0)
                        (\"src/dispatch/start.lisp\" 1 1 0 0) (\"src/dispatch/step.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(8 9 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (eighth rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"dispatch missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (dispatch-source-identity \"/a/src/dispatch/unexpected.lisp\") \"src/dispatch/unexpected.lisp\")
        \"unexpected module silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/dispatch/types.lisp\" #((0)) #*0)
                          (list* \"/b/src/dispatch/types.lisp\" #((0)) #*1)))))
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::html-count-rows (concatenate 'string html html)))))))
  :passed)

(defun audit-dispatch-coverage (native html library-output dispatch-output)
  \"All eight dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-start-coverage-audit
          (getf report :scope) :entire-eight-file-dispatch-package
          (getf report :dispatch-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :namespace-adapter) :dispatch-heading-with-unchanged-td-and-native-parser
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream dispatch-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :dispatch-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: dispatch coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Dispatch coverage reader self-test PASS~%\"))
")
  (:PATH #A((37) BASE-CHAR . "spikes/out/pool-start/reader-run.lisp") :BYTES 711 :SHA256
   "7de22c68baace90fad6e1e3037d597f703f7efa3d6e68b6d2da8e15144d15aef" :GIT-BLOB
   "b04db4615758fdd17ba94e3387bb0aebe81a7566" :TEXT "(require :asdf)
(pushnew :dispatch-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-start/dispatch-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-start/dispatch-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Dispatch coverage reader self-test PASS~%\")
")
  (:PATH #A((35) BASE-CHAR . "spikes/out/pool-start/tool-run.lisp") :BYTES 616 :SHA256
   "83e717a03a89cc099e33092811f236462be151fbab773262883c33331e5b873b" :GIT-BLOB
   "ddebadf116eaeee218b2f8ce534c9898cc9e5768" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-start-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-start.lisp\"
                    :output-file \"spikes/out/pool-start/measure-pool-start.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-start compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-START.MEASURE\" \"MAIN\")
")
  (:PATH #A((36) BASE-CHAR . "docs/implementazione/pool-prepara.md") :BYTES 3972 :SHA256
   "d89173554525977c89e691e067eda1a43cbdad2ae7ffd8a29408210ed6aef3da" :GIT-BLOB
   "14ff3e1b5cc133a64beace7e116cb850fafb7858" :TEXT "# Preparare un tratto dal pool alla Serie

`arcdocdb.scheduler.dispatch:prepara-tratto-pool` unisce il
[passo del dispatcher](pool-step.md) e un solo begin del bridge, sul link
appena selezionato. Incremento C3 di REQ-THR-001, REQ-CON-001/002/004/005 e
REQ-AFF-008; [metodo preregistrato](pool-prepara-metodo.md),
[rilettura C3/C4](pool-prepara-revisione.md). Nessuna modifica ai protocolli C1.

## Sette valori, un solo passo

Owner corrente non rientrante, binding coerente e bridge precedente chiuso.
Il passo seleziona claim, current o recycle dalla fase del contesto.
Con CLAIMED il link restituito è già quello corrente: viene avviato direttamente
senza un secondo routing. Il primo gruppo di valori segue l'avvio esplicito;
il secondo conserva i metadati della selezione senza reinterpretarli.

| Stato | Link | Token | Ragione | Origine/dettaglio/azione |
|---|---|---|---|---|
| ACTIVE | Link selezionato | Positivo, originale del bridge | NIL | Originali del passo |
| CLOSING | Link selezionato | Positivo, originale del bridge | `:serie-busy` o `:serie-lease-generation` | Originali del passo |
| EMPTY, BUSY, INACTIVE | NIL | 0 | NIL | `:claim`, cursore originale, azione lifecycle |
| PUBLISHED | NIL | 0 | NIL | `:recycle`, count della partizione, NIL |

Ordine: **link, token, stato, ragione, origine, dettaglio, azione**.
Per un CLAIMED già esistente: origine `:current`, dettaglio e azione NIL.
Per un full: origine `:recycle`, count e azione NIL. L'azione NIL non prova
che il comando pool sia immutato: in questi due casi il pool non è consultato.
Il ritiro pendente non impedisce il completamento dell'obbligo corrente.

Ogni chiamata esegue al più **un trasferimento ready e un tentativo di begin**.
Una pubblicazione termina subito: nessuna seconda presa o conferma del ritiro.
EMPTY/BUSY/INACTIVE non provano quiescenza e non autorizzano park o shutdown.
Non si eseguono pop, applicazione payload, ACK batch o end del bridge.

## Rifiuti e guasti

Con ACTIVE il caller usa link/token per prelevare, applicare, confermare e
terminare esplicitamente. Con CLOSING chiude il tratto prima del ricircolo;
non ritenta l'acquisizione della Serie. L'esaurimento della generazione
richiede gestione della risorsa e non una riprogrammazione indefinita.

BUSY restituito dal gate non avvia nulla. La condizione
`resource-exhausted :writer-queue-busy` durante begin conserva invece CLAIMED
e link IDLE senza consumare un token del bridge. Se la presa e l'ACK di
attivazione erano già riusciti, rimangono validi. Ready busy durante recycle
conserva RESCHEDULE e l'obbligo. Il caller decide eventuali tentativi successivi.

Owner, binding e fasi attive sono verificati dal passo prima di nuove azioni.
La coppia link/status incoerente o uno status inatteso segnala
`invariant-violation :pool-dispatcher-state` prima del begin. I controlli
NOTINLINE con argomenti T restano operativi anche nelle FI fuori contratto.

I guasti inattesi dei delegati propagano la medesima condizione. Non sono
restituiti i sette valori quando begin fallisce: il caller conserva in anticipo
dispatcher, contesto, tabella e riferimenti alle risorse configurate. Lease,
link e diagnosi restano nelle strutture C1, anche quando terminali; non viene
promessa una nuova API di recupero delle capacità dopo FAULTED. Il coordinamento
dell'Archivio resta necessario. Nessun handler, rollback o cleanup C3 viene aggiunto.

## Costo e confini

Scelta dell'esito e avvio sono O(1); solo il claim può scandire K partizioni,
K ≤64. Routing eseguito una sola volta. Nessun nuovo stato mutabile, ciclo,
thread, callback, I/O, attesa o scrittura condivisa tra Serie per messaggio.
Nessuna nuova allocazione intenzionale: le misure includono i controlli C1
e il ciclo reale della fixture, senza isolare il solo costo dell'adapter.
Applicazione dei payload del motore, park/wake, sensori reali, lifecycle fisico
e coordinamento Archivio restano aperti; il motore completo non è qualificato.
")
  (:PATH #A((43) BASE-CHAR . "docs/implementazione/pool-prepara-metodo.md") :BYTES 3110 :SHA256
   "3c209be9f587a7f5afa0ad082a5a643fd4adbae4194e85279daf35490ffd899a" :GIT-BLOB
   "1adf298ac2b0cbcb211f622c5e83cab4e84efbff" :TEXT
   "# Preparazione bounded di un tratto pool/Serie: metodo

Preregistrazione C3/C4 del 2026-10-15, base
`7f1cc54477483039bd98bd8c3f6508416f5c0ced`, prima del codice e delle prove.
REQ-THR-001, REQ-CON-001/002/004/005, REQ-AFF-008; ADR-0031/0034/0045.

## Contratto fissato

`prepara-tratto-pool dispatcher` esegue un solo
[passo di selezione](pool-step.md). Soltanto con CLAIMED avvia direttamente
il bridge del link restituito: owner non rientrante e nessun altro passo
interposto rendono inutile un secondo routing. Al più un trasferimento
ready e un begin; nessun pop, ACK batch, end, retry o cleanup implicito.

Sette valori: **link, token, stato, ragione, origine, dettaglio, azione**.
I primi quattro conservano la forma dell'[avvio](pool-begin.md): ACTIVE o
CLOSING con token positivo e ragione originale. EMPTY, BUSY, INACTIVE e
PUBLISHED restituiscono NIL/0/stato/NIL senza begin; gli ultimi tre valori
provengono dal passo, distinguendo cursore, count e assenza di trasferimento.
Una pubblicazione termina subito; il ritiro rimane al successivo ingresso IDLE.

Fasi già attive, owner/binding invalidi e guasti dei delegati mantengono le
condizioni originali. Writer busy conserva CLAIMED/link IDLE; Serie busy o
generazione esaurita restituiscono CLOSING da terminare esplicitamente.
Errori dopo un trasferimento non lo annullano e non autorizzano replay.
Un helper NOTINLINE con link/status T conserva i controlli della coppia:
CLAIMED richiede un link, gli esiti senza lavoro richiedono NIL; status
inattesi segnalano `invariant-violation :pool-dispatcher-state`.

## Qualifica prevista

- Test della nuova presa con attivazione, CLAIMED corrente con pool inattivo,
  ricircolo full/room, ritiro pendente, tutti i sette valori e FIFO reale.
- Conteggio delle chiamate: un solo passo, un begin solo con CLAIMED; nessun
  secondo routing o avvio del bridge, pop, ACK, end o nuova presa dopo published.
- Rifiuti owner/binding/fase prima degli effetti; BUSY della coda ready e del
  writer, Serie busy e limiti di generazione; causa EQ e capacità conservate.
- FI fuori contratto della coppia link/status e status inattesi, distinguendole
  dalle prove nominali dei delegati C1. Cleanup delle sole risorse di fixture.
- Compilazione stretta, suite completa, lint/tracciabilità/link; copertura
  nativa dell'intero `src/dispatch/`, soglia C3 ≥95%, senza escludere missing.
- Sensore C4 con fixture e cleanup fuori clock: EMPTY e ciclo ACTIVE reale
  con payload, pop/ACK/end fuori dal solo ingresso ma inclusi nel ciclo
  misurato. Cinque fixture fresche per campagna, 4096 cicli e 128 warmup.
  Self-test di oracoli, rilevamento heap/sink/clock e conservazione dei guasti.
- Rilettura C3/C4 con checklist e identità dei file; registri e tentativi
  originali conservati. Nessuna modifica ai sorgenti C1.

Le misure includono controlli e delegati e non isolano il costo dell'adapter.
Non si promettono speedup, nuova concorrenza positiva, fairness o loop server.
Restano applicazione payload del motore, I/O durevole, park/wake e governo
dell'Archivio; nessun gate del motore completo viene chiuso.
")
  (:PATH #A((46) BASE-CHAR . "docs/implementazione/pool-prepara-revisione.md") :BYTES 3540 :SHA256
   "e754413c888fa1d4aaef7f1155e583a63412e71bf3601fe238074febec0caec6" :GIT-BLOB
   "2eb452c647d55eaa9acb18c2960fd28885735168" :TEXT "# Preparazione del tratto: rilettura C3/C4

Lettura dell'autore il 2026-10-15, dopo le fixture di sviluppo e prima delle
campagne formali. Una lettura C3 con checklist ADR-0031/0034; non è una nuova
revisione C1 né una revisione indipendente. Esito statico favorevole, senza
rilievi aperti. Copertura, misure e controlli completi restano evidenze separate.

| Controllo | Riscontro |
|---|---|
| Requisiti e ambito | REQ-THR-001, REQ-CON-001/002/004/005, REQ-AFF-008; sole modifiche C3/C4. |
| Stato e owner | Nessun nuovo stato; passo pubblico verifica porta/owner/binding/fase prima della selezione. |
| Flusso limitato | Un passo e al più un begin; nessun ciclo o attesa nuovi nel prodotto. |
| Routing | Il link scelto viene usato direttamente; spy verifica un routing e zero chiamate al secondo adapter. |
| Risultati | Sette valori scalari; token originale con ACTIVE/CLOSING, zero con esiti senza begin; metadati originali. |
| CLOSING e busy | Distinti ritorni gate e condizioni writer/ready; chiusura esplicita con token vivo, nessun retry implicito. |
| Errori dopo trasferimento | Test con writer busy e routing invalido conservano claim/ACK riusciti; nessun rollback. |
| Difese operative | Link/status T e helper NOTINLINE; FI su dieci coppie/status, prima del begin. |
| Guasto terminale | Causa EQ, riferimenti e lease writer conservati; nessun handler o fault marking C3; limiti del caller documentati. |
| Memoria e parallelismo | Nessuna nuova allocazione intenzionale o stato globale; nessuna scrittura condivisa per messaggio. Misura formale separata. |
| C4 | Sette oracoli negativi; sensore heap/sink/clock condiviso, driver CLI/partial verificato; cinque fixture fresche per campagna. |
| Copertura e conservazione | Reader nativo/HTML a otto file, fixture indipendente 8/9 e 1/2 rami; raw, missing e tentativi conservati senza esclusioni. |

Identità SHA-256 dei file letti (il documento stesso non è autoreferenziale):

| File | SHA-256 |
|---|---|
| `src/dispatch/begin.lisp` | `4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/package.lisp` | `6b791437e5b6c7c21dc9cf1be85b81ec0498725c307512b5978d4c8ed04e7255` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `src/dispatch/start.lisp` | `087fd623a51a89d4f5fe4d917ba7f563c8062b6e24ead3618d7f2501e0335b5d` |
| `src/dispatch/step.lisp` | `0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `arcdocdb.asd` | `023ad35a7263ca41ba9a58abd4f5bb0983e80c459fa4b4eea9ee45275e0af194` |
| `tests/scheduler/pool-start.lisp` | `a6647dc88a69d58437ee8d738bf14b7d2dea94f17b24067a4fb3b4532f9a0bdd` |
| `tools/measure-pool-start.lisp` | `72dad0204d67d2d2596ee60dc252f939fc1bec2b82eeac8f19854299e48e73cf` |
| `spikes/out/pool-start/coverage-run.lisp` | `3b869030b495ae7a0532685f614670ca347bc392137bbf0687623862e402c4c2` |
| `spikes/out/pool-start/dispatch-coverage-reader.lisp` | `561ef6d1dbb9b17e8221d3085ebec6202940c033cbb94ae047c765a1b032939d` |
| `spikes/out/pool-start/reader-run.lisp` | `7de22c68baace90fad6e1e3037d597f703f7efa3d6e68b6d2da8e15144d15aef` |
| `spikes/out/pool-start/tool-run.lisp` | `83e717a03a89cc099e33092811f236462be151fbab773262883c33331e5b873b` |
")
  (:PATH #A((12) BASE-CHAR . "CHANGELOG.md") :BYTES 25332 :SHA256
   "c0ab66e775050746bdc9cc9532830ac52a8c8f3d4db7917b5907fb5824a0d03d" :GIT-BLOB
   "206e46875368d73c038ecce2d87f708d16b08f30" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Preparazione bounded di un tratto pool/Serie: selezione e un solo begin
  sul link corrente, senza secondo routing. Sette valori conservano token,
  stato, ragione e metadati originali; pubblicazione senza seconda presa,
  CLOSING e guasti restano espliciti al caller.

- Recovery readonly dei CLOSED dal CONTROL autorevole: lettura solo fino a P,
  verifica writer/compaction e prepared risolti da OUTCOME o chiusura EDIT,
  senza decision log globale. Controllo dell'insieme completo prima del
  publisher canonico, ID u64 senza troncamento; qualifica C1 dedicata aperta.

- Verifica dedicata del decision log dell'Archivio: preflight, identità,
  query, ownership e collegamento al recovery ACTIVE, con catena nativa
  fino alla pubblicazione CONTROL nei formati v1/v2. Copertura separata
  del modulo e registrazione di ogni tentativo nella campagna dedicata.

- Verifica integrata pool/dispatcher/Serie con due worker reali: 32 quantum
  su una Serie mentre l'altra mantiene lease o debito batch, più ritiro con
  ring pieno/libero e trasferimento del lavoro residuo a un altro worker.
  Sei scenari sincronizzati; nessuna misura di speedup o modifica ai protocolli.

- Suite nativa indipendente del checkpoint dal vecchio ACTIVE: file v1/v2,
  risoluzione OUTCOME/DECISION, prefisso e coda, budget, chiusura CLOSED
  e collegamento al publisher del control log con oracoli indipendenti.

- Lettura del primo item CBOR minimo con frontiera assoluta: coda non
  letta, budget della finestra autorizzata e scratch privato per worker.
  Consente di ricavare le frontiere degli item concatenati; qualifica C1
  e profilo documentale restano aperti.

- Builder del checkpoint dal recovery ACTIVE: deriva lo stato completo
  dal CONTROL autorevole, conserva CLOSED/REMOVED/esiti, chiude il vecchio
  ACTIVE a P e collega il nuovo ID verificato. Budget prima degli array e
  verifica della transizione in memoria; preparatore e publisher canonici
  invariati, qualifica C1 dedicata aperta.

- Prove dedicate del recovery ACTIVE: lettura readonly, risoluzione dei
  prepared, chiusura deterministica e pubblicazione su file reali v1/v2.
  Oracoli indipendenti, fault injection, copertura e misure separate
  conservati nella campagna `2026-10-15-active-verifica`.

- Passo bounded del dispatcher pool/Serie: sceglie una sola operazione fra
  nuova presa IDLE, collegamento del CLAIMED e ricircolo RESCHEDULE.
  Origine esplicita distingue cursore, count e assenza di trasferimento;
  gli obblighi esistenti non consultano il pool. Nessun secondo claim,
  begin o retry implicito; fasi attive e prima causa restano conservate.

- Lettura readonly di `Registri/multiserie.log`: header UUID/CRC/formato
  verificato prima del corpo, replay completo fino all'EOF attestato e
  decisioni possedute. Nuovo ingresso ACTIVE vincolato allo stesso ambito
  canonico dell'Archivio; formati invariati, qualifica C1 dedicata aperta.

- Rendezvous delle fixture concorrenti residue CBOR, UTF-8 e due Serie:
  checkpoint dopo il primo lavoro effettivo, mantenendo conteggi, sink e
  oracoli. Diagnostica prima delle asserzioni temporali; intervalli WALL
  della fixture, comprensivi delle attese e dei controlli.

- Verifica integrata del lifetime delle fonti GET: lettori su FD CLOSED reali,
  pubblicazione ACTIVE con superset e riduzione controllata, ritiro EBR e
  chiusura dopo quiescenza. Include errore tipizzato e uscita non locale;
  decisione durabile del catalogo e rotazione completa restano da integrare.

- Rendezvous dopo il primo elemento realmente codificato nei test concorrenti
  CBOR float/tag, per imporre l'interleaving senza dipendere dall'avvio dello
  scheduler. Intervalli e checkpoint stampati prima delle asserzioni; metriche
  della fixture distinte dalla latenza del solo encoder.

- Prove dedicate della lettura CONTROL, transizione conservativa e
  pubblicazione validata: 84 nuovi test v1/v2, matrice finita e file reali
  con quattro Serie. Copertura, 216 finestre di confronto, sorgenti dei
  tentativi falliti e output originali conservati nella campagna
  `2026-10-14-control-transizione`; nessuna promozione del motore completo.

- Composizione di tag CBOR da contenuti già codificati: verifica completa
  prima della scrittura, testata MT6 minima e budget comprensivi del tag
  senza aggiungere profondità ai contenitori. Sorgenti condivisibili in
  lettura con scratch privati; semantica applicativa e qualifica C1 aperte.

- Recovery readonly del vecchio ACTIVE nominato dal control log: header
  e prefisso verificati fino a EOF, prepared risolti da OUTCOME/DECISION,
  esiti derivati in array u64 ordinati e serializer della chiusura CLOSED.
  La pubblicazione verifica P ed esiti prima del publisher unico; nessuna
  troncatura, modifica del formato o nuovo CSN. Qualifica C1 e gate del
  Recovery Manager restano aperti.

- Avvio esplicito dell'obbligo pool già acquisito: selezione del writer
  corrente e un solo begin del bridge, con restituzione del link e dei tre
  risultati originali. Writer-busy conserva CLAIMED; Serie-busy mantiene
  token e chiusura esplicita. Nessun nuovo gate, retry o cleanup implicito.

- Casi dedicati ai rifiuti del preflight GET ACTIVE prima del CSN: identità,
  stato OPEN/SEALED, ordine, capacità e guasti degli header, con witness
  indipendenti di byte, token, radici, frontiere e assenza di I/O.
  Suite ACTIVE a 42 test e quattro mutanti preflight rilevati; conservati
  copertura, regressione bootstrap e audit indipendenti delle prove complete.

- Composizione di mappe CBOR da chiavi e valori già codificati: verifica
  completa prima della scrittura, testata MT5 basata sulle coppie e budget
  comprensivi della radice. Sorgenti condivisibili in lettura con scratch
  privati; ordinamento delle chiavi e qualifica C1 restano aperti.

- Ricircolo esplicito dal dispatcher alla Serie: pubblica l'obbligo e termina
  IDLE se c'è spazio; a ring pieno restituisce il link del nuovo writer
  CLAIMED dopo un solo scambio FIFO. Nessun gate del pool, ritiro o nuova
  presa impliciti; busy e guasti conservano i confini execution esistenti.

- Lettura readonly del control log autorevole, con header verificato e replay
  fino all'EOF attestato. Risultato senza buffer, legato alla vista canonica;
  pubblicazione subordinata alla conservazione di CLOSED, esiti e REMOVED,
  chiusura del vecchio ACTIVE e apertura di un ID nuovo. Nessuna modifica
  al formato o agli ADR; recovery completo e qualifica C1 restano aperti.

- Composizione di array CBOR da elementi già codificati: verifica completa
  prima della scrittura, testata minima e budget comprensivi della radice.
  Sorgente e indice condivisibili in lettura, destinazione e scratch privati
  per worker. Profilo documentale e qualifica C1 restano aperti.

- Dispatcher logico dal pool al collegamento della Serie: binding preallocato
  sul medesimo contesto, routing solo dopo una presa autorizzata e ingresso
  distinto per completare gli obblighi già CLAIMED. Nessun begin, pop o retry
  implicito; ritiro e diagnosi conservano i confini C1 esistenti.

- Pubblicazione del checkpoint recuperato: rinomina ancorata alla directory
  preparata, verifica delle foglie contro i FD del nuovo e vecchio control log,
  controllo del nome installato e fsync del parent. Gettone locale unico con
  cleanup prima del CAS; errori terminali senza retry, rollback o risultati
  parziali. Recovery completo e qualifica delle nuove chiamate restano aperti.

- Suite funzionale dedicata al GET ACTIVE ordinario: 28 test con file reali,
  formati v1/v2, oracoli wire indipendenti, confini di payload e directory,
  cache, guasti e cleanup snapshot/EBR. Copertura isolata e compatibilità
  CLOSED conservate con prove grezze e audit indipendenti; qualifica C1 e
  MC/DC restano aperti.

- Presa dei writer governata dallo stato del pool: conferma il comando solo
  dopo la barriera IDLE, delega il claim C1 quando attivo e lascia ready e
  cursore intatti quando inattivo. Compiti e ricircoli già acquisiti completano
  i propri obblighi prima del ritiro; nessuna attesa o gestione fisica dei thread.

- Preparazione del checkpoint `control.log.tmp`: header della Serie, EDIT
  completo e SEAL costruiti senza I/O, manifest verificato contro il nuovo
  ACTIVE, file fisicamente distinto, trasferimenti a blocchi, rilettura esatta
  e fsync del parent. Nessun CSN o rinomina implicita; integrazione del recovery
  e qualifica C1 restano aperte.

- Attuazione logica del controllore pool su worker preesistenti: richieste
  persistenti e conteggio delle sole conferme, ritiro soltanto a contesto IDLE
  senza abbandonare lease o batch, riattivazione degli stessi contesti.
  Include 18 prove con worker reali, copertura C3 senza esclusioni e misure
  senza allocazioni dopo l'avvio. Dispatcher, risveglio e avvio fisico restano aperti.

- Preparazione del nuovo segmento writer: preflight senza effetti, identità
  readonly/append prima della write, header canonico durevole, rilettura esatta
  e fsync del parent. Adattatore ACTIVE con prova obbligatoria e verifica del
  registro CSN della vista; errori senza retry o risultati parziali. Decisione
  EDIT, apertura/rotazione del server e qualifica C1 restano da integrare.

- Ponte fonti GET della Serie: directory CLOSED nel contenuto della radice
  ACTIVE, acquisizione unica dal controller sotto EBR, risoluzione dalla
  stessa radice catturata e rifiuto di owner/ID duplicati prima dell'adozione.
  Mantiene il protocollo WAL e i cinque esiti del nucleo GET; rotazione e
  reclaim completo restano distinti.

- Scrittura dei float CBOR da parole IEEE: riduzione esatta della larghezza,
  preservazione di segno e payload NaN, preflight prima della mutazione
  e destinazioni private per i worker. Qualifica C1 e profilo documentale
  restano aperti.

- Controllore locale del numero di worker di calcolo: EWMA intere,
  crescita additiva, riduzione moltiplicativa e permanenza delle condizioni.
  Campioni e tempo iniettati, target distinto dai worker effettivi,
  aggiornamento limitato senza allocazioni dopo l’avvio. Avvio, risveglio
  e ritiro dei thread restano il prossimo componente del pool.

- Associazione fisica readonly/append: confronto esatto device/inode nel pool
  I/O, prova immutabile legata alle capacità e verifica senza syscall nel
  costruttore ACTIVE. Backend iniettabile esteso con identity opzionale;
  rifiuti senza fallback, retry o mutazioni. Percorso GET invariato;
  adozione nel server e qualifica C1 restano aperte.

- Directory GET dei segmenti CLOSED: ID u32 compatti e riferimenti privati
  immutabili, controllo di Serie/ordine/budget prima delle copie, ricerca
  limitata a diciassette passi e collegamento al resolver/cache/I/O.
  Una location pubblicata senza segmento è un guasto, mai un miss.
  Pubblicazione, ACTIVE, rotazione e reclaim restano integrazioni distinte.
  Corretto il confronto del ritorno di lettura nel resolver CLOSED: l'API
  restituisce END nel buffer, anche quando la regione comincia a 64.

- Scrittura minima dei valori semplici CBOR MT7: codici wire 0..23 e
  32..255, preflight di range/codice/capacità e destinazione esclusiva.
  Include confronto su tutti i codici, fuzz e due worker riusati;
  profilo applicativo, composizione e qualifica C1 restano aperti.

- Routing preallocato dei writer pronti alla Serie: ordinali immutabili,
  registro con associazioni verificate e tabella privata per worker.
  Selezione diretta in tempo costante, anche dopo ricircolo a coda piena,
  senza scritture condivise per messaggio. Include18 nuove regressioni,
  due letture C1, audit completo della copertura e cinque misure locali;
  pool e coordinatore restano aperti.

- Resolver GET ACTIVE per lotti ordinari: radice acquisita dalla pubblicazione
  della Serie, pagine immutabili e directory persistente con quattro piccoli
  vettori per append. Preflight prima del CSN, verifica del solo lotto nuovo e riuso cache/lettura GET;
  budget, fail-stop e confini documentati. Prepared/OUTCOME ACTIVE, indice
  concreto, rotazione/reclaim e qualifica C1 restano aperti.

- Collegamento preallocato worker/Serie: doppia lease, token monotoni, debito
  batch e rilascio Serie prima del worker, con retry limitato alla fine e
  conservazione dei guasti originali. Include 26 prove, due letture C1,
  copertura completa nel denominatore e cinque misure locali del percorso
  seriale; pool e coordinatore Archivio restano da integrare.

- Resolver GET dei segmenti CLOSED: frontiera dal manifest, prefisso writer
  sigillato o compaction verificato, righe u32 immutabili e prove OUTCOME
  risolte senza I/O nel lookup. Connessione a cache e lettura GET, budget
  espliciti e controlli di posizione/CSN; ACTIVE, prove EDIT, directory e
  qualifica C1 restano aperti.

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

- I test con worker riusati delle stringhe CBOR usano segnali distinti
  per ondata, evitando che un worker consumi il permesso dell'altro
  nell'ondata successiva.

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
  (:PATH #A((30) BASE-CHAR . "docs/implementazione/README.md") :BYTES 12670 :SHA256
   "fe4f359bba18105d3830e6ebb2fda12b5bee2db33996bbe1768772170590a59a" :GIT-BLOB
   "c587801192079a2660389f3aae0dc9ca1ee86882" :TEXT "# Implementazione

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
| Scrittura delle stringhe CBOR | [Item MT2/3, budget completo, UTF-8 e overlap](cbor-stringhe.md) | [`src/codec/cbor-string-write.lisp`](../../src/codec/cbor-string-write.lisp) |
| Scrittura dei valori semplici CBOR | [Codici wire MT7, preflight e destinazione privata](cbor-semplici.md) | [`src/codec/cbor-simple-write.lisp`](../../src/codec/cbor-simple-write.lisp) |
| Scrittura dei float CBOR | [Bit IEEE, riduzione esatta e destinazione privata](cbor-float-scrittura.md) | [`src/codec/cbor-float-write.lisp`](../../src/codec/cbor-float-write.lisp) |
| Composizione degli array CBOR | [Item verificati, budget della radice e scratch privato](cbor-array.md), [verifiche](cbor-array-risultati.md) | [`src/codec/cbor-array-write.lisp`](../../src/codec/cbor-array-write.lisp) |
| Composizione delle mappe CBOR | [Coppie verificate, budget della radice e scratch privato](cbor-map.md), [verifiche](cbor-map-risultati.md) | [`src/codec/cbor-map-write.lisp`](../../src/codec/cbor-map-write.lisp) |
| Composizione dei tag CBOR | [Contenuto verificato, nodi inclusivi e profondità invariata](cbor-tag.md), [verifiche](cbor-tag-risultati.md) | [`src/codec/cbor-tag-write.lisp`](../../src/codec/cbor-tag-write.lisp) |
| Lettura del primo item CBOR | [Frontiera assoluta, coda non letta e scratch privato](cbor-item.md), [verifiche](cbor-item-risultati.md) | [`src/codec/cbor-item-read.lisp`](../../src/codec/cbor-item-read.lisp) |
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
| Controllore del pool | [Target limitato, EWMA, AIMD e isteresi](controllore-pool.md) | [`src/scheduler/`](../../src/scheduler/) |
| Attuazione del pool | [Attivazione e ritiro confermati dai worker](pool-worker-lifecycle.md) | [`src/scheduler/lifecycle-worker.lisp`](../../src/scheduler/lifecycle-worker.lisp) |
| Presa governata dal pool | [Gate active, contesto IDLE e presa C1 delegata](pool-worker-claim.md) | [`src/scheduler/pool-claim.lisp`](../../src/scheduler/pool-claim.lisp) |
| Collegamento pool/Serie | [Binding immutabile, nuova presa e obblighi già assunti](pool-dispatch.md) | [`src/dispatch/`](../../src/dispatch/) |
| Ricircolo pool/Serie | [Un solo trasferimento ready e routing del nuovo CLAIMED](pool-recycle.md) | [`src/dispatch/recycle.lisp`](../../src/dispatch/recycle.lisp) |
| Avvio dell'obbligo pool/Serie | [Routing corrente e doppia lease esplicita](pool-begin.md) | [`src/dispatch/begin.lisp`](../../src/dispatch/begin.lisp) |
| Passo del dispatcher pool/Serie | [Scelta unica fra ammissione e obblighi esistenti](pool-step.md) | [`src/dispatch/step.lisp`](../../src/dispatch/step.lisp) |
| Catena pool/dispatcher/Serie | [Worker reali, isolamento e ritiro con handoff](pool-catena-risultati.md); [metodo](pool-catena-metodo.md) | [`tests/scheduler/pool-chain.lisp`](../../tests/scheduler/pool-chain.lisp) |
| Preparazione di un tratto pool/Serie | [Selezione e un solo avvio, con token e rifiuti espliciti](pool-prepara.md); [risultati](pool-prepara-risultati.md) | [`src/dispatch/start.lisp`](../../src/dispatch/start.lisp) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Completamento I/O | [Cleanup, frontiere e capacità dopo short I/O](io-completamento.md) | [`src/io/flush.lisp`](../../src/io/flush.lisp), [`src/io/transfer.lisp`](../../src/io/transfer.lisp) |
| Rinomina nella directory | [FD parent, cambio atomico e fail-stop locale](io-rinomina.md) | [`src/io/rename.lisp`](../../src/io/rename.lisp) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| ACTIVE vuoto | [Radice iniziale, CLOSED recuperati e primo lotto](get-active-vuoto.md) | [active-init.lisp](../../src/get-resolver/active-init.lisp) |
| Checkpoint del control log | [EDIT completo, piano privato e preparazione durevole a blocchi](checkpoint-control.md) | [`src/control/`](../../src/control/) |
| Pubblicazione del control log | [Rinomina ancorata, identità dei nomi e gettone unico](pubblicazione-control.md) | [`src/control/publication.lisp`](../../src/control/publication.lisp) |
| Control log recuperato | [Lettura readonly, manifest posseduto e transizione conservativa](control-recuperato.md); [metodo delle misure](control-transizione-metodo.md) | [`src/control/recovery-read.lisp`](../../src/control/recovery-read.lisp) |
| Vecchio ACTIVE recuperato | [Prefisso readonly, prepared risolti e chiusura verificata](active-recuperato.md); [verifiche](active-recuperato-verifica.md) e [metodo delle misure](active-recuperato-metodo.md) | [`src/recovery-active/`](../../src/recovery-active/) |
| Checkpoint dal recovery | [Stato completo da CONTROL e ACTIVE](checkpoint-recovery.md) | [`src/recovery-checkpoint/`](../../src/recovery-checkpoint/) |
| CLOSED recuperati | [Prefisso autorevole, esiti locali e insieme completo prima del publisher](closed-recuperato.md) | [`src/recovery-closed/`](../../src/recovery-closed/) |
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
| Prestazioni del nucleo GET | [Metodo, oracoli e stress parallelo](get-performance-metodo.md) | [`tests/get-performance/`](../../tests/get-performance/) |
| Percorso GET | [Candidato, fonte readonly, cache e conferma snapshot](get-record.md) | [`src/get/`](../../src/get/) |
| Verifica GET | [Prima suite funzionale, metodo e limiti](get-verifica.md) | [`tests/get/`](../../tests/get/) |
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Verifica snapshot e CSN | [Metodo preregistrato, decisioni e limiti](snapshot-verifica.md) | Registro e adattatore già presenti in `src/mvcc/` |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Verifica EBR e lettura | [Suite, metodo, mutanti e limiti](lettura-verifica.md) | [`tests/epochs/`](../../tests/epochs/) e [`tests/read/`](../../tests/read/) |
| Resolver GET CLOSED | [Frontiera dal manifest, flag e prova OUTCOME](get-resolver.md); [metodo delle prove funzionali](get-resolver-metodo.md) | [`src/get-resolver/`](../../src/get-resolver/) |
| Directory GET CLOSED | [Selezione limitata del segmento nella Serie](get-directory.md) | [`src/get-directory/`](../../src/get-directory/) |
| Fonti GET della Serie | [Acquisizione ACTIVE/CLOSED dalla singola radice pubblicata](get-fonti-serie.md) | [`src/get-directory/sources-read.lisp`](../../src/get-directory/sources-read.lisp) |
| Resolver GET ACTIVE ordinario | [Lotti verificati, root della Serie e directory persistente](get-active.md); [prove funzionali](get-active-verifica.md), [metodo](get-active-preflight-metodo.md) e [verifica dei rifiuti OPEN](get-active-preflight-verifica.md) | [`src/get-resolver/active-build.lisp`](../../src/get-resolver/active-build.lisp) |
| Scansione recovery | [Prefisso dei log e testimonianze SEAL](scansione-log.md) | [`src/recovery/`](../../src/recovery/) |
| Decisioni multiserie | [Tabella TXID, CSN e partecipanti](decisioni-multiserie.md) | [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp) |
| Decision log dell'Archivio | [Lettura readonly, identità e collegamento al recovery ACTIVE](decisioni-recuperate.md) | [`src/recovery-archive/`](../../src/recovery-archive/) |
| Manifest della Serie | [Ripiegamento degli EDIT del control log](manifest-control-log.md) | [`src/recovery/`](../../src/recovery/) |
| Inventario recovery | [Piano di riconciliazione dei nomi dei segmenti](inventario.md) | [`src/recovery/inventory-build.lisp`](../../src/recovery/inventory-build.lisp) |
| Ordinamento delle decisioni | [Radix misurato e query concorrenti](decisioni-radix-risultati.md) | [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) |

Le evidenze hanno un ambito esplicito: un test del codec non verifica transazioni,
durability, recovery o prestazioni del database.

Gli [esiti dei processi nelle mutazioni CBOR](cbor-mutazioni-processi.md)
distinguono i rilevamenti dei mutanti dagli errori dei worker di verifica.
")
  (:PATH #A((46) BASE-CHAR . "docs/implementazione/pool-prepara-risultati.md") :BYTES 8382 :SHA256
   "d9bcec9f3d789215c3de7d3bda01bd6d72e9f188f3f0ec3ad4bce5ba2338cbfa" :GIT-BLOB
   "df98a3e8190f3f156b8146b1835919b2bf136c38" :TEXT
   "# Preparazione del tratto pool/Serie: risultati locali

Incremento C3/C4 sulla base `7f1cc54477483039bd98bd8c3f6508416f5c0ced`;
[contratto](pool-prepara.md), [metodo preregistrato](pool-prepara-metodo.md)
e [rilettura con identità dei file](pool-prepara-revisione.md).
Implementazione `fa2a483778a9a56ddcb2f12c7700e3f16ff489cc`.
La qualifica usa 18 file congelati; nessuna modifica ai sorgenti C1
appartiene a questo incremento. Sono aggiunti 17 test, 129 nel package scheduler.

## Processi originali

Tutti i processi sotto sono OK/STABLE/exit 0. I riferimenti puntano alle
copie originali, compresi conservazione e payload gzip, senza promozione degli esiti.

| Processo | Wall s | Sorgenti | Esito osservato |
|---|---:|---:|---|
| [Sviluppo 01](../../spikes/results/2026-10-15-pool-prepara/processes/development-01/report.lisp) | 27,950115 | 972 | 127 test scheduler; 15 nuovi |
| [Sensore in sviluppo](../../spikes/results/2026-10-15-pool-prepara/processes/sensor-development/report.lisp) | 25,095753 | 973 | Self-test positivo, sette oracoli negativi e controlli heap/sink/clock |
| [Reader copertura](../../spikes/results/2026-10-15-pool-prepara/processes/reader-development/report.lisp) | 1,121031 | 973 | Self-test indipendente su otto identità, native/HTML e rifiuti |
| [Sviluppo 02](../../spikes/results/2026-10-15-pool-prepara/processes/development-02/report.lisp) | 23,054720 | 973 | 129 test scheduler; 17 nuovi, incluso errore dopo presa e ACK |
| [Controllo completo](../../spikes/results/2026-10-15-pool-prepara/processes/check-core/report.lisp) | 300,887805 | 975 | 1.668 test nominati, 2 smoke, 4 fixture lint, tutti i 10 spike |
| [Copertura](../../spikes/results/2026-10-15-pool-prepara/processes/coverage/report.lisp) | 30,474354 | 975 | 129 test scheduler, 8 file, gate C3 superato |
| [Misure](../../spikes/results/2026-10-15-pool-prepara/processes/benchmark/report.lisp) | 38,320366 | 975 | 10 campioni completi, heap osservato zero |
| [Build integrata](../../spikes/results/2026-10-15-pool-prepara/processes/integrated/report.lisp) | 46,588497 | 983 | 1.722 test nominati e 2 smoke; lint e tracciabilità senza errori |

La prima versione dei test è conservata per intero e confrontata con il Git
blob del suo record. La seconda aggiunge il drenaggio finale della fixture
inattiva e due scenari dopo il trasferimento riuscito, senza cambiare il
prodotto. Il sensore e il reader non sono stati modificati dopo i rispettivi
self-test. Nessun processo fallito è stato scartato: gli otto sono passati.

Compilazione stretta senza warning/style-warning. Il controllo completo e la
build integrata conservano note del compilatore in stderr: rispettivamente
1.248.815 e 1.379.752 byte UTF-8; non sono presentati come stderr vuoti.
Gli altri sei processi hanno stderr vuoto.

Il controllo completo include link, tracciabilità, fixture degli strumenti e
archivio; la sua fotografia precedente alla nuova pubblicazione conta 123
cataloghi, 3.565 riferimenti, 42.702 file e 1.138.547.016 byte. Tutti i file
originali della campagna dei 10 spike sono conservati separatamente.

## Copertura senza esclusioni

[Audit specifico](../../spikes/results/2026-10-15-pool-prepara/data/coverage/coverage-dispatch-audit.lisp):
**281/289 forme, 97,231834%; 14/14 rami nativi**. Intero `src/dispatch/`,
nessuna esclusione; non viene inferita MC/DC.

| File | Forme | Rami |
|---|---:|---:|
| package | 1/1 | 0/0 |
| types | 40/40 | 8/8 |
| build | 24/24 | 2/2 |
| claim | 45/49 | 0/0 |
| recycle | 45/49 | 0/0 |
| begin | 21/21 | 0/0 |
| step | 51/51 | 0/0 |
| start | **54/54** | **4/4** |

Le otto forme mancanti sono quelle preesistenti, conservate nel denominatore:
claim, indici nativi 31–34, path `(1 4 3 3 4 3)` e prefissi 1/2/3;
recycle, indici 39–42, path `(1 4 2 3 3 4 6)` e prefissi 1/2/3.
L'audit riporta tutti i path esatti, senza attribuirli a rami nuovi.
Il nativo originale di 3.217.144 byte, nove file HTML e i due audit sono
conservati come testo UTF-8 lossless nei bundle di sviluppo. Solo i FASL
sono intermedi esclusi. Nessun bit di copertura è riscritto.

## Allocazione e tempi grezzi

[Rapporto originale](../../spikes/results/2026-10-15-pool-prepara/data/benchmark/report.lisp).
SBCL 2.6.9 ARM64, Darwin 27, safety 3, clock 1.000.000 tick/s.
Cinque fixture fresche per campagna, 4096 cicli e 128 warmup per replica,
quattro chiamate alla nuova API per ciclo. I controlli scalari restano nel clock.

| Campagna | Tick delle cinque repliche | Heap byte | Sink per replica |
|---|---|---:|---:|
| EMPTY | 7507 / 7070 / 8177 / 7960 / 7980 | 0 in tutte | 8435712 |
| ACTIVE completo | 33711 / 36596 / 33516 / 76109 / 36643 | 0 in tutte | 8501248 |

40.960 cicli misurati e 163.840 preparazioni totali; ACTIVE elabora 81.920
payload sentinel nei soli campioni, con enqueue, pubblicazione ready,
preparazione, pop, ACK e end inclusi. Factory, lookup API, GC e chiusura del
backend sono esclusi. Tutti i campioni completano 4096 iterazioni.
Il controllo positivo rileva 16.777.472 byte; sink errato, clock zero,
CLI, destinazione esistente e raw parziale sono verificati dal self-test.

Il picco di 76109 tick è conservato. Le campagne sono seriali nel loro
processo, mentre altre verifiche locali possono essere in esecuzione:
carico esterno non controllato. Non si isola il costo dell'adapter e non si
confrontano questi due percorsi diversi come speedup o regressione.
Il contatore zero non è una prova assoluta di non allocazione per ogni ingresso.
Current/recycle, rifiuti e coordinatore concorrente non sono misurati qui.

## Integrazione e confini

È stato integrato il parent `b2536f616f34f297aec7ba67b77096cd556271cc`,
qualifica del recovery Archivio, con merge
`680f675237585e9d99a91a440c0f675817c892ea`. I 17 file frozen diversi da ASDF
restano identici; ASDF comprende anche la suite Archivio aggiunta dal parent.
Il controllo integrato esegue l'intera suite: 238 file lint/0 violazioni;
122 requisiti, 65 invarianti, 13 FI, 52 ADR/0 errori.

Il [manifesto](../../spikes/results/2026-10-15-pool-prepara/manifesto.lisp)
e il [catalogo](../../spikes/results/2026-10-15-pool-prepara/catalogo.lisp)
collegano sorgenti finali, tutte le copie frozen con suffisso `.txt`, processi
e sviluppo. I writer C4 verificati sono riusati invariati; le loro famiglie
generiche sono dichiarate e non ampliano lo scope della qualifica.

Nessun nuovo test di concorrenza positiva, loop server, applicazione payload
del database o I/O durevole è qualificato da questa campagna. CLOSING e
guasti terminali restano responsabilità esplicite del caller e dell'Archivio.

## Controllo finale e conservazione conclusiva

La [pubblicazione](../../spikes/results/2026-10-15-pool-prepara/processes/publication/report.lisp)
è OK/STABLE/exit 0, 295,396073 s, 984 sorgenti e stderr vuoto.
Sono preservati tutti i 49 file UTF-8 dello sviluppo: un controllo aggiuntivo
confronta i byte originali con il testo estratto dai bundle, inclusi i nove
HTML e il nativo. I 18 file dei primi otto processi sono inoltre confrontati
byte per byte con gli originali; nessun descriptor viene riscritto.

Dopo questa pubblicazione è stato integrato il componente CLOSED, parent
`31c3776ff8304d04aed314f60c2ad66435b8654a`, con merge
`81c0e57dc9a9b79e27967832fbc524e9109c2027`. L'unico conflitto era nel
changelog e sono conservate entrambe le voci. I 17 file frozen diversi da
ASDF rimangono identici; nessuna nuova misura è attribuita al codice CLOSED.

Il [controllo finale integrato](../../spikes/results/2026-10-15-pool-prepara/processes/final-verification/report.lisp)
esegue test, lint, tracciabilità, link ed evidenze: OK/STABLE/exit 0,
239,448811 s, 992 sorgenti. Superati 1.722 test nominati e 2 smoke;
245 file lint/0 violazioni; 122 requisiti/65 invarianti/13 FI/52 ADR/0 errori;
483 Markdown/3.256 link/0 rotti. Archivio: 127 cataloghi, 3.686 riferimenti,
42.949 file e 1.154.887.206 byte. Compilazione stretta senza avvisi;
le note in stderr sono conservate integralmente (1.401.121 byte UTF-8).
Questi conteggi precedono le copie di chiusura e i tre collegamenti aggiunti qui.

Il [manifesto conclusivo](../../spikes/results/2026-10-15-pool-prepara/chiusura-01.lisp)
conserva i due registri originali e le loro capacità di lettura compressa,
insieme alle sorgenti finali e agli script della chiusura. Non riscrive né
promuove gli esiti delle campagne precedenti.
")
  (:PATH #A((38) BASE-CHAR . "spikes/out/pool-start-publication.lisp") :BYTES 4322 :SHA256
   "187fe46718a1fd56d9291d176ce77bdf60afdcd8c93b68bdf6f34936a87eb73d" :GIT-BLOB
   "489d7f01b2d56f3f565992190de2d9bcc4d45faa" :TEXT
   ";;;; C4 orchestration: unchanged byte-preserving writers; originals and all UTF-8 dev files.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(let* ((base \"7f1cc54477483039bd98bd8c3f6508416f5c0ced\")
       (destination #p\"spikes/results/2026-10-15-pool-prepara/\")
       (root (truename \"./\")) (args (uiop:command-line-arguments))
       (valid-args (unless (= (length args) 1) (error \"One data config required.\")))
       (config (worker-read-raw-data (pathname (first args))))
       (records (getf config :records))
       (paths (getf config :final-paths)))
  (declare (ignore valid-args))
  (when (probe-file destination) (error \"Canonical destination already present.\"))
  (let* ((sources (worker-plan-source-bundles paths \"sources-final\" :pool-start-final-sources))
         (development (lifecycle-development-plan
                       :roots '(#p\"spikes/out/pool-start/\")
                       :required '(#p\"spikes/out/pool-start/full-attempt-01.log\"
                                   #p\"spikes/out/pool-start/coverage-attempt-01/coverage-state.lisp\"
                                   #p\"spikes/out/pool-start/bench-attempt-01/report.lisp\")
                       :extra '(#p\"/tmp/arcdocdb-pool-start-freeze.json\")))
         (orchestration (worker-plan-source-bundles
                         '(#p\"spikes/out/pool-start-publication.lisp\"
                           #p\"spikes/out/pool-start-publication-input.lisp\"
                           #p\"spikes/out/worker-publication-functions.lisp\"
                           #p\"spikes/out/pool-controller/publish.lisp\"
                           #p\"spikes/out/pool-controller/dev-evidence.lisp\"
                           #p\"spikes/out/lifecycle-publication.lisp\"
                           #p\"tools/measure-pool-step.lisp\" #p\"tools/measure-pool-lifecycle.lisp\"
                           #p\"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"
                           #p\"tools/evidence-storage.lisp\" #p\"tools/finish-evidence.lisp\"
                           #p\"tools/compact-evidence.lisp\")
                         \"publication-sources\" :pool-start-publication-sources))
         (plans (mapcar (lambda (record) (pool-publication-record-plan record root destination)) records))
         (campaign (lifecycle-evidence-directory-plan
                    (list :name \"check-core-spikes\" :source (getf config :spike-directory)) root destination)))
    (ensure-directories-exist (merge-pathnames \"placeholder\" destination))
    (pool-publication-write-plans sources destination)
    (pool-publication-write-plans orchestration destination)
    (pool-development-write development destination)
    (worker-save-data
     (list :schema-version 1 :kind :pool-start-evidence :base base
           :processes (mapcar #'pool-publication-copy-record plans)
           :campaign (lifecycle-copy-evidence-directory campaign)
           :data (mapcar (lambda (entry) (pool-publication-copy-data entry root destination))
                         '((:name \"benchmark\" :source \"spikes/out/pool-start/bench-attempt-01/report.lisp\")
                           (:name \"coverage\" :source \"spikes/out/pool-start/coverage-attempt-01/coverage-dispatch-audit.lisp\")
                           (:name \"coverage-library\" :source \"spikes/out/pool-start/coverage-attempt-01/coverage-audit.lisp\")))
           :development-files (length (getf development :paths))
           :excluded-fasl (getf development :excluded)
           :compatibility '(:catalog-component :writer-worker
                            :development-bundle-kind :pool-worker-lifecycle-development
                            :large-bundle-kind :pool-worker-lifecycle-development-large)
           :limits '(:original-process-and-conservation-bytes :all-development-utf8
                     :native-coverage-and-html-preserved-as-source-text
                     :only-fasl-excluded :frozen-copies-with-txt-suffix
                     :no-status-promotion :no-performance-comparison))
     (merge-pathnames \"manifesto.lisp\" destination))
    (lifecycle-publication-refresh-manifest base :directory destination)
    (format t \"Pool prepare: original processes, development sources and spike files verified.~%\")))
")
  (:PATH #A((32) BASE-CHAR . "spikes/out/pool-start-close.lisp") :BYTES 1057 :SHA256
   "f412de1da0ffbbd6d280fb93157c79a87382f7c6681fff4870b3241805ca377c" :GIT-BLOB
   "db96f3f94f353f2bcaaf8510425969e4179d4b97" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-closure-library *features*)))
  (load \"spikes/out/lifecycle-close-records.lisp\"))
(let* ((args (uiop:command-line-arguments))
       (input #p\"spikes/out/pool-start-publication-input.lisp\")
       (config (worker-read-raw-data input))
       (*lifecycle-publication-directory* #p\"spikes/results/2026-10-15-pool-prepara/\"))
  (unless (= (length args) 2) (error \"Publication and final record IDs required.\"))
  (lifecycle-close-records
   input \"chiusura-01\"
   (list (list :name \"publication\" :id (first args))
         (list :name \"final-verification\" :id (second args)))
   :extra-sources
   (append (mapcar #'pathname (getf config :final-paths))
           '(#p\"spikes/out/pool-start-publication.lisp\" #p\"spikes/out/pool-start-close.lisp\"
             #p\"spikes/out/pool-start-publication-attempt-01.log\"
             #p\"spikes/out/pool-start-final-attempt-01.log\"
             #p\"spikes/out/pool-start-development-audit.lisp\"
             #p\"spikes/out/pool-start-development-audit.log\"))))
")
  (:PATH #A((48) BASE-CHAR . "spikes/out/pool-start-publication-attempt-01.log") :BYTES 287 :SHA256
   "b1e06d7c90d67a9db82408e401b8489d4116aaeca28c9acc22a95ccb90f2caf4" :GIT-BLOB
   "bc7ebe7ca89a9452013e6b5dac60749efbd2978c" :TEXT
   ":OK: sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script spikes/out/pool-start-publication.lisp spikes/out/pool-start-publication-input.lisp; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001078794-command-75844-0/report.lisp
")
  (:PATH #A((42) BASE-CHAR . "spikes/out/pool-start-final-attempt-01.log") :BYTES 161 :SHA256
   "1e3817cd69b01a0fae679afe1b2e762c5a5a418b93395ef49a5b3a3c3fa5d575" :GIT-BLOB
   "acf6725f573a47b360e2d87370916d6b2822816e" :TEXT
   ":OK: make test lint trace links evidence; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001079172-command-83983-0/report.lisp
")
  (:PATH #A((44) BASE-CHAR . "spikes/out/pool-start-development-audit.lisp") :BYTES 1270 :SHA256
   "6f4a2b581b618de3897f670454e0dd0a65aeaaec34007163eb848e5976433765" :GIT-BLOB
   "48181226130a678f3dc9fd9c104ac083553ddebb" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let ((count 0) (html 0) (native 0))
  (dolist (path (append (directory \"spikes/results/2026-10-15-pool-prepara/development-evidence*.lisp\")
                       (directory \"spikes/results/2026-10-15-pool-prepara/development-large-?.lisp\")))
    (let ((data (arcdocdb.evidence:read-evidence path)))
      (dolist (source (getf data :sources))
        (let* ((original (pathname (getf source :path)))
               (text (sb-ext:string-to-octets (getf source :text) :external-format :utf-8)))
          (with-open-file (stream original :element-type '(unsigned-byte 8))
            (let ((raw (make-array (file-length stream) :element-type '(unsigned-byte 8))))
              (assert (= (length raw) (getf source :bytes) (length text)))
              (assert (= (length raw) (read-sequence raw stream)))
              (assert (equalp raw text))))
          (when (equal (pathname-type original) \"html\") (incf html))
          (when (equal (file-namestring original) \"coverage-state.lisp\") (incf native))
          (incf count)))))
  (assert (= html 9)) (assert (= native 1))
  (format t \"UTF8 development: ~D original files byte-identical, including ~D HTML and ~D native coverage.~%\"
          count html native))
")
  (:PATH #A((43) BASE-CHAR . "spikes/out/pool-start-development-audit.log") :BYTES 92 :SHA256
   "3d3970af70a01bc3f1ec98ea28b03fbc03f982943f8b9227e6d5f215060e0bbe" :GIT-BLOB
   "684882599cf623ad685b3b9a69a9bf507b8b8437" :TEXT
   "UTF8 development: 49 original files byte-identical, including 9 HTML and 1 native coverage.
")))
