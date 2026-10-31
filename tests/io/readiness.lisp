(in-package #:arcdocdb.io.tests)
;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-readiness-domains-and-borrowed-fd-zero
  (dolist (n '(nil 0 10 1.5 1/2)) (signals invalid-argument (arcdocdb.io::crea-attesa-io n)))
  (signals invalid-argument (arcdocdb.io::crea-attesa-io 1 :backend t))
  (is (= 72 (length (arcdocdb.io::attesa-io-buffer (arcdocdb.io::crea-attesa-io 9)))))
  (let* ((wait (arcdocdb.io::crea-attesa-io 1)) (buffer (arcdocdb.io::attesa-io-buffer wait)))
    (dolist (args '((-1 0 :input) (1 0 :input) (nil 0 :input) (0 -1 :input)
                    (0 2147483648 :input) (0 0 :invalid)))
      (signals invalid-argument (apply #'arcdocdb.io::configura-attesa-io wait args)))
    (arcdocdb.io::configura-attesa-io wait 0 0 :input)
    (is (= 0 (arcdocdb.binary:leggi-u32 buffer 0))) (is (= 1 (arcdocdb.binary:leggi-u16 buffer 4)))
    (arcdocdb.io::configura-attesa-io wait 0 0 :output)
    (is (= 4 (arcdocdb.binary:leggi-u16 buffer 4)))
    (arcdocdb.io::configura-attesa-io wait 0 nil :input)
    (is (= #xffffffff (arcdocdb.binary:leggi-u32 buffer 0))) (is (zerop (arcdocdb.binary:leggi-u16 buffer 4)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-LIM-003
(deftest test-REQ-IPC-002-readiness-timeout-interruption-and-faults
  (let ((calls 0))
    (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                  (lambda (buffer n ms) (declare (ignore buffer n ms)) (incf calls) (values -1 sb-posix:eintr)))))
      (is (eq :interrupted (arcdocdb.io::attendi-io wait 100))) (is (= calls 1))))
  (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                (lambda (buffer n ms) (declare (ignore buffer n ms)) (values 0 0)))))
    (dolist (ms '(-1 101 nil 1/2)) (signals invalid-argument (arcdocdb.io::attendi-io wait ms)))
    (is (eq :timeout (arcdocdb.io::attendi-io wait 0)))
    (is (eq :timeout (arcdocdb.io::attendi-io wait 100))))
  (dolist (result (list '(10 0) '(2 0) '(-2 1) '(nil 0) (list 0 sb-posix:eio) '(-1 0) '(0 nil) '(0 -1)))
    (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                  (lambda (buffer n ms) (declare (ignore buffer n ms)) (values-list result)))))
      (signals invariant-violation (arcdocdb.io::attendi-io wait 0))))
  (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                (lambda (buffer n ms) (declare (ignore buffer n ms)) (values -1 sb-posix:eio)))))
    (signals io-fault (arcdocdb.io::attendi-io wait 1))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-IPC-002-readiness-flags-counts-and-reset
  (dolist (flags '(1 8 16 24))
    (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                  (lambda (buffer n ms) (declare (ignore n ms))
                    (arcdocdb.binary:scrivi-u16 buffer 6 flags) (values 1 0)))))
      (arcdocdb.io::configura-attesa-io wait 0 0 :input)
      (is (eq :ready (arcdocdb.io::attendi-io wait 0)))))
  (dolist (row '((128 1 invariant-violation) (32 1 io-fault) (0 1 invariant-violation)
                 (1 0 invariant-violation) (4 1 invariant-violation)))
    (destructuring-bind (flags count type) row
      (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                    (lambda (buffer n ms) (declare (ignore n ms))
                      (arcdocdb.binary:scrivi-u16 buffer 6 flags) (values count 0)))) (caught nil))
        (arcdocdb.io::configura-attesa-io wait 0 0 :input)
        (handler-case (arcdocdb.io::attendi-io wait 0) (error (c) (setf caught c)))
        (is (typep caught type)))))
  (let ((calls 0))
    (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                  (lambda (buffer n ms) (declare (ignore n ms))
                    (is (zerop (arcdocdb.binary:leggi-u16 buffer 6)))
                    (incf calls)
                    (if (= calls 1) (progn (arcdocdb.binary:scrivi-u16 buffer 6 1) (values 1 0)) (values 0 0))))))
      (arcdocdb.io::configura-attesa-io wait 0 0 :input)
      (arcdocdb.io::attendi-io wait 0) (is (eq :timeout (arcdocdb.io::attendi-io wait 0)))))
  (let ((wait (arcdocdb.io::crea-attesa-io 1 :backend
                (lambda (buffer n ms) (declare (ignore n ms))
                  (arcdocdb.binary:scrivi-u16 buffer 6 8) (values 1 0)))))
    (signals invariant-violation (arcdocdb.io::attendi-io wait 0))))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(deftest test-REQ-IPC-002-readiness-real-pipe-input-output-and-hup
  (multiple-value-bind (reader writer) (sb-posix:pipe)
    (let ((wait (arcdocdb.io::crea-attesa-io 1)) (data (zeros 1)))
      (unwind-protect
           (progn
             (arcdocdb.io::configura-attesa-io wait 0 reader :input)
             (is (eq :timeout (arcdocdb.io::attendi-io wait 0)))
             (arcdocdb.io::configura-attesa-io wait 0 writer :output)
             (is (eq :ready (arcdocdb.io::attendi-io wait 0)))
             (sb-sys:with-pinned-objects (data)
               (is (= 1 (sb-posix:write writer (sb-sys:vector-sap data) 1))))
             (arcdocdb.io::configura-attesa-io wait 0 reader :input)
             (is (eq :ready (arcdocdb.io::attendi-io wait 0)))
             (sb-sys:with-pinned-objects (data)
               (is (= 1 (sb-posix:read reader (sb-sys:vector-sap data) 1))))
             (is (eq :timeout (arcdocdb.io::attendi-io wait 0)))
             (sb-posix:close writer) (setf writer nil)
             (is (eq :ready (arcdocdb.io::attendi-io wait 10)))
             (is (sb-posix:fstat reader)))
        (sb-posix:close reader) (when writer (sb-posix:close writer))))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-IPC-002-readiness-owner-reentry-and-nonlocal-cleanup
  (let ((wait nil) (mode :unwind))
    (setf wait (arcdocdb.io::crea-attesa-io 1 :backend
                 (lambda (buffer n ms) (declare (ignore buffer n ms))
                   (case mode
                     (:unwind (throw 'readiness-exit :released))
                     (:reentry (arcdocdb.io::attendi-io wait 0))
                     (:configure (arcdocdb.io::configura-attesa-io wait 0 0 :input))
                     (otherwise (values 0 0))))))
    (is (eq :released (catch 'readiness-exit (arcdocdb.io::attendi-io wait 0))))
    (is (null (arcdocdb.io::attesa-io-busy wait)))
    (dolist (value '(:reentry :configure))
      (setf mode value)
      (signals invalid-argument (arcdocdb.io::attendi-io wait 0))
      (is (null (arcdocdb.io::attesa-io-busy wait))))
    (setf mode :ok)
    (is (eq :timeout (arcdocdb.io::attendi-io wait 0)))
    (let ((seen (sb-thread:join-thread
                 (sb-thread:make-thread
                  (lambda ()
                    (handler-case (arcdocdb.io::attendi-io wait 0)
                      (invalid-argument (condition) (error-reason condition))))))))
      (is (eq :io-readiness-owner seen)))
    (arcdocdb.io::configura-attesa-io wait 0 0 :input)))
