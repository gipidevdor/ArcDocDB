;;; OWNER: runner C4; candidati prodotti dal motore, alterazioni esplicite solo nelle fixture.
;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-LIM-003 REQ-AFF-008
(in-package #:arcdocdb.engine.tests)

(defun open-discovery-engine (root &key (version 2) observer (config (e:crea-opzione-scoperta-indice)))
  (e:apri-motore root (archive-id) (series-id) :version version :clock (lambda () 10) :observer observer
    :max-file-bytes 2097152 :max-record-bytes 131072 :max-records 4096 :max-segments 32
    :index-capacity 128 :key-arena-bytes 262144 :index-discovery config))
(defun discovery-images (root)
  (remove-if-not (lambda (pair) (e::nome-candidato-indice-p (car pair))) (images root)))
(defun discovery-selected (engine option)
  (is (eq :paged (e:modo-indice-motore engine))) (check-active-file engine)
  (is (string= (e::opzione-indice-paginato-name option)
               (e::opzione-indice-paginato-name (e::motore-paged-option engine)))))
(defun discovery-overwrite (path data)
  (with-open-file (out path :direction :output :element-type '(unsigned-byte 8) :if-exists :supersede)
    (write-sequence data out)))
(defun discovery-corrupt (path kind)
  (let* ((data (image path)) (size 4096) (footer (- (length data) size)))
    (ecase kind
      (:crc (setf (aref data (+ footer 30)) (logxor 1 (aref data (+ footer 30)))))
      (:data (setf (aref data (+ size 70)) (logxor 1 (aref data (+ size 70)))))
      (:payload
       (let* ((slot (loop for i below 32 when (< (aref data (+ size 96 i)) 128) return i))
              (position (+ size 96 32 (* slot 64) 8)))
         (is slot)
         (arcdocdb.binary:scrivi-u64 data position (1+ (arcdocdb.binary:leggi-u64 data position)))
         (arcdocdb.binary:scrivi-u32 data (+ size 92)
           (arcdocdb.binary:crc32c data (+ size 96) (* size 2)))))
      (:version (arcdocdb.binary:scrivi-u16 data (+ footer 8) 2))
      (:flags (setf (aref data (+ footer 11)) 1))
      (:root (arcdocdb.binary:scrivi-u64 data (+ footer 64) 0))
      (:magic (arcdocdb.binary:scrivi-u64 data footer 0))
      (:padding (setf (aref data (+ footer 200)) 1))
      (:profile (setf (aref data (+ footer 10)) 14)))
    (when (member kind '(:version :flags :root :magic :padding :profile))
      (arcdocdb.binary:scrivi-u32 data (- (length data) 4)
        (arcdocdb.binary:crc32c data footer (- (length data) 4))))
    (discovery-overwrite path data)))

(deftest test-REQ-IDX-010-discover-profili-nomi-domini-e-quota
  (dolist (args '((:max-names 0) (:max-names 65537) (:max-names nil) (:max-candidates 0)
                  (:max-candidates 1025) (:max-candidates 1.5) (:max-discovery-payload -1)
                  (:max-discovery-payload 536870913) (:max-names 1 :max-candidates 2) (:page-size 8192)
                  (:frames 0) (:max-visits 0) (:max-bytes 1)))
    (signals arcdocdb.conditions:invalid-argument (apply #'e:crea-opzione-scoperta-indice args)))
  (signals arcdocdb.conditions:resource-exhausted (e:crea-opzione-scoperta-indice :max-discovery-payload 0))
  (is (e:crea-opzione-scoperta-indice :max-names 1 :max-candidates 1))
  (is (e:crea-opzione-scoperta-indice :max-names 65536 :max-candidates 1024
         :max-discovery-payload 536870912 :page-size 65536 :frames 64 :max-bytes 4295098368))
  (let* ((template (build-option 1)) (quota (e::payload-scoperta-indice template 4096 64)))
    (signals arcdocdb.conditions:resource-exhausted (e:crea-opzione-scoperta-indice :max-discovery-payload (1- quota)))
    (is (e:crea-opzione-scoperta-indice :max-discovery-payload quota)))
  (dolist (name '(nil 123 "" "primary-000000000000001.idx.tmp" "foreign-0000000000000001.idx.tmp"
                  "primary-0000000000000001.idx.bad" "primary-000000000000000G.idx.tmp"))
    (is (not (e::nome-candidato-indice-p name))))
  (is (e::nome-candidato-indice-p "primary-0000000000000000.idx.tmp"))
  (is (e::nome-candidato-indice-p "primary-ffffffffffffffff.idx.tmp"))
  (is (e::nome-candidato-preferito-p "primary-0000000000000001.idx.tmp" nil))
  (is (e::nome-candidato-preferito-p "primary-0000000000000002.idx.tmp" "primary-0000000000000001.idx.tmp"))
  (is (not (e::nome-candidato-preferito-p "primary-0000000000000001.idx.tmp" "primary-0000000000000002.idx.tmp")))
  (is (not (e::nome-candidato-preferito-p "primary-0000000000000001.idx.tmp" "primary-0000000000000001.idx.tmp")))
  (signals arcdocdb.conditions:invalid-argument
           (e:apri-motore "/directory-not-opened/" (archive-id) (series-id) :create t
             :index-discovery (e:crea-opzione-scoperta-indice)))
  (signals arcdocdb.conditions:invalid-argument
           (e:apri-motore "/directory-not-opened/" (archive-id) (series-id)
             :index-image (build-option 1) :index-discovery (e:crea-opzione-scoperta-indice))))

(deftest test-REQ-IDX-010-discover-v1-v2-tre-taglie-scelta-e-ritiro
  (dolist (version '(1 2))
    (dolist (size '(4096 16384 65536))
      (with-root (root)
        (let ((first (build-option 1 :page-size size)) (second (build-option 2 :page-size size))
              (latest (build-option 10 :page-size size)) (seen nil))
          (with-engine (engine (open-build-engine root :create t :version version))
            (initial-workload engine)
            (dolist (option (list second first latest)) (e:costruisci-indice-paginato-motore engine option)))
          (let ((before (discovery-images root)))
            (with-engine (engine (open-discovery-engine root :version version
                                   :config (e:crea-opzione-scoperta-indice :page-size size :max-candidates 3)
                                   :observer (lambda (engine phase)
                                               (when (member phase '(:before-index-discovery :index-image-candidate
                                                                     :index-image-discovered :before-index-image :index-image-ready))
                                                 (push phase seen) (is (eq :recovering (e:stato-motore engine)))
                                                 (signals arcdocdb.conditions:invalid-argument
                                                          (e:leggi-documento engine (key 1) (bytes 64)))) nil)))
              (discovery-selected engine latest) (check-initial engine)
              (is (= 3 (count :index-image-candidate seen)))
              (dolist (phase '(:before-index-discovery :index-image-discovered :before-index-image :index-image-ready))
                (is (= 1 (count phase seen))))
              (check-images root before)
              (let ((file (check-active-file engine)))
                (e:scrivi-documento engine (key 1) (value 9))
                (is (eq :closed (arcdocdb.io:stato-file file))) (check-get engine 1 (value 9))))
            (with-engine (engine (open-discovery-engine root :version version
                                   :config (e:crea-opzione-scoperta-indice :page-size size)))
              ;; La scrittura rende obsolete tutte le immagini: il canonico resta disponibile.
              (is (eq :resident (e:modo-indice-motore engine))) (check-get engine 1 (value 9)) (check-frontier engine 6))
            (check-images root before)))))))

(deftest test-REQ-IDX-010-discover-nessuno-incompleti-profili-e-canonico
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t)) (initial-workload engine))
    (with-engine (engine (open-discovery-engine root))
      (is (eq :resident (e:modo-indice-motore engine))) (check-initial engine))
    (let ((first (build-option 1)) (other (build-option 2 :page-size 16384)))
      (with-engine (engine (open-build-engine root))
        (e:costruisci-indice-paginato-motore engine first) (e:costruisci-indice-paginato-motore engine other))
      (discovery-overwrite (build-path root (build-option 99)) (bytes 0))
      (discovery-overwrite (build-path root (build-option 100)) (bytes 12289))
      (discovery-overwrite (merge-pathnames "foreign.idx.tmp" root) (bytes 3 55))
      (discovery-overwrite (build-path root (build-option 50)) (image (build-path root first)))
      (discovery-corrupt (build-path root (build-option 50)) :profile)
      (discovery-corrupt (build-path root first) :crc)
      (let ((before (images root)))
        (with-engine (engine (open-discovery-engine root))
          (is (eq :resident (e:modo-indice-motore engine))) (check-initial engine))
        (with-engine (engine (open-discovery-engine root :config (e:crea-opzione-scoperta-indice :page-size 16384)))
          (discovery-selected engine other) (check-initial engine))
        (check-images root (remove-if-not (lambda (pair) (or (e::nome-candidato-indice-p (car pair))
                                                          (string= (car pair) "foreign.idx.tmp"))) before))))))

(deftest test-REQ-IDX-010-discover-candidato-selezionato-verificato-integralmente-senza-ripiego
  (dolist (kind '(:data :payload :version :flags :root :magic :padding))
    (with-root (root)
      (let ((first (build-option 1)) (second (build-option 2)))
        (with-engine (engine (open-build-engine root :create t))
          (initial-workload engine)
          (e:costruisci-indice-paginato-motore engine first) (e:costruisci-indice-paginato-motore engine second))
        (discovery-corrupt (build-path root second) kind)
        (let ((before (discovery-images root)) (fds (activation-fds)))
          (if (eq kind :version)
              (signals arcdocdb.conditions:unsupported-format (open-discovery-engine root))
              (signals arcdocdb.conditions:corruption-detected (open-discovery-engine root)))
          (is (equal fds (activation-fds))) (check-images root before)
          (with-engine (engine (open-build-engine root)) (check-initial engine)))))))

(deftest test-REQ-IDX-010-discover-limiti-prima-di-scelta-e-budget-verifica
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (initial-workload engine)
      (e:costruisci-indice-paginato-motore engine (build-option 1))
      (e:costruisci-indice-paginato-motore engine (build-option 2)))
    (let ((before (discovery-images root)) (seen nil) (fds (activation-fds)))
      (signals arcdocdb.conditions:resource-exhausted
               (open-discovery-engine root :config (e:crea-opzione-scoperta-indice :max-candidates 1)
                 :observer (lambda (engine phase) (declare (ignore engine))
                             (when (eq phase :index-image-candidate) (setf seen t)) nil)))
      (is (not seen)) (is (equal fds (activation-fds)))
      (signals arcdocdb.conditions:resource-exhausted
               (open-discovery-engine root :config (e:crea-opzione-scoperta-indice :max-names 1 :max-candidates 1)))
      (signals arcdocdb.conditions:resource-exhausted
               (open-discovery-engine root :config (e:crea-opzione-scoperta-indice :max-visits 2)))
      (is (equal fds (activation-fds))) (check-images root before))))

(deftest test-REQ-IDX-010-discover-source-stato-e-revisione-prima-della-scelta
  (dolist (change '(:state :revision :source))
    (with-root (root)
      (with-engine (engine (open-build-engine root :create t))
        (initial-workload engine) (e:costruisci-indice-paginato-motore engine (build-option 1)))
      (let ((seen nil) (fds (activation-fds)))
        (signals arcdocdb.conditions:invariant-violation
                 (open-discovery-engine root :observer
                  (lambda (engine phase)
                    (when (eq phase :before-index-image) (setf seen t))
                    (when (eq phase :index-image-discovered)
                      (ecase change
                        (:state (setf (e::motore-state engine) :starting))
                        (:revision (incf (arcdocdb.index.primary::indice-primario-revision (e::motore-index engine))))
                        (:source (incf (e::motore-source-csn engine))))) nil)))
        (is (not seen)) (is (equal fds (activation-fds)))))))

(deftest test-REQ-IDX-010-discover-nonlocal-close-e-symlink-senza-fallback
  (dolist (phase '(:before-index-discovery :index-image-candidate :index-image-discovered :index-image-ready))
    (with-root (root)
      (with-engine (engine (open-build-engine root :create t))
        (initial-workload engine) (e:costruisci-indice-paginato-motore engine (build-option 1)))
      (let ((captured nil) (fds (activation-fds)))
        (is (eq :stopped
                (catch 'stop (open-discovery-engine root :observer
                             (lambda (engine step) (when (eq phase step) (setf captured engine) (throw 'stop :stopped)) nil)))))
        (is (eq :faulted (e:stato-motore captured))) (is (null (e::motore-paged-file captured)))
        (is (equal fds (activation-fds)))
        (with-engine (engine (open-discovery-engine root)) (check-initial engine)))))
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t)) (initial-workload engine))
    (sb-posix:symlink "CONTROL" (namestring (build-path root (build-option 1))))
    (signals arcdocdb.conditions:io-fault (open-discovery-engine root))
    (with-engine (engine (open-build-engine root)) (check-initial engine))))

(defun discovery-child-main (arguments)
  (destructuring-bind (mode path format stage) arguments
    (let* ((root (uiop:ensure-directory-pathname path)) (version (parse-integer format)))
      (cond ((string= mode "discover-run")
             (with-engine (engine (open-discovery-engine root :version version
                                    :observer (lambda (engine phase)
                                                (declare (ignore engine))
                                                (when (string-equal stage (symbol-name phase)) (crash phase)) nil)))
               (error "Crash non raggiunto.")))
            ((string= mode "discover-verify")
             (with-engine (engine (open-discovery-engine root :version version))
               (discovery-selected engine (build-option 2)) (check-initial engine)))
            (t (error "Mode sconosciuto.")))
      (format t "~&DISCOVERY-VERIFIED v~D ~A~%" version stage))))

(deftest test-REQ-IDX-010-discover-SIGKILL-probe-scelta-e-adozione-v1-v2
  (dolist (version '(1 2))
    (dolist (stage '("index-image-candidate" "index-image-discovered" "index-image-ready"))
      (with-root (root)
        (let ((storage (merge-pathnames "storage/" root)))
          (ensure-directories-exist (merge-pathnames ".parent" storage))
          (with-engine (engine (open-build-engine storage :create t :version version))
            (initial-workload engine)
            (e:costruisci-indice-paginato-motore engine (build-option 1))
            (e:costruisci-indice-paginato-motore engine (build-option 2)))
          (let ((before (discovery-images storage)))
            (child root version "discover-run" stage :signaled sb-posix:sigkill)
            (child root version "discover-verify" stage :exited 0)
            (check-images storage before)))))))

(deftest test-REQ-IDX-010-discover-fonte-prima-del-nome-e-identita-canonica
  (with-root (root)
    (let ((old (build-option 100)) (current (build-option 1)))
      (with-engine (engine (open-build-engine root :create t))
        (initial-workload engine) (e:costruisci-indice-paginato-motore engine old)
        (e:scrivi-documento engine (key 1) (value 9))
        (e:costruisci-indice-paginato-motore engine current))
      (loop for offset in '(16 32 88 96 104 108 112) for id from 200 do
        (let* ((data (image (build-path root current))) (footer (- (length data) 4096)))
          (setf (aref data (+ footer offset)) (logxor 1 (aref data (+ footer offset))))
          (arcdocdb.binary:scrivi-u32 data (- (length data) 4)
            (arcdocdb.binary:crc32c data footer (- (length data) 4)))
          (discovery-overwrite (build-path root (build-option id)) data)))
      (let ((before (discovery-images root)))
        (with-engine (engine (open-discovery-engine root))
          (discovery-selected engine current) (check-get engine 1 (value 9)) (check-frontier engine 6))
        (check-images root before)))))

(deftest test-REQ-IDX-010-discover-non-aggira-il-recovery-canonico
  (with-root (root)
    (with-engine (engine (open-build-engine root :create t))
      (initial-workload engine) (e:costruisci-indice-paginato-motore engine (build-option 1)))
    (let* ((entry (first (images root t))) (path (merge-pathnames (car entry) root))
           (data (cdr entry)) (seen nil))
      (setf (aref data 0) (logxor 1 (aref data 0))) (discovery-overwrite path data)
      (signals arcdocdb.conditions:corruption-detected
               (open-discovery-engine root :observer
                (lambda (engine phase) (declare (ignore engine))
                  (when (eq phase :before-index-discovery) (setf seen t)) nil)))
      (is (not seen)))))

(deftest test-REQ-IDX-010-discover-geometria-oltre-limite-senza-lettura-del-payload
  (with-root (root)
    (let ((current (build-option 1)) (huge (build-option 999)) (eof (* 65539 4096)))
      (with-engine (engine (open-build-engine root :create t))
        (initial-workload engine) (e:costruisci-indice-paginato-motore engine current))
      ;; File sparso: dimensione logica oltre formato, un solo byte scritto, nessun vettore gigante.
      (with-open-file (out (build-path root huge) :direction :output :element-type '(unsigned-byte 8)
                           :if-exists :error)
        (file-position out (1- eof)) (write-byte 0 out))
      (let ((before (image (build-path root current))))
        (with-engine (engine (open-discovery-engine root :config
                               (e:crea-opzione-scoperta-indice :max-bytes 4295098368)))
          (discovery-selected engine current) (check-initial engine))
        (is (equalp before (image (build-path root current))))
        (with-open-file (input (build-path root huge) :element-type '(unsigned-byte 8))
          (is (= eof (file-length input))))))))

(deftest test-REQ-IDX-010-discover-fence-adozione-e-admission-anche-esplicita
  (dolist (mode '(:discovery :explicit :resident))
    (dolist (phase (if (eq mode :resident) '(:before-admission)
                      '(:before-index-image :index-image-ready :before-admission)))
      (dolist (change '(:state :revision :source :health))
        (with-root (root)
          (with-engine (engine (open-build-engine root :create t))
            (initial-workload engine) (e:costruisci-indice-paginato-motore engine (build-option 1)))
          (let ((fds (activation-fds)) (observed nil))
            (flet ((observer (engine step)
                     (when (eq phase step)
                       (setf observed t)
                       (ecase change
                         (:state (setf (e::motore-state engine) :starting))
                         (:revision (incf (arcdocdb.index.primary::indice-primario-revision (e::motore-index engine))))
                         (:source (incf (e::motore-source-csn engine)))
                         (:health (arcdocdb.series:fault-controllore-serie (e::motore-controller engine) (e::motore-lease engine))))) nil))
              (signals arcdocdb.conditions:invariant-violation
                       (if (eq mode :discovery)
                           (open-discovery-engine root :observer #'observer)
                           (open-build-engine root :option (when (eq mode :explicit) (build-option 1)) :observer #'observer))))
            (is observed) (is (equal fds (activation-fds)))))))))
