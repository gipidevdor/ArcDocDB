;;;; Misure seriali di scrittura mappe CBOR; buffer preallocato per fixture.
;;;; Uso: --self-test oppure --bench; warmup 64, 1024 chiamate × 5 repliche.
;;;; Prereg: vuoto/coppia scalare/due miste/24/256 coppie/array-tag-testo, start2.
;;;; REQ: REQ-CBR-006 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
(require :asdf)
(require :sb-md5)
(defpackage #:arcdocdb.cmw.bench (:use #:cl))
(in-package #:arcdocdb.cmw.bench)
(declaim (optimize (safety 3) (debug 2)))
(defconstant +iterations+ 1024)
(defconstant +warmup+ 64)
(defconstant +replicas+ 5)

(defun fingerprints ()
  "Registra prodotto e driver; il confronto verifica stabilità, non autenticità."
  (loop for path in (append '(#p"arcdocdb.asd" #p"spikes/out/cbor-map-write-20261014/drivers/bench.lisp"
                             #p"spikes/out/cbor-map-write-20261014/drivers/fixtures-and-mutations.lisp")
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
      (write (list :schema-version 1 :kind :cbor-map-write-benchmark :status :failed
                   :phase :load-product :diagnostic (princ-to-string condition)
                   :source-fingerprints-before *before* :source-fingerprints-after (fingerprints))
             :pretty t)
      (terpri))
    (sb-ext:exit :code 1)))

(define-condition invalid-observation (error)
  ((reason :initarg :reason :reader observation-reason))
  (:report (lambda (condition stream)
             (format stream "Osservazione benchmark mappe CBOR rifiutata: ~S."
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
  (let* ((expected (make-array 15 :element-type '(unsigned-byte 8)
                                :initial-contents '(165 165 162 97 97 1 97 98 130 244 245
                                                    165 165 165 165)))
         (buffer (copy-seq expected)))
    (unless (= 18549 (checked-token buffer expected 11 11))
      (error "Self-test benchmark: token indipendente errato."))
    (expect-check-rejection (lambda () (checked-token buffer expected 10 11)) :output-shape)
    (expect-check-rejection (lambda () (checked-token (subseq buffer 0 14) expected 11 11))
                            :output-shape)
    (dolist (index '(0 2 3 6 11 14))
      (setf (aref buffer index) (logxor 1 (aref buffer index)))
      (expect-check-rejection (lambda () (checked-token buffer expected 11 11)) :output-byte)
      (setf (aref buffer index) (aref expected index)))
    (list :status :ok :expected-token 18549 :altered-next-and-length-rejected 2
          :altered-prefix-header-payload-residual-tail-rejected 6 :reason-specific-rejection t)))

(defun checked-immutable (source expected-source ends expected-ends)
  "Confronta sorgente e tabella intere, celle oltre 2*COUNT comprese, senza allocare."
  (dotimes (i (length source))
    (unless (= (aref source i) (aref expected-source i)) (reject-observation :source-byte)))
  (dotimes (i (length ends))
    (unless (= (aref ends i) (aref expected-ends i)) (reject-observation :table-cell)))
  t)

(defun immutable-self-test ()
  "Rifiuti specifici per sorgente e tabella alterate, anche una cella oltre 2*COUNT."
  (let* ((source (make-array 4 :element-type '(unsigned-byte 8) :initial-contents '(165 0 1 165)))
         (expected-source (copy-seq source))
         (ends (make-array 4 :element-type '(unsigned-byte 32) :initial-contents '(1 2 2779096485 2779096485)))
         (expected-ends (copy-seq ends)))
    (checked-immutable source expected-source ends expected-ends)
    (setf (aref source 1) 1)
    (expect-check-rejection (lambda () (checked-immutable source expected-source ends expected-ends))
                            :source-byte)
    (setf (aref source 1) 0 (aref ends 3) 0)
    (expect-check-rejection (lambda () (checked-immutable source expected-source ends expected-ends))
                            :table-cell)
    (list :status :ok :source-change-rejected t :unused-table-cell-change-rejected t
          :reason-specific-rejection t)))

(defun check-zero-heap (samples)
  "Criterio locale sui dati osservati; non è una prova assoluta di non allocazione."
  (unless (every (lambda (entry) (zerop (getf entry :heap-bytes))) samples)
    (reject-observation :nonzero-heap))
  t)

(defun sensor-self-test ()
  "Rifiuta un sink diverso dal token indipendente e un campione con heap non nullo."
  (expect-check-rejection (lambda () (sample (lambda () 1) 16 0 :warmup 0)) :sample-sink)
  (unless (check-zero-heap '((:heap-bytes 0)))
    (error "Self-test benchmark: campione heap nullo rifiutato."))
  (expect-check-rejection (lambda () (check-zero-heap '((:heap-bytes 1)))) :nonzero-heap)
  (list :status :ok :wrong-sink-rejected t :nonzero-heap-rejected t
        :reason-specific-rejection t))

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

(defun campaign (name count payload boundaries wire token)
  "Wire letterale freddo; sorgente/tabella/scratch e destinazione preallocati e privati."
  (let* ((size (length wire)) (next (+ 2 size)) (end (+ next 2))
         (source-end (+ 2 (length payload)))
         (buffer (make-array (+ size 6) :element-type '(unsigned-byte 8) :initial-element 165))
         (expected (copy-seq buffer))
         (source (make-array (+ 6 (length payload)) :element-type '(unsigned-byte 8) :initial-element 165))
         (ends (make-array (+ (* 2 count) 2) :element-type '(unsigned-byte 32) :initial-element #xa5a5a5a5))
         (space (arcdocdb.cbor:crea-spazio-cbor)))
    (replace expected wire :start1 2)
    (replace source payload :start1 2)
    (replace ends boundaries)
    (let* ((expected-source (copy-seq source)) (expected-ends (copy-seq ends))
           (cold-values (multiple-value-list
                         (arcdocdb.cbor:scrivi-mappa-cbor-minima
                          buffer 2 end source 2 source-end ends count space))))
      (check-cold-values cold-values next)
      (checked-immutable source expected-source ends expected-ends)
      (unless (= token (checked-token buffer expected (first cold-values) next))
        (error "Token freddo diverso dalla costante aritmetica indipendente."))
      (let* ((function (lambda ()
                         (let ((actual (arcdocdb.cbor:scrivi-mappa-cbor-minima
                                        buffer 2 end source 2 source-end ends count space)))
                           (checked-immutable source expected-source ends expected-ends)
                           (checked-token buffer expected actual next))))
             (samples (loop repeat +replicas+ collect (sample function +iterations+ token))))
        (list :name name :count count :source-literal payload :item-ends-literal boundaries
              :source-full-buffer (coerce expected-source 'list) :item-ends-full (coerce expected-ends 'list)
              :source-start 2 :source-end source-end :unit-bytes size :expected-bytes wire
              :expected-full-buffer (coerce expected 'list)
              :expected-next next :expected-token token :cold-values cold-values
              :cold-value-count (length cold-values) :start 2 :end end
              :private-preallocated-buffer t :private-preallocated-workspace t
              :complete-output-checked-per-call t :source-and-table-checked-per-call t
              :samples samples)))))

(defun fixtures ()
  "Catalogo congelato prima del prodotto; COUNT coppie, 2*COUNT fini attive."
  (list (list :empty 0 nil nil '(160) 4608)
        (list :scalar-pair 1 '(0 1) '(1 2) '(161 0 1) 5938)
        (list :two-mixed-pairs 2 '(97 97 1 97 98 130 244 245) '(2 3 5 8)
              '(162 97 97 1 97 98 130 244 245) 18549)
        (list :twenty-four-pairs 24 (make-list 48 :initial-element 0)
              (loop for i from 1 to 48 collect i) (append '(184 24) (make-list 48 :initial-element 0)) 37165)
        (list :two-hundred-fifty-six-pairs 256 (make-list 512 :initial-element 0)
              (loop for i from 1 to 512 collect i) (append '(185 1 0) (make-list 512 :initial-element 0)) 344441)
        (list :array-tag-text-pair 1 '(130 0 1 192 98 195 169) '(3 7)
              '(161 130 0 1 192 98 195 169) 15337)))

(defun main ()
  "Report anche sul fallimento; zero heap richiesto senza soglie di velocità o scaling."
  (let* ((args (rest sb-ext:*posix-argv*))
         (report (list :schema-version 1 :kind :cbor-map-write-benchmark :status :running :campaigns nil
                       :fixture-catalogue-blob "89900f1bebaf66af3b3b8e19e17596d438cbf936"
                       :source-fingerprints-before *before* :recorded-at (get-universal-time)
                       :sbcl (lisp-implementation-version) :machine (machine-type)
                       :os (software-type) :os-version (software-version) :workers 1 :safety 3
                       :timer-units-per-second internal-time-units-per-second
                       :limits '(:success-path-only :serial :preallocated-private-buffers
                                 :map-prefix-and-validated-payload :source-table-readonly :preallocated-private-workspace
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
