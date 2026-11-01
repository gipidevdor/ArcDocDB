;;;; Serial actor order and per-connection result/ownership oracles; no timing assumptions.
(in-package #:arcdocdb.local.server.tests)
(defun conditional-pending (key token &optional (operation 1) (document (bytes #xf6)) (deadline 100))
  (let ((connection (l::make-local-connection :limit 65536 :versions t :state :pending :deadline deadline)))
    (setf (l::local-connection-pending connection) (version-envelope connection operation key (when (= operation 1) document) token)) connection))
(defun conditional-response (connection &optional (operation 1))
  (let* ((buffer (l::local-connection-output connection)) (end (l::local-connection-size connection)))
    (l::decode-local-version-response buffer (l:decode-local-envelope buffer 4 end) (l::local-connection-space connection) operation)))
(defun conditional-queue-cleared (queue)
  (is (zerop (l::local-write-queue-count queue)))
  (is (every #'null (l::local-write-queue-connections queue))) (is (every #'null (l::local-write-queue-operations queue)))
  (dolist (array (list (l::local-write-queue-conditions queue) (l::local-write-queue-expected queue)
                       (l::local-write-queue-csns queue) (l::local-write-queue-applied queue))) (is (every #'zerop array))))
(defun conditional-turn (engine connections &key (clock (lambda () 10)) (limit 8))
  (let ((queue (l::make-local-write-queue :limit limit)))
    (l::dispatch-local-ready engine connections clock queue) (conditional-queue-cleared queue)))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-conditional-group-deadline-after-encoding-before-queue
  (let ((now 0))
    (with-engine (engine root :create t)
      (e:scrivi-documento engine (bytes 1) (bytes #xf6))
      (let ((original (symbol-function 'l::encode-local-version-response))
            (connection (conditional-pending (bytes 1) 0 0 nil 5)))
        (unwind-protect
             (progn
               (setf (symbol-function 'l::encode-local-version-response)
                     (lambda (&rest args) (prog1 (apply original args) (setf now 5))))
               (conditional-turn engine (vector connection) :clock (lambda () now))
               (is (eq :closed (l::local-connection-state connection))) (arcdocdb.engine.tests::check-frontier engine 1))
          (setf (symbol-function 'l::encode-local-version-response) original))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-002 REQ-LIM-003
(deftest test-REQ-IPC-002-conditional-group-admin-limits-and-partial-peer
  (dolist (limit '(1 2 8))
    (with-engine (engine root :create t)
      (let ((connections (make-array 6)) (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush)))
        (dotimes (i 5) (setf (aref connections i) (conditional-pending (bytes i) 0)))
        (setf (aref connections 5) (l::make-local-connection :state :request))
        (unwind-protect
             (progn (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (fd) (incf flushes) (funcall original fd)))
                    (conditional-turn engine connections :limit limit)
                    (is (= flushes (ceiling 5 limit)))
                    (dotimes (i 5) (is (equal (list :applied (1+ i)) (multiple-value-list (conditional-response (aref connections i))))))
                    (is (eq :request (l::local-connection-state (aref connections 5))))
                    (arcdocdb.engine.tests::check-frontier engine 5))
          (setf (symbol-function 'arcdocdb.io:durable-flush) original))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-conditional-group-unnegotiated-request-is-barrier
  (with-engine (engine root :create t)
    (let ((a (conditional-pending (bytes 1) 0)) (bad (conditional-pending (bytes 9) 0))
          (b (conditional-pending (bytes 2) 0)) (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush)))
      (setf (l::local-connection-versions bad) nil)
      (unwind-protect
           (progn
             (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (fd) (incf flushes) (funcall original fd)))
             (conditional-turn engine (vector a bad b)) (is (= flushes 2))
             (signals l:request-rejected (conditional-response bad))
             (is (equal '(:applied 1) (multiple-value-list (conditional-response a))))
             (is (equal '(:applied 2) (multiple-value-list (conditional-response b))))
             (arcdocdb.engine.tests::check-frontier engine 2))
        (setf (symbol-function 'arcdocdb.io:durable-flush) original)))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-WAL-002 REQ-WAL-006 REQ-IDX-013
(deftest test-REQ-TXS-002-conditional-group-actor-independent-mixed-one-flush
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t version mode)) (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush))
            (a (conditional-pending (bytes 1) 0)) (b (conditional-pending (bytes 2) 99)) (c (group-pending 1 1 (bytes 3) (bytes #xf6))))
        (unwind-protect
             (progn
               (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (fd) (incf flushes) (funcall original fd)))
               (conditional-turn engine (vector a b c))
               (is (= flushes 1)) (is (equal '(:applied 1) (multiple-value-list (conditional-response a))))
               (is (equal '(:conflict 0) (multiple-value-list (conditional-response b)))) (is (= 2 (group-response c 1)))
               (arcdocdb.engine.tests::check-frontier engine 2))
          (setf (symbol-function 'arcdocdb.io:durable-flush) original) (e:chiudi-motore engine)))))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-WAL-006
(deftest test-REQ-TXS-002-conditional-group-actor-same-key-ABA-barriers
  (with-engine (engine root :create t)
    (let* ((first (group-pending 1 1 (bytes 1) (bytes 0))) (a (conditional-pending (bytes 1) 1))
           (b (conditional-pending (bytes 1) 1)) (delete (conditional-pending (bytes 1) 2 3))
           (insert (conditional-pending (bytes 1) 0)) (stale (conditional-pending (bytes 1) 2 3)))
      (conditional-turn engine (vector first a b delete insert stale))
      (is (= 1 (group-response first 1)))
      (is (equal '(:applied 2) (multiple-value-list (conditional-response a))))
      (is (equal '(:conflict 2) (multiple-value-list (conditional-response b))))
      (is (equal '(:applied 3) (multiple-value-list (conditional-response delete 3))))
      (is (equal '(:applied 4) (multiple-value-list (conditional-response insert))))
      (is (equal '(:conflict 4) (multiple-value-list (conditional-response stale 3))))
      (arcdocdb.engine.tests::check-frontier engine 4))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-WAL-006
(deftest test-REQ-IPC-002-conditional-group-read-ping-and-versioned-get-barriers
  (with-engine (engine root :create t)
    (let* ((a (conditional-pending (bytes 1) 0)) (read (read-connection)) (b (conditional-pending (bytes 2) 0))
           (ping (group-pending 1 0 nil)) (c (conditional-pending (bytes 3) 0))
           (get (conditional-pending (bytes 3) 0 0)))
      (setf (l::local-connection-pending read) (read-envelope read (vector (bytes 1))))
      (conditional-turn engine (vector a read b ping c get))
      (is (equalp (vector (bytes #xf6)) (read-result read (l::local-connection-size read) 1)))
      (is (null (group-response ping 0)))
      (is (equalp (list :found (bytes #xf6) 3) (multiple-value-list (conditional-response get 0))))
      (arcdocdb.engine.tests::check-frontier engine 3))))

;;; REQ: REQ-IPC-002 REQ-TXS-003 REQ-LIM-003 REQ-WAL-006
(deftest test-REQ-TXS-003-conditional-group-expiration-keeps-condition-owner-aligned
  (with-engine (engine root :create t)
    (e:scrivi-documento engine (bytes 2) (bytes 0))
    (let* ((queue (l::make-local-write-queue)) (a (conditional-pending (bytes 1) 0)) (b (conditional-pending (bytes 2) 1))
           (c (conditional-pending (bytes 3) 99)))
      (l::dispatch-local-pending engine a queue (lambda () 0))
      (l::dispatch-local-pending engine b queue (lambda () 0))
      (l::dispatch-local-pending engine c queue (lambda () 0))
      (setf (l::local-connection-deadline a) 1)
      (l::flush-local-write-queue engine queue (lambda () 2))
      (is (eq :closed (l::local-connection-state a)))
      (is (equal '(:applied 2) (multiple-value-list (conditional-response b))))
      (is (equal '(:conflict 0) (multiple-value-list (conditional-response c))))
      (arcdocdb.engine.tests::check-frontier engine 2) (conditional-queue-cleared queue))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-conditional-group-capacity-fallback-rechecks-original-conditions
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (read-test-open root t 2 :resident :records 1)))
      (unwind-protect
           (let ((a (conditional-pending (bytes 1) 0)) (b (conditional-pending (bytes 2) 0)) (c (conditional-pending (bytes 3) 99)))
             (conditional-turn engine (vector a b c))
             (is (equal '(:applied 1) (multiple-value-list (conditional-response a))))
             (is (equal '(:applied 2) (multiple-value-list (conditional-response b))))
             (is (equal '(:conflict 0) (multiple-value-list (conditional-response c))))
             (arcdocdb.engine.tests::check-frontier engine 2))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-conditional-group-expired-after-commit-never-acknowledged
  (let ((now 0))
    (with-engine (engine root :create t :observer (lambda (engine phase) (declare (ignore engine))
                                                  (when (eq phase :after-flush) (setf now 10)) nil))
      (let ((a (conditional-pending (bytes 1) 0 1 (bytes #xf6) 5)) (b (conditional-pending (bytes 2) 0 1 (bytes #xf6) 5)))
        (conditional-turn engine (vector a b) :clock (lambda () now))
        (is (eq :closed (l::local-connection-state a))) (is (eq :closed (l::local-connection-state b)))
        (arcdocdb.engine.tests::check-frontier engine 2)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-conditional-group-encoder-error-never-falls-back
  (with-engine (engine root :create t)
    (let ((original (symbol-function 'l::encode-local-version-response))
          (cause (make-condition 'arcdocdb.conditions:resource-exhausted :reason :conditional-encoder-fi))
          (queue (l::make-local-write-queue)) (a (conditional-pending (bytes 1) 0)) (b (conditional-pending (bytes 2) 0)) (caught nil))
      (unwind-protect
           (progn
             (setf (symbol-function 'l::encode-local-version-response) (lambda (&rest args) (declare (ignore args)) (error cause)))
             (handler-case (l::dispatch-local-ready engine (vector a b) (lambda () 10) queue)
               (error (seen) (is (eq cause seen)) (setf caught t)))
             (is caught) (arcdocdb.engine.tests::check-frontier engine 2)
             (is (eq :ready (e:stato-motore engine))) (conditional-queue-cleared queue))
        (setf (symbol-function 'l::encode-local-version-response) original)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004
(deftest test-REQ-AFF-004-conditional-group-nonlocal-exit-clears-collector
  (with-engine (engine root :create t)
    (let ((original (symbol-function 'e::scrivi-gruppo-con-condizioni)) (queue (l::make-local-write-queue)))
      (unwind-protect
           (progn
             (setf (symbol-function 'e::scrivi-gruppo-con-condizioni) (lambda (&rest args) (declare (ignore args)) (throw 'group :escaped)))
             (is (eq :escaped (catch 'group (l::dispatch-local-ready engine
                                               (vector (conditional-pending (bytes 1) 0) (conditional-pending (bytes 2) 0))
                                               (lambda () 10) queue))))
             (conditional-queue-cleared queue) (arcdocdb.engine.tests::check-frontier engine 0))
        (setf (symbol-function 'e::scrivi-gruppo-con-condizioni) original)))))
