(require :asdf)
(require :sb-md5)
(defparameter *old* "spikes/out/cbor-map-write-20261014/drivers/")
(defparameter *new* "spikes/out/cbor-tag-write-20261014/drivers/")
(defun replace-all (text before after)
  (with-output-to-string (out)
    (loop with cursor = 0 for pos = (search before text :start2 cursor)
          do (write-string text out :start cursor :end pos)
          while pos do (write-string after out) (setf cursor (+ pos (length before))))))
(defun section (text begin end replacement)
  (let ((a (search begin text)) (b (search end text)))
    (assert (and a b (< a b)))
    (concatenate 'string (subseq text 0 a) replacement (subseq text b))))
(defun base (name)
  (let ((text (uiop:read-file-string (concatenate 'string *old* name))))
    (dolist (pair '(("cbor-map-write-20261014" "cbor-tag-write-20261014")
                    ("cbor-map" "cbor-tag") ("cbor-map-write" "cbor-tag-write")
                    ("arcdocdb.cmw" "arcdocdb.ctw") ("mappe CBOR" "tag CBOR")
                    ("REQ-CBR-006" "REQ-CBR-007")
                    ("636dd2706c2903542978606cf029e7198bf4dbb3" "3175390e496173398781bf8b39170cb33892125f")
                    ("ARCDOCDB.CBOR.MAP.WRITE.TESTS::" "ARCDOCDB.CBOR.TAG.WRITE.TESTS::")
                    ("CMW-ACCEPT" "CTW-ACCEPT")))
      (setf text (replace-all text (first pair) (second pair))))
    text))
(defun save (name text)
  (with-open-file (out (concatenate 'string *new* name) :direction :output :if-exists :error
                           :if-does-not-exist :create :external-format :utf-8)
    (write-string text out)))
(defun blob (name)
  (string-trim '(#\Newline #\Return) (uiop:run-program
    (list "git" "hash-object" (concatenate 'string *new* name)) :output :string)))
(defun md5 (name)
  (format nil "~(~{~2,'0X~}~)" (coerce (sb-md5:md5sum-file (concatenate 'string *new* name)) 'list)))
(defparameter *fixture-blob* (blob "fixtures-and-mutations.lisp"))
(defparameter *fixture-md5* (md5 "fixtures-and-mutations.lisp"))

(let ((text (base "bench.lisp")))
  (setf text (replace-all text ";;;; Prereg: vuoto/coppia scalare/due miste/24/256 coppie/array-tag-testo, start2."
                         ";;;; Prereg: tag corto/24/55799/65536/HIGH1/catena e contenitore, start2."))
  (setf text (replace-all text "(make-array 15 :element-type" "(make-array 14 :element-type"))
  (setf text (replace-all text "'(165 165 162 97 97 1 97 98 130 244 245\n                                                    165 165 165 165)"
                         "'(165 165 218 0 1 0 0 130 0 1 165 165 165 165)"))
  (setf text (replace-all text "18549" "10464"))
  (setf text (replace-all text "buffer expected 11 11" "buffer expected 10 10"))
  (setf text (replace-all text "buffer expected 10 11" "buffer expected 9 10"))
  (setf text (replace-all text "(subseq buffer 0 14) expected 11 11" "(subseq buffer 0 13) expected 10 10"))
  (setf text (replace-all text "'(0 2 3 6 11 14)" "'(0 2 3 7 10 13)"))
  (setf text (section text "(defun checked-immutable" "(defun check-zero-heap"
"(defun checked-immutable (source expected-source)
  \"Confronta ogni byte fisico della sorgente senza allocare.\"
  (unless (= (length source) (length expected-source)) (reject-observation :source-shape))
  (dotimes (i (length source))
    (unless (= (aref source i) (aref expected-source i)) (reject-observation :source-byte)))
  t)

(defun immutable-self-test ()
  \"Rifiuti specifici della sorgente, compresi prefisso e coda fuori span.\"
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

"))
  (setf text (section text "(defun check-zero-heap" "(defun self-test ()"
"(defun check-zero-heap (samples)
  \"Richiede osservazioni presenti e intere; zero e assenza non sono equivalenti.\"
  (dolist (entry samples)
    (let ((heap (getf entry :heap-bytes :absent)))
      (unless (typep heap '(integer 0 *)) (reject-observation :heap-observation))
      (unless (zerop heap) (reject-observation :nonzero-heap))))
  t)

(defun sensor-self-test ()
  \"Rifiuta sink, heap non nullo e heap assente/NIL/non intero.\"
  (expect-check-rejection (lambda () (sample (lambda () 1) 16 0 :warmup 0)) :sample-sink)
  (check-zero-heap '((:heap-bytes 0)))
  (expect-check-rejection (lambda () (check-zero-heap '((:heap-bytes 1)))) :nonzero-heap)
  (dolist (entry '((:other 0) (:heap-bytes nil) (:heap-bytes -1) (:heap-bytes 0d0)))
    (expect-check-rejection (lambda () (check-zero-heap (list entry))) :heap-observation))
  (list :status :ok :wrong-sink-rejected t :nonzero-heap-rejected t
        :missing-or-invalid-heap-rejected 4 :reason-specific-rejection t))

"))
  (setf text (section text "(defun campaign" "(defun main ()"
"(defun campaign (name high low payload wire token)
  \"Wire freddo; sorgente intera, scratch e destinazione privati preallocati.\"
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
        (error \"Token freddo diverso dalla costante aritmetica indipendente.\"))
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
  \"Sei wire letterali congelati; parole u32 mantenute separate.\"
  (list (list :scalar-small 0 1 '(0) '(193 0) 5368)
        (list :text-24 0 24 '(98 195 169) '(216 24 98 195 169) 10359)
        (list :self-described-map 0 55799 '(160) '(217 217 247 160) 9825)
        (list :array-65536 0 65536 '(130 0 1) '(218 0 1 0 0 130 0 1) 10464)
        (list :bytes-high-one 1 0 '(66 0 255) '(219 0 0 0 1 0 0 0 0 66 0 255) 16425)
        (list :tag-chain-container 4294967295 4294967295 '(192 193 130 97 97 245)
              '(219 255 255 255 255 255 255 255 255 192 193 130 97 97 245) 43144)))

"))
  (setf text (replace-all text "89900f1bebaf66af3b3b8e19e17596d438cbf936" *fixture-blob*))
  (setf text (replace-all text ":map-prefix-and-validated-payload :source-table-readonly"
                         ":tag-prefix-and-validated-payload :source-readonly"))
  (save "bench.lisp" text))

(let ((text (base "audit.lisp")))
  (setf text (replace-all text "eeaa1a0d34d6bd94d5cf7c1d62e9c4027b0f5027" (blob "bench.lisp")))
  (setf text (replace-all text "0dd9d0f178e39ff133da23bcf06f8b47" (md5 "bench.lisp")))
  (setf text (replace-all text "89900f1bebaf66af3b3b8e19e17596d438cbf936" *fixture-blob*))
  (setf text (replace-all text "66759726c5b63708a7cbce0be546d475" *fixture-md5*))
  (setf text (replace-all text ":map-prefix-and-validated-payload :source-table-readonly"
                         ":tag-prefix-and-validated-payload :source-readonly"))
  (setf text (section text "(defparameter *catalog*" "(defparameter *benchmark-limits*"
"(defparameter *catalog*
  '((:scalar-small 0 1 (0))
    (:text-24 0 24 (98 195 169))
    (:self-described-map 0 55799 (160))
    (:array-65536 0 65536 (130 0 1))
    (:bytes-high-one 1 0 (66 0 255))
    (:tag-chain-container 4294967295 4294967295 (192 193 130 97 97 245))))
"))
  (setf text (section text "(defun arithmetic-map-header" "(defun independent-sink"
"(defun word-bytes (word width)
  \"Oracolo aritmetico big-endian; nessun writer o scanner viene caricato.\"
  (loop for power from (1- width) downto 0
        collect (mod (floor word (expt 256 power)) 256)))

(defun arithmetic-tag-header (high low)
  \"MT6 minimo da due parole u32 separate, senza ricostruire un intero u64.\"
  (require-check (and (typep high '(unsigned-byte 32)) (typep low '(unsigned-byte 32)))
                 :reference-words)
  (cond ((plusp high) (append '(219) (word-bytes high 4) (word-bytes low 4)))
        ((< low 24) (list (+ 192 low)))
        ((< low 256) (cons 216 (word-bytes low 1)))
        ((< low 65536) (cons 217 (word-bytes low 2)))
        (t (cons 218 (word-bytes low 4)))))

(defun reference-cell (spec)
  \"MT6 aritmetico piu payload freddo; buffer/sorgente interi, NEXT e token.\"
  (destructuring-bind (name high low payload) spec
    (let* ((bytes (append (arithmetic-tag-header high low) payload))
           (size (length bytes)) (next (+ 2 size))
           (full (append '(165 165) bytes '(165 165 165 165)))
           (token (+ next (loop for byte in full for weight from 1 sum (* weight byte)))))
      (list :name name :high high :low low :source payload :bytes bytes
            :size size :next next :end (+ next 2) :full full :token token
            :source-full (append '(165 165) payload '(165 165 165 165))
            :source-start 2 :source-end (+ 2 (length payload))))))

"))
  (setf text (replace-all text "(+ 11 (loop for byte in '(165 165 162 97 97 1 97 98 130 244 245 165 165 165 165)"
                         "(+ 10 (loop for byte in '(165 165 218 0 1 0 0 130 0 1 165 165 165 165)"))
  (setf text (replace-all text "18549" "10464"))
  (setf text (replace-all text ":unused-table-cell-change-rejected" ":source-prefix-and-tail-checked"))
  (setf text (replace-all text "(checked-plist sensor '(:status :wrong-sink-rejected :nonzero-heap-rejected :reason-specific-rejection))"
                         "(checked-plist sensor '(:status :wrong-sink-rejected :nonzero-heap-rejected :missing-or-invalid-heap-rejected :reason-specific-rejection))"))
  (setf text (replace-all text "(eq t (getf sensor :nonzero-heap-rejected))"
                         "(eq t (getf sensor :nonzero-heap-rejected))\n                        (eql 4 (getf sensor :missing-or-invalid-heap-rejected))"))
  (setf text (replace-all text ":nonzero-heap-rejected t :reason-specific-rejection t)"
                         ":nonzero-heap-rejected t :missing-or-invalid-heap-rejected 4 :reason-specific-rejection t)"))
  (setf text (replace-all text ":source-prefix-and-tail-checked\n                                :reason-specific-rejection"
                         ":source-prefix-and-tail-checked :source-shape-rejected\n                                :reason-specific-rejection"))
  (setf text (replace-all text "(eq t (getf immutable :source-prefix-and-tail-checked))"
                         "(eq t (getf immutable :source-prefix-and-tail-checked))\n                          (eq t (getf immutable :source-shape-rejected))"))
  (setf text (replace-all text ":source-prefix-and-tail-checked t\n                                                    :reason-specific-rejection"
                         ":source-prefix-and-tail-checked t :source-shape-rejected t\n                                                    :reason-specific-rejection"))
  (setf text (section text "(defun audit-cell" "(defun audit-benchmark"
"(defun audit-cell (cell spec timer)
  \"Verifica parole/sorgente/output freddi interi e cinque repliche da1024/warm64.\"
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

"))
  (setf text (replace-all text "collect (list :name (getf ref :name) :count (getf ref :count)\n                              :source-literal (getf ref :source) :item-ends-literal (getf ref :ends)"
                         "collect (list :name (getf ref :name) :high (getf ref :high) :low (getf ref :low)\n                              :source-literal (getf ref :source)"))
  (setf text (replace-all text " :item-ends-full (getf ref :ends-full)" ""))
  (setf text (replace-all text ":source-and-table-checked-per-call" ":source-checked-per-call"))
  (setf text (section text "(defun reference-self-test" "(defun self-test ()"
"(defun reference-self-test ()
  \"L'oracolo indipendente deve ricostruire tutti i wire/token freddi literalizzati.\"
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

"))
  (setf text (replace-all text "'(:count :source-start :source-end :unit-bytes)"
                         "'(:high :low :source-start :source-end :unit-bytes)"))
  (setf text (replace-all text "'(:source-full-buffer :item-ends-full)" "'(:source-full-buffer)"))
  (setf text (section text "      (bad-report :bounds" "      (dolist (index"
"      (bad-report :missing-heap :missing-field
                  (lambda (r) (remf (getf (first-cell r) :samples) :not-a-plist)))
"))
  ;; Replace the preparatory missing-field fixture with a sample-level removal.
  (setf text (replace-all text "(remf (getf (first-cell r) :samples) :not-a-plist)"
                         "(remf (first (getf (first-cell r) :samples)) :heap-bytes)"))
  (save "audit.lisp" text))

(let ((text (base "mutation.lisp")))
  (setf text (section text "(defparameter *planned-mutant-names*" "(defun catalogue-ready-p"
";;; Catalogo semantico freddo. Target e whitelist restano NIL prima del freeze prodotto/corpus.
(defparameter *planned-mutant-names*
  '(\"physical-capacity\" \"wrong-major\" \"swapped-words\" \"scan-omitted\"
    \"overlap-without-header\" \"root-node-excluded\" \"tag-depth-charged\" \"extra-return-value\"))
(defparameter *catalogue-source-blob* nil)
(defparameter *catalogue-source-files* nil)
(defparameter *catalogue-corpus-files* nil)
(defparameter *catalogue-data-blob* nil)
(defparameter *catalogue-raw-fingerprints* nil)
(defparameter *mutants* nil)
(defparameter *semantic-catalogue-blob* \"FIXTURE-BLOB-PENDING\")
(defparameter *method-blob* \"3175390e496173398781bf8b39170cb33892125f\")
(defparameter *corpus-plan-blob* nil)
(defparameter *corpus-plan-declared-api-calls* nil)
(defparameter *expected-corpus-count* nil)
(defparameter *corpus-frame-functions* nil)
(defparameter *cold-origin-frame* nil)
(defparameter *origin-namespace-prefix* \"ARCDOCDB.CBOR.TAG.WRITE.TESTS::\")

"))
  (setf text (replace-all text "FIXTURE-BLOB-PENDING" *fixture-blob*))
  (setf text (replace-all text "bozza cieca, campagna non abilitata" "bozza fredda, campagna non abilitata"))
  (save "mutation-before-product.lisp" text)
  (save "mutation.lisp" text))
(format t "fixture ~A~%bench ~A md5 ~A~%audit ~A~%mutation-draft ~A~%"
        *fixture-blob* (blob "bench.lisp") (md5 "bench.lisp") (blob "audit.lisp") (blob "mutation-before-product.lisp"))
