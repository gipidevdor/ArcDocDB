(in-package #:arcdocdb.verify.tests)

;;; REQ: REQ-AFF-010 REQ-REC-004
(deftest test-REQ-AFF-010-mixed-format-empty-active-and-decisions
  (et::with-root (root)
    (et::with-root (other)
      (data-store root 2 0)
      (data-store other 1 0)
      (dolist (target '(:decisions :active))
        (let* ((name (if (eq target :decisions) "multiserie.log"
                         (file-namestring (segment-path root
                           (find :active (getf (inspect-store root) :segments)
                                 :key (lambda (row) (getf row :state)))))))
               (path (merge-pathnames name root)) (original (et::image path)))
          (write-fixture path (et::image (merge-pathnames name other)))
          (let ((failure (refusal root (if (eq target :decisions) :decisions :record-order)
                          (lambda () (inspect-store root)))))
            (is (typep (v:verification-primary failure) 'arcdocdb.conditions:unsupported-format)))
          (write-fixture path original)
          (is (eq :clean (getf (inspect-store root) :status))))))))

;;; REQ: REQ-AFF-010 REQ-AFF-002 REQ-REC-004
(deftest test-REQ-AFF-010-header-and-committed-body-corruption
  (dolist (target '(:control :decisions :active-header :active-body :closed-body))
    (et::with-root (root)
      (data-store root 2)
      (when (eq target :closed-body)
        (et::with-engine (engine (et::open-engine root)) (et::check-frontier engine 3)))
      (let* ((report (inspect-store root))
             (path (case target
                     (:control (merge-pathnames "control.log" root))
                     (:decisions (merge-pathnames "multiserie.log" root))
                     (otherwise (segment-path root
                       (find-if (lambda (row) (and (eq (if (eq target :closed-body) :closed :active)
                                                       (getf row :state)) (> (getf row :valid-prefix) 64)))
                                (getf report :segments))))))
             (original (et::image path)))
        (damage-fixture path (if (member target '(:active-body :closed-body)) 104 8))
        (let ((failure (refusal root (case target (:control :control) (:decisions :decisions) (otherwise :segments))
                                (lambda () (inspect-store root)))))
          (is (typep (v:verification-primary failure) 'arcdocdb.conditions:corruption-detected))
          (is (string= (file-namestring path) (v:verification-file failure))))
        (write-fixture path original)
        (is (eq :clean (getf (inspect-store root) :status)))))))

;;; REQ: REQ-AFF-010 REQ-AFF-018
(deftest test-REQ-AFF-010-missing-source-and-unknown-final-preserved
  (dolist (missing '(t nil))
    (et::with-root (root)
      (data-store root 2)
      (if missing
          (delete-file (segment-path root (find :active (getf (inspect-store root) :segments)
                                                :key (lambda (row) (getf row :state)))))
          (write-fixture (merge-pathnames "00000000000000f0.seg" root) #(1 2 3)))
      (let ((failure (refusal root :inventory (lambda () (inspect-store root)) :verify-inventory-not-ready)))
        (is (v:verification-actions failure))))))

;;; REQ: REQ-AFF-010 REQ-AFF-008
(deftest test-REQ-AFF-010-config-and-resource-refusals
  (et::with-root (root)
    (data-store root 2)
    (dolist (options '((:max-file-bytes 0) (:max-segments 0) (:max-records 65537)))
      (let ((before (store-image root)))
        (signals arcdocdb.conditions:invalid-argument
          (apply #'v:verifica-storage-m1 root (et::archive-id) (et::series-id) options) :verify-configuration)
        (check-unchanged root before)))
    (let ((failure (refusal root :control
                     (lambda () (v:verifica-storage-m1 root (et::archive-id) (et::series-id)
                                      :max-file-bytes 8192 :max-segments 1 :max-records 32))
                     :verify-segment-budget)))
      (is (typep (v:verification-primary failure) 'arcdocdb.conditions:resource-exhausted)))
    (let ((wrong (et::archive-id)))
      (setf (aref wrong 15) 0)
      (refusal root :decisions (lambda () (v:verifica-storage-m1 root wrong (et::series-id)))))
    (let ((wrong (et::series-id)))
      (setf (aref wrong 15) 0)
      (refusal root :control (lambda () (v:verifica-storage-m1 root (et::archive-id) wrong))))))

;;; REQ: REQ-AFF-010 REQ-AFF-011
(deftest test-REQ-AFF-010-running-engine-excluded-and-lock-released
  (et::with-root (root)
    (et::with-engine (engine (et::open-engine root :create t))
      (let ((failure (refusal root :lock (lambda () (inspect-store root)))))
        (is (typep (v:verification-primary failure) 'arcdocdb.conditions:io-fault)))
      (is (= 1 (e:scrivi-documento engine (et::key 1) (et::value 1)))))
    (is (eq :clean (getf (inspect-store root) :status)))))

;;; REQ: REQ-AFF-010 REQ-AFF-004 REQ-AFF-013
(deftest test-REQ-AFF-010-injected-cleanup-keeps-primary-no-native-fallback
  (let* ((closed 0) (primary (make-condition 'arcdocdb.conditions:io-fault
                             :reason :fixture-lock-failure :operation :directory-lock))
         (cleanup (make-condition 'arcdocdb.conditions:io-fault :reason :fixture-close-failure :operation :close))
         (backend (arcdocdb.io:make-backend
                   (lambda (path mode) (declare (ignore path mode)) 0)
                   (lambda (&rest args) (declare (ignore args)) (error "Unexpected read"))
                   (lambda (&rest args) (declare (ignore args)) (error "Unexpected write"))
                   (lambda (fd) (declare (ignore fd)) (error "Unexpected flush"))
                   (lambda (fd) (declare (ignore fd)) (error "Unexpected directory flush"))
                   (lambda (fd) (is (= fd 0)) (incf closed) (error cleanup))
                   :directory-lock (lambda (fd) (is (= fd 0)) (error primary)))))
    (handler-case
        (progn (v:verifica-storage-m1 "/not-opened-native/" (et::archive-id) (et::series-id) :backend backend)
               (error "Expected rejection"))
      (v:verification-error (condition)
        (is (eq primary (v:verification-primary condition)))
        (is (equal (list cleanup) (v:verification-cleanup condition)))))
    (is (= closed 1))))
