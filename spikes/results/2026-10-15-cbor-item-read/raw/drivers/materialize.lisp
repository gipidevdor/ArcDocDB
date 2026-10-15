(require :asdf)
(require :sb-md5)
(defparameter *base* "spikes/out/cbor-item-read-20261015/drivers/")
(defparameter *method* "a67a79bf4fefe11c4778cd881eb5279a006966ca")
(defparameter *semantic* "c6a22e6751cab0eff88dd1173ed81543d595a659")
(defparameter *plan* "63a749b0e8737f49d400f40b0a98c454c2dc3cfc")
(defparameter *sources* '(("src/codec/cbor-item-read.lisp" "b9099dc8a8c96281063811e686deb4dcb2b1d39b")))
(defparameter *corpus*
  '(("tests/codec/cbor-item-read-support.lisp" "0326100362a1c4b24d2c7e511e45357f09a56d33")
    ("tests/codec/cbor-item-read.lisp" "b2cbdcb4255c51d9da4fe73b28939c1cb923fefe")
    ("tests/codec/cbor-item-read-threads.lisp" "a0da65545ed80ede0a967cadbb337731f6fe1ce9")))
(defun git-blob (path)
  (string-trim '(#\Newline #\Return) (uiop:run-program (list "git" "hash-object" path) :output :string)))
(defun md5 (path) (format nil "~(~{~2,'0X~}~)" (coerce (sb-md5:md5sum-file path) 'list)))
(defun verify-pins ()
  (dolist (pin (append *sources* *corpus*)) (assert (equal (second pin) (git-blob (first pin)))))
  (assert (equal *method* (git-blob "docs/implementazione/cbor-item-metodo.md")))
  (assert (equal *semantic* (git-blob (concatenate 'string *base* "fixtures-and-mutations.lisp"))))
  (assert (equal *plan* (git-blob "spikes/out/cbor-item-read-20261015/review/blind-plan.md"))))
(defun unique-position (text target)
  (let ((pos (search target text)))
    (assert (and pos (not (search target text :start2 (1+ pos))))) pos))
(defun replace-one (text before after)
  (let ((pos (unique-position text before)))
    (concatenate 'string (subseq text 0 pos) after (subseq text (+ pos (length before))))))
(defun replace-all (text before after)
  (with-output-to-string (out)
    (loop with start = 0 for pos = (search before text :start2 start)
          do (write-string text out :start start :end pos)
          while pos do (write-string after out) (setf start (+ pos (length before))))))
(defun replace-parameter (text name value)
  (let* ((prefix (format nil "(defparameter ~A " name)) (pos (unique-position text prefix)))
    (let ((*read-eval* nil) (*readtable* (copy-readtable nil)))
      (multiple-value-bind (form end) (read-from-string text t nil :start pos)
        (declare (ignore form))
        (concatenate 'string (subseq text 0 pos)
                     (let ((*print-readably* t) (*print-pretty* t))
                       (format nil "(defparameter ~A '~S)" name value)) (subseq text end))))))
(defun write-new (name data)
  (with-open-file (out (concatenate 'string *base* name) :direction :output
                       :if-exists :error :if-does-not-exist :create :external-format :utf-8)
    (let ((*print-readably* t)) (write data :stream out :pretty t) (terpri out))))
(verify-pins)
(let* ((selector '("rg" "--no-filename" "^\\(deftest test-REQ-CBR-008-"
                   "tests/codec/cbor-item-read.lisp" "tests/codec/cbor-item-read-threads.lisp"))
       (selected (uiop:run-program selector :output :string)) (prefix "(deftest ")
       (names (loop for line in (uiop:split-string selected :separator '(#\Newline))
                    unless (zerop (length line)) collect
                    (progn
                      (assert (and (<= (length prefix) (length line))
                                   (string= prefix line :end2 (length prefix))))
                      (let ((name (string-trim '(#\Space #\Tab #\Return) (subseq line (length prefix)))))
                        (assert (every (lambda (c) (or (alphanumericp c) (char= c #\-))) name))
                        (concatenate 'string "ARCDOCDB.CBOR.ITEM.READ.TESTS::" (string-upcase name))))))
       (path "src/codec/cbor-item-read.lisp") (source (uiop:read-file-string path :external-format :utf-8))
       (function-start (unique-position source "(defun leggi-item-cbor-minimo"))
       (function (string-right-trim '(#\Newline #\Return) (subseq source function-start)))
       (public-start (unique-position source "(declaim (ftype (function (t t t t &key"))
       (public (string-right-trim '(#\Newline #\Return) (subseq source public-start)))
       (result "(risultato-struttura-cbor scratch next node-limit depth-limit)")
       (extra (replace-one
                (replace-one public "(values index (integer 0 100) index &optional)"
                             "(values index (integer 0 100) index null &optional)") result
                "(multiple-value-bind (nodes peak position) (risultato-struttura-cbor scratch next node-limit depth-limit) (values nodes peak position nil))"))
       (drain "(svuota-frame-cbor scratch (spazio-cbor-cursor scratch))")
       (drain-wrong (replace-all function drain "(svuota-frame-cbor scratch limit)"))
       (mutants
         (list (list path "generic-scan"
                     "(passo-struttura-cbor bytes scratch limit node-limit depth-limit t)"
                     "(passo-struttura-cbor bytes scratch limit node-limit depth-limit nil)")
               (list path "drain-on-physical-end" function drain-wrong)
               (list path "next-equals-end" result
                     "(multiple-value-bind (nodes peak position) (risultato-struttura-cbor scratch next node-limit depth-limit) (declare (ignore position)) (values nodes peak limit))")
               (list path "node-budget-ignored" "(node-limit (the (integer 1 16777216) max-nodes))"
                     "(node-limit (the (integer 1 16777216) +cbor-scan-max-bytes+))")
               (list path "depth-budget-ignored" "(depth-limit (the (integer 0 100) max-depth))"
                     "(depth-limit (the (integer 0 100) +cbor-scan-max-depth+))")
               (list path "byte-budget-ignored"
                     "(check-input-struttura-cbor buffer start end space max-bytes max-nodes max-depth)"
                     "(check-input-struttura-cbor buffer start end space (progn (identity max-bytes) +cbor-scan-max-bytes+) max-nodes max-depth)")
               (list path "start-skipped" "(begin (the index start))" "(begin (the index 0))")
               (list path "extra-return-value" public extra)))
       (raw (loop for file in (append (mapcar #'first *sources*) (mapcar #'first *corpus*)
                                     (mapcar (lambda (name) (concatenate 'string *base* name))
                                             '("fixtures-and-mutations.lisp" "bench.lisp" "audit.lisp")))
                  collect (list file (md5 file))))
       (catalogue
         (list :schema-version 1 :kind :cbor-item-materialized-catalogue :status :materialized-static-only
               :method-blob *method* :semantic-catalogue-blob *semantic* :corpus-plan-blob *plan*
               :corpus-plan-path "spikes/out/cbor-item-read-20261015/review/blind-plan.md"
               :corpus-plan-declared-api-calls 9901 :api "leggi-item-cbor-minimo"
               :planned-mutant-names (mapcar #'second mutants) :source-files *sources* :corpus-files *corpus*
               :other-driver-blobs (loop for name in '("bench.lisp" "audit.lisp")
                                        collect (list name (git-blob (concatenate 'string *base* name))))
               :raw-md5-pins raw :serial-nominal-tests 16 :parallel-nominal-tests 1
               :frozen-nominal-test-count 17 :nominal-line-selector selector :frozen-def-test-functions names
               :unique-source-substitutions mutants :campaign-executed nil :self-tests-executed nil
               :limits '(:static-materialization-only :source-strings-not-loaded
                         :corpus-only-pinned-digests-and-deftest-name-lines-read
                         :extra-value-mutant-has-coherent-local-ftype :private-per-copy-fasl-cache
                         :no-compilation-or-product-execution-before-c1-and-c4)))
       (draft (uiop:read-file-string (concatenate 'string *base* "mutation-before-product.lisp") :external-format :utf-8)))
  (setf draft (replace-one draft "702c8172ae1ebad30c683fe5eb5ad66f88e434ea" "118c779ca567411675e5dfbb0866b5b17e77c7f0"))
  (setf draft (replace-one draft "1cabd9a00e99e72baa1cc6b8067e4d3c4e4f0916" "6cf528ab25ee0af5d785d501b6072970449a7fa4"))
  (assert (and (= 17 (length names)) (= 17 (length (remove-duplicates names :test #'string=)))))
  (assert (= 2 (loop with start = 0 for pos = (search drain function :start2 start)
                    while pos count pos do (setf start (+ pos (length drain))))))
  (dolist (mutant mutants)
    (unique-position source (third mutant)) (assert (not (string= (third mutant) (fourth mutant)))))
  (with-open-file (out (concatenate 'string *base* "nominal-deftest-lines.txt")
                       :direction :output :if-exists :error :if-does-not-exist :create)
    (write-string selected out))
  (write-new "nominal-whitelist.lisp"
             (list :schema-version 1 :kind :cbor-item-frozen-nominal-whitelist :selector selector
                   :source-pins *corpus* :count 17 :functions names :bodies-read nil :product-loaded nil))
  (write-new "catalogue-materialized.lisp" catalogue)
  (let* ((catalogue-path (concatenate 'string *base* "catalogue-materialized.lisp"))
         (catalogue-blob (git-blob catalogue-path)))
    (dolist (binding (list (list "*catalogue-source-blob*" (second (first *sources*)))
                           (list "*catalogue-source-files*" *sources*) (list "*catalogue-corpus-files*" *corpus*)
                           (list "*catalogue-data-blob*" catalogue-blob)
                           (list "*catalogue-raw-fingerprints*" (append raw (list (list catalogue-path (md5 catalogue-path)))))
                           (list "*mutants*" mutants) (list "*corpus-plan-blob*" *plan*)
                           (list "*corpus-plan-declared-api-calls*" 9901) (list "*expected-corpus-count*" 17)
                           (list "*corpus-frame-functions*" names)
                           (list "*cold-origin-frame*" (format nil "27: (~A)" (first names)))))
      (setf draft (replace-parameter draft (first binding) (second binding))))
    (with-open-file (out (concatenate 'string *base* "mutation.lisp") :direction :output
                         :if-exists :error :if-does-not-exist :create :external-format :utf-8)
      (write-string draft out))
    (verify-pins)
    (format t "catalogue ~A~%mutation ~A~%nominals ~D~%" catalogue-blob
            (git-blob (concatenate 'string *base* "mutation.lisp")) (length names))))
