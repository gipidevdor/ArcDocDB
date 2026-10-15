;;;; Audit C4 indipendente dei dati del benchmark primo item CBOR.
;;;; Uso: --self-test oppure --bench <report-wrapper.lisp> <item-blob>.
;;;; Nessun prodotto, driver, builder o oracolo di test viene caricato.
;;;; OWNER: dati freddi locali; il contatore appartiene alla singola esecuzione.
;;;; REQ: REQ-CBR-008 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002 REQ-VAL-001
(require :asdf)
(let ((*load-verbose* nil) (*load-print* nil) (*standard-output* *error-output*))
  (load "tools/evidence-storage.lisp"))
(defpackage #:arcdocdb.cir.audit (:use #:cl))
(in-package #:arcdocdb.cir.audit)
(declaim (optimize (safety 3) (debug 2)))

(defconstant +driver-blob+ "118c779ca567411675e5dfbb0866b5b17e77c7f0")
(defconstant +driver-md5+ "075fd8060d77c8665164a2d20c12b417")
(defconstant +method-blob+ "a67a79bf4fefe11c4778cd881eb5279a006966ca")
;;; Il pin del solo nuovo kernel viene fornito dalla CLI, non dedotto dal report.
(defparameter *item-blob* nil)
(defparameter *item-source* "src/codec/cbor-item-read.lisp")
(defparameter *checks* 0)
(defparameter *catalog*
  '((:scalar (0) 1 0 201232)
    (:text (98 195 169) 1 0 335499)
    (:array (130 0 245) 3 1 335486)
    (:map (162 97 97 0 97 98 129 244) 6 2 671472)
    (:tag-chain (192 193 129 97 122) 4 1 469665)
    (:mixed-array (132 32 249 60 0 66 0 255 160) 5 2 738173)))
(defparameter *benchmark-limits*
  '(:success-path-only :serial :preallocated-private-buffers
    :first-minimal-item :unvalidated-tail :whole-window-byte-budget :source-readonly :preallocated-private-workspace
    :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
    :output-check-cost-included :no-pool-or-device-throughput :no-scaling-or-latency-threshold))

(define-condition audit-rejection (error)
  ((reason :initarg :reason :reader rejection-reason)
   (detail :initarg :detail :initform nil :reader rejection-detail))
  (:report (lambda (condition stream)
             (let ((*print-circle* t) (*print-level* 5) (*print-length* 10))
               (format stream "Audit primo item CBOR rifiutato: ~S~@[ (~S)~]."
                       (rejection-reason condition) (rejection-detail condition))))))

