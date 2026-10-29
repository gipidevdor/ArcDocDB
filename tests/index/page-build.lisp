;;; OWNER: runner, sink e immagini privati; nessun file prodotto o pubblicazione globale.
;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003 REQ-AFF-003
(in-package #:arcdocdb.index.page.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(defun build-fixture (size &key (max-pages 65536))
  (let ((pages (make-hash-table)))
    (values (p:crea-costruttore-pagine (identita-fixture size :page size) size
              (lambda (buffer offset) (setf (gethash offset pages) (copy-seq buffer)) (+ offset size))
              0 0 :max-pages max-pages) pages)))

(defun build-entry (builder key &optional (csn 7))
  (let ((words (lookup-words)))
    (setf (aref words 0) csn (aref words 1) #x100000070
          (aref words 2) (+ (ash 1 48) (ash (length key) 32))
          (aref words 3) (+ 24 (length key) 3) (aref words 4) 0)
    (p:crea-entry-costruzione builder key words)))

(defun build-reader (size root pages)
  (p:crea-lettore-indice-pagine
   (p:crea-cache-pagine size 1
    (lambda (id buffer)
      (let ((source (gethash (p::identita-pagina-page id) pages)))
        (unless source (error "Pagina costruita assente")) (replace buffer source) size)))
   (p:identita-riferimento-costruito root)))

(defun build-get (reader key words)
  (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key 0 (length key) 0 0)
    (p:leggi-indice-pagine reader key 0 (length key) high low words)))

(deftest req-idx-009-costruzione-span-copia-range-e-metadati
  (multiple-value-bind (builder pages) (build-fixture 4096)
    (let* ((key (lookup-key 1 2 3)) (arena (bytes 100 44)) (words (lookup-words)))
      (replace arena key :start1 37)
      (setf (aref words 0) 7 (aref words 1) #x100000070
            (aref words 2) (+ 37 (ash 3 32) (ash 1 48)) (aref words 3) 30 (aref words 4) 0)
      (signals invalid-argument (p:crea-entry-costruzione builder arena words :start 37 :end 101))
      (signals invalid-argument (p:crea-entry-costruzione builder arena words :start 40 :end 37))
      (signals invalid-argument (p:crea-entry-costruzione builder arena words :start 37 :end 39))
      (let ((entry (p:crea-entry-costruzione builder arena words :start 37 :end 40)))
        (fill arena 255)
        (let* ((root (p:costruisci-bucket-pagine builder (vector entry))) (reader (build-reader 4096 root pages)))
          (is (eq :live (build-get reader key words)))
          (is (= (aref words 0) 7)) (is (= (aref words 3) 30)))))))

