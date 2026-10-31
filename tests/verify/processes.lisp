(in-package #:arcdocdb.verify.tests)

;;; REQ: REQ-AFF-010 REQ-AFF-007 REQ-REC-004 REQ-AFF-009
(deftest test-REQ-AFF-010-before-recovery-two-real-SIGKILL-v1-v2
  (dolist (version '(1 2))
    (dolist (stage '("plain" "tail"))
      (et::with-root (root)
        ;; Existing C4 children exercise only real engine startup/requests and confirm SIGKILL.
        ;; Verification runs BEFORE recovery; it cannot create a replacement ACTIVE or checkpoint.
        (et::child root version "write" stage :signaled 9)
        (let* ((storage (merge-pathnames "storage/" root)) (before (store-image storage))
               (report (inspect-store storage)))
          (is (eq (if (string= stage "plain") :clean :attention) (getf report :status)))
          (is (= 5 (getf report :max-csn) (getf report :records)))
          (is (= (if (string= stage "tail") 13 0) (getf report :noncanonical-bytes)))
          (check-unchanged storage before))
        (et::child root version "resume" "plain" :signaled 9)
        (let* ((storage (merge-pathnames "storage/" root)) (before (store-image storage))
               (report (inspect-store storage)))
          (is (eq (if (string= stage "plain") :clean :attention) (getf report :status)))
          (is (= 9 (getf report :max-csn) (getf report :records)))
          (check-unchanged storage before))
        ;; Independent existing value/tombstone oracle after the second inspection.
        (et::child root version "verify" "plain" :exited 0)))))
