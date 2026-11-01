(in-package #:arcdocdb.backup.tests)

(defun cli (&rest arguments)
  (uiop:run-program (append (list (namestring sb-ext:*runtime-pathname*) "--noinform" "--no-userinit"
                                  "--no-sysinit" "--script" "tools/arcdocdb-backup.lisp") arguments)
                    :output :string :error-output :string :ignore-error-status t))
(defun cli-check (expected &rest arguments)
  (multiple-value-bind (output errors code) (apply #'cli arguments)
    (declare (ignore errors)) (is (= expected code)) (vt::read-cli-result output)))

;;; REQ: REQ-AFF-014 REQ-AFF-008 REQ-VAL-001
(deftest test-REQ-AFF-014-real-CLI-create-verify-compare-restore-and-rejections
  (is (eq :ok (getf (cli-check 0 "--self-test") :status)))
  (is (eq :failed (getf (cli-check 1 "verify" "/missing/" "bad" "bad") :status)))
  (et::with-root (root)
    (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root))
           (restored (merge-pathnames "restored/" root))
           (archive "49494949494949494949494949494949") (series "29292929292929292929292929292929")
           (before (vt::store-image source)))
      (cli-check 0 "create" (namestring source) (namestring copy) archive series)
      (cli-check 0 "verify" (namestring copy) archive series)
      (is (eq :identical (getf (cli-check 0 "compare" (namestring source) (namestring copy) archive series) :status)))
      (cli-check 0 "restore" (namestring copy) (namestring restored) archive series)
      (is (equalp before (vt::store-image source)))
      (is (equalp before (vt::store-image restored)))
      (cli-check 1 "restore" (namestring copy) (namestring restored) archive series)
      (et::with-engine (engine (et::open-engine source)) (e:scrivi-documento engine (et::key 5) (et::value 5)))
      (is (eq :different (getf (cli-check 2 "compare" (namestring source) (namestring copy) archive series) :status))))))
