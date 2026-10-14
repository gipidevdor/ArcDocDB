;;;; Audit C4 indipendente dei dati del benchmark tag CBOR.
;;;; Uso: --self-test oppure --bench <report-wrapper.lisp> <input-blob> <write-blob>.
;;;; Nessun prodotto, driver, builder o oracolo di test viene caricato.
;;;; OWNER: dati freddi locali; il contatore appartiene alla singola esecuzione.
;;;; REQ: REQ-CBR-007 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002 REQ-VAL-001
(require :asdf)
(let ((*load-verbose* nil) (*load-print* nil) (*standard-output* *error-output*))
  (load "tools/evidence-storage.lisp"))
(defpackage #:arcdocdb.ctw.audit (:use #:cl))
(in-package #:arcdocdb.ctw.audit)
(declaim (optimize (safety 3) (debug 2)))

(defconstant +driver-blob+ "4f4e2ac97f2f9d903dfebfdc6b15553b40e59a84")
(defconstant +driver-md5+ "6a8a3180a812088c238f3493fa957cc0")
(defconstant +method-blob+ "3175390e496173398781bf8b39170cb33892125f")
;;; Impronte attese esplicite del prodotto congelato, fornite dalla CLI.
;;; Non vengono dedotte dalle dichiarazioni del report da verificare.
(defparameter *input-blob* nil)
(defparameter *write-blob* nil)
(defparameter *checks* 0)
(defparameter *catalog*
  '((:scalar-small 0 1 (0))
    (:text-24 0 24 (98 195 169))
    (:self-described-map 0 55799 (160))
    (:array-65536 0 65536 (130 0 1))
    (:bytes-high-one 1 0 (66 0 255))
    (:tag-chain-container 4294967295 4294967295 (192 193 130 97 97 245))))
(defparameter *benchmark-limits*
  '(:success-path-only :serial :preallocated-private-buffers
    :tag-prefix-and-validated-payload :source-readonly :preallocated-private-workspace
    :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
    :output-check-cost-included :no-pool-or-device-throughput
    :no-scaling-or-latency-threshold))

