(in-package #:arcdocdb.verify.tests)

;;; REQ: REQ-AFF-010 REQ-AFF-008
(deftest test-REQ-AFF-010-cli-argument-fixtures
  (multiple-value-bind (out err code) (run-verifier-cli "--self-test")
    (declare (ignore err)) ; outer command preserves toolchain diagnostics.
    (is (= 0 code)) (is (eq :ok (getf (read-cli-result out) :status))))
  (dolist (args '(nil ("/unused/" "00" "00")
                  ("/unused/" "49494949494949494949494949494949" "29292929292929292929292929292929"
                   "--max-records" "-1")))
    (multiple-value-bind (out err code) (apply #'run-verifier-cli args)
      (declare (ignore err))
      (is (= 1 code)) (is (eq :failed (getf (read-cli-result out) :status))))))

;;; REQ: REQ-AFF-010 REQ-AFF-018
(deftest test-REQ-AFF-010-cli-clean-attention-corruption
  (et::with-root (root)
    (data-store root 2)
    (let ((base (list (namestring root) "49494949494949494949494949494949" "29292929292929292929292929292929"
                      "--max-file-bytes" "8192" "--max-records" "32" "--max-segments" "16")))
      (let ((before (store-image root)))
        (multiple-value-bind (out err code) (apply #'run-verifier-cli base)
          (declare (ignore err))
          (is (= 0 code)) (is (eq :clean (getf (read-cli-result out) :status))))
        (check-unchanged root before))
      (write-fixture (merge-pathnames "unverified.idx" root) #(1 2 3))
      (let ((before (store-image root)))
        (multiple-value-bind (out err code) (apply #'run-verifier-cli base)
          (declare (ignore err))
          (is (= 2 code)) (is (eq :attention (getf (read-cli-result out) :status))))
        (check-unchanged root before))
      (damage-fixture (merge-pathnames "control.log" root) 8)
      (let ((before (store-image root)))
        (multiple-value-bind (out err code) (apply #'run-verifier-cli base)
          (declare (ignore err))
          (is (= 1 code)) (is (eq :failed (getf (read-cli-result out) :status))))
        (check-unchanged root before)))))
