;;; OWNER: runner, temporanei esclusivi e fonte/oracoli indipendenti dai metadati del derivato.
;;; REQ: REQ-IDX-010 REQ-AFF-003 REQ-LIM-003
(in-package #:arcdocdb.index.page.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(defun image-source (count &key (token 1) (csn 7))
  (p:crea-fonte-indice (bytes 16 49) (series) (bytes 32 token) csn count))

(defun image-validator (keys)
  (lambda (key start end words)
    (and (some (lambda (expected) (equalp expected (subseq key start end))) keys)
         (= (aref words 0) 7) (= (aref words 1) #x100000070)
         (= (aref words 2) (+ (ash 1 48) (ash (- end start) 32)))
         (= (aref words 3) (+ 27 (- end start))) (zerop (aref words 4)))))

(defun build-image-open (file size keys)
  (is (= (arcdocdb.io:append-esatto file (bytes size) 0 size) size))
  (let ((builder (p:crea-costruttore-pagine-file file (identita-fixture size :page size) size 0 0)))
    (values builder (p:costruisci-bucket-pagine builder
                       (map 'simple-vector (lambda (key) (build-entry builder key)) keys)))))

(defun write-image-fixture (directory size keys &key (name "image.tmp") (source (image-source (length keys))) observer)
  (let ((file (arcdocdb.io:crea-temporaneo (merge-pathnames name directory) :max-transfer size)))
    (unwind-protect
         (multiple-value-bind (builder root) (build-image-open file size keys)
           (p:sigilla-immagine-pagine builder root file source :observer observer)
           (is (eq :sealed (p::costruttore-pagine-state builder)))
           (signals invalid-argument (p:costruisci-bucket-pagine builder #()) :index-build-sealed))
      (arcdocdb.io:chiudi file))))

(defmacro with-image-input ((file eof directory &optional (name "image.tmp")) &body body)
  `(let ((parent (arcdocdb.io:apri-directory ,directory)))
     (unwind-protect
          (multiple-value-bind (,file ,eof)
              (arcdocdb.io:apri-lettura-nella-directory parent ,name :max-transfer 65536)
            (unwind-protect (progn ,@body) (arcdocdb.io:chiudi ,file)))
       (arcdocdb.io:chiudi parent))))

(defun image-mutate (directory size index function &key (footer nil))
  (with-open-file (stream (merge-pathnames "image.tmp" directory) :direction :io
                          :element-type '(unsigned-byte 8) :if-exists :overwrite)
    (let ((buffer (bytes size)))
      (file-position stream (* size index))
      (is (= (read-sequence buffer stream) size))
      (funcall function buffer)
      (cond ((eq footer :raw) nil)
            (footer (ref-write buffer (- size 4) (ref-crc buffer 0 (- size 4)) 4))
            ((plusp index) (repair buffer 0 size))
            (t nil))
      (file-position stream (* size index)) (write-sequence buffer stream))))

(deftest req-idx-010-container-tre-taglie-chiavi-massime-e-pubblicazione
  (dolist (size '(4096 16384 65536))
    (arcdocdb.io.tests::with-directory (directory)
      (let* ((keys (list (lookup-key 1 2) (bytes 65535 127))) (source (image-source 2)) (words (lookup-words)))
        (write-image-fixture directory size keys :source source)
        (with-image-input (file eof directory)
          (let* ((image (p:recupera-immagine-pagine file eof size source 0 0 (image-validator keys) :frames 1))
                 (view (p:crea-vista-indice-paginato source)))
            (signals arcdocdb.conditions:resource-exhausted
                     (p:leggi-vista-indice-paginato view (lookup-key 1 2) 0 2 words) :index-image-not-ready)
            (p:pubblica-immagine-verificata view image)
            (dolist (key keys)
              (is (eq :live (p:leggi-vista-indice-paginato view key 0 (length key) words)))
              (is (= (aref words 0) 7)))
            (fill words 99)
            (is (eq :absent (p:leggi-vista-indice-paginato view (lookup-key 99) 0 1 words)))
            (is (every (lambda (n) (= n 99)) words))
            (arcdocdb.io:chiudi file)
            (signals arcdocdb.conditions:io-fault
                     (p:leggi-vista-indice-paginato view (lookup-key 1 2) 0 2 words) :io-unavailable)))))))

(deftest req-idx-010-footer-oracolo-indipendente
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((size 4096) (keys (list (lookup-key 1))) (source (image-source 1)))
      (write-image-fixture directory size keys :source source)
      (with-image-input (file eof directory)
        (let ((buffer (bytes size)))
          (arcdocdb.io:leggi-esatto file buffer 0 size (- eof size))
          (is (equalp (subseq buffer 0 8) #(65 82 67 73 82 70 48 49)))
          (is (= (ref-read buffer 8 2) 1)) (is (= (aref buffer 10) 12))
          (is (equalp (subseq buffer 16 32) (bytes 16 49))) (is (equalp (subseq buffer 32 48) (series)))
          (is (= (ref-read buffer 48 8) 91)) (is (= (ref-read buffer 56 8) 7))
          (is (= (ref-read buffer 64 8) size)) (is (= (ref-read buffer 72 8) 7))
          (is (= (ref-read buffer 80 8) 1)) (is (= (ref-read buffer 88 8) 7))
          (is (= (ref-read buffer 96 8) 1)) (is (= (ref-read buffer 104 8) 0))
          (is (equalp (subseq buffer 112 144) (bytes 32 1)))
          (is (= (ref-read buffer (- size 4) 4) (ref-crc buffer 0 (- size 4)))))))))

(deftest req-idx-010-footer-fonte-seme-versione-e-riservati
  (dolist (item '((16 1 1 :index-image-source-mismatch) (32 1 1 :index-image-source-mismatch)
                  (48 0 8 :index-image-root) (56 0 8 :index-image-root)
                  (64 8192 8 :index-image-root) (72 6 8 :index-image-root)
                  (80 2 8 :index-image-root) (88 8 8 :index-image-source-mismatch)
                  (96 2 8 :index-image-source-mismatch) (104 1 4 :index-image-source-mismatch)
                  (108 1 4 :index-image-source-mismatch) (112 2 1 :index-image-source-mismatch)
                  (11 1 1 :index-image-reserved) (12 1 4 :index-image-reserved)
                  (144 1 1 :index-image-reserved) (10 14 1 :index-image-reserved)
                  (0 0 4 :index-image-magic)))
    (arcdocdb.io.tests::with-directory (directory)
      (let ((keys (list (lookup-key 1))) (source (image-source 1)) (calls 0))
        (write-image-fixture directory 4096 keys :source source)
        (destructuring-bind (offset value width reason) item
          (image-mutate directory 4096 2 (lambda (buffer) (ref-write buffer offset value width)) :footer t)
          (with-image-input (file eof directory)
            (signals corruption-detected
                     (p:recupera-immagine-pagine file eof 4096 source 0 0
                       (lambda (&rest args) (declare (ignore args)) (incf calls) t)) reason)
            (is (zerop calls))))))))

(deftest req-idx-010-duplicati-globali-payload-identico-rifiutati
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((size 4096) (key (lookup-key 1)) (source (image-source 2))
           (file (arcdocdb.io:crea-temporaneo (merge-pathnames "image.tmp" directory) :max-transfer size)))
      (unwind-protect
           (progn
             (arcdocdb.io:append-esatto file (bytes size) 0 size)
             (let* ((builder (p:crea-costruttore-pagine-file file (identita-fixture size :page size) size 0 0))
                    (entry (build-entry builder key))
                    (tail (p:costruisci-bucket-pagine builder (vector entry)))
                    (root (p:costruisci-bucket-pagine builder (vector entry) :next tail)))
               (p:sigilla-immagine-pagine builder root file source)))
        (arcdocdb.io:chiudi file))
      (with-image-input (input eof directory)
        (signals corruption-detected (p:recupera-immagine-pagine input eof size source 0 0 (image-validator (list key (lookup-key 2))))
                 :index-image-entry-origin)))))

(deftest req-idx-010-autorita-conteggio-e-budget-cumulativo
  (arcdocdb.io.tests::with-directory (directory)
    (let ((keys (list (lookup-key 1))) (source (image-source 1)))
      (write-image-fixture directory 4096 keys :source source)
      (with-image-input (file eof directory)
        (signals corruption-detected (p:recupera-immagine-pagine file eof 4096 source 0 0
                                      (lambda (&rest args) (declare (ignore args)) nil)) :index-image-authority)
        (signals invalid-argument (p:recupera-immagine-pagine file eof 4096 source 0 0
                                   (lambda (&rest args) (declare (ignore args)) :wrong)) :index-image-validator-result)
        (signals arcdocdb.conditions:resource-exhausted
                 (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys) :max-visits 3)
                 :index-image-visit-budget)
        (is (typep (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys) :max-visits 4)
                   'p:immagine-indice-verificata))))))

(deftest req-idx-010-interruzioni-sigillo-e-riapertura-senza-ack
  (dolist (stop '(:before-footer :after-footer :after-flush))
    (arcdocdb.io.tests::with-directory (directory)
      (let* ((size 4096) (keys (list (lookup-key 1))) (source (image-source 1))
             (file (arcdocdb.io:crea-temporaneo (merge-pathnames "image.tmp" directory) :max-transfer size))
             (observed nil) (returned nil))
        (unwind-protect
             (multiple-value-bind (builder root) (build-image-open file size keys)
               (is (eq :stopped
                       (catch 'seal-stop
                         (setf returned
                               (p:sigilla-immagine-pagine builder root file source
                                 :observer (lambda (phase) (push phase observed)
                                             (when (eq phase stop) (throw 'seal-stop :stopped)) nil))))))
               (is (null returned)) (is (eq :faulted (p::costruttore-pagine-state builder)))
               (signals invalid-argument (p:costruisci-bucket-pagine builder #()) :index-build-faulted))
          (arcdocdb.io:chiudi file))
        (with-image-input (input eof directory)
          (if (eq stop :before-footer)
              (signals corruption-detected (p:recupera-immagine-pagine input eof size source 0 0 (image-validator keys))
                       :index-image-size)
              (is (typep (p:recupera-immagine-pagine input eof size source 0 0 (image-validator keys))
                         'p:immagine-indice-verificata))))))))

(deftest req-idx-010-adozione-preserva-root-e-invalidazione-fonte
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((keys (list (lookup-key 1))) (a (image-source 1)) (b (image-source 1 :token 2))
           (view (p:crea-vista-indice-paginato a)) (words (lookup-words)))
      (write-image-fixture directory 4096 keys :source a)
      (write-image-fixture directory 4096 keys :source b :name "other.tmp")
      (with-image-input (left left-eof directory)
        (with-image-input (right right-eof directory "other.tmp")
          (let ((first (p:recupera-immagine-pagine left left-eof 4096 a 0 0 (image-validator keys)))
                (second (p:recupera-immagine-pagine right right-eof 4096 b 0 0 (image-validator keys))))
            (p:pubblica-immagine-verificata view first)
            (signals invalid-argument (p:pubblica-immagine-verificata view second) :index-image-publication-source)
            (is (eq first (p::vista-indice-paginato-current view)))
            (signals invalid-argument (p:invalida-vista-indice-paginato view (image-source 1 :csn 6))
                     :index-image-source-regression)
            (is (eq first (p::vista-indice-paginato-current view)))
            (is (eq :live (p:leggi-vista-indice-paginato view (lookup-key 1) 0 1 words)))
            (p:invalida-vista-indice-paginato view b)
            (signals arcdocdb.conditions:resource-exhausted
                     (p:leggi-vista-indice-paginato view (lookup-key 1) 0 1 words) :index-image-not-ready)
            (signals invalid-argument (p:pubblica-immagine-verificata view first) :index-image-publication-source)
            (p:pubblica-immagine-verificata view second)
            (is (eq :live (p:leggi-vista-indice-paginato view (lookup-key 1) 0 1 words)))
            (is (eq :index-image-view-owner
                    (sb-thread:join-thread
                     (sb-thread:make-thread
                      (lambda ()
                        (handler-case (p:pubblica-immagine-verificata view first)
                          (invalid-argument (c) (error-reason c))))))))))))))

(deftest req-idx-010-entry-irraggiungibili-e-copertura-mancante
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((size 4096) (key (lookup-key 1)) (other (lookup-key 2)) (source (image-source 1))
           (file (arcdocdb.io:crea-temporaneo (merge-pathnames "image.tmp" directory) :max-transfer size)))
      (unwind-protect
           (progn
             (arcdocdb.io:append-esatto file (bytes size) 0 size)
             (let ((builder (p:crea-costruttore-pagine-file file (identita-fixture size :page size) size 0 0)))
               (p:costruisci-bucket-pagine builder (vector (build-entry builder other)))
               (let ((root (p:costruisci-bucket-pagine builder (vector (build-entry builder key)))))
                 (p:sigilla-immagine-pagine builder root file source))))
        (arcdocdb.io:chiudi file))
      (with-image-input (input eof directory)
        (signals corruption-detected (p:recupera-immagine-pagine input eof size source 0 0 (image-validator (list key)))
                 :index-image-entry-origin))))
  (arcdocdb.io.tests::with-directory (directory)
    (let ((keys (list (lookup-key 1))) (source (image-source 2)))
      (write-image-fixture directory 4096 keys)
      (image-mutate directory 4096 2 (lambda (buffer) (ref-write buffer 96 2 8)) :footer t)
      (with-image-input (input eof directory)
        (signals corruption-detected (p:recupera-immagine-pagine input eof 4096 source 0 0 (image-validator keys))
                 :index-image-entry-count)))))

(deftest req-idx-010-pagina-valida-digest-falso
  (arcdocdb.io.tests::with-directory (directory)
    (let ((keys (list (lookup-key 1))) (source (image-source 1)))
      (write-image-fixture directory 4096 keys :source source)
      (image-mutate directory 4096 1
        (lambda (buffer)
          (let* ((slot (loop for i below 32 when (< (aref buffer (+ 96 i)) 128) return i))
                 (entry (+ 96 32 (* slot 64))))
            (ref-write buffer (+ entry 4) (logxor 1 (ref-read buffer (+ entry 4) 4)) 4))))
      (with-image-input (file eof directory)
        (signals corruption-detected (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys))
                 :index-image-key-digest)))))

(deftest req-idx-010-fonte-vuota-e-tipo-root-errato
  (arcdocdb.io.tests::with-directory (directory)
    (let ((source (image-source 0 :csn 0)) (words (lookup-words)))
      (write-image-fixture directory 4096 nil :source source)
      (with-image-input (file eof directory)
        (let* ((image (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator nil) :max-visits 3))
               (view (p:crea-vista-indice-paginato source)))
          (p:pubblica-immagine-verificata view image)
          (is (eq :absent (p:leggi-vista-indice-paginato view (lookup-key 1) 0 1 words)))
          (is (every (lambda (n) (= n 99)) words))))
      ;; Trasforma l'empty bucket in un frammento localmente valido, ma root di tipo errato.
      (image-mutate directory 4096 1 (lambda (buffer) (setf (aref buffer 10) 3)
                                      (ref-write buffer 60 2080 4) (ref-write buffer 80 0 4)))
      (with-image-input (file eof directory)
        (signals corruption-detected (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator nil))
                 :index-image-root-kind)))))

(deftest req-idx-010-archi-vuoti-verificati-senza-query-entry
  (dolist (bad '(:kind :order))
    (arcdocdb.io.tests::with-directory (directory)
      (let* ((size 4096) (source (image-source 0))
             (file (arcdocdb.io:crea-temporaneo (merge-pathnames "image.tmp" directory) :max-transfer size)))
        (unwind-protect
             (progn
               (arcdocdb.io:append-esatto file (bytes size) 0 size)
               (let* ((builder (p:crea-costruttore-pagine-file file (identita-fixture size :page size) size 0 0))
                      (child (if (eq bad :kind) (p:costruisci-bucket-pagine builder #())
                                 (p:costruisci-directory-pagine builder 1 62 #(nil nil))))
                      (root (p:costruisci-directory-pagine builder 1 63 (vector child nil))))
                 (p:sigilla-immagine-pagine builder root file source)))
          (arcdocdb.io:chiudi file))
        (image-mutate directory size 1
          (lambda (buffer)
            (if (eq bad :kind)
                (progn (setf (aref buffer 10) 3) (ref-write buffer 60 2080 4) (ref-write buffer 80 0 4))
                (ref-write buffer 80 (+ 1 (* 63 256)) 4))))
        (with-image-input (input eof directory)
          (signals corruption-detected (p:recupera-immagine-pagine input eof size source 0 0 (image-validator nil))
                   (if (eq bad :kind) :index-image-child-kind :index-image-directory-order)))))))

(deftest req-idx-010-footer-crc-versione-prefisso-e-file-incompleto
  (dolist (bad '(:crc :version :prefix :truncated :tail))
    (arcdocdb.io.tests::with-directory (directory)
      (let ((keys (list (lookup-key 1))) (source (image-source 1)) (path (merge-pathnames "image.tmp" directory)))
        (write-image-fixture directory 4096 keys :source source)
        (case bad
          (:crc (image-mutate directory 4096 2 (lambda (b) (ref-write b 4092 0 4)) :footer :raw))
          (:version (image-mutate directory 4096 2 (lambda (b) (ref-write b 8 2 2)) :footer t))
          (:prefix (image-mutate directory 4096 0 (lambda (b) (setf (aref b 0) 1))))
          ((:truncated :tail)
           (let ((all (with-open-file (s path :element-type '(unsigned-byte 8))
                        (let ((b (bytes (file-length s)))) (read-sequence b s) b))))
             (with-open-file (s path :direction :output :if-exists :supersede :element-type '(unsigned-byte 8))
               (write-sequence all s :end (if (eq bad :truncated) (1- (length all)) (length all)))
               (when (eq bad :tail) (write-byte 0 s)))))
          (otherwise (error "Caso sconosciuto")))
        (with-image-input (file eof directory)
          (if (eq bad :version)
              (signals unsupported-format (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys))
                       :index-image-version)
              (signals corruption-detected (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys))
                       (case bad (:crc :index-image-footer-crc) (:prefix :index-image-prefix)
                         (otherwise :index-image-size)))))))))

(deftest req-idx-010-sigillo-file-esatto-vecchia-root-e-osservatore
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((size 4096) (file (arcdocdb.io:crea-temporaneo (merge-pathnames "image.tmp" directory) :max-transfer size))
           (other (arcdocdb.io:crea-temporaneo (merge-pathnames "other.tmp" directory) :max-transfer size)))
      (unwind-protect
           (multiple-value-bind (builder root) (build-image-open file size (list (lookup-key 1)))
             (signals invalid-argument (p:sigilla-immagine-pagine builder root other (image-source 1)) :index-image-seal-input)
             (signals invalid-argument (p:sigilla-immagine-pagine builder root file (image-source 0)) :index-image-seal-input)
             (let ((new-root (p:costruisci-bucket-pagine builder #() :next root)))
               (signals invalid-argument (p:sigilla-immagine-pagine builder root file (image-source 1)) :index-image-seal-input)
               (signals invalid-argument (p:sigilla-immagine-pagine builder new-root file (image-source 1)
                                          :observer (lambda (phase) (declare (ignore phase)) t))
                        :index-image-observer-result)
               (is (eq :faulted (p::costruttore-pagine-state builder)))))
        (arcdocdb.io:chiudi file) (arcdocdb.io:chiudi other)))))

(deftest req-idx-010-recovery-directory-multilivello-e-overflow
  (arcdocdb.io.tests::with-directory (directory)
    (let* ((size 4096) (keys (loop for i below 24 collect (lookup-key i))) (source (image-source 24))
           (groups (make-array 4 :initial-element nil)) (children (make-array 2 :initial-element nil))
           (file (arcdocdb.io:crea-temporaneo (merge-pathnames "image.tmp" directory) :max-transfer size)))
      (unwind-protect
           (progn
             (arcdocdb.io:append-esatto file (bytes size) 0 size)
             (let ((builder (p:crea-costruttore-pagine-file file (identita-fixture size :page size) size 0 0)))
               (dolist (key keys)
                 (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key 0 1 0 0)
                   (declare (ignore low)) (push (build-entry builder key) (aref groups (ldb (byte 2 30) high)))))
               (dotimes (side 2)
                 (let ((leaves (make-array 2 :initial-element nil)))
                   (dotimes (bit 2)
                     (let* ((entries (aref groups (+ (* side 2) bit)))
                            (tail (p:costruisci-bucket-pagine builder (coerce (rest entries) 'simple-vector))))
                       (setf (aref leaves bit)
                             (p:costruisci-bucket-pagine builder (if entries (vector (first entries)) #()) :next tail))))
                   (setf (aref children side) (p:costruisci-directory-pagine builder 1 62 leaves))))
               (let ((root (p:costruisci-directory-pagine builder 1 63 children)))
                 (p:sigilla-immagine-pagine builder root file source))))
        (arcdocdb.io:chiudi file))
      (with-image-input (input eof directory)
        (let* ((image (p:recupera-immagine-pagine input eof size source 0 0 (image-validator keys) :frames 1))
               (view (p:crea-vista-indice-paginato source)) (words (lookup-words)))
          (p:pubblica-immagine-verificata view image)
          (dolist (key keys) (is (eq :live (p:leggi-vista-indice-paginato view key 0 1 words))))
          (is (eq :absent (p:leggi-vista-indice-paginato view (lookup-key 99) 0 1 words))))))))

(deftest req-idx-010-flush-fallito-e-nessuna-prova-adottabile
  (let* ((flushes 0)
         (backend (arcdocdb.io.tests::backend
                    :writer (lambda (fd buffer start count) (declare (ignore fd buffer start)) count)
                    :flush (lambda (fd) (declare (ignore fd)) (incf flushes)
                             (error 'sb-posix:syscall-error :errno sb-posix:eio :name 'fsync))))
         (file (arcdocdb.io:crea-temporaneo "image.tmp" :backend backend :max-transfer 4096)))
    (unwind-protect
         (multiple-value-bind (builder root) (build-image-open file 4096 (list (lookup-key 1)))
           (signals arcdocdb.conditions:io-fault (p:sigilla-immagine-pagine builder root file (image-source 1)) :io-syscall)
           (is (= flushes 1)) (is (eq :faulted (p::costruttore-pagine-state builder)))
           (is (eq :faulted (arcdocdb.io:stato-file file))))
      (arcdocdb.io:chiudi file))))

(deftest req-idx-010-configurazione-fonte-recovery-e-lifetime
  (dolist (args '((15 16 32 1) (16 15 32 1) (16 16 31 1) (16 16 32 -1) (16 16 32 29360129)))
    (destructuring-bind (archive-size series-size token-size count) args
      (signals invalid-argument (p:crea-fonte-indice (bytes archive-size) (bytes series-size) (bytes token-size) 7 count)
               :index-image-source)))
  (arcdocdb.io.tests::with-directory (directory)
    (let ((keys (list (lookup-key 1))) (source (image-source 1)))
      (write-image-fixture directory 4096 keys :source source)
      (with-image-input (file eof directory)
        (dolist (frames '(0 65 1.0))
          (signals invalid-argument (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys) :frames frames)
                   :index-image-recovery-configuration))
        (dolist (visits '(0 -1 1.0))
          (signals invalid-argument (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys) :max-visits visits)
                   :index-image-recovery-configuration))
        (signals invalid-argument (p:recupera-immagine-pagine file eof 4096 source 0 0 nil) :index-image-recovery-configuration)
        (signals arcdocdb.conditions:resource-exhausted
                 (p:recupera-immagine-pagine file eof 4096 source 0 0 (image-validator keys) :max-visits 1)
                 :index-image-visit-budget)
        (signals arcdocdb.conditions:io-fault
                 (p:recupera-immagine-pagine file eof 4096 source 0 0
                   (lambda (&rest args) (declare (ignore args)) (arcdocdb.io:chiudi file) t)) :io-unavailable)))))