(deftest req-idx-009-costruzione-bucket-roundtrip-tre-taglie
  (dolist (size '(4096 16384 65536))
    (multiple-value-bind (builder pages) (build-fixture size)
      (let* ((key (lookup-key 1 2 3)) (entry (build-entry builder key))
             (root (p:costruisci-bucket-pagine builder (vector entry)))
             (reader (build-reader size root pages)) (words (lookup-words)))
        (fill key 99)
        (is (eq :live (build-get reader (lookup-key 1 2 3) words)))
        (is (= (aref words 0) 7)) (is (= (aref words 1) #x100000070))
        (is (= (aref words 2) (+ (ash 1 48) (ash 3 32)))) (is (= (aref words 3) 30))
        (fill words 99)
        (is (eq :absent (build-get reader key words)))
        (is (every (lambda (n) (= n 99)) words))
        (is (= (hash-table-count pages) 1))))))

(deftest req-idx-009-costruzione-chiavi-massime-miste-e-overflow
  (dolist (size '(4096 16384 65536))
    (multiple-value-bind (builder pages) (build-fixture size)
      (let* ((long (bytes 65535 127)) (tiny (lookup-key 1)) (other (lookup-key 2))
             (tail (p:costruisci-bucket-pagine builder (vector (build-entry builder other))))
             (root (p:costruisci-bucket-pagine builder (vector (build-entry builder tiny)
                                                             (build-entry builder long #xffffffffffffffff)) :next tail))
             (reader (build-reader size root pages)) (words (lookup-words)))
        (is (= (hash-table-count pages) (+ 2 (ceiling 65535 (- size 96)))))
        (dolist (key (list long tiny other)) (is (eq :live (build-get reader key words))))
        (is (eq :absent (build-get reader (lookup-key 3) words)))
        (maphash (lambda (offset page)
                   (let ((id (identita-fixture size :page offset)))
                     (p:verifica-pagina-indice page 0 size id)
                     ;; Oracolo manuale: tutti i NEXT sono precedenti e non futuri.
                     (is (< (ref-read page 64 8) offset)))) pages)))))

(deftest req-idx-009-costruzione-directory-routing-multilivello
  (multiple-value-bind (builder pages) (build-fixture 4096)
    (let ((groups (make-array 4 :initial-element nil)) (children (make-array 2 :initial-element nil))
          (words (lookup-words)) (keys nil))
      (dotimes (i 24)
        (let ((key (lookup-key i)))
          (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key 0 1 0 0)
            (declare (ignore low))
            (push (build-entry builder key) (aref groups (ldb (byte 2 30) high))))
          (push key keys)))
      (dotimes (side 2)
        (let ((leaves (make-array 2 :initial-element nil)))
          (dotimes (bit 2)
            (setf (aref leaves bit) (p:costruisci-bucket-pagine builder (coerce (aref groups (+ (* side 2) bit)) 'simple-vector))))
          (setf (aref children side) (p:costruisci-directory-pagine builder 1 62 leaves))))
      (let* ((root (p:costruisci-directory-pagine builder 1 63 children)) (reader (build-reader 4096 root pages)))
        (dolist (key keys) (is (eq :live (build-get reader key words))))
        (is (eq :absent (build-get reader (lookup-key 99) words)))))))

(deftest req-idx-009-costruzione-preflight-duplicati-capienza-e-budget
  (multiple-value-bind (builder pages) (build-fixture 4096 :max-pages 1)
    (let ((entry (build-entry builder (lookup-key 1))))
      (signals invalid-argument (p:costruisci-bucket-pagine builder (vector entry entry)) :index-build-duplicate-key)
      (signals arcdocdb.conditions:resource-exhausted
               (p:costruisci-bucket-pagine builder (make-array 29 :initial-element entry)) :index-build-bucket-capacity)
      (signals arcdocdb.conditions:resource-exhausted
               (p:costruisci-bucket-pagine builder (vector (build-entry builder (bytes 65535 1)))) :index-build-page-budget)
      (is (zerop (hash-table-count pages)))
      (p:costruisci-bucket-pagine builder (vector entry))
      (is (= (hash-table-count pages) 1))
      (signals arcdocdb.conditions:resource-exhausted (p:costruisci-bucket-pagine builder #()) :index-build-page-budget)
      (is (eq :open (p::costruttore-pagine-state builder))))))

(deftest req-idx-009-costruzione-fail-stop-short-write-e-nonlocal
  (dolist (mode '(:short :throw :error))
    (let* ((calls 0)
           (builder (p:crea-costruttore-pagine (identita-fixture 4096 :page 4096) 4096
                      (lambda (buffer offset) (declare (ignore buffer offset)) (incf calls)
                        (case mode (:short 1) (:throw (throw 'build-stop :stopped))
                          (:error (error 'arcdocdb.conditions:io-fault :reason :fixture-io :operation :write))
                          (otherwise (error "Modalita sconosciuta")))) 0 0)))
      (if (eq mode :throw)
          (is (eq :stopped (catch 'build-stop (p:costruisci-bucket-pagine builder #()))))
          (signals arcdocdb.conditions:io-fault (p:costruisci-bucket-pagine builder #())))
      (is (eq :faulted (p::costruttore-pagine-state builder)))
      (signals invalid-argument (p:costruisci-bucket-pagine builder #()) :index-build-faulted)
      (is (= calls 1)))))

(deftest req-idx-009-costruzione-directory-preflight-owner-routing-ordine
  (multiple-value-bind (builder pages) (build-fixture 4096)
    (multiple-value-bind (foreign foreign-pages) (build-fixture 4096)
      (declare (ignore foreign-pages))
      (let* ((key (lookup-key 1)) (entry (build-entry builder key))
             (leaf (p:costruisci-bucket-pagine builder (vector entry)))
             (foreign-leaf (p:costruisci-bucket-pagine foreign #()))
             (count (hash-table-count pages)) (slot (ldb (byte 1 31) (p::entry-costruzione-high entry)))
             (correct (make-array 2 :initial-element nil)) (wrong (make-array 2 :initial-element nil)))
        (setf (aref correct slot) leaf (aref wrong (- 1 slot)) leaf)
        (signals invalid-argument (p:costruisci-directory-pagine builder 1 63 wrong) :index-build-directory-routing)
        (signals invalid-argument (p:costruisci-directory-pagine builder 1 63 (vector foreign-leaf nil)) :index-build-reference)
        (signals invalid-argument (p:costruisci-directory-pagine builder 0 0 #()) :index-build-directory-geometry)
        (signals invalid-argument (p:costruisci-directory-pagine builder 8 0 (make-array 256 :initial-element nil))
                 :index-build-directory-geometry)
        (signals invalid-argument (p:costruisci-directory-pagine builder 1 64 correct) :index-build-directory-geometry)
        (signals invalid-argument (p:costruisci-directory-pagine builder 1 63 #(nil)) :index-build-directory-geometry)
        (is (= count (hash-table-count pages)))
        (let ((directory (p:costruisci-directory-pagine builder 1 63 correct)))
          (signals invalid-argument (p:costruisci-directory-pagine builder 1 63 (vector directory nil))
                   :index-build-directory-order)
          (signals invalid-argument (p:costruisci-bucket-pagine builder #() :next directory) :index-build-reference))
        (signals invalid-argument (p:costruisci-bucket-pagine builder (vector (build-entry foreign key))) :index-build-entry-owner)
        (signals invalid-argument (p:costruisci-bucket-pagine builder #(1)) :index-build-entry-type)
        (signals invalid-argument (p:costruisci-directory-pagine builder 1 0 #(1 nil)) :index-build-child-type)))))

(deftest req-idx-009-costruzione-confini-preflight-owner-e-rientro
  (let* ((builder nil) (mode :reject) (calls 0)
         (sink (lambda (buffer offset) (incf calls) (+ offset (length buffer)))))
    (setf builder (p:crea-costruttore-pagine (identita-fixture 4096 :page 4096) 4096 sink 0 0
                    :preflight (lambda (total size) (is (= total size))
                                 (case mode
                                   (:reject (error 'arcdocdb.conditions:resource-exhausted :reason :fixture-budget))
                                   (:bad t) (:reentry (p:costruisci-bucket-pagine builder #()))
                                   (:ok nil) (otherwise (error "Modalita sconosciuta"))))))
    (signals arcdocdb.conditions:resource-exhausted (p:costruisci-bucket-pagine builder #()) :fixture-budget)
    (setf mode :bad)
    (signals invalid-argument (p:costruisci-bucket-pagine builder #()) :index-build-preflight-result)
    (setf mode :reentry)
    (signals invalid-argument (p:costruisci-bucket-pagine builder #()) :index-build-reentry)
    (is (zerop calls)) (is (eq :open (p::costruttore-pagine-state builder)))
    (is (eq :index-build-owner
            (sb-thread:join-thread
             (sb-thread:make-thread (lambda () (handler-case (p:costruisci-bucket-pagine builder #())
                                                (invalid-argument (c) (error-reason c))))))))
    (setf mode :ok)
    (p:costruisci-bucket-pagine builder #()) (is (= calls 1))))

(deftest req-idx-009-costruzione-interruzione-ogni-frontiera-chiave
  ;; 5000 byte => due frammenti da 4 KiB e bucket finale.
  (loop for stop from 1 to 3 do
    (let* ((calls 0) (returned nil)
           (builder (p:crea-costruttore-pagine (identita-fixture 4096 :page 4096) 4096
                      (lambda (buffer offset)
                        (incf calls)
                        (when (= calls stop) (error 'arcdocdb.conditions:io-fault :reason :fixture-stop :operation :write))
                        (+ offset (length buffer))) 0 0))
           (entry (build-entry builder (bytes 5000 1))))
      (signals arcdocdb.conditions:io-fault
               (setf returned (p:costruisci-bucket-pagine builder (vector entry))) :fixture-stop)
      (is (null returned)) (is (= calls stop)) (is (eq :faulted (p::costruttore-pagine-state builder)))
      (signals invalid-argument (p:costruisci-bucket-pagine builder #()) :index-build-faulted))))

(deftest req-idx-009-costruzione-file-append-flush-riapertura-readonly
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((size 4096) (path (merge-pathnames "indice.tmp" directory))
           (file (arcdocdb.io:crea-temporaneo path :max-transfer size)) (root nil) (key (bytes 5000 127)))
      (unwind-protect
           (progn
             (arcdocdb.io:append-esatto file (bytes size) 0 size)
             (let* ((builder (p:crea-costruttore-pagine-file file (identita-fixture size :page size) size 0 0))
                    (entry (build-entry builder key)))
               (setf root (p:costruisci-bucket-pagine builder (vector entry)))
               (is (= (arcdocdb.io:posizione-durevole file) 0))
               (is (= (arcdocdb.io:durable-flush file) (* size 4)))))
        (arcdocdb.io:chiudi file))
      (let ((input (arcdocdb.io:apri-lettura path :max-transfer size)))
        (unwind-protect
             (let* ((cache (p:crea-cache-pagine-file size 1 input))
                    (reader (p:crea-lettore-indice-pagine cache (p:identita-riferimento-costruito root)))
                    (words (lookup-words)))
               (is (eq :live (build-get reader key words)))
               (is (= (aref words 0) 7))
               (is (eq :absent (build-get reader (bytes 5000 126) words))))
          (arcdocdb.io:chiudi input))))))

(deftest req-idx-009-costruzione-configurazione-e-candidati-incoerenti
  (let ((start (identita-fixture 4096 :page 4096)))
    (dolist (bad '(0 65537 1.0))
      (signals invalid-argument (p:crea-costruttore-pagine start 4096 #'identity 0 0 :max-pages bad)
               :index-build-configuration))
    (signals invalid-argument (p:crea-costruttore-pagine start 4095 #'identity 0 0) :index-build-configuration)
    (signals invalid-argument (p:crea-costruttore-pagine start 4096 nil 0 0) :index-build-configuration)
    (signals invalid-argument (p:crea-costruttore-pagine start 4096 #'identity 0 0 :preflight nil)
             :index-build-configuration))
  (multiple-value-bind (builder pages) (build-fixture 4096)
    (declare (ignore pages))
    (let ((words (lookup-words)))
      (signals invalid-argument (p:crea-entry-costruzione builder (lookup-key 1) words) :index-build-candidate)
      (setf (aref words 0) 0 (aref words 1) #x100000070 (aref words 2) (+ (ash 1 48) (ash 1 32))
            (aref words 3) 28 (aref words 4) 0)
      (signals invalid-argument (p:crea-entry-costruzione builder (lookup-key 1) words) :index-page-record)
      (setf (aref words 0) 7)
      (is (typep (p:crea-entry-costruzione builder (lookup-key 1) words) 'p:entry-costruzione)))))

(deftest req-idx-009-costruzione-bucket-pieno-collisioni-gruppi
  (multiple-value-bind (builder pages) (build-fixture 4096)
    (let ((entries nil) (keys nil) (words (lookup-words)))
      (loop for i below 30000 until (= (length entries) 28) do
        (let ((key (lookup-key (logand i 255) (ash i -8))))
          (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key 0 2 0 0)
            (declare (ignore high))
            (when (= (logand low 2175) 5)
              (push key keys) (push (build-entry builder key) entries)))))
      (is (= (length entries) 28))
      (let* ((root (p:costruisci-bucket-pagine builder (coerce entries 'simple-vector)))
             (reader (build-reader 4096 root pages)))
        (dolist (key keys) (is (eq :live (build-get reader key words))))))))

(deftest req-idx-009-costruzione-directory-campo-a-cavallo-u32
  (multiple-value-bind (builder pages) (build-fixture 4096)
    (let ((children (make-array 128 :initial-element nil)) (key (lookup-key 42)) (words (lookup-words)))
      (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key 0 1 0 0)
        (let ((slot (ldb (byte 7 29) (logior (ash high 32) low))))
          (setf (aref children slot) (p:costruisci-bucket-pagine builder (vector (build-entry builder key))))))
      (let ((root (p:costruisci-directory-pagine builder 7 29 children)))
        (is (eq :live (build-get (build-reader 4096 root pages) key words)))))))

(deftest req-idx-009-costruzione-quota-file-e-identita-senza-wrap
  (let* ((size 4096) (last (- (ash 1 60) size)) (calls 0)
         (builder (p:crea-costruttore-pagine (identita-fixture size :page last) size
                    (lambda (buffer offset) (incf calls) (+ offset (length buffer))) 0 0)))
    (signals arcdocdb.conditions:resource-exhausted (p:costruisci-bucket-pagine builder #()) :index-build-page-budget)
    (is (zerop calls)) (is (eq :open (p::costruttore-pagine-state builder))))
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((size 4096) (file (arcdocdb.io:crea-temporaneo (merge-pathnames "quota.tmp" directory)
                                                       :max-transfer size :max-file-bytes (* size 3))))
      (unwind-protect
           (progn
             (arcdocdb.io:append-esatto file (bytes size) 0 size)
             (let ((builder (p:crea-costruttore-pagine-file file (identita-fixture size :page size) size 0 0)))
               (signals arcdocdb.conditions:resource-exhausted
                        (p:costruisci-bucket-pagine builder (vector (build-entry builder (bytes 5000 1)))) :io-group-budget)
               (is (= (arcdocdb.io:posizione-scritta file) size))
               (is (eq :open (p::costruttore-pagine-state builder)))
               (is (eq :open (arcdocdb.io:stato-file file)))
               (p:costruisci-bucket-pagine builder #())
               (is (= (arcdocdb.io:posizione-scritta file) (* size 2)))))
        (arcdocdb.io:chiudi file)))))
