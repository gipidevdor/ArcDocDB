(require :asdf)
(require :sb-md5)
(defparameter *base* "spikes/out/cbor-tag-write-20261014/drivers/")
(defparameter *method* "3175390e496173398781bf8b39170cb33892125f")
(defparameter *semantic* "3c410448af31a28e99fe39f93261ced04f15860d")
(defparameter *plan* "71f0cbd4f4b9e2c180c2fe4dde208fa8d88a6787")
(defparameter *sources*
  '(("src/codec/cbor-tag-input.lisp" "6dfad07035ac8040b2aec0a455c175ea15dfd9ad")
    ("src/codec/cbor-tag-write.lisp" "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b")))
(defparameter *corpus*
  '(("tests/codec/cbor-tag-write-support.lisp" "15978d05251705387205d6468031a701ad95ec85")
    ("tests/codec/cbor-tag-write.lisp" "df97950ec8d24157bb6566c7995262f7beea7742")
    ("tests/codec/cbor-tag-write-threads.lisp" "def870295400af2c84ca00e7a9b5cd5b747ec315")))
(defun git-blob (path)
  (string-trim '(#\Newline #\Return)
    (uiop:run-program (list "git" "hash-object" path) :output :string)))
(defun md5 (path)
  (format nil "~(~{~2,'0X~}~)" (coerce (sb-md5:md5sum-file path) 'list)))
(defun verify-pins ()
  (dolist (pin (append *sources* *corpus*)) (assert (equal (second pin) (git-blob (first pin)))))
  (assert (equal *method* (git-blob "docs/implementazione/cbor-tag-metodo.md")))
  (assert (equal *semantic* (git-blob (concatenate 'string *base* "fixtures-and-mutations.lisp"))))
  (assert (equal *plan* (git-blob "spikes/out/cbor-tag-write-20261014/review/blind-plan.md"))))
(defun unique-position (text target)
  (let ((pos (search target text)))
    (assert (and pos (not (search target text :start2 (1+ pos))))) pos))
(defun replace-one (text before after)
  (let ((pos (unique-position text before)))
    (concatenate 'string (subseq text 0 pos) after (subseq text (+ pos (length before))))))
(defun replace-parameter (text name value)
  (let* ((prefix (format nil "(defparameter ~A " name)) (pos (unique-position text prefix)))
    (let ((*read-eval* nil) (*readtable* (copy-readtable nil)))
      (multiple-value-bind (form end) (read-from-string text t nil :start pos)
        (declare (ignore form))
        (concatenate 'string (subseq text 0 pos)
                     (let ((*print-readably* t) (*print-pretty* t))
                       (format nil "(defparameter ~A '~S)" name value))
                     (subseq text end))))))
(defun write-new (name data)
  (with-open-file (out (concatenate 'string *base* name) :direction :output
                       :if-exists :error :if-does-not-exist :create :external-format :utf-8)
    (let ((*print-readably* t)) (write data :stream out :pretty t) (terpri out))))
(verify-pins)
(let* ((selector '("rg" "--no-filename" "^\\(deftest test-REQ-CBR-007-"
                   "tests/codec/cbor-tag-write.lisp" "tests/codec/cbor-tag-write-threads.lisp"))
       (selected (uiop:run-program selector :output :string))
       (prefix "(deftest ")
       (names
         (loop for line in (uiop:split-string selected :separator '(#\Newline))
               unless (zerop (length line))
                 collect (progn
                   (assert (and (<= (length prefix) (length line))
                                (string= prefix line :end2 (length prefix))))
                   (let ((name (string-trim '(#\Space #\Tab #\Return) (subseq line (length prefix)))))
                     (assert (every (lambda (c) (or (alphanumericp c) (char= c #\-))) name))
                     (concatenate 'string "ARCDOCDB.CBOR.TAG.WRITE.TESTS::" (string-upcase name))))))
       (write-path "src/codec/cbor-tag-write.lisp")
       (input-path "src/codec/cbor-tag-input.lisp")
       (writer (uiop:read-file-string write-path :external-format :utf-8))
       (input (uiop:read-file-string input-path :external-format :utf-8))
       (public-start (unique-position writer "(declaim (ftype (function (t t t t t t t t t"))
       (public (string-right-trim '(#\Newline #\Return) (subseq writer public-start)))
       (extra (replace-one (replace-one public "(values index &optional)" "(values index null &optional)")
                           "          result)))))" "          (values result nil))))))"))
       (mutants
         (list
          (list input-path "physical-capacity"
                "(dimensioni-tag-cbor start end span high low max-bytes)"
                "(dimensioni-tag-cbor start (length buffer) span high low max-bytes)")
          (list write-path "wrong-major"
                "(scrivi-header-cbor-minimo bytes begin next 6 hi lo)"
                "(scrivi-header-cbor-minimo bytes begin next 5 hi lo)")
          (list write-path "swapped-words"
                "(scrivi-header-cbor-minimo bytes begin next 6 hi lo)"
                "(scrivi-header-cbor-minimo bytes begin next 6 lo hi)")
          (list write-path "scan-omitted"
                "(verifica-contenuto-tag-cbor src source-begin source-limit scratch span max-nodes max-depth)"
                "(progn (identity src) (identity source-begin) (identity source-limit) (identity scratch) (identity span) (identity max-nodes) (identity max-depth) nil)")
          (list input-path "overlap-without-header"
                "(check-overlap-tag-cbor buffer start (+ start item-size) source source-start source-end)"
                "(check-overlap-tag-cbor buffer (+ start header-size) (+ start item-size) source source-start source-end)")
          (list write-path "root-node-excluded"
                ":max-bytes span :max-nodes (1- max-nodes) :max-depth max-depth"
                ":max-bytes span :max-nodes max-nodes :max-depth max-depth")
          (list write-path "tag-depth-charged"
                ":max-bytes span :max-nodes (1- max-nodes) :max-depth max-depth"
                ":max-bytes span :max-nodes (1- max-nodes) :max-depth (1- max-depth)")
          (list write-path "extra-return-value" public extra)))
       (raw
         (loop for path in (append (mapcar #'first *sources*) (mapcar #'first *corpus*)
                                  (mapcar (lambda (name) (concatenate 'string *base* name))
                                          '("fixtures-and-mutations.lisp" "bench.lisp" "audit.lisp")))
               collect (list path (md5 path))))
       (catalogue
         (list :schema-version 1 :kind :cbor-tag-materialized-catalogue
               :status :materialized-static-only :method-blob *method* :semantic-catalogue-blob *semantic*
               :corpus-plan-blob *plan* :corpus-plan-path "spikes/out/cbor-tag-write-20261014/review/blind-plan.md"
               :corpus-plan-declared-api-calls 9658 :api "scrivi-tag-cbor-minimo"
               :planned-mutant-names (mapcar #'second mutants) :source-files *sources* :corpus-files *corpus*
               :other-driver-blobs
               (loop for name in '("bench.lisp" "audit.lisp")
                     collect (list name (git-blob (concatenate 'string *base* name))))
               :raw-md5-pins raw :serial-nominal-tests 19 :parallel-nominal-tests 1
               :frozen-nominal-test-count 20 :nominal-line-selector selector
               :frozen-def-test-functions names :unique-source-substitutions mutants
               :campaign-executed nil :self-tests-executed nil
               :limits '(:static-materialization-only :source-strings-not-loaded
                         :corpus-only-pinned-digests-and-deftest-name-lines-read
                         :post-guards-can-intercept-mutant-before-corruption
                         :no-compilation-or-product-execution-before-c1-and-c4))))
       (draft (uiop:read-file-string (concatenate 'string *base* "mutation-before-product-final.lisp")
                                     :external-format :utf-8)))
  (assert (and (= 20 (length names)) (= 20 (length (remove-duplicates names :test #'string=)))))
  (dolist (mutation mutants)
    (let ((text (if (string= input-path (first mutation)) input writer)))
      (unique-position text (third mutation))
      (assert (not (string= (third mutation) (fourth mutation))))))
  (with-open-file (out (concatenate 'string *base* "nominal-deftest-lines.txt")
                       :direction :output :if-exists :error :if-does-not-exist :create)
    (write-string selected out))
  (write-new "nominal-whitelist.lisp"
             (list :schema-version 1 :kind :cbor-tag-frozen-nominal-whitelist
                   :selector selector :source-pins *corpus* :count 20 :functions names
                   :bodies-read nil :product-loaded nil))
  (write-new "catalogue-materialized.lisp" catalogue)
  (let* ((catalogue-path (concatenate 'string *base* "catalogue-materialized.lisp"))
         (catalogue-blob (git-blob catalogue-path)))
    (dolist (binding
              (list (list "*catalogue-source-blob*" (second (second *sources*)))
                    (list "*catalogue-source-files*" *sources*)
                    (list "*catalogue-corpus-files*" *corpus*)
                    (list "*catalogue-data-blob*" catalogue-blob)
                    (list "*catalogue-raw-fingerprints*" (append raw (list (list catalogue-path (md5 catalogue-path)))))
                    (list "*mutants*" mutants) (list "*corpus-plan-blob*" *plan*)
                    (list "*corpus-plan-declared-api-calls*" 9658)
                    (list "*expected-corpus-count*" 20) (list "*corpus-frame-functions*" names)
                    (list "*cold-origin-frame*" (format nil "27: (~A)" (first names)))))
      (setf draft (replace-parameter draft (first binding) (second binding))))
    (with-open-file (out (concatenate 'string *base* "mutation.lisp") :direction :output
                         :if-exists :supersede :if-does-not-exist :error :external-format :utf-8)
      (write-string draft out))
    (verify-pins)
    (format t "catalogue ~A~%mutation ~A~%nominals ~D~%" catalogue-blob
            (git-blob (concatenate 'string *base* "mutation.lisp")) (length names))))
