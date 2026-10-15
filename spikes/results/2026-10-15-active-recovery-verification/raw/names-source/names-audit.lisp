;;;; C4: confronto dei nomi nativi, con fixture positive e negative.
(require :asdf)
(load "tools/evidence-storage.lisp")
(declaim (optimize (safety 3) (debug 3)))
(defparameter *names-auditor-source* *load-truename*)

(defun observed-active-recovery-names (output)
  "Estrae soltanto righe native ok della suite ACTIVE-RECOVERY, senza eseguirle."
  (assert (<= (length output) (* 32 1024 1024)))
  (let ((lines (uiop:split-string output :separator (string #\Newline))))
    (assert (<= (length lines) 100000))
    (loop for line in lines
          when (and (uiop:string-prefix-p "ok    " line) (search "ACTIVE-RECOVERY" line))
            collect (string-trim '(#\Space #\Tab #\Return) (subseq line 6)))))

(defun names-fixture (names)
  (format nil "~{ok    ~A~%~}" names))

(defun verify-names-fixtures (names)
  (assert (equal names (observed-active-recovery-names (names-fixture names))))
  (dolist (variant (list (rest names) (reverse names) (append names (list (first names)))))
    (let ((observed (observed-active-recovery-names (names-fixture variant))))
      (assert (not (equal names observed)))))
  4)

(defun audit-native-names (counter-path core-path expected-commit)
  (let* ((counter (arcdocdb.evidence:read-evidence counter-path))
         (core (arcdocdb.evidence:read-evidence core-path))
         (row (find "ARCDOCDB.RECOVERY.ACTIVE.TESTS" (getf counter :suites)
                    :test #'string= :key (lambda (item) (getf item :package))))
         (names (getf row :test-names)))
    (assert (and (eq :ok (getf counter :status)) (= 27 (length names))
                 (equal expected-commit (getf counter :commit))))
    (assert (and (eq :ok (getf core :status)) (eql 0 (getf core :exit-code))
                 (eq :stable (getf core :source-consistency))
                 (equal expected-commit (getf (getf core :environment) :commit))))
    (let ((fixtures (verify-names-fixtures names))
          (actual (observed-active-recovery-names (getf core :stdout))))
      (assert (equal names actual))
      (assert (search (getf row :native-line) (getf core :stdout)))
      (list :schema-version 1 :kind :recovery-active-native-names-audit :status :ok
            :commit expected-commit :counter counter-path :core core-path
            :counter-sha256 (arcdocdb.evidence:file-sha256 counter-path)
            :auditor-sha256 (arcdocdb.evidence:file-sha256 *names-auditor-source*)
            :count (length actual) :ordered-native-test-names actual
            :positive-and-negative-fixtures fixtures
            :limits '(:read-eval-disabled :one-form-and-eof :no-evidence-or-fasl-load
                      :no-product-execution :no-c1-or-performance-claim)))))

(handler-case
    (let ((arguments (uiop:command-line-arguments)))
      (assert (= 3 (length arguments)))
      (write (apply #'audit-native-names arguments) :pretty t)
      (terpri))
  (error (condition)
    (write (list :schema-version 1 :kind :recovery-active-native-names-audit
                 :status :failed :diagnostic (princ-to-string condition)) :pretty t)
    (terpri)
    (sb-ext:exit :code 1)))
