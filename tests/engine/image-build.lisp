;;; OWNER: runner C4; tutte le immagini end-to-end sono costruite dall'API di prodotto.
;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-REC-001 REQ-AFF-008
(in-package #:arcdocdb.engine.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(defun open-build-engine (root &key create (version 2) observer option (capacity 128))
  (e:apri-motore root (archive-id) (series-id) :create create :version version
    :clock (lambda () 10) :observer observer :max-file-bytes 2097152 :max-record-bytes 131072
    :max-records 4096 :max-segments 32 :index-capacity capacity :key-arena-bytes 262144 :index-image option))

(defun build-option (id &rest options)
  (apply #'e:crea-opzione-indice-paginato
         (string-downcase (format nil "primary-~16,'0x.idx.tmp" id)) options))
(defun build-key (id &optional (length 16))
  (let ((key (bytes length))) (arcdocdb.binary:scrivi-u32 key 0 id) key))
(defun check-build-get (engine key expected)
  (let ((target (bytes 128 204)))
    (multiple-value-bind (status size) (e:leggi-documento engine key target :start 2)
      (is (eq status (if expected :found :absent))) (is (= size (if expected (length expected) 0)))
      (when expected (is (equalp expected (subseq target 2 (+ 2 size)))))
      (is (= (aref target 0) 204)) (is (= (aref target 1) 204)))))
(defun build-path (root option) (merge-pathnames (e::opzione-indice-paginato-name option) root))

