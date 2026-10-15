;;;; Misure seriali di lettura primo item CBOR; buffer preallocato per fixture.
;;;; Uso: --self-test oppure --bench; warmup 64, 1024 chiamate × 5 repliche.
;;;; Prereg: scalare/testo/array/mappa/catena-tag/array misto, coda FF1C1800, start2.
;;;; REQ: REQ-CBR-008 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
(require :asdf)
(require :sb-md5)
(defpackage #:arcdocdb.cir.bench (:use #:cl))
(in-package #:arcdocdb.cir.bench)
(declaim (optimize (safety 3) (debug 2)))
(defconstant +iterations+ 1024)
(defconstant +warmup+ 64)
(defconstant +replicas+ 5)

(defun fingerprints ()
  "Registra prodotto e driver; il confronto verifica stabilità, non autenticità."
  (loop for path in (append '(#p"arcdocdb.asd" #p"spikes/out/cbor-item-read-20261015/drivers/bench.lisp"
                             #p"spikes/out/cbor-item-read-20261015/drivers/fixtures-and-mutations.lisp")
                            (sort (directory "src/**/*.lisp") #'string< :key #'namestring))
        collect (list :file (enough-namestring path)
                      :md5 (format nil "~(~{~2,'0X~}~)"
                                   (coerce (sb-md5:md5sum-file path) 'list)))))

(defun load-product ()
  "Carica prima della misura, con avvisi fatali e output diagnostico separato."
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (let ((*standard-output* *error-output*))
    (handler-bind ((warning (lambda (condition) (error condition))))
      (asdf:load-asd (merge-pathnames "arcdocdb.asd" (truename "./")))
      (asdf:load-system "arcdocdb"))))

(defparameter *before* (fingerprints))
(handler-case (load-product)
  (error (condition)
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :cbor-item-read-benchmark :status :failed
                   :phase :load-product :diagnostic (princ-to-string condition)
                   :source-fingerprints-before *before* :source-fingerprints-after (fingerprints))
             :pretty t)
      (terpri))
    (sb-ext:exit :code 1)))

(define-condition invalid-observation (error)
  ((reason :initarg :reason :reader observation-reason))
  (:report (lambda (condition stream)
             (format stream "Osservazione benchmark primo item CBOR rifiutata: ~S."
                     (observation-reason condition)))))

(defun reject-observation (reason)
  "Segnala il motivo specifico; i self-test non accettano errori estranei."
  (error 'invalid-observation :reason reason))

(defun expected-sink (iterations token)
  "Somma aritmetica dei token attesi e degli indici delle invocazioni."
  (logand most-positive-fixnum (+ (* iterations token) (/ (* iterations (1- iterations)) 2))))

(defun sample (function iterations token &key (warmup +warmup+))
  "Warmup e GC fuori da heap/clock; il risultato alimenta il sink atteso."
  (unless (and (<= 1 iterations +iterations+) (<= 0 warmup +warmup+)
               (typep token '(integer 0 *)) (<= token most-positive-fixnum))
    (error "Parametri benchmark scrittura CBOR fuori budget."))
  (dotimes (i warmup) (funcall function))
  (sb-ext:gc :full t)
  (let ((ticks-before (get-internal-real-time)) (heap-before (sb-ext:get-bytes-consed)) (sink 0))
    (declare (type fixnum sink))
    (dotimes (i iterations)
      (setf sink (logand most-positive-fixnum (+ sink i (the fixnum (funcall function))))))
    (let* ((heap (- (sb-ext:get-bytes-consed) heap-before))
           (ticks (- (get-internal-real-time) ticks-before))
           (seconds (/ ticks (float internal-time-units-per-second 1d0)))
           (expected (expected-sink iterations token)))
      (unless (and (>= heap 0) (>= ticks 0)) (reject-observation :clock-or-heap))
      (unless (= expected sink) (reject-observation :sample-sink))
      (list :iterations iterations :warmup-iterations warmup :heap-bytes heap
            :raw-ticks ticks :seconds seconds :sink sink :expected-sink expected
            :expected-return-token token
            :calls-per-second (when (plusp seconds) (/ iterations seconds))))))

(defun expect-check-rejection (function reason)
  "Richiede precisamente il motivo atteso, senza accettare errori estranei."
  (let ((rejected nil))
    (handler-case (funcall function)
      (invalid-observation (condition)
        (unless (eq reason (observation-reason condition)) (error condition))
        (setf rejected t)))
    (unless rejected (error "Self-test: alterazione non rilevata."))))

(defun check-cold-values (values nodes peak next)
  "Esattamente tre valori, inclusa la distinzione da un quarto NIL."
  (unless (= 3 (length values)) (reject-observation :cold-arity))
  (unless (equal values (list nodes peak next)) (reject-observation :cold-result))
  t)

(defun checked-read (buffer expected space nodes peak next expected-nodes expected-peak expected-next)
  "Confronta tutti i tre risultati, l'intero buffer fisico e tutti i sei scalari scratch."
  (unless (eql nodes expected-nodes) (reject-observation :result-nodes))
  (unless (eql peak expected-peak) (reject-observation :result-peak))
  (unless (eql next expected-next) (reject-observation :result-next))
  (unless (= (length buffer) (length expected)) (reject-observation :buffer-shape))
  (unless (and (= next (arcdocdb.cbor::spazio-cbor-cursor space))
               (= nodes (arcdocdb.cbor::spazio-cbor-nodes space))
               (= peak (arcdocdb.cbor::spazio-cbor-peak-depth space))
               (zerop (arcdocdb.cbor::spazio-cbor-top space))
               (zerop (arcdocdb.cbor::spazio-cbor-depth space))
               (not (arcdocdb.cbor::spazio-cbor-pending-tag space)))
    (reject-observation :workspace-state))
  (let ((token (+ (* nodes 17) (* peak 257) (* next 65537))))
    (declare (type fixnum token))
    (dotimes (i (length buffer) token)
      (unless (= (aref buffer i) (aref expected i)) (reject-observation :buffer-byte))
      (incf token (* (1+ i) (aref buffer i))))))

(defun workspace-stats (space)
  "Snapshot dei soli sei scalari, fuori dalle misure."
  (list :cursor (arcdocdb.cbor::spazio-cbor-cursor space)
        :top (arcdocdb.cbor::spazio-cbor-top space) :nodes (arcdocdb.cbor::spazio-cbor-nodes space)
        :depth (arcdocdb.cbor::spazio-cbor-depth space)
        :peak-depth (arcdocdb.cbor::spazio-cbor-peak-depth space)
        :pending-tag (arcdocdb.cbor::spazio-cbor-pending-tag space)))

(defun setup-workspace (space nodes peak next)
  "Stato sintetico del checker, nessuno scanner o nuova API chiamato."
  (setf (arcdocdb.cbor::spazio-cbor-cursor space) next
        (arcdocdb.cbor::spazio-cbor-top space) 0 (arcdocdb.cbor::spazio-cbor-nodes space) nodes
        (arcdocdb.cbor::spazio-cbor-depth space) 0
        (arcdocdb.cbor::spazio-cbor-peak-depth space) peak
        (arcdocdb.cbor::spazio-cbor-pending-tag space) nil))

(declaim (notinline synthetic-values))
(defun synthetic-values (arguments)
  "Valori sintetici da lista runtime; evita un warning statico per arità volutamente errata."
  (values-list arguments))

(defun arity-self-test ()
  "Tre accettati; zero/uno/due/quattro e tre risultati errati rifiutati."
  (check-cold-values '(1 0 3) 1 0 3)
  (dolist (values '(nil (1) (1 0) (1 0 3 nil) (1 0 3 4)))
    (expect-check-rejection (lambda () (check-cold-values values 1 0 3)) :cold-arity))
  (dolist (values '((2 0 3) (1 1 3) (1 0 4)))
    (expect-check-rejection (lambda () (check-cold-values values 1 0 3)) :cold-result))
  (let ((consumer (lambda (nodes peak next) (+ nodes peak next))))
    (unless (= 4 (multiple-value-call consumer (synthetic-values '(1 0 3)))) (error "Consumer3 errato."))
    (dolist (count '(2 4))
      (let ((rejected nil))
        (handler-case
            (multiple-value-call consumer (synthetic-values (if (= count 2) '(1 0) '(1 0 3 nil))))
          (program-error () (setf rejected t)))
        (unless rejected (error "Consumer a tre argomenti non rifiuta arita errata.")))))
  (list :status :ok :exact-three-accepted t :wrong-arity-rejected 5
        :wrong-results-rejected 3 :fixed-arity-hot-consumer-rejected 2))

(defun checker-self-test ()
  "Token freddo e alterazioni dei tre valori e quattro regioni del buffer."
  (let* ((expected (make-array 9 :element-type '(unsigned-byte 8)
                               :initial-contents '(165 165 0 255 28 24 0 165 165)))
         (buffer (copy-seq expected)) (space (arcdocdb.cbor:crea-spazio-cbor)))
    (setup-workspace space 1 0 3)
    (unless (= 201232 (checked-read buffer expected space 1 0 3 1 0 3))
      (error "Token freddo del checker errato."))
    (expect-check-rejection (lambda () (checked-read buffer expected space 2 0 3 1 0 3)) :result-nodes)
    (expect-check-rejection (lambda () (checked-read buffer expected space 1 1 3 1 0 3)) :result-peak)
    (expect-check-rejection (lambda () (checked-read buffer expected space 1 0 4 1 0 3)) :result-next)
    (expect-check-rejection
      (lambda () (checked-read (subseq buffer 0 8) expected space 1 0 3 1 0 3)) :buffer-shape)
    (dolist (i '(0 2 3 8))
      (setf (aref buffer i) (logxor 1 (aref buffer i)))
      (expect-check-rejection (lambda () (checked-read buffer expected space 1 0 3 1 0 3)) :buffer-byte)
      (setf (aref buffer i) (aref expected i)))
    (list :status :ok :expected-token 201232 :altered-three-results-rejected 3
          :altered-buffer-shape-rejected 1 :altered-prefix-item-tail-physical-tail-rejected 4
          :reason-specific-rejection t)))

(defun workspace-self-test ()
  "Tutti i sei scalari sono controllati, compresi TOP/DEPTH/PENDING-TAG terminali."
  (let* ((buffer (make-array 9 :element-type '(unsigned-byte 8)
                             :initial-contents '(165 165 0 255 28 24 0 165 165)))
         (expected (copy-seq buffer)) (space (arcdocdb.cbor:crea-spazio-cbor)))
    (dolist (slot '(:cursor :top :nodes :depth :peak-depth :pending-tag))
      (setup-workspace space 1 0 3)
      (ecase slot
        (:cursor (setf (arcdocdb.cbor::spazio-cbor-cursor space) 4))
        (:top (setf (arcdocdb.cbor::spazio-cbor-top space) 1))
        (:nodes (setf (arcdocdb.cbor::spazio-cbor-nodes space) 2))
        (:depth (setf (arcdocdb.cbor::spazio-cbor-depth space) 1))
        (:peak-depth (setf (arcdocdb.cbor::spazio-cbor-peak-depth space) 1))
        (:pending-tag (setf (arcdocdb.cbor::spazio-cbor-pending-tag space) t)))
      (expect-check-rejection (lambda () (checked-read buffer expected space 1 0 3 1 0 3))
                              :workspace-state))
    (list :status :ok :altered-scalar-fields-rejected 6 :reason-specific-rejection t)))

(defun check-zero-heap (samples)
  "Richiede osservazioni presenti e intere; zero e assenza non sono equivalenti."
  (dolist (entry samples)
    (let ((heap (getf entry :heap-bytes :absent)))
      (unless (typep heap '(integer 0 *)) (reject-observation :heap-observation))
      (unless (zerop heap) (reject-observation :nonzero-heap))))
  t)

(defun sensor-self-test ()
  "Rifiuta sink, heap non nullo e heap assente/NIL/non intero."
  (expect-check-rejection (lambda () (sample (lambda () 1) 16 0 :warmup 0)) :sample-sink)
  (check-zero-heap '((:heap-bytes 0)))
  (expect-check-rejection (lambda () (check-zero-heap '((:heap-bytes 1)))) :nonzero-heap)
  (dolist (entry '((:other 0) (:heap-bytes nil) (:heap-bytes -1) (:heap-bytes 0d0)))
    (expect-check-rejection (lambda () (check-zero-heap (list entry))) :heap-observation))
  (list :status :ok :wrong-sink-rejected t :nonzero-heap-rejected t
        :missing-or-invalid-heap-rejected 4 :reason-specific-rejection t))

(defun self-test ()
  "Baseline nulla e controllo positivo 16 × 1 MiB, con oggetto vivo e sink verificato."
  (let ((baseline (sample (lambda () 0) +iterations+ 0)) (probe nil))
    (check-zero-heap (list baseline))
    (let ((positive (sample (lambda ()
                             (setf probe (make-array 1048576 :element-type '(unsigned-byte 8)
                                                            :initial-element 0))
                             (length probe))
                           16 1048576 :warmup 0)))
      (unless (and (= 1048576 (length probe)) (>= (getf positive :heap-bytes) (* 16 1048576)))
        (error "Allocazioni deliberate non rilevate."))
      (list :status :ok :baseline baseline :positive-control positive
            :output-checker (checker-self-test) :arity-checker (arity-self-test)
            :sensor-checker (sensor-self-test) :workspace-checker (workspace-self-test)))))

(defun campaign (name item nodes peak token)
  "Item e coda freddi, buffer read-only e scratch privato; consumer fisso a tre valori."
  (let* ((next (+ 2 (length item))) (end (+ next 4))
         (full (append '(165 165) item '(255 28 24 0 165 165)))
         (buffer (make-array (length full) :element-type '(unsigned-byte 8) :initial-contents full))
         (expected (copy-seq buffer)) (space (arcdocdb.cbor:crea-spazio-cbor))
         (cold-values (multiple-value-list (arcdocdb.cbor:leggi-item-cbor-minimo buffer 2 end space))))
    (check-cold-values cold-values nodes peak next)
    (unless (= token (checked-read buffer expected space nodes peak next nodes peak next))
      (error "Token fixture diverso dalla costante fredda."))
    (let* ((cold-workspace (workspace-stats space))
           (consumer (lambda (actual-nodes actual-peak actual-next)
                       (checked-read buffer expected space actual-nodes actual-peak actual-next nodes peak next)))
           (function (lambda ()
                       (multiple-value-call consumer
                         (arcdocdb.cbor:leggi-item-cbor-minimo buffer 2 end space))))
           (samples (loop repeat +replicas+ collect (sample function +iterations+ token))))
      (list :name name :item-literal item :tail-literal '(255 28 24 0)
            :expected-nodes nodes :expected-peak peak :expected-next next :expected-token token
            :expected-full-buffer full :observed-full-buffer (coerce buffer 'list)
            :start 2 :end end :cold-values cold-values :cold-value-count (length cold-values)
            :cold-workspace cold-workspace :preallocated-readonly-source t
            :private-preallocated-workspace t :complete-source-checked-per-call t
            :exact-three-values-checked-per-call t :complete-scalar-workspace-checked-per-call t
            :samples samples))))

(defun fixtures ()
  "Sei vettori freddi MT0..7, coda autorizzata malformata non validata."
  '((:scalar (0) 1 0 201232)
    (:text (98 195 169) 1 0 335499)
    (:array (130 0 245) 3 1 335486)
    (:map (162 97 97 0 97 98 129 244) 6 2 671472)
    (:tag-chain (192 193 129 97 122) 4 1 469665)
    (:mixed-array (132 32 249 60 0 66 0 255 160) 5 2 738173)))

(defun main ()
  "Report anche sul fallimento; zero heap richiesto senza soglie di velocità o scaling."
  (let* ((args (rest sb-ext:*posix-argv*))
         (report (list :schema-version 1 :kind :cbor-item-read-benchmark :status :running :campaigns nil
                       :fixture-catalogue-blob "c6a22e6751cab0eff88dd1173ed81543d595a659"
                       :source-fingerprints-before *before* :recorded-at (get-universal-time)
                       :sbcl (lisp-implementation-version) :machine (machine-type)
                       :os (software-type) :os-version (software-version) :workers 1 :safety 3
                       :timer-units-per-second internal-time-units-per-second
                       :limits '(:success-path-only :serial :preallocated-private-buffers
                                 :first-minimal-item :unvalidated-tail :whole-window-byte-budget :source-readonly :preallocated-private-workspace
                                 :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                                 :output-check-cost-included :no-pool-or-device-throughput
                                 :no-scaling-or-latency-threshold))))
    (handler-case
        (progn
          (unless (member args '(("--self-test") ("--bench")) :test #'equal)
            (error "Usare --self-test oppure --bench."))
          (setf (getf report :self-test) (self-test))
          (when (equal args '("--bench"))
            (dolist (fixture (fixtures))
              (setf (getf report :campaigns)
                    (append (getf report :campaigns) (list (apply #'campaign fixture)))))
            (dolist (entry (getf report :campaigns))
              (check-zero-heap (getf entry :samples))))
          (setf (getf report :status) :ok))
      (error (condition) (setf (getf report :status) :failed
                               (getf report :diagnostic) (princ-to-string condition))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after
            (getf report :source-consistency) (if (equal *before* after) :stable :changed))
      (when (and (eq (getf report :status) :ok) (not (equal *before* after)))
        (setf (getf report :status) :source-changed)))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq (getf report :status) :ok) (sb-ext:exit :code 1))))

(main)