(defun require-check (predicate reason &optional detail)
  "Conta un controllo; il fallimento conserva un motivo specifico verificabile."
  (incf *checks*)
  (unless predicate (error 'audit-rejection :reason reason :detail detail))
  t)

(defun proper-length (value)
  "Lunghezza soltanto per liste proprie e acicliche; zero e distinto da NIL."
  (handler-case (list-length value) (type-error () nil)))

(defun checked-plist (data fields)
  "Rifiuta liste improprie/cicliche, chiavi duplicate e campi richiesti assenti."
  (let ((size (proper-length data)) (seen nil) (absent (gensym "ABSENT")))
    (require-check (and (consp data) size (evenp size)) :plist-shape)
    (loop for key in data by #'cddr
          do (require-check (keywordp key) :plist-key key)
             (require-check (not (member key seen)) :duplicate-key key)
             (push key seen))
    (dolist (field fields)
      (require-check (not (eq absent (getf data field absent))) :missing-field field))
    data))

(defun checked-data-tree (data)
  "Visita iterativa dei cons: liste proprie acicliche, condivisioni lecite, budget C4.
Non interpreta simboli o metadata; rifiuta cicli di cons anche in campi non utilizzati.
Non attraversa vettori generali: non verifica grafi Lisp arbitrari dentro tali vettori."
  (let ((states (make-hash-table :test 'eq)) (pending (list (cons :enter data))) (nodes 0))
    (loop while pending
          for task = (pop pending) for node = (cdr task)
          when (consp node)
            do (if (eq :leave (car task))
                   (setf (gethash node states) :done)
                   (case (gethash node states)
                     (:active (require-check nil :data-cycle))
                     (:done nil)
                     (otherwise
                      (require-check (< (incf nodes) 1000000) :data-budget)
                      (require-check (or (null (cdr node)) (consp (cdr node))) :data-improper-list)
                      (setf (gethash node states) :active)
                      (push (cons :leave node) pending)
                      (push (cons :enter (cdr node)) pending)
                      (push (cons :enter (car node)) pending)))))
    data))

(defun read-one (text)
  "Una forma dati e EOF, con readtable standard e READ-EVAL NIL."
  (require-check (stringp text) :stdout-type)
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*read-base* 10)
        (*read-suppress* nil) (*package* (find-package :cl-user)) (eof (gensym "EOF")))
    (handler-case
        (with-input-from-string (stream text)
          (let ((data (read stream nil eof)))
            (require-check (not (eq data eof)) :reader-empty)
            (require-check (eq eof (read stream nil eof)) :reader-trailing)
            (checked-plist (checked-data-tree data) nil)))
      (audit-rejection (condition) (error condition))
      (error (condition)
        (error 'audit-rejection :reason :reader-error :detail (princ-to-string condition))))))

(defun hex-string-p (value size)
  "Verifica la forma esadecimale, senza trattare un hash come autenticazione."
  (and (stringp value) (= size (length value))
       (every (lambda (character) (digit-char-p character 16)) value)))

(defun nonempty-string-p (value)
  "Predicato sui metadata testuali, senza conversioni o valutazione."
  (and (stringp value) (plusp (length value))))

(defun relative-path-p (value)
  "Un nome relativo non ambiguo, senza NUL, wildcard o traversamento."
  (and (nonempty-string-p value) (not (char= #\/ (char value 0)))
       (not (find-if (lambda (character) (find character '(#\Null #\\ #\* #\? #\[ #\]))) value))
       (not (member ".." (uiop:split-string value :separator '(#\/)) :test #'string=))))

(defun source-table (entries path-key hash-key size &optional absent-allowed)
  "Indicizza esclusivamente i nomi dichiarati; non attesta un inventario completo."
  (require-check (let ((count (proper-length entries))) (and count (plusp count)))
                 :source-table-shape)
  (let ((table (make-hash-table :test 'equal)))
    (dolist (entry entries table)
      (checked-plist entry (list path-key hash-key))
      (require-check (= 4 (length entry)) :source-entry-fields)
      (let ((path (getf entry path-key)) (hash (getf entry hash-key)))
        (require-check (relative-path-p path) :source-path path)
        (require-check (not (nth-value 1 (gethash path table))) :source-path-duplicate path)
        (require-check (or (and absent-allowed (eq hash :absent)) (hex-string-p hash size))
                       :source-hash path)
        (setf (gethash path table) hash)))))

(defun close-number-p (actual expected)
  "Tolleranza numerica relativa per ricostruzioni del clock, senza soglia di velocita."
  (and (realp actual) (<= 0 actual)
       (<= (abs (- actual expected)) (* 1d-9 (max 1d0 (abs expected))))))

(defun reference-cell (spec)
  "Ricostruzione aritmetica da item/nodi/picco freddi, senza scanner o writer."
  (destructuring-bind (name item nodes peak cold-token) spec
    (let* ((next (+ 2 (length item))) (end (+ next 4))
           (full (append '(165 165) item '(255 28 24 0 165 165)))
           (token (+ (* nodes 17) (* peak 257) (* next 65537)
                     (loop for byte in full for weight from 1 sum (* byte weight)))))
      (require-check (= cold-token token) :reference-token name)
      (list :name name :item item :tail '(255 28 24 0) :nodes nodes :peak peak
            :next next :end end :full full :token token
            :workspace (list :cursor next :top 0 :nodes nodes :depth 0 :peak-depth peak :pending-tag nil)))))

(defun independent-sink (iterations token)
  "Residuo della somma dei token piu gli indici 0..ITERATIONS-1."
  (mod (+ (* iterations token) (floor (* iterations (1- iterations)) 2))
       (1+ most-positive-fixnum)))

(defun audit-sample (sample iterations warmup token timer heap-mode)
  "Verifica parametri, heap, sink e relazioni del clock per un campione."
  (checked-plist sample '(:iterations :warmup-iterations :heap-bytes :raw-ticks :seconds
                          :sink :expected-sink :expected-return-token :calls-per-second))
  (require-check (eql iterations (getf sample :iterations)) :sample-iterations)
  (require-check (eql warmup (getf sample :warmup-iterations)) :sample-warmup)
  (require-check (eql token (getf sample :expected-return-token)) :sample-token)
  (let ((heap (getf sample :heap-bytes)) (ticks (getf sample :raw-ticks))
        (sink (independent-sink iterations token)))
    (require-check (and (integerp heap) (not (minusp heap))) :sample-heap-shape)
    (require-check (case heap-mode
                     (:zero (zerop heap)) (:positive (>= heap 16777216))
                     (otherwise nil))
                   (if (eq heap-mode :zero) :sample-heap :positive-counter))
    (require-check (and (eql sink (getf sample :sink)) (eql sink (getf sample :expected-sink)))
                   :sample-sink)
    (require-check (and (integerp ticks) (not (minusp ticks))) :sample-ticks)
    (let ((seconds (/ ticks (float timer 1d0))))
      (require-check (close-number-p (getf sample :seconds) seconds) :sample-time)
      (require-check (if (zerop ticks) (null (getf sample :calls-per-second))
                        (close-number-p (getf sample :calls-per-second) (/ iterations seconds)))
                     :sample-rate)
      seconds)))

(defun audit-self-controls (controls timer)
  "Baseline zero, positivo 16MiB e marker dei checker indipendenti con valori esatti."
  (checked-plist controls '(:status :baseline :positive-control :output-checker :arity-checker
                           :sensor-checker :workspace-checker))
  (require-check (eq :ok (getf controls :status)) :self-control-status)
  (let ((baseline (getf controls :baseline)) (positive (getf controls :positive-control)))
    (checked-plist baseline '(:heap-bytes))
    (require-check (eql 0 (getf baseline :heap-bytes)) :baseline-heap)
    (dolist (spec '((:output-checker :checker-self-test
                    (:status :ok :expected-token 201232 :altered-three-results-rejected 3
                     :altered-buffer-shape-rejected 1 :altered-prefix-item-tail-physical-tail-rejected 4
                     :reason-specific-rejection t))
                   (:arity-checker :arity-self-test
                    (:status :ok :exact-three-accepted t :wrong-arity-rejected 5
                     :wrong-results-rejected 3 :fixed-arity-hot-consumer-rejected 2))
                   (:sensor-checker :sensor-self-test
                    (:status :ok :wrong-sink-rejected t :nonzero-heap-rejected t
                     :missing-or-invalid-heap-rejected 4 :reason-specific-rejection t))
                   (:workspace-checker :workspace-self-test
                    (:status :ok :altered-scalar-fields-rejected 6 :reason-specific-rejection t))))
      (let ((observed (getf controls (first spec))) (expected (third spec)))
        (checked-plist observed (loop for key in expected by #'cddr collect key))
        (loop for (key value) on expected by #'cddr
              do (require-check (equal value (getf observed key)) (second spec) key))))
    (+ (audit-sample baseline 1024 64 0 timer :zero)
       (audit-sample positive 16 0 1048576 timer :positive))))

(defun audit-cell (cell spec timer)
  "Sei fixture letterali, tre valori, buffer intero e scalari terminali, cinque repliche."
  (checked-plist cell '(:name :item-literal :tail-literal :expected-nodes :expected-peak
                       :expected-next :expected-token :expected-full-buffer :observed-full-buffer
                       :start :end :cold-values :cold-value-count :cold-workspace
                       :preallocated-readonly-source :private-preallocated-workspace
                       :complete-source-checked-per-call :exact-three-values-checked-per-call
                       :complete-scalar-workspace-checked-per-call :samples))
  (let* ((ref (reference-cell spec)) (nodes (getf ref :nodes)) (peak (getf ref :peak))
         (next (getf ref :next)) (token (getf ref :token)) (samples (getf cell :samples)))
    (dolist (mapping '((:name :name) (:item-literal :item) (:tail-literal :tail)
                       (:expected-nodes :nodes) (:expected-peak :peak)))
      (require-check (equal (getf cell (first mapping)) (getf ref (second mapping)))
                     :fixture-definition (list (getf ref :name) (first mapping))))
    (require-check (equal (getf ref :full) (getf cell :expected-full-buffer)) :fixture-buffer)
    (require-check (equal (getf ref :full) (getf cell :observed-full-buffer)) :fixture-observed-buffer)
    (require-check (eql next (getf cell :expected-next)) :fixture-next)
    (require-check (eql token (getf cell :expected-token)) :fixture-token)
    (require-check (and (eql 3 (proper-length (getf cell :cold-values)))
                        (eql 3 (getf cell :cold-value-count))
                        (equal (list nodes peak next) (getf cell :cold-values))) :fixture-arity)
    (checked-plist (getf cell :cold-workspace) '(:cursor :top :nodes :depth :peak-depth :pending-tag))
    (loop for (key value) on (getf ref :workspace) by #'cddr
          do (require-check (equal value (getf (getf cell :cold-workspace) key)) :fixture-workspace key))
    (require-check (and (eql 2 (getf cell :start)) (eql (getf ref :end) (getf cell :end))) :fixture-span)
    (dolist (key '(:preallocated-readonly-source :private-preallocated-workspace
                   :complete-source-checked-per-call :exact-three-values-checked-per-call
                   :complete-scalar-workspace-checked-per-call))
      (require-check (eq t (getf cell key)) :fixture-observation key))
    (require-check (eql 5 (proper-length samples)) :fixture-sample-count)
    (loop for sample in samples sum (audit-sample sample 1024 64 token timer :zero))))

(defun audit-benchmark (report wrapper)
  "Audit dei dati freddi; non prova autenticita, esecuzione o completezza dell'inventario."
  (checked-data-tree report)
  (checked-plist report '(:schema-version :kind :status :campaigns :self-test :recorded-at
                         :sbcl :machine :os :os-version :workers :safety :timer-units-per-second
                         :limits :fixture-catalogue-blob :source-fingerprints-before :source-fingerprints-after
                         :source-consistency))
  (require-check (and (eql 1 (getf report :schema-version))
                      (eq :cbor-item-read-benchmark (getf report :kind))) :benchmark-schema)
  (require-check (eq :ok (getf report :status)) :benchmark-status)
  (require-check (equal "c6a22e6751cab0eff88dd1173ed81543d595a659"
                        (getf report :fixture-catalogue-blob)) :fixture-catalogue-freeze)
  (require-check (eql 3 (getf report :safety)) :metadata-safety)
  (require-check (eql 1 (getf report :workers)) :metadata-workers)
  (require-check (equal *benchmark-limits* (getf report :limits)) :metadata-limits)
  (dolist (key '(:sbcl :machine :os :os-version))
    (require-check (nonempty-string-p (getf report key)) :metadata-text key))
  (let ((environment (getf wrapper :environment)))
    (dolist (mapping '((:sbcl :version) (:machine :machine) (:os :os) (:os-version :os-version)))
      (require-check (equal (getf report (first mapping)) (getf environment (second mapping)))
                     :metadata-environment (first mapping))))
  (let* ((before (getf report :source-fingerprints-before))
         (after (getf report :source-fingerprints-after))
         (table (source-table before :file :md5 32))
         (outer-table (source-table (getf wrapper :source-blobs-before) :path :git-blob 40 t))
         (timer (getf report :timer-units-per-second)) (cells (getf report :campaigns)))
    (source-table after :file :md5 32)
    (require-check (and (eq :stable (getf report :source-consistency)) (equal before after))
                   :fingerprint-stability)
    (maphash (lambda (path md5)
               (declare (ignore md5))
               (require-check (or (member path
                                         '("spikes/out/cbor-item-read-20261015/drivers/bench.lisp"
                                           "spikes/out/cbor-item-read-20261015/drivers/fixtures-and-mutations.lisp")
                                         :test #'equal)
                                  (hex-string-p (gethash path outer-table) 40))
                              :fingerprint-outer-inventory path)) table)
    (require-check (equal +driver-md5+ (gethash "spikes/out/cbor-item-read-20261015/drivers/bench.lisp" table))
                   :fingerprint-driver)
    (require-check (equal "8dfd03d8510d882e533d68b79bab1073"
                          (gethash "spikes/out/cbor-item-read-20261015/drivers/fixtures-and-mutations.lisp" table))
                   :fingerprint-fixture-catalogue)
    ;; La CLI vincola i Git blob esterni. I MD5 dichiarati non sono autenticati
    ;; o associati ai blob senza byte di sorgente inclusi nel rapporto.
    (require-check (hex-string-p (gethash *item-source* table) 32) :fingerprint-item)
    (require-check (nth-value 1 (gethash "arcdocdb.asd" table)) :fingerprint-asdf)
    (require-check (and (integerp timer) (plusp timer)) :metadata-timer)
    (require-check (and (eql 6 (proper-length cells))
                        (every (lambda (cell) (checked-plist cell '(:name))) cells)
                        (equal (mapcar #'first *catalog*) (mapcar (lambda (cell) (getf cell :name)) cells)))
                   :fixture-catalog)
    (let* ((control-seconds (audit-self-controls (getf report :self-test) timer))
           (sample-seconds (loop for cell in cells for spec in *catalog*
                                 sum (audit-cell cell spec timer)))
           (recorded (getf report :recorded-at))
           (started (getf wrapper :started-at-universal-time))
           (finished (getf wrapper :finished-at-universal-time)))
      (require-check (and (integerp recorded) (<= started recorded finished)) :metadata-recorded-time)
      (require-check (<= (+ control-seconds sample-seconds)
                         (+ (getf wrapper :wall-seconds) (/ 32d0 timer))) :sample-wall-time)
      (list :cells 6 :samples 30 :heap-bytes 0 :cold-arity 3 :sink-mask most-positive-fixnum
            :sample-seconds sample-seconds :self-control-seconds control-seconds
            :baseline-heap-bytes 0
            :positive-control-heap-bytes (getf (getf (getf report :self-test) :positive-control) :heap-bytes)
            :timer-units-per-second timer :recorded-at recorded
            :source-fingerprint-count (length before)))))

(defun audit-wrapper (wrapper)
  "Verifica processo, snapshot, argv, metadata e una sola forma STDOUT."
  (checked-data-tree wrapper)
  (checked-plist wrapper '(:schema-version :kind :status :exit-code :source-consistency
                          :source-blobs-before :source-blobs-after :stdout :stderr :command
                          :environment :started-at-universal-time :finished-at-universal-time
                          :wall-seconds))
  (require-check (and (eql 1 (getf wrapper :schema-version))
                      (eq :command-verification (getf wrapper :kind))) :wrapper-schema)
  (require-check (eq :ok (getf wrapper :status)) :wrapper-status)
  (require-check (eql 0 (getf wrapper :exit-code)) :wrapper-exit)
  (require-check (stringp (getf wrapper :stderr)) :wrapper-stderr)
  (let* ((before (getf wrapper :source-blobs-before)) (after (getf wrapper :source-blobs-after))
         (table (source-table before :path :git-blob 40 t)) (command (getf wrapper :command))
         (environment (getf wrapper :environment))
         (started (getf wrapper :started-at-universal-time))
         (finished (getf wrapper :finished-at-universal-time)) (wall (getf wrapper :wall-seconds)))
    (source-table after :path :git-blob 40 t)
    (require-check (and (eq :stable (getf wrapper :source-consistency)) (equal before after))
                   :wrapper-source-stability)
    (require-check (and (hex-string-p *item-blob* 40)
                        (equal *item-blob* (gethash *item-source* table))) :wrapper-item-blob)
    (require-check (equal +method-blob+ (gethash "docs/implementazione/cbor-item-metodo.md" table))
                   :wrapper-method-blob)
    (require-check (let ((size (proper-length command)))
                     (and size (>= size 3) (every #'stringp command)
                          (equal '("--script" "spikes/out/cbor-item-read-20261015/drivers/bench.lisp" "--bench")
                                 (last command 3)))) :wrapper-command)
    (checked-plist environment '(:lisp :version :machine :os :os-version :commit :cwd
                                 :date-universal-time :external-load-status))
    (require-check (equal "SBCL" (getf environment :lisp)) :wrapper-lisp)
    (require-check (eq :uncontrolled (getf environment :external-load-status)) :wrapper-external-load)
    (dolist (key '(:version :machine :os :os-version :cwd))
      (require-check (nonempty-string-p (getf environment key)) :wrapper-environment key))
    (require-check (hex-string-p (getf environment :commit) 40) :wrapper-commit)
    (require-check (and (integerp started) (plusp started) (integerp finished) (<= started finished)
                        (integerp (getf environment :date-universal-time))
                        (<= (1- started) (getf environment :date-universal-time) finished)
                        (realp wall) (not (minusp wall))
                        ;; Il contatore wall parte prima di AMBIENTE/STARTED.
                        ;; Overhead metadata lecito, con un secondo di quantizzazione.
                        (<= (- finished started 1) wall)) :wrapper-time)
    (audit-benchmark (read-one (getf wrapper :stdout)) wrapper)))

(defun serialized (data)
  "Imprime soltanto dati sintetici con una rappresentazione leggibile."
  (let ((*print-readably* t) (*print-circle* nil) (*print-pretty* nil))
    (write-to-string data)))

(defun synthetic-sample (iterations warmup token heap &optional (ticks 1024))
  "Costruisce metadata di campione sintetici, senza misure o codice di prodotto."
  (let ((seconds (/ ticks 1000000d0)) (sink (independent-sink iterations token)))
    (list :iterations iterations :warmup-iterations warmup :heap-bytes heap
          :raw-ticks ticks :seconds seconds :sink sink :expected-sink sink
          :expected-return-token token :calls-per-second (when (plusp ticks) (/ iterations seconds)))))

(defun synthetic-report ()
  "Dati sintetici indipendenti; nessuna esecuzione del prodotto o benchmark."
  (let ((fingerprints (list (list :file "arcdocdb.asd" :md5 (make-string 32 :initial-element #\0))
                            (list :file "spikes/out/cbor-item-read-20261015/drivers/bench.lisp" :md5 +driver-md5+)
                            (list :file *item-source* :md5 (make-string 32 :initial-element #\2))
                            (list :file "spikes/out/cbor-item-read-20261015/drivers/fixtures-and-mutations.lisp"
                                  :md5 "8dfd03d8510d882e533d68b79bab1073"))))
    (list :schema-version 1 :kind :cbor-item-read-benchmark :status :ok
          :fixture-catalogue-blob "c6a22e6751cab0eff88dd1173ed81543d595a659"
          :recorded-at 1000 :sbcl "synthetic-version" :machine "synthetic-machine"
          :os "synthetic-os" :os-version "synthetic-os-version" :workers 1 :safety 3
          :timer-units-per-second 1000000 :limits (copy-list *benchmark-limits*)
          :source-fingerprints-before fingerprints :source-fingerprints-after (copy-tree fingerprints)
          :source-consistency :stable
          :self-test (list :status :ok :baseline (synthetic-sample 1024 64 0 0)
                           :positive-control (synthetic-sample 16 0 1048576 16777472)
                           :output-checker (list :status :ok :expected-token 201232 :altered-three-results-rejected 3
                                                 :altered-buffer-shape-rejected 1
                                                 :altered-prefix-item-tail-physical-tail-rejected 4 :reason-specific-rejection t)
                           :arity-checker (list :status :ok :exact-three-accepted t :wrong-arity-rejected 5
                                                :wrong-results-rejected 3 :fixed-arity-hot-consumer-rejected 2)
                           :sensor-checker (list :status :ok :wrong-sink-rejected t :nonzero-heap-rejected t
                                                 :missing-or-invalid-heap-rejected 4 :reason-specific-rejection t)
                           :workspace-checker (list :status :ok :altered-scalar-fields-rejected 6 :reason-specific-rejection t))
          :campaigns
          (loop for spec in *catalog* for ref = (reference-cell spec)
                collect (list :name (getf ref :name) :item-literal (copy-list (getf ref :item))
                              :tail-literal (copy-list (getf ref :tail))
                              :expected-nodes (getf ref :nodes) :expected-peak (getf ref :peak)
                              :expected-next (getf ref :next) :expected-token (getf ref :token)
                              :expected-full-buffer (copy-list (getf ref :full))
                              :observed-full-buffer (copy-list (getf ref :full))
                              :cold-values (list (getf ref :nodes) (getf ref :peak) (getf ref :next))
                              :cold-value-count 3 :cold-workspace (copy-list (getf ref :workspace))
                              :start 2 :end (getf ref :end) :preallocated-readonly-source t
                              :private-preallocated-workspace t :complete-source-checked-per-call t
                              :exact-three-values-checked-per-call t :complete-scalar-workspace-checked-per-call t
                              :samples (loop repeat 5 collect (synthetic-sample 1024 64 (getf ref :token) 0)))))))

(defun synthetic-wrapper (report)
  "Wrapper sintetico; hash dichiarati senza pretesa di autenticazione."
  (let ((blobs (list (list :path "spikes/out/cbor-item-read-20261015/drivers/bench.lisp" :git-blob +driver-blob+)
                     (list :path *item-source* :git-blob *item-blob*)
                     (list :path "docs/implementazione/cbor-item-metodo.md" :git-blob +method-blob+)
                     (list :path "arcdocdb.asd" :git-blob (make-string 40 :initial-element #\0)))))
    (list :schema-version 1 :kind :command-verification :status :ok :exit-code 0
          :source-consistency :stable :source-blobs-before blobs :source-blobs-after (copy-tree blobs)
          :stdout (serialized report) :stderr ""
          :command '("sbcl" "--script" "spikes/out/cbor-item-read-20261015/drivers/bench.lisp" "--bench")
          :environment (list :lisp "SBCL" :version "synthetic-version" :machine "synthetic-machine"
                             :os "synthetic-os" :os-version "synthetic-os-version"
                             :commit (make-string 40 :initial-element #\0) :cwd "/synthetic/"
                             :date-universal-time 1000 :external-load-status :uncontrolled)
          :started-at-universal-time 1000 :finished-at-universal-time 1001 :wall-seconds 1d0)))

(defun expected-rejection (reason function)
  "Accetta soltanto il motivo atteso; errori di programmazione non sono rilevamenti."
  (let ((observed nil))
    (handler-case (funcall function)
      (audit-rejection (condition) (setf observed (rejection-reason condition))))
    (require-check (eq observed reason) :self-test-missed-rejection (list :expected reason :observed observed))))

(defun first-cell (report)
  "Accesso ai dati sintetici, senza dipendenze dai builder del benchmark."
  (first (getf report :campaigns)))

(defun (setf first-cell) (value report)
  "Sostituisce la testa della prima plist di :CAMPAIGNS nelle fixture sintetiche."
  (setf (car (getf report :campaigns)) value))

(defun first-sample (report)
  "Accesso al campione sintetico da alterare individualmente."
  (first (getf (first-cell report) :samples)))

(defun (setf first-sample) (value report)
  "Sostituisce la testa della prima plist di :SAMPLES nelle fixture sintetiche."
  (setf (car (getf (first-cell report) :samples)) value))

(defun reference-self-test ()
  "Costanti fredde literalizzate per tutti i risultati e token; nessuna API richiamata."
  (let ((expected '((:scalar 1 0 3 201232) (:text 1 0 5 335499) (:array 3 1 5 335486)
                    (:map 6 2 10 671472) (:tag-chain 4 1 7 469665) (:mixed-array 5 2 11 738173))))
    (loop for spec in *catalog* for ref = (reference-cell spec) for cold in expected
          do (require-check (equal cold (list (getf ref :name) (getf ref :nodes) (getf ref :peak)
                                             (getf ref :next) (getf ref :token))) :reference-cold))
    (list :status :ok :cold-fixtures 6 :arithmetic-token t :three-results-literal t :tail-not-scanned t)))

(defun self-test ()
  "Quattro positivi e alterazioni singole; motivi esatti e nessun prodotto caricato."
  (let* ((*item-blob* (make-string 40 :initial-element #\2))
         (good (synthetic-report)) (wrapper (synthetic-wrapper good)) (fixtures nil)
         (reference (reference-self-test)))
    (audit-wrapper wrapper)
    (let ((earlier (copy-tree wrapper)))
      (setf (getf (getf earlier :environment) :date-universal-time) 999) (audit-wrapper earlier))
    (let ((overhead (copy-tree wrapper))) (setf (getf overhead :wall-seconds) 5d0) (audit-wrapper overhead))
    (let ((zero-clock (copy-tree good)))
      (setf (getf (first-sample zero-clock) :raw-ticks) 0
            (getf (first-sample zero-clock) :seconds) 0d0
            (getf (first-sample zero-clock) :calls-per-second) nil)
      (audit-wrapper (synthetic-wrapper zero-clock)))
    (labels ((bad-report (name reason mutator)
               (let ((data (copy-tree good)))
                 (funcall mutator data)
                 (expected-rejection reason (lambda () (audit-benchmark data wrapper)))
                 (push (list :name name :reason reason) fixtures)))
             (bad-wrapper (name reason mutator)
               (let ((data (copy-tree wrapper)))
                 (funcall mutator data)
                 (expected-rejection reason (lambda () (audit-wrapper data)))
                 (push (list :name name :reason reason) fixtures))))
      (dolist (key '(:expected-nodes :expected-peak))
        (bad-report key :fixture-definition (lambda (r) (incf (getf (first-cell r) key)))))
      (dolist (key '(:item-literal :tail-literal))
        (bad-report key :fixture-definition (lambda (r) (incf (first (getf (first-cell r) key))))))
      (dolist (key '(:expected-full-buffer :observed-full-buffer))
        (dolist (index '(0 2 3 8))
          (bad-report (list key index) (if (eq key :expected-full-buffer) :fixture-buffer :fixture-observed-buffer)
                      (lambda (r) (incf (nth index (getf (first-cell r) key)))))))
      (bad-report :next :fixture-next (lambda (r) (incf (getf (first-cell r) :expected-next))))
      (bad-report :token :fixture-token (lambda (r) (incf (getf (first-cell r) :expected-token))))
      (dolist (values '(nil (1) (1 0) (1 0 3 nil) (1 0 3 4) (2 0 3) (1 1 3) (1 0 4)))
        (bad-report (list :arity-values values) :fixture-arity
                    (lambda (r) (setf (getf (first-cell r) :cold-values) values))))
      (bad-report :arity-count :fixture-arity (lambda (r) (incf (getf (first-cell r) :cold-value-count))))
      (dolist (key '(:cursor :top :nodes :depth :peak-depth :pending-tag))
        (bad-report key :fixture-workspace
                    (lambda (r) (setf (getf (getf (first-cell r) :cold-workspace) key)
                                     (if (eq key :pending-tag) t -1)))))
      (dolist (key '(:start :end))
        (bad-report key :fixture-span (lambda (r) (incf (getf (first-cell r) key)))))
      (bad-report :samples :fixture-sample-count (lambda (r) (pop (getf (first-cell r) :samples))))
      (dolist (key '(:preallocated-readonly-source :private-preallocated-workspace
                     :complete-source-checked-per-call :exact-three-values-checked-per-call
                     :complete-scalar-workspace-checked-per-call))
        (bad-report key :fixture-observation (lambda (r) (setf (getf (first-cell r) key) nil))))
      (bad-report :missing-heap :missing-field (lambda (r) (remf (first-sample r) :heap-bytes)))
      (dolist (invalid '(nil -1 0d0 :absent))
        (bad-report (list :invalid-heap invalid) :sample-heap-shape
                    (lambda (r) (setf (getf (first-sample r) :heap-bytes) invalid))))
      (dolist (spec '((:iterations :sample-iterations) (:warmup-iterations :sample-warmup)
                      (:expected-return-token :sample-token) (:heap-bytes :sample-heap)
                      (:sink :sample-sink) (:expected-sink :sample-sink)
                      (:raw-ticks :sample-time) (:seconds :sample-time) (:calls-per-second :sample-rate)))
        (bad-report (first spec) (second spec) (lambda (r) (incf (getf (first-sample r) (first spec))))))
      (bad-report :zero-rate :sample-rate
                  (lambda (r) (setf (getf (first-sample r) :raw-ticks) 0
                                    (getf (first-sample r) :seconds) 0d0
                                    (getf (first-sample r) :calls-per-second) 0d0)))
      (bad-report :positive-sensor :positive-counter
                  (lambda (r) (setf (getf (getf (getf r :self-test) :positive-control) :heap-bytes) 0)))
      (bad-report :baseline :baseline-heap
                  (lambda (r) (setf (getf (getf (getf r :self-test) :baseline) :heap-bytes) 1)))
      (dolist (spec '((:output-checker :checker-self-test :expected-token)
                     (:arity-checker :arity-self-test :exact-three-accepted)
                     (:sensor-checker :sensor-self-test :wrong-sink-rejected)
                     (:workspace-checker :workspace-self-test :altered-scalar-fields-rejected)))
        (bad-report (first spec) (second spec)
                    (lambda (r) (setf (getf (getf (getf r :self-test) (first spec)) (third spec)) nil))))
      (bad-report :fingerprint-stability :fingerprint-stability (lambda (r) (setf (getf r :source-consistency) :changed)))
      (bad-report :driver-md5 :fingerprint-driver
                  (lambda (r) (dolist (key '(:source-fingerprints-before :source-fingerprints-after))
                                (setf (getf (second (getf r key)) :md5) (make-string 32 :initial-element #\1)))))
      (bad-report :fixture-freeze :fixture-catalogue-freeze
                  (lambda (r) (setf (getf r :fixture-catalogue-blob) (make-string 40 :initial-element #\1))))
      (bad-report :fixture-inner-md5 :fingerprint-fixture-catalogue
                  (lambda (r) (dolist (key '(:source-fingerprints-before :source-fingerprints-after))
                                (setf (getf (fourth (getf r key)) :md5) (make-string 32 :initial-element #\1)))))
      (bad-report :benchmark-status :benchmark-status (lambda (r) (setf (getf r :status) :failed)))
      (bad-report :timer :metadata-timer (lambda (r) (setf (getf r :timer-units-per-second) 0)))
      (bad-report :workers :metadata-workers (lambda (r) (setf (getf r :workers) 2)))
      (bad-report :metadata :metadata-environment (lambda (r) (setf (getf r :sbcl) "other")))
      (bad-report :whole-window-declaration :metadata-limits (lambda (r) (remf r :limits) (setf (getf r :limits) nil)))
      (bad-wrapper :exit :wrapper-exit (lambda (r) (setf (getf r :exit-code) 1)))
      (bad-wrapper :source-stability :wrapper-source-stability (lambda (r) (setf (getf r :source-consistency) :changed)))
      (bad-wrapper :item-hash :wrapper-item-blob
                   (lambda (r) (dolist (key '(:source-blobs-before :source-blobs-after))
                                 (setf (getf (second (getf r key)) :git-blob) (make-string 40 :initial-element #\1)))))
      (bad-wrapper :method-hash :wrapper-method-blob
                   (lambda (r) (dolist (key '(:source-blobs-before :source-blobs-after))
                                 (setf (getf (third (getf r key)) :git-blob) (make-string 40 :initial-element #\1)))))
      (bad-wrapper :command :wrapper-command (lambda (r) (setf (getf r :command) '("sbcl" "--self-test"))))
      (bad-wrapper :time :wrapper-time (lambda (r) (setf (getf r :wall-seconds) -1)))
      (bad-wrapper :duplicate-key :duplicate-key (lambda (r) (nconc r (list :status :ok))))
      (dolist (spec '((:reader-error "#.(list :a 1)") (:reader-trailing "(:a 1) (:b 2)")
                      (:reader-trailing "(:a 1) :eof") (:reader-empty "")
                      (:data-improper-list "(:a . 1)") (:data-cycle "#1=(:a 1 . #1#)")
                      (:data-cycle "(:unused #1=(:a #1#))") (:duplicate-key "(:a 1 :a 2)")))
        (expected-rejection (first spec) (lambda () (read-one (second spec))))
        (push (list :name :reader-fixture :reason (first spec)) fixtures)))
    (list :synthetic-only t :positive-fixture-count 4 :negative-fixture-count (length fixtures)
          :negative-fixtures (nreverse fixtures) :reference-self-test reference
          :specific-reasons-required t :driver-or-product-loaded nil)))

(defun file-observation (path)
  "Osservazione dei byte originali, descriptor incluso; non e prova di atomicita."
  (list :path (namestring (truename path)) :bytes (arcdocdb.evidence:file-bytes path)
        :sha256 (arcdocdb.evidence:file-sha256 path)))

(defun audit-file (path)
  "Legge evidenza plain/gzip verificata, osservando i byte prima e dopo l'audit."
  (let* ((before (file-observation path))
         (wrapper (arcdocdb.evidence:read-evidence path :max-expanded-bytes 67108864))
         (result (audit-wrapper wrapper)) (after (file-observation path)))
    (require-check (equal before after) :evidence-byte-stability)
    (list :wrapper-before before :wrapper-after after :result result
          :wrapper-started-at (getf wrapper :started-at-universal-time)
          :wrapper-finished-at (getf wrapper :finished-at-universal-time))))

(defun main ()
  "Un rapporto sul rifiuto; nessun prodotto, benchmark o campagna caricato."
  (let ((report (list :schema-version 1 :kind :cbor-item-read-bench-audit :status :running
                      :recorded-at (get-universal-time) :client-date "2026-10-15"
                      :sbcl (lisp-implementation-version) :driver-blob +driver-blob+
                      :method-blob +method-blob+ :item-source *item-source* :item-blob nil
                      :limits '(:data-consistency-only :no-product-or-driver-loaded
                                :no-authenticity-or-execution-proof :declared-source-inventory-only
                                :expected-product-git-blob-supplied-by-caller :ignored-driver-bound-by-frozen-inner-md5
                                :inner-product-md5-not-bound-to-git-blob :raw-runtime-dates-preserved
                                :no-speed-or-scaling-threshold :local-before-after-byte-observations))))
    (handler-case
        (let ((args (rest sb-ext:*posix-argv*)))
          (setf (getf report :result)
                (cond ((equal args '("--self-test")) (self-test))
                      ((and (= 3 (length args)) (string= "--bench" (first args)))
                       (let ((*item-blob* (string-downcase (third args))))
                         (require-check (hex-string-p *item-blob* 40) :expected-product-hash)
                         (setf (getf report :item-blob) *item-blob*)
                         (audit-file (second args))))
                      (t (error 'audit-rejection :reason :usage
                                :detail "Usare --self-test oppure --bench <wrapper> <item-blob>."))))
          (setf (getf report :status) :ok))
      (error (condition)
        (setf (getf report :status) :failed
              (getf report :reason) (if (typep condition 'audit-rejection)
                                        (rejection-reason condition) :unexpected-error)
              (getf report :diagnostic) (princ-to-string condition))))
    (setf (getf report :checks) *checks*)
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status)) (sb-ext:exit :code 1))))

(main)
