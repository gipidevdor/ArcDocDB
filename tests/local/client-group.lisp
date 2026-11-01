;;;; Scripted native transfers around the real synchronous client state machine.
(in-package #:arcdocdb.local.server.tests)

(defun scripted-group-client (reply &key fragment fault throw-tag expire short-io read-groups versions)
  (let ((cursor 0) (sent 0) (calls 0) (now 0) (polls 0) (final-checks 0))
    (let* ((backend (l::make-native-backend
                     :send (lambda (fd buffer start count)
                             (declare (ignore fd buffer start)) (incf calls)
                             (when throw-tag (throw throw-tag :transferred))
                             (when fault (error fault))
                             (if (and short-io (= 1 calls)) (values -1 sb-posix:eintr)
                                 (let ((n (min count (or fragment count)))) (incf sent n) (values n 0))))
                     :recv (lambda (fd buffer start count)
                             (declare (ignore fd)) (incf calls)
                             (if (and short-io (zerop (mod calls 3))) (values -1 sb-posix:eagain)
                                 (let ((n (min count (- (length reply) cursor) (or fragment count))))
                                   (replace buffer reply :start1 start :end1 (+ start n) :start2 cursor :end2 (+ cursor n))
                                   (incf cursor n)
                                   (when (and (eq expire t) (= cursor (length reply))) (setf now (* 30 internal-time-units-per-second)))
                                   (values n 0))))
                     :control (lambda (op args)
                                (is (eq op :poll)) (incf polls)
                                (arcdocdb.binary:scrivi-u16 (first args) 6
                                  (arcdocdb.binary:leggi-u16 (first args) 4)) (values 1 0))))
           (client (l::make-local-client :socket (l::new-local-socket) :state :ready :write-groups t :read-groups read-groups :versions versions
                     :clock (lambda ()
                              (when (and (eq expire :decode) (= cursor (length reply)))
                                (when (= 2 (incf final-checks)) (setf now (* 30 internal-time-units-per-second)))) now)
                     :io-backend backend :waiter (l::make-local-waiter 1 backend))))
      (values client (lambda () (values sent polls))))))
(defun client-group-reply (payload &optional (status 0) (id 1))
  (arcdocdb.local.wire.tests::framed (arcdocdb.local.wire.tests::body 3 id status payload)))
(defun csn-output () (make-array 8 :element-type '(unsigned-byte 64) :initial-element 999))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-IPC-002-group-client-fragmented-success-and-output-tail
  (multiple-value-bind (client stats) (scripted-group-client (client-group-reply (bytes #x83 1 2 3)) :fragment 1 :short-io t)
    (unwind-protect
         (let ((out (csn-output)))
           (is (= 3 (l:client-write-group client (explicit-operations) out)))
           (is (equalp #(1 2 3 999 999 999 999 999) out))
           (is (eq :ready (l::local-client-state client)))
           (is (= 2 (l::local-client-next-id client)))
           (multiple-value-bind (sent polls) (funcall stats) (is (plusp sent)) (is (plusp polls)))
           (is (every #'zerop (l::local-client-group-csns client))))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-group-client-malformed-last-result-and-eof-preserve-output
  (dolist (reply (list (client-group-reply (bytes #x83 1 2 2))
                       (client-group-reply (bytes #x83 1 2 3) 0 2)
                       (client-group-reply (bytes #x82 1 2)) (bytes 0 0)))
    (let ((client (scripted-group-client reply)) (out (csn-output)))
      (unwind-protect
           (progn
             (signals l:outcome-unknown (l:client-write-group client (explicit-operations) out))
             (is (every (lambda (n) (= n 999)) out)) (is (eq :closed (l::local-client-state client)))
             (is (every #'zerop (l::local-client-group-csns client))))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-group-client-rejection-ready-and-legacy-unknown-opcode
  (loop for status from 1 to 5 do
    (let ((client (scripted-group-client (client-group-reply (bytes #xf6) status))) (out (csn-output)))
      (unwind-protect
           (progn
             (signals l:request-rejected (l:client-write-group client (explicit-operations) out))
             (is (every (lambda (n) (= n 999)) out)) (is (eq :ready (l::local-client-state client)))
             (is (= 2 (l::local-client-next-id client))))
        (l:close-local client))))
  ;; Unknown legacy command 4 has count zero: an authoritative rejection must not become a decoder type error.
  (let ((client (scripted-group-client (client-group-reply (bytes #xf6) 4))))
    (unwind-protect
         (progn (signals l:request-rejected (l::exchange-local-client client 4 (bytes 1) nil))
                (is (eq :ready (l::local-client-state client))))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-client-final-byte-deadline-never-acknowledged
  (dolist (expire '(t :decode))
   (dolist (grouped '(nil t))
    (let ((client (scripted-group-client (client-group-reply (if grouped (bytes #x83 1 2 3) (bytes 1))) :expire expire))
          (out (csn-output)))
      (unwind-protect
           (progn
             (signals l:outcome-unknown
               (if grouped (l:client-write-group client (explicit-operations) out) (l:client-put client (bytes 1) (bytes 0))))
             (is (eq :closed (l::local-client-state client))) (is (every (lambda (n) (= n 999)) out)))
        (l:close-local client))))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-IPC-002-group-client-preflight-no-send-or-id-consumption
  (multiple-value-bind (client stats) (scripted-group-client (bytes))
    (unwind-protect
         (progn
           (dolist (args (list (list #() (csn-output)) (list (explicit-operations) #(0 0 0))
                               (list (explicit-operations) (l::local-client-group-csns client))))
             (signals arcdocdb.conditions:invalid-argument (apply #'l:client-write-group client args)))
           (is (= 1 (l::local-client-next-id client))) (is (zerop (funcall stats)))
           (setf (l::local-client-next-id client) 18446744073709551616)
           (signals arcdocdb.conditions:resource-exhausted (l:client-write-group client (explicit-operations) (csn-output)))
           (is (zerop (funcall stats))))
      (l:close-local client)))
  (let ((client (l::make-local-client :state :ready)))
    (signals arcdocdb.conditions:unsupported-format (l:client-write-group client (explicit-operations) (csn-output)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-WAL-006
(deftest test-REQ-AFF-004-group-client-nonlocal-exit-closes-and-retains-cleanup-error
  (dolist (cleanup-fault '(nil t))
    (let ((client (scripted-group-client (bytes) :throw-tag 'exit))
          (original (symbol-function 'l::close-local-socket))
          (cause (make-condition 'arcdocdb.conditions:io-fault :operation :test :reason :secondary)))
      (unwind-protect
           (progn
             (when cleanup-fault
               (setf (symbol-function 'l::close-local-socket)
                     (lambda (socket &key backend) (declare (ignore backend)) (funcall original socket) (error cause))))
             (is (eq :transferred (catch 'exit (l:client-write-group client (explicit-operations) (csn-output)))))
             (is (eq :closed (l::local-client-state client))) (is (null (l::local-client-socket client)))
             (is (equal (when cleanup-fault (list cause)) (l::local-client-cleanup-failures client))))
        (setf (symbol-function 'l::close-local-socket) original) (l:close-local client)))))
