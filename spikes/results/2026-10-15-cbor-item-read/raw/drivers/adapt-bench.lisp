(require :asdf)
(defun replace-all (text before after)
  (with-output-to-string (out)
    (loop with start = 0 for pos = (search before text :start2 start)
          do (write-string text out :start start :end pos)
          while pos do (write-string after out) (setf start (+ pos (length before))))))
(defun section (text begin end replacement)
  (let ((a (search begin text)) (b (search end text)))
    (assert (and a b (< a b)))
    (concatenate 'string (subseq text 0 a) replacement (subseq text b))))
(let ((text (uiop:read-file-string "spikes/out/cbor-tag-write-20261014/drivers/bench.lisp")))
  (dolist (pair '(("cbor-tag-write-20261014" "cbor-item-read-20261015")
                  ("cbor-tag-write" "cbor-item-read") ("arcdocdb.ctw" "arcdocdb.cir")
                  ("REQ-CBR-007" "REQ-CBR-008")
                  ("scrittura tag CBOR" "lettura primo item CBOR")
                  ("benchmark tag CBOR" "benchmark primo item CBOR")
                  ("3c410448af31a28e99fe39f93261ced04f15860d" "c6a22e6751cab0eff88dd1173ed81543d595a659")))
    (setf text (replace-all text (first pair) (second pair))))
  (setf text (section text "(defun checked-token" "(defun check-zero-heap"
"(defun expect-check-rejection (function reason)
  \"Richiede precisamente il motivo atteso, senza accettare errori estranei.\"
  (let ((rejected nil))
    (handler-case (funcall function)
      (invalid-observation (condition)
        (unless (eq reason (observation-reason condition)) (error condition))
        (setf rejected t)))
    (unless rejected (error \"Self-test: alterazione non rilevata.\"))))

(defun check-cold-values (values nodes peak next)
  \"Esattamente tre valori, inclusa la distinzione da un quarto NIL.\"
  (unless (= 3 (length values)) (reject-observation :cold-arity))
  (unless (equal values (list nodes peak next)) (reject-observation :cold-result))
  t)

(defun checked-read (buffer expected space nodes peak next expected-nodes expected-peak expected-next)
  \"Confronta tutti i tre risultati, l'intero buffer fisico e tutti i sei scalari scratch.\"
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
  \"Snapshot dei soli sei scalari, fuori dalle misure.\"
  (list :cursor (arcdocdb.cbor::spazio-cbor-cursor space)
        :top (arcdocdb.cbor::spazio-cbor-top space) :nodes (arcdocdb.cbor::spazio-cbor-nodes space)
        :depth (arcdocdb.cbor::spazio-cbor-depth space)
        :peak-depth (arcdocdb.cbor::spazio-cbor-peak-depth space)
        :pending-tag (arcdocdb.cbor::spazio-cbor-pending-tag space)))

(defun setup-workspace (space nodes peak next)
  \"Stato sintetico del checker, nessuno scanner o nuova API chiamato.\"
  (setf (arcdocdb.cbor::spazio-cbor-cursor space) next
        (arcdocdb.cbor::spazio-cbor-top space) 0 (arcdocdb.cbor::spazio-cbor-nodes space) nodes
        (arcdocdb.cbor::spazio-cbor-depth space) 0
        (arcdocdb.cbor::spazio-cbor-peak-depth space) peak
        (arcdocdb.cbor::spazio-cbor-pending-tag space) nil))

(defun arity-self-test ()
  \"Tre accettati; zero/uno/due/quattro e tre risultati errati rifiutati.\"
  (check-cold-values '(1 0 3) 1 0 3)
  (dolist (values '(nil (1) (1 0) (1 0 3 nil) (1 0 3 4)))
    (expect-check-rejection (lambda () (check-cold-values values 1 0 3)) :cold-arity))
  (dolist (values '((2 0 3) (1 1 3) (1 0 4)))
    (expect-check-rejection (lambda () (check-cold-values values 1 0 3)) :cold-result))
  (let ((consumer (lambda (nodes peak next) (+ nodes peak next))))
    (unless (= 4 (multiple-value-call consumer (values 1 0 3))) (error \"Consumer3 errato.\"))
    (dolist (count '(2 4))
      (let ((rejected nil))
        (handler-case
            (if (= count 2) (multiple-value-call consumer (values 1 0))
                (multiple-value-call consumer (values 1 0 3 nil)))
          (program-error () (setf rejected t)))
        (unless rejected (error \"Consumer a tre argomenti non rifiuta arita errata.\")))))
  (list :status :ok :exact-three-accepted t :wrong-arity-rejected 5
        :wrong-results-rejected 3 :fixed-arity-hot-consumer-rejected 2))

(defun checker-self-test ()
  \"Token freddo e alterazioni dei tre valori e quattro regioni del buffer.\"
  (let* ((expected (make-array 9 :element-type '(unsigned-byte 8)
                               :initial-contents '(165 165 0 255 28 24 0 165 165)))
         (buffer (copy-seq expected)) (space (arcdocdb.cbor:crea-spazio-cbor)))
    (setup-workspace space 1 0 3)
    (unless (= 201232 (checked-read buffer expected space 1 0 3 1 0 3))
      (error \"Token freddo del checker errato.\"))
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
  \"Tutti i sei scalari sono controllati, compresi TOP/DEPTH/PENDING-TAG terminali.\"
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

"))
  (setf text (replace-all text ":immutable-checker (immutable-self-test)"
                         ":workspace-checker (workspace-self-test)"))
  (setf text (section text "(defun campaign" "(defun main ()"
"(defun campaign (name item nodes peak token)
  \"Item e coda freddi, buffer read-only e scratch privato; consumer fisso a tre valori.\"
  (let* ((next (+ 2 (length item))) (end (+ next 4))
         (full (append '(165 165) item '(255 28 24 0 165 165)))
         (buffer (make-array (length full) :element-type '(unsigned-byte 8) :initial-contents full))
         (expected (copy-seq buffer)) (space (arcdocdb.cbor:crea-spazio-cbor))
         (cold-values (multiple-value-list (arcdocdb.cbor:leggi-item-cbor-minimo buffer 2 end space))))
    (check-cold-values cold-values nodes peak next)
    (unless (= token (checked-read buffer expected space nodes peak next nodes peak next))
      (error \"Token fixture diverso dalla costante fredda.\"))
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
  \"Sei vettori freddi MT0..7, coda autorizzata malformata non validata.\"
  '((:scalar (0) 1 0 201232)
    (:text (98 195 169) 1 0 335499)
    (:array (130 0 245) 3 1 335486)
    (:map (162 97 97 0 97 98 129 244) 6 2 671472)
    (:tag-chain (192 193 129 97 122) 4 1 469665)
    (:mixed-array (132 32 249 60 0 66 0 255 160) 5 2 738173)))

"))
  (setf text (replace-all text ":tag-prefix-and-validated-payload :source-readonly :preallocated-private-workspace"
                         ":first-minimal-item :unvalidated-tail :whole-window-byte-budget :source-readonly :preallocated-private-workspace"))
  (setf text (replace-all text ";;;; Prereg: tag corto/24/55799/65536/HIGH1/catena e contenitore, start2."
                         ";;;; Prereg: scalare/testo/array/mappa/catena-tag/array misto, coda FF1C1800, start2."))
  (with-open-file (out "spikes/out/cbor-item-read-20261015/drivers/bench.lisp"
                       :direction :output :if-exists :error :if-does-not-exist :create)
    (write-string text out)))