(deftest test-REQ-IDX-010-build-end-to-end-v1-v2-tre-taglie
  (dolist (version '(1 2))
    (dolist (size '(4096 16384 65536))
      (with-root (root)
        (let ((option (build-option 1 :page-size size :frames 1)) (source nil))
          (with-engine (engine (open-build-engine root :create t :version version))
            (initial-workload engine)
            (let ((originals (images root)) (fds (length (e::motore-fds engine))))
              (setf source (e:fonte-indice-motore engine))
              (is (eq option (e:costruisci-indice-paginato-motore engine option)))
              (is (= fds (length (e::motore-fds engine))))
              (check-images root originals) (check-initial engine)
              (is (eq :resident (e:modo-indice-motore engine)))
              (is (same-engine-source source (e:fonte-indice-motore engine)))))
          (with-engine (engine (open-build-engine root :version version :option option))
            (is (eq :paged (e:modo-indice-motore engine))) (check-initial engine)
            (let ((second (build-option 2 :page-size size :frames 1)))
              (e:costruisci-indice-paginato-motore engine second)
              (is (eq :paged (e:modo-indice-motore engine))) (check-initial engine))
            (is (= 6 (e:cancella-documento engine (key 1)))) (check-get engine 1 nil)))))))

(deftest test-REQ-IDX-010-build-vuoto-tombstone-e-chiave-massima
  (dolist (kind '(:empty :tombstone :long))
    (with-root (root)
      (let ((option (build-option 1 :frames 1)) (long (build-key 1 65535)))
        (with-engine (engine (open-build-engine root :create t))
          (case kind
            (:empty nil) (:tombstone (e:cancella-documento engine (key 1)))
            (:long (e:scrivi-documento engine long (value 1))))
          (e:costruisci-indice-paginato-motore engine option))
        (with-engine (engine (open-build-engine root :option option))
          (is (eq :paged (e:modo-indice-motore engine)))
          (check-build-get engine long (when (eq kind :long) (value 1)))
          (check-get engine 1 nil))))))

(deftest test-REQ-IDX-010-build-600-chiavi-directory-tre-taglie
  (dolist (size '(4096 16384 65536))
    (with-root (root)
      (let ((option (build-option 1 :page-size size :frames 1)) (value (bytes 23 91)))
        (with-engine (engine (open-build-engine root :create t :capacity 1024))
          (dotimes (id 600) (e:scrivi-documento engine (build-key id) value))
          (e:costruisci-indice-paginato-motore engine option)
          ;; Nessuna pagina per ogni singola chiave: fanout adattivo invece di 128 bucket sparsi.
          (is (< (length (image (build-path root option))) (* 100 size))))
        (with-engine (engine (open-build-engine root :capacity 1024 :option option))
          (dotimes (id 600) (check-build-get engine (build-key id) value))
          (check-build-get engine (build-key 601) nil)
          (is (= 601 (e:cancella-documento engine (build-key 300))))
          (check-build-get engine (build-key 300) nil))))))

(defun skewed-build-keys ()
  (let ((keys nil))
    (loop for id below 200000 until (= (length keys) 80) do
      (let ((key (build-key id)))
        (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key 0 16 #x243f6a88 #x85a308d3)
          (declare (ignore low))
          (when (zerop (ash high -25)) (push key keys)))))
    (is (= (length keys) 80))
    (loop for id from 200000 below 201000 do
      (let ((key (build-key id)))
        (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key 0 16 #x243f6a88 #x85a308d3)
          (declare (ignore low))
          (when (logbitp 31 high) (return-from skewed-build-keys (cons key keys))))))
    (error "Outlier non trovato.")))

(deftest test-REQ-IDX-010-build-prefisso-comune-e-directory-multilivello
  (with-root (root)
    (let ((keys (skewed-build-keys)) (option (build-option 1 :frames 1)) (value (value 1)))
      (with-engine (engine (open-build-engine root :create t))
        (dolist (key keys) (e:scrivi-documento engine key value))
        (e:costruisci-indice-paginato-motore engine option))
      (with-engine (engine (open-build-engine root :option option))
        (dolist (key keys) (check-build-get engine key value))))))

(deftest test-REQ-IDX-010-build-preflight-budget-nome-e-ownership
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (initial-workload engine)
      (let* ((option (build-option 1)) (needed (e::payload-costruzione-immagine engine option)) (originals (images root)))
        (dolist (args '((:max-build-payload -1) (:max-build-payload 536870913) (:max-pages 0) (:max-pages 65537)))
          (signals arcdocdb.conditions:invalid-argument (apply #'e:costruisci-indice-paginato-motore engine option args)))
        (signals arcdocdb.conditions:resource-exhausted
                 (e:costruisci-indice-paginato-motore engine option :max-build-payload (1- needed)) :engine-image-build-memory)
        (dolist (id '(0 1152921504606846976))
          (signals arcdocdb.conditions:invalid-argument
                   (e:costruisci-indice-paginato-motore engine (build-option id)) :engine-image-build-id))
        (is (not (probe-file (build-path root option)))) (check-images root originals) (check-initial engine)
        (let ((thread (sb-thread:make-thread
                       (lambda () (signals arcdocdb.conditions:invalid-argument
                                     (e:costruisci-indice-paginato-motore engine option) :engine-owner)))))
          (sb-thread:join-thread thread))
        (e:costruisci-indice-paginato-motore engine option :max-build-payload needed)
        (let ((image (image (build-path root option))))
          (signals arcdocdb.conditions:invalid-argument
                   (e:costruisci-indice-paginato-motore engine option) :engine-image-build-exists)
          (is (equalp image (image (build-path root option)))))
        (check-initial engine)))))

(deftest test-REQ-IDX-010-build-quota-file-pagine-e-verifica-fallita
  (dolist (failure '(:file :pages :verify))
    (with-root (root)
      (let ((option (build-option 1 :max-bytes (if (eq failure :file) 12288 1048576)
                                 :max-visits (if (eq failure :verify) 2 16777216))))
        (with-engine (engine (open-build-engine root :create t))
          (dotimes (id 40) (e:scrivi-documento engine (build-key id) (value 1)))
          (let ((originals (images root)) (fds (length (e::motore-fds engine))))
            (signals arcdocdb.conditions:resource-exhausted
                     (e:costruisci-indice-paginato-motore engine option :max-pages (if (eq failure :pages) 1 65536)))
            (is (eq :faulted (e:stato-motore engine)))
            (is (= fds (length (e::motore-fds engine)))) (check-images root originals)))
        (with-engine (engine (open-build-engine root :option (when (eq failure :verify) (build-option 1))))
          (dotimes (id 40) (check-build-get engine (build-key id) (value 1))))))))

(deftest test-REQ-IDX-010-build-uscita-non-locale-e-rientro
  (dolist (phase '(:image-build-planned :image-build-created :image-build-pages :image-build-before-footer
                  :image-build-after-footer :image-build-after-flush :image-build-verified))
    (with-root (root)
      (let ((option (build-option 1)))
        (with-engine (engine (open-build-engine root :create t
                              :observer (lambda (engine observed)
                                          (when (eq observed phase)
                                            (signals arcdocdb.conditions:invalid-argument
                                                     (e:costruisci-indice-paginato-motore engine (build-option 2)))
                                            (throw 'build-abort :unwound)) nil)))
          (initial-workload engine)
          (let ((originals (images root)))
            (is (eq :unwound (catch 'build-abort (e:costruisci-indice-paginato-motore engine option))))
            (is (eq :faulted (e:stato-motore engine))) (is (not (e::motore-busy engine)))
            (check-images root originals)))
        (with-engine (engine (open-build-engine root)) (check-initial engine))))))

(deftest test-REQ-IDX-010-build-radix-u64-duplicati-e-overflow-forzato
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (dotimes (id 40) (e:scrivi-documento engine (build-key id) (value 1)))
      (unwind-protect
           (progn
             (setf (e::motore-busy engine) t)
             (let* ((plan (e::prepara-piano-immagine-motore engine)) (order (e::piano-immagine-motore-order plan))
                    (expected (sort (coerce order 'list) #'<)))
               (signals arcdocdb.conditions:invariant-violation
                        (e::conta-chiavi-costruzione (e::piano-immagine-motore-source plan) 16)
                        :engine-image-build-count-range)
               (setf (e::motore-busy engine) nil)
               (signals arcdocdb.conditions:invariant-violation (e::verifica-fonte-costruzione engine plan))
               (setf (e::motore-busy engine) t)
               (let* ((token (e::motore-source-token engine)) (old (aref token 24)))
                 (unwind-protect
                      (progn (setf (aref token 24) (logxor 1 old))
                             (signals arcdocdb.conditions:invariant-violation (e::verifica-fonte-costruzione engine plan)))
                   (setf (aref token 24) old)))
               (dotimes (i (length order))
                 (let ((slot (aref order i)))
                   (setf (aref (e::piano-immagine-motore-high plan) slot) (if (evenp i) #xffffffff 0)
                         (aref (e::piano-immagine-motore-low plan) slot) (mod i 3))))
               (dotimes (byte 8) (e::ordina-byte-costruzione plan (* byte 8)))
               (setf order (e::piano-immagine-motore-order plan))
               (is (equal expected (sort (coerce order 'list) #'<)))
               (let ((previous 0))
                 (dotimes (i (length order))
                   (let* ((slot (aref order i))
                          (digest (logior (ash (aref (e::piano-immagine-motore-high plan) slot) 32)
                                          (aref (e::piano-immagine-motore-low plan) slot))))
                     (is (<= previous digest)) (setf previous digest))))
               (signals arcdocdb.conditions:invariant-violation (e::limite-bit-costruzione plan 0 40 31))
               (is (= 64 (e::limite-bit-costruzione plan 0 40 64)))
               ;; Forza il solo ramo dei digest identici nel piano privato. Il builder ricalcola i digest reali.
               (fill (e::piano-immagine-motore-high plan) 0) (fill (e::piano-immagine-motore-low plan) 0)
               (multiple-value-bind (builder pages) (arcdocdb.index.page.tests::build-fixture 4096)
                 (signals arcdocdb.conditions:invariant-violation (e::emetti-albero-costruzione plan builder 0 40 64 65))
                 (signals arcdocdb.conditions:invariant-violation (e::emetti-albero-costruzione plan builder 0 41 64 0))
                 (signals arcdocdb.conditions:invariant-violation (e::emetti-albero-costruzione plan builder 0 40 65 0))
                 ;; La fixture generica usa seed zero; reader e builder usano gli stessi digest reali.
                 (let ((proof (e::emetti-albero-costruzione plan builder 0 40 64 0)))
                   (is (= 2 (hash-table-count pages)))
                   (is (= 40 (arcdocdb.index.page::riferimento-costruito-count proof)))))))
        (setf (e::motore-busy engine) nil)))))

(deftest test-REQ-IDX-010-build-rileva-mutazione-fonte-e-conteggio
  (dolist (failure '(:revision :count))
    (with-root (root)
      (let ((option (build-option 1)))
        (with-engine (engine (open-build-engine root :create t
                              :observer (lambda (engine phase)
                                          (when (and (eq failure :revision) (eq phase :image-build-planned))
                                            (incf (arcdocdb.index.primary::indice-primario-revision (e::motore-index engine)))) nil)))
          (initial-workload engine)
          (when (eq failure :count)
            (incf (arcdocdb.index.primary::frammento-indice-live
                   (arcdocdb.index.primary:frammento-corrente-indice (e::motore-index engine) 0))))
          (let ((originals (images root)))
            (signals arcdocdb.conditions:invariant-violation (e:costruisci-indice-paginato-motore engine option))
            (is (eq :faulted (e:stato-motore engine))) (check-images root originals)
            (when (eq failure :count) (is (not (probe-file (build-path root option)))))))
        (with-engine (engine (open-build-engine root)) (check-initial engine))))))

(deftest test-REQ-IDX-010-build-cleanup-tenta-entrambi-i-close
  (dolist (complete '(nil t))
    (let* ((engine (e::%make-motore :archive-id (archive-id) :series-id (series-id)
                                   :scratch (bytes 0) :empty (bytes 0)))
           (closed 0)
           (backend (arcdocdb.io:make-backend #'identity #'identity #'identity #'identity #'identity
                       (lambda (fd) (declare (ignore fd)) (incf closed) -1)))
           (append (arcdocdb.io::%make-file :append backend 4096 16384))
           (input (arcdocdb.io::%make-file :input backend 4096 16384)))
      (if complete
          (signals e:errore-cleanup-motore (e::chiudi-file-costruzione engine append input t))
          (e::chiudi-file-costruzione engine append input nil))
      (is (= closed 2)) (is (= 2 (length (e::motore-cleanup-failures engine))))
      (is (eq :closed (arcdocdb.io:stato-file input))) (is (eq :closed (arcdocdb.io:stato-file append))))))

(deftest test-REQ-IDX-010-build-causa-io-preservata-dal-confine
  (with-root (root)
    (let ((cause (make-condition 'arcdocdb.conditions:io-fault :reason :build-test-eio :operation :append)))
      (with-engine (engine (open-build-engine root :create t
                            :observer (lambda (engine phase)
                                        (declare (ignore engine))
                                        (when (eq phase :image-build-pages) (error cause)) nil)))
        (initial-workload engine)
        (let ((originals (images root)) (seen nil))
          (handler-case (e:costruisci-indice-paginato-motore engine (build-option 1))
            (arcdocdb.conditions:io-fault (condition) (is (eq cause condition)) (setf seen t)))
          (is seen) (is (eq :faulted (e:stato-motore engine)))
          (is (eq cause (e::motore-failure engine))) (check-images root originals))))))

(defun build-image-child-main (arguments)
  (destructuring-bind (mode path version-string stage) arguments
    (let ((root (uiop:ensure-directory-pathname path)) (version (parse-integer version-string)) (option (build-option 1)))
      (cond ((string= mode "build-image")
             (with-engine (engine (open-build-engine root :version version
                                    :observer (lambda (engine phase)
                                                (declare (ignore engine))
                                                (when (string-equal (symbol-name phase) stage) (crash phase)) nil)))
               (e:costruisci-indice-paginato-motore engine option)
               (error "SIGKILL non raggiunto.")))
            ((string= mode "build-verify")
             (if (string= stage "image-build-after-flush")
                 (with-engine (engine (open-build-engine root :version version :option option))
                   (is (eq :paged (e:modo-indice-motore engine))) (check-initial engine))
                 (progn
                   (signals arcdocdb.conditions:corruption-detected (open-build-engine root :version version :option option))
                   (with-engine (engine (open-build-engine root :version version)) (check-initial engine)))))
            (t (error "Mode costruzione sconosciuto.")))
      (format t "~&ENGINE-BUILD-VERIFIED ~A ~A v~D~%" mode stage version))))

(deftest test-REQ-IDX-010-build-SIGKILL-v1-v2-creazione-pagine-flush
  (dolist (version '(1 2))
    (dolist (stage '("image-build-created" "image-build-pages" "image-build-after-flush"))
      (with-root (root)
        (let ((storage (merge-pathnames "storage/" root)))
          (ensure-directories-exist storage)
          (with-engine (engine (open-build-engine storage :create t :version version)) (initial-workload engine))
          (child root version "build-image" stage :signaled sb-posix:sigkill)
          (let ((image (image (build-path storage (build-option 1)))))
            (child root version "build-verify" stage :exited 0)
            (is (equalp image (image (build-path storage (build-option 1)))))))))))