(define-condition audit-rejection (error)
  ((reason :initarg :reason :reader rejection-reason)
   (detail :initarg :detail :initform nil :reader rejection-detail))
  (:report (lambda (condition stream)
             (let ((*print-circle* t) (*print-level* 5) (*print-length* 10))
               (format stream "Audit tag CBOR rifiutato: ~S~@[ (~S)~]."
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

(defun word-bytes (word width)
  "Oracolo aritmetico big-endian; nessun writer o scanner viene caricato."
  (loop for power from (1- width) downto 0
        collect (mod (floor word (expt 256 power)) 256)))

(defun arithmetic-tag-header (high low)
  "MT6 minimo da due parole u32 separate, senza ricostruire un intero u64."
  (require-check (and (typep high '(unsigned-byte 32)) (typep low '(unsigned-byte 32)))
                 :reference-words)
  (cond ((plusp high) (append '(219) (word-bytes high 4) (word-bytes low 4)))
        ((< low 24) (list (+ 192 low)))
        ((< low 256) (cons 216 (word-bytes low 1)))
        ((< low 65536) (cons 217 (word-bytes low 2)))
        (t (cons 218 (word-bytes low 4)))))

(defun reference-cell (spec)
  "MT6 aritmetico piu payload freddo; buffer/sorgente interi, NEXT e token."
  (destructuring-bind (name high low payload) spec
    (let* ((bytes (append (arithmetic-tag-header high low) payload))
           (size (length bytes)) (next (+ 2 size))
           (full (append '(165 165) bytes '(165 165 165 165)))
           (token (+ next (loop for byte in full for weight from 1 sum (* weight byte)))))
      (list :name name :high high :low low :source payload :bytes bytes
            :size size :next next :end (+ next 2) :full full :token token
            :source-full (append '(165 165) payload '(165 165 165 165))
            :source-start 2 :source-end (+ 2 (length payload))))))

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
  "Sensori indipendenti: baseline zero, 16 MiB deliberati e checker con marker esatti."
  (checked-plist controls '(:status :baseline :positive-control :output-checker :arity-checker
                           :sensor-checker :immutable-checker))
  (require-check (eq :ok (getf controls :status)) :self-control-status)
  (let ((baseline (getf controls :baseline)) (positive (getf controls :positive-control))
        (checker (getf controls :output-checker)) (arity (getf controls :arity-checker))
        (sensor (getf controls :sensor-checker)))
    (checked-plist baseline '(:heap-bytes))
    (require-check (eql 0 (getf baseline :heap-bytes)) :baseline-heap)
    (checked-plist checker '(:status :expected-token :altered-next-and-length-rejected
                            :altered-prefix-header-payload-residual-tail-rejected :reason-specific-rejection))
    (require-check (and (eq :ok (getf checker :status))
                        (eql (getf checker :expected-token)
                           (+ 10 (loop for byte in '(165 165 218 0 1 0 0 130 0 1 165 165 165 165)
                                      for weight from 1 sum (* weight byte))))
                        (eql 2 (getf checker :altered-next-and-length-rejected))
                        (eql 6 (getf checker :altered-prefix-header-payload-residual-tail-rejected))
                        (eq t (getf checker :reason-specific-rejection)))
                   :checker-self-test)
    (checked-plist arity '(:status :single-value-accepted :wrong-arity-or-next-rejected))
    (require-check (and (eq :ok (getf arity :status)) (eq t (getf arity :single-value-accepted))
                        (eql 4 (getf arity :wrong-arity-or-next-rejected))) :arity-self-test)
    (checked-plist sensor '(:status :wrong-sink-rejected :nonzero-heap-rejected :missing-or-invalid-heap-rejected :reason-specific-rejection))
    (require-check (and (eq :ok (getf sensor :status))
                        (eq t (getf sensor :wrong-sink-rejected))
                        (eq t (getf sensor :nonzero-heap-rejected))
                        (eql 4 (getf sensor :missing-or-invalid-heap-rejected))
                        (eq t (getf sensor :reason-specific-rejection))) :sensor-self-test)
    (let ((immutable (getf controls :immutable-checker)))
      (checked-plist immutable '(:status :source-change-rejected :source-prefix-and-tail-checked :source-shape-rejected
                                :reason-specific-rejection))
      (require-check (and (eq :ok (getf immutable :status))
                          (eq t (getf immutable :source-change-rejected))
                          (eq t (getf immutable :source-prefix-and-tail-checked))
                          (eq t (getf immutable :source-shape-rejected))
                          (eq t (getf immutable :reason-specific-rejection))) :immutable-self-test))
    (+ (audit-sample baseline 1024 64 0 timer :zero)
       (audit-sample positive 16 0 1048576 timer :positive))))

(defun audit-cell (cell spec timer)
  "Verifica parole/sorgente/output freddi interi e cinque repliche da1024/warm64."
  (checked-plist cell '(:name :high :low :source-literal :source-full-buffer
                       :source-start :source-end :unit-bytes
                       :expected-bytes :expected-full-buffer :expected-next :expected-token
                       :cold-values :cold-value-count :start :end :private-preallocated-buffer
                       :private-preallocated-workspace :complete-output-checked-per-call
                       :source-checked-per-call :samples))
  (let* ((ref (reference-cell spec)) (next (getf ref :next)) (token (getf ref :token))
         (cold (getf cell :cold-values)) (samples (getf cell :samples)))
    (dolist (mapping '((:name :name) (:high :high) (:low :low) (:source-literal :source)
                       (:source-full-buffer :source-full) (:source-start :source-start)
                       (:source-end :source-end) (:unit-bytes :size)))
      (require-check (equal (getf cell (first mapping)) (getf ref (second mapping)))
                     :fixture-definition (list (getf ref :name) (first mapping))))
    (require-check (equal (getf ref :bytes) (getf cell :expected-bytes)) :fixture-bytes)
    (require-check (equal (getf ref :full) (getf cell :expected-full-buffer)) :fixture-buffer)
    (require-check (eql next (getf cell :expected-next)) :fixture-next)
    (require-check (eql token (getf cell :expected-token)) :fixture-token)
    (require-check (and (eql 1 (proper-length cold)) (eql 1 (getf cell :cold-value-count))
                        (eql next (first cold))) :fixture-arity)
    (require-check (and (eql 2 (getf cell :start)) (eql (getf ref :end) (getf cell :end))) :fixture-span)
    (dolist (key '(:private-preallocated-buffer :private-preallocated-workspace
                   :complete-output-checked-per-call :source-checked-per-call))
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
                      (eq :cbor-tag-write-benchmark (getf report :kind))) :benchmark-schema)
  (require-check (eq :ok (getf report :status)) :benchmark-status)
  (require-check (equal "3c410448af31a28e99fe39f93261ced04f15860d"
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
                                         '("spikes/out/cbor-tag-write-20261014/drivers/bench.lisp"
                                           "spikes/out/cbor-tag-write-20261014/drivers/fixtures-and-mutations.lisp")
                                         :test #'equal)
                                  (hex-string-p (gethash path outer-table) 40))
                              :fingerprint-outer-inventory path)) table)
    (require-check (equal +driver-md5+ (gethash "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp" table))
                   :fingerprint-driver)
    (require-check (equal "5c0dbc229bfcc07c2d9c9e581affe2ae"
                          (gethash "spikes/out/cbor-tag-write-20261014/drivers/fixtures-and-mutations.lisp" table))
                   :fingerprint-fixture-catalogue)
    ;; La CLI vincola i Git blob esterni. I MD5 dichiarati non sono autenticati
    ;; o associati ai blob senza byte di sorgente inclusi nel rapporto.
    (require-check (hex-string-p (gethash "src/codec/cbor-tag-input.lisp" table) 32)
                   :fingerprint-input)
    (require-check (hex-string-p (gethash "src/codec/cbor-tag-write.lisp" table) 32)
                   :fingerprint-write)
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
      (list :cells 6 :samples 30 :heap-bytes 0 :cold-arity 1 :sink-mask most-positive-fixnum
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
    (require-check (and (hex-string-p *input-blob* 40)
                        (equal *input-blob* (gethash "src/codec/cbor-tag-input.lisp" table)))
                   :wrapper-input-blob)
    (require-check (and (hex-string-p *write-blob* 40)
                        (equal *write-blob* (gethash "src/codec/cbor-tag-write.lisp" table)))
                   :wrapper-write-blob)
    (require-check (equal +method-blob+ (gethash "docs/implementazione/cbor-tag-metodo.md" table))
                   :wrapper-method-blob)
    (require-check (let ((size (proper-length command)))
                     (and size (>= size 3) (every #'stringp command)
                          (equal '("--script" "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp" "--bench")
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
  "Dati sintetici per falsificare l'auditor; non sono esecuzioni del prodotto."
  (let ((fingerprints (list (list :file "arcdocdb.asd" :md5 (make-string 32 :initial-element #\0))
                            (list :file "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp" :md5 +driver-md5+)
                            (list :file "src/codec/cbor-tag-input.lisp" :md5 (make-string 32 :initial-element #\2))
                            (list :file "src/codec/cbor-tag-write.lisp" :md5 (make-string 32 :initial-element #\3))
                            (list :file "spikes/out/cbor-tag-write-20261014/drivers/fixtures-and-mutations.lisp"
                                  :md5 "5c0dbc229bfcc07c2d9c9e581affe2ae"))))
    (list :schema-version 1 :kind :cbor-tag-write-benchmark :status :ok
          :fixture-catalogue-blob "3c410448af31a28e99fe39f93261ced04f15860d"
          :recorded-at 1000 :sbcl "synthetic-version" :machine "synthetic-machine"
          :os "synthetic-os" :os-version "synthetic-os-version" :workers 1 :safety 3
          :timer-units-per-second 1000000 :limits (copy-list *benchmark-limits*)
          :source-fingerprints-before fingerprints :source-fingerprints-after (copy-tree fingerprints)
          :source-consistency :stable
          :self-test (list :status :ok :baseline (synthetic-sample 1024 64 0 0)
                           :positive-control (synthetic-sample 16 0 1048576 16777472)
                           :output-checker (list :status :ok :expected-token 10464
                                                 :altered-next-and-length-rejected 2
                                                 :altered-prefix-header-payload-residual-tail-rejected 6
                                                 :reason-specific-rejection t)
                           :arity-checker (list :status :ok :single-value-accepted t
                                                :wrong-arity-or-next-rejected 4)
                           :sensor-checker (list :status :ok :wrong-sink-rejected t
                                                 :nonzero-heap-rejected t :missing-or-invalid-heap-rejected 4 :reason-specific-rejection t)
                           :immutable-checker (list :status :ok :source-change-rejected t
                                                    :source-prefix-and-tail-checked t :source-shape-rejected t
                                                    :reason-specific-rejection t))
          :campaigns
          (loop for spec in *catalog* for ref = (reference-cell spec)
                collect (list :name (getf ref :name) :high (getf ref :high) :low (getf ref :low)
                              :source-literal (getf ref :source)
                              :source-full-buffer (getf ref :source-full)
                              :source-start (getf ref :source-start) :source-end (getf ref :source-end)
                              :unit-bytes (getf ref :size)
                              :expected-bytes (getf ref :bytes) :expected-full-buffer (getf ref :full)
                              :expected-next (getf ref :next) :expected-token (getf ref :token)
                              :cold-values (list (getf ref :next)) :cold-value-count 1
                              :start 2 :end (getf ref :end) :private-preallocated-buffer t
                              :private-preallocated-workspace t :complete-output-checked-per-call t
                              :source-checked-per-call t
                              :samples (loop repeat 5 collect
                                             (synthetic-sample 1024 64 (getf ref :token) 0)))))))

(defun synthetic-wrapper (report)
  "Wrapper representativo; i soli hash non affermano completezza o autenticita."
  (let ((blobs (list (list :path "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp" :git-blob +driver-blob+)
                     (list :path "src/codec/cbor-tag-input.lisp" :git-blob *input-blob*)
                     (list :path "src/codec/cbor-tag-write.lisp" :git-blob *write-blob*)
                     (list :path "docs/implementazione/cbor-tag-metodo.md"
                           :git-blob +method-blob+)
                     (list :path "arcdocdb.asd" :git-blob (make-string 40 :initial-element #\0)))))
    (list :schema-version 1 :kind :command-verification :status :ok :exit-code 0
          :source-consistency :stable :source-blobs-before blobs :source-blobs-after (copy-tree blobs)
          :stdout (serialized report) :stderr ""
          :command '("sbcl" "--script" "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp" "--bench")
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
  "L'oracolo indipendente deve ricostruire tutti i wire/token freddi literalizzati."
  (let ((expected '((:scalar-small (193 0) 4 5368)
                    (:text-24 (216 24 98 195 169) 7 10359)
                    (:self-described-map (217 217 247 160) 6 9825)
                    (:array-65536 (218 0 1 0 0 130 0 1) 10 10464)
                    (:bytes-high-one (219 0 0 0 1 0 0 0 0 66 0 255) 14 16425)
                    (:tag-chain-container (219 255 255 255 255 255 255 255 255 192 193 130 97 97 245)
                                          17 43144))))
    (loop for spec in *catalog* for ref = (reference-cell spec) for cold in expected
          do (require-check (equal cold (list (getf ref :name) (getf ref :bytes)
                                             (getf ref :next) (getf ref :token))) :reference-cold))
    (list :status :ok :independent-arithmetic-header t :two-u32-words t :cold-fixtures 6)))

(defun self-test ()
  "Quattro report positivi e alterazioni individuali con motivi esatti, senza prodotto."
  (let* ((*input-blob* (make-string 40 :initial-element #\2))
         (*write-blob* (make-string 40 :initial-element #\3))
         (good (synthetic-report)) (wrapper (synthetic-wrapper good)) (fixtures nil)
         (reference (reference-self-test)))
    (audit-wrapper wrapper)
    (let ((earlier (copy-tree wrapper)))
      (setf (getf (getf earlier :environment) :date-universal-time) 999)
      (audit-wrapper earlier))
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
      (bad-report :bytes :fixture-bytes (lambda (r) (incf (first (getf (first-cell r) :expected-bytes)))))
      (dolist (key '(:high :low :source-start :source-end :unit-bytes))
        (bad-report key :fixture-definition (lambda (r) (incf (getf (first-cell r) key)))))
      (dolist (key '(:source-full-buffer))
        (bad-report key :fixture-definition (lambda (r) (incf (first (getf (first-cell r) key))))))
      (bad-report :payload :fixture-definition
                  (lambda (r) (incf (first (getf (second (getf r :campaigns)) :source-literal)))))
      (bad-report :missing-heap :missing-field
                  (lambda (r) (remf (first (getf (first-cell r) :samples)) :heap-bytes)))
      (dolist (invalid '(nil -1 0d0 :absent))
        (bad-report (list :invalid-heap invalid) :sample-heap-shape
                    (lambda (r) (setf (getf (first-sample r) :heap-bytes) invalid))))
      (dolist (index '(0 2 3 6))
        (bad-report (list :buffer-byte index) :fixture-buffer
                    (lambda (r) (incf (nth index (getf (first-cell r) :expected-full-buffer))))))
      (bad-report :next :fixture-next (lambda (r) (incf (getf (first-cell r) :expected-next))))
      (bad-report :token :fixture-token (lambda (r) (incf (getf (first-cell r) :expected-token))))
      (bad-report :arity :fixture-arity (lambda (r) (setf (getf (first-cell r) :cold-values) '(3 nil))))
      (bad-report :span :fixture-span (lambda (r) (incf (getf (first-cell r) :end))))
      (bad-report :samples :fixture-sample-count (lambda (r) (pop (getf (first-cell r) :samples))))
      (dolist (key '(:private-preallocated-buffer :private-preallocated-workspace
                     :complete-output-checked-per-call :source-checked-per-call))
        (bad-report key :fixture-observation (lambda (r) (setf (getf (first-cell r) key) nil))))
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
      (bad-report :checker :checker-self-test
                  (lambda (r) (setf (getf (getf (getf r :self-test) :output-checker) :expected-token) 0)))
      (bad-report :immutable-checker :immutable-self-test
                  (lambda (r) (setf (getf (getf (getf r :self-test) :immutable-checker)
                                         :source-prefix-and-tail-checked) nil)))
      (bad-report :arity-checker :arity-self-test
                  (lambda (r) (setf (getf (getf (getf r :self-test) :arity-checker)
                                         :single-value-accepted) nil)))
      (bad-report :sensor :sensor-self-test
                  (lambda (r) (setf (getf (getf (getf r :self-test) :sensor-checker) :wrong-sink-rejected) nil)))
      (bad-report :heap-presence-sensor :sensor-self-test
                  (lambda (r) (setf (getf (getf (getf r :self-test) :sensor-checker)
                                         :missing-or-invalid-heap-rejected) 0)))
      (bad-report :fingerprint-stability :fingerprint-stability
                  (lambda (r) (setf (getf r :source-consistency) :changed)))
      (bad-report :driver-md5 :fingerprint-driver
                  (lambda (r) (dolist (key '(:source-fingerprints-before :source-fingerprints-after))
                                (setf (getf (second (getf r key)) :md5) (make-string 32 :initial-element #\1)))))
      (bad-report :fixture-freeze :fixture-catalogue-freeze
                  (lambda (r) (setf (getf r :fixture-catalogue-blob) (make-string 40 :initial-element #\1))))
      (bad-report :fixture-inner-md5 :fingerprint-fixture-catalogue
                  (lambda (r) (dolist (key '(:source-fingerprints-before :source-fingerprints-after))
                                (setf (getf (fifth (getf r key)) :md5)
                                      (make-string 32 :initial-element #\1)))))
      (bad-report :benchmark-status :benchmark-status (lambda (r) (setf (getf r :status) :failed)))
      (bad-report :timer :metadata-timer (lambda (r) (setf (getf r :timer-units-per-second) 0)))
      (bad-report :workers :metadata-workers (lambda (r) (setf (getf r :workers) 2)))
      (bad-report :metadata :metadata-environment (lambda (r) (setf (getf r :sbcl) "other")))
      (bad-wrapper :exit :wrapper-exit (lambda (r) (setf (getf r :exit-code) 1)))
      (bad-wrapper :source-stability :wrapper-source-stability
                   (lambda (r) (setf (getf r :source-consistency) :changed)))
      (bad-wrapper :input-hash :wrapper-input-blob
                   (lambda (r) (dolist (key '(:source-blobs-before :source-blobs-after))
                                 (setf (getf (second (getf r key)) :git-blob)
                                       (make-string 40 :initial-element #\1)))))
      (bad-wrapper :write-hash :wrapper-write-blob
                   (lambda (r) (dolist (key '(:source-blobs-before :source-blobs-after))
                                 (setf (getf (third (getf r key)) :git-blob)
                                       (make-string 40 :initial-element #\1)))))
      (bad-wrapper :method-hash :wrapper-method-blob
                   (lambda (r) (dolist (key '(:source-blobs-before :source-blobs-after))
                                 (setf (getf (fourth (getf r key)) :git-blob)
                                       (make-string 40 :initial-element #\1)))))
      (bad-wrapper :command :wrapper-command (lambda (r) (setf (getf r :command) '("sbcl" "--self-test"))))
      (bad-wrapper :time :wrapper-time (lambda (r) (setf (getf r :wall-seconds) -1)))
      (bad-wrapper :duplicate-key :duplicate-key (lambda (r) (nconc r (list :status :ok))))
      (dolist (spec '((:reader-error "#.(list :a 1)") (:reader-trailing "(:a 1) (:b 2)")
                      (:reader-trailing "(:a 1) :eof")
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
  "Un solo rapporto anche sul rifiuto; exit non nullo, nessuna campagna avviata."
  (let ((report (list :schema-version 1 :kind :cbor-tag-write-bench-audit :status :running
                      :recorded-at (get-universal-time) :client-date "2026-10-14"
                      :sbcl (lisp-implementation-version) :driver-blob +driver-blob+
                      :method-blob +method-blob+ :input-blob nil :write-blob nil
                      :limits '(:data-consistency-only :no-product-or-driver-loaded
                                :no-authenticity-or-execution-proof :declared-source-inventory-only
                                :expected-product-git-blobs-supplied-by-caller :ignored-driver-bound-by-frozen-inner-md5
                                :inner-product-md5-not-bound-to-git-blob
                                :raw-runtime-dates-preserved :no-speed-or-scaling-threshold
                                :local-before-after-byte-observations))))
    (handler-case
        (let ((args (rest sb-ext:*posix-argv*)))
          (setf (getf report :result)
                (cond ((equal args '("--self-test")) (self-test))
                      ((and (= 4 (length args)) (string= "--bench" (first args)))
                       (let ((*input-blob* (string-downcase (third args)))
                             (*write-blob* (string-downcase (fourth args))))
                         (require-check (and (hex-string-p *input-blob* 40)
                                             (hex-string-p *write-blob* 40)) :expected-product-hashes)
                         (setf (getf report :input-blob) *input-blob*
                               (getf report :write-blob) *write-blob*)
                         (audit-file (second args))))
                      (t (error 'audit-rejection :reason :usage
                                :detail "Usare --self-test oppure --bench <report-wrapper.lisp> <input-blob> <write-blob>."))))
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
