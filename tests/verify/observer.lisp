(in-package #:arcdocdb.verify.tests)

;;; REQ: REQ-AFF-010 REQ-AFF-004 REQ-REC-004
(deftest test-REQ-AFF-010-source-observer-contract
  ;; Private FI fixture for the notification helper only; expected identity is literal,
  ;; no decoder or verifier output computes it. No real file or data read is involved.
  (arcdocdb.io.tests::with-file
      (file (arcdocdb.io:apri-lettura "fixture" :backend (arcdocdb.io.tests::backend)))
    (let* ((entry (arcdocdb.recovery.manifest::%make-recovery-source
                   7 :active :final (map 'simple-base-string #'identity "0000000000000007.seg")))
           (sources (arcdocdb.recovery.manifest::%make-recovery-sources (vector entry))) (seen nil))
      (setf (arcdocdb.recovery.manifest::%rs-file entry) file)
      (is (null (arcdocdb.recovery.series::notifica-fonte-serie sources 0 nil)))
      (is (null (arcdocdb.recovery.series::notifica-fonte-serie sources 0
                  (lambda (id state form) (push (list id state form) seen) nil))))
      (is (equal '((7 :active :final)) seen))
      (signals arcdocdb.conditions:invariant-violation
        (arcdocdb.recovery.series::notifica-fonte-serie sources 0
          (lambda (id state form) (declare (ignore id state form)) :invalid)) :series-recovery-observer-result)
      (let ((cause (make-condition 'arcdocdb.conditions:resource-exhausted :reason :fixture-observer)))
        (handler-case
            (progn (arcdocdb.recovery.series::notifica-fonte-serie sources 0
                     (lambda (id state form) (declare (ignore id state form)) (error cause)))
                   (error "Missing observer failure"))
          (arcdocdb.conditions:resource-exhausted (observed) (is (eq cause observed)))))
      (is (eq :open (arcdocdb.io:stato-file file))))))

;;; REQ: REQ-AFF-010 REQ-AFF-004 REQ-AFF-013
(deftest test-REQ-AFF-010-foreign-exit-releases-directory-once
  (let* ((closed 0)
         (unused (lambda (&rest args) (declare (ignore args)) (error "Unexpected I/O")))
         (backend (arcdocdb.io:make-backend
                    (lambda (name mode) (declare (ignore name mode)) 0)
                    unused unused unused unused
                    (lambda (fd) (is (= fd 0)) (incf closed) 0)
                    :directory-lock (lambda (fd) (is (= fd 0)) (throw 'verification-exit :left)))))
    (is (eq :left (catch 'verification-exit
                    (v:verifica-storage-m1 "/fixture/" (et::archive-id) (et::series-id) :backend backend))))
    (is (= 1 closed))))
