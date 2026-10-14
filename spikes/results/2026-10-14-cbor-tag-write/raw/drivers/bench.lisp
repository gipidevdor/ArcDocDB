;;;; Misure seriali di scrittura tag CBOR; buffer preallocato per fixture.
;;;; Uso: --self-test oppure --bench; warmup 64, 1024 chiamate × 5 repliche.
;;;; Prereg: tag corto/24/55799/65536/HIGH1/catena e contenitore, start2.
;;;; REQ: REQ-CBR-007 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
(require :asdf)
(require :sb-md5)
(defpackage #:arcdocdb.ctw.bench (:use #:cl))
(in-package #:arcdocdb.ctw.bench)
(declaim (optimize (safety 3) (debug 2)))
(defconstant +iterations+ 1024)
(defconstant +warmup+ 64)
(defconstant +replicas+ 5)

(defun fingerprints ()
  "Registra prodotto e driver; il confronto verifica stabilità, non autenticità."
  (loop for path in (append '(#p"arcdocdb.asd" #p"spikes/out/cbor-tag-write-20261014/drivers/bench.lisp"
                             #p"spikes/out/cbor-tag-write-20261014/drivers/fixtures-and-mutations.lisp")
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
      (write (list :schema-version 1 :kind :cbor-tag-write-benchmark :status :failed
                   :phase :load-product :diagnostic (princ-to-string condition)
                   :source-fingerprints-before *before* :source-fingerprints-after (fingerprints))
             :pretty t)
      (terpri))
    (sb-ext:exit :code 1)))

(define-condition invalid-observation (error)
  ((reason :initarg :reason :reader observation-reason))
  (:report (lambda (condition stream)
             (format stream "Osservazione benchmark tag CBOR rifiutata: ~S."
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

(defun checked-token (buffer expected next expected-next)
  "Controlla tutto l'output, sentinelle comprese; NEXT e ogni byte alimentano il sink."
  (unless (and (= next expected-next) (= (length buffer) (length expected)))
    (reject-observation :output-shape))
  (let ((token next))
    (declare (type fixnum token))
    (dotimes (i (length buffer) token)
      (unless (= (aref buffer i) (aref expected i))
        (reject-observation :output-byte))
      (incf token (* (1+ i) (aref buffer i))))))

(defun expect-check-rejection (function reason)
  "Il dato alterato deve produrre proprio il motivo preregistrato, non un errore generico."
  (let ((rejected nil))
    (handler-case (funcall function)
      (invalid-observation (condition)
        (unless (eq reason (observation-reason condition)) (error condition))
        (setf rejected t)))
    (unless rejected (error "Self-test benchmark: dato alterato non rilevato."))))

(defun check-cold-values (values expected-next)
  "Rifiuta qualunque arità diversa da uno, compreso un secondo valore NIL."
  (unless (= 1 (length values)) (reject-observation :cold-arity))
  (unless (eql expected-next (first values)) (reject-observation :cold-next))
  expected-next)

(defun arity-self-test ()
  "Un valore esatto accettato; zero, due/extra NIL e NEXT errato rifiutati."
  (unless (= 7 (check-cold-values '(7) 7))
    (error "Self-test benchmark: NEXT singolo non conservato."))
  (dolist (values '(nil (7 8) (7 nil)))
    (expect-check-rejection (lambda () (check-cold-values values 7)) :cold-arity))
  (expect-check-rejection (lambda () (check-cold-values '(8) 7)) :cold-next)
  (list :status :ok :single-value-accepted t :wrong-arity-or-next-rejected 4))

(defun checker-self-test ()
  "Token positivo e otto alterazioni: NEXT/lunghezza, prefisso/header/payload/residuo/coda."
  (let* ((expected (make-array 14 :element-type '(unsigned-byte 8)
                                :initial-contents '(165 165 218 0 1 0 0 130 0 1 165 165 165 165)))
         (buffer (copy-seq expected)))
    (unless (= 10464 (checked-token buffer expected 10 10))
      (error "Self-test benchmark: token indipendente errato."))
    (expect-check-rejection (lambda () (checked-token buffer expected 9 10)) :output-shape)
    (expect-check-rejection (lambda () (checked-token (subseq buffer 0 13) expected 10 10))
                            :output-shape)
    (dolist (index '(0 2 3 7 10 13))
      (setf (aref buffer index) (logxor 1 (aref buffer index)))
      (expect-check-rejection (lambda () (checked-token buffer expected 10 10)) :output-byte)
      (setf (aref buffer index) (aref expected index)))
    (list :status :ok :expected-token 10464 :altered-next-and-length-rejected 2
          :altered-prefix-header-payload-residual-tail-rejected 6 :reason-specific-rejection t)))

(defun checked-immutable (source expected-source)
  "Confronta ogni byte fisico della sorgente senza allocare."
  (unless (= (length source) (length expected-source)) (reject-observation :source-shape))
  (dotimes (i (length source))
    (unless (= (aref source i) (aref expected-source i)) (reject-observation :source-byte)))
  t)

(defun immutable-self-test ()
  "Rifiuti specifici della sorgente, compresi prefisso e coda fuori span."
  (let* ((source (make-array 5 :element-type '(unsigned-byte 8)
                                :initial-contents '(165 165 0 165 165)))
         (expected-source (copy-seq source)))
    (checked-immutable source expected-source)
    (expect-check-rejection
      (lambda () (checked-immutable (subseq source 0 4) expected-source)) :source-shape)
    (dolist (index '(0 2 4))
      (setf (aref source index) (logxor 1 (aref source index)))
      (expect-check-rejection (lambda () (checked-immutable source expected-source)) :source-byte)
      (setf (aref source index) (aref expected-source index)))
    (list :status :ok :source-change-rejected t :source-prefix-and-tail-checked t
          :source-shape-rejected t :reason-specific-rejection t)))

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
            :sensor-checker (sensor-self-test) :immutable-checker (immutable-self-test)))))

(defun campaign (name high low payload wire token)
  "Wire freddo; sorgente intera, scratch e destinazione privati preallocati."
  (let* ((size (length wire)) (next (+ 2 size)) (end (+ next 2))
         (source-end (+ 2 (length payload)))
         (buffer (make-array (+ size 6) :element-type '(unsigned-byte 8) :initial-element 165))
         (expected (copy-seq buffer))
         (source (make-array (+ 6 (length payload)) :element-type '(unsigned-byte 8) :initial-element 165))
         (space (arcdocdb.cbor:crea-spazio-cbor)))
    (replace expected wire :start1 2)
    (replace source payload :start1 2)
    (let* ((expected-source (copy-seq source))
           (cold-values (multiple-value-list
                         (arcdocdb.cbor:scrivi-tag-cbor-minimo
                          buffer 2 end source 2 source-end high low space))))
      (check-cold-values cold-values next)
      (checked-immutable source expected-source)
      (unless (= token (checked-token buffer expected (first cold-values) next))
        (error "Token freddo diverso dalla costante aritmetica indipendente."))
      (let* ((function (lambda ()
                         (let ((actual (arcdocdb.cbor:scrivi-tag-cbor-minimo
                                        buffer 2 end source 2 source-end high low space)))
                           (checked-immutable source expected-source)
                           (checked-token buffer expected actual next))))
             (samples (loop repeat +replicas+ collect (sample function +iterations+ token))))
        (list :name name :high high :low low :source-literal payload
              :source-full-buffer (coerce expected-source 'list)
              :source-start 2 :source-end source-end :unit-bytes size :expected-bytes wire
              :expected-full-buffer (coerce expected 'list)
              :expected-next next :expected-token token :cold-values cold-values
              :cold-value-count (length cold-values) :start 2 :end end
              :private-preallocated-buffer t :private-preallocated-workspace t
              :complete-output-checked-per-call t :source-checked-per-call t
              :samples samples)))))

(defun fixtures ()
  "Sei wire letterali congelati; parole u32 mantenute separate."
  (list (list :scalar-small 0 1 '(0) '(193 0) 5368)
        (list :text-24 0 24 '(98 195 169) '(216 24 98 195 169) 10359)
        (list :self-described-map 0 55799 '(160) '(217 217 247 160) 9825)
        (list :array-65536 0 65536 '(130 0 1) '(218 0 1 0 0 130 0 1) 10464)
        (list :bytes-high-one 1 0 '(66 0 255) '(219 0 0 0 1 0 0 0 0 66 0 255) 16425)
        (list :tag-chain-container 4294967295 4294967295 '(192 193 130 97 97 245)
              '(219 255 255 255 255 255 255 255 255 192 193 130 97 97 245) 43144)))

(defun main ()
  "Report anche sul fallimento; zero heap richiesto senza soglie di velocità o scaling."
  (let* ((args (rest sb-ext:*posix-argv*))
         (report (list :schema-version 1 :kind :cbor-tag-write-benchmark :status :running :campaigns nil
                       :fixture-catalogue-blob "3c410448af31a28e99fe39f93261ced04f15860d"
                       :source-fingerprints-before *before* :recorded-at (get-universal-time)
                       :sbcl (lisp-implementation-version) :machine (machine-type)
                       :os (software-type) :os-version (software-version) :workers 1 :safety 3
                       :timer-units-per-second internal-time-units-per-second
                       :limits '(:success-path-only :serial :preallocated-private-buffers
                                 :tag-prefix-and-validated-payload :source-readonly :preallocated-private-workspace
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
