;;;; Bounded client read-ahead: private retained bytes are never early response authority.
(in-package #:arcdocdb.local.server.tests)
(defun receive-fixture (wire &key steps (limit 65536) (clock (lambda () 0)) (input (l::local-buffer)) on-send on-recv (read-groups nil) (versions nil))
  (let ((cursor 0) (calls 0) (sends 0) (polls 0) (requests nil))
    (let* ((backend (l::make-native-backend
                     :send (lambda (fd buffer start count)
                             (declare (ignore fd buffer start)) (incf sends)
                             (when on-send (funcall on-send sends)) (values count 0))
                     :recv (lambda (fd buffer start count)
                             (declare (ignore fd)) (incf calls) (push count requests)
                             (let ((step (pop steps)))
                               (case step
                                 (:eintr (values -1 sb-posix:eintr))
                                 (:wait (values -1 sb-posix:eagain))
                                 (:eof (values 0 0))
                                 (:error (values -1 sb-posix:eio))
                                 (otherwise
                                  (let ((n (min count (- (length wire) cursor) (or step count))))
                                    (replace buffer wire :start1 start :end1 (+ start n) :start2 cursor :end2 (+ cursor n))
                                    (incf cursor n) (when on-recv (funcall on-recv calls)) (values n 0))))))
                     :control (lambda (op args)
                                (is (eq op :poll)) (incf polls)
                                (arcdocdb.binary:scrivi-u16 (first args) 6
                                  (arcdocdb.binary:leggi-u16 (first args) 4)) (values 1 0))))
           (client (l::make-local-client :socket (l::new-local-socket) :state :ready :limit limit :clock clock :input input :read-groups read-groups :versions versions
                     :io-backend backend :waiter (l::make-local-waiter 1 backend))))
      (values client (lambda () (list :calls calls :sends sends :polls polls :cursor cursor :requests (reverse requests)))))))
(defun receive-stream (&rest frames) (apply #'concatenate '(vector (unsigned-byte 8)) frames))
(defun receive-ping (&optional (id 1)) (client-group-reply (bytes #xf6) 0 id))
(defun receive-cleared (client)
  (is (eq :closed (l::local-client-state client))) (is (null (l::local-client-socket client)))
  (is (zerop (l::local-client-input-consumed client))) (is (zerop (l::local-client-input-received client))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-client-complete-frame-uses-one-reserved-recv
  (dolist (size '(1 1024 60000))
    (let ((document (if (= size 1) (bytes #xf6) (arcdocdb.local.wire.tests::get-document size))) (out (into-target)))
      (multiple-value-bind (client stats) (receive-fixture (into-reply document))
        (unwind-protect
             (progn (is (equal (list :found size) (multiple-value-list (l:client-get-into client (bytes 1) out :start 4))))
                    (into-guards out 4 document) (is (= 1 (getf (funcall stats) :calls)))
                    (is (equal '(65540) (getf (funcall stats) :requests))) (is (= 2 (l::local-client-next-id client))))
          (l:close-local client)) (receive-cleared client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-LIM-003
(deftest test-REQ-IPC-002-client-all-prefix-splits-body-fragments-and-retryable-input
  (let ((reply (receive-ping)))
    (dolist (steps (append (loop for split from 1 below (length reply) collect (list split))
                          (list (make-list (length reply) :initial-element 1) '(:eintr :wait))))
      (multiple-value-bind (client stats) (receive-fixture reply :steps steps)
        (unwind-protect
             (progn (is (null (l:client-ping client))) (is (eq :ready (l::local-client-state client)))
                    (is (= (length reply) (getf (funcall stats) :cursor)))
                    (when (eq :eintr (first steps)) (is (= 2 (getf (funcall stats) :polls)))))
          (l:close-local client)) (receive-cleared client)))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-AFF-008
(deftest test-REQ-IPC-002-client-coalesced-responses-keep-separate-IDs-and-values
  (let* ((first (receive-ping)) (second (into-reply (bytes #x18 42) 2))
         (third (client-group-reply (bytes 23) 0 3)) (stream (receive-stream first second third)) (out (into-target)))
    (multiple-value-bind (client stats) (receive-fixture stream)
      (unwind-protect
           (progn
             (is (null (l:client-ping client))) (is (= (length first) (l::local-client-input-consumed client)))
             (is (= (length stream) (l::local-client-input-received client)))
             (is (equal '(:found 2) (multiple-value-list (l:client-get-into client (bytes 1) out :start 4))))
             (into-guards out 4 (bytes #x18 42))
             (is (= 23 (l:client-put client (bytes 1) (bytes #xf6))))
             (is (= 4 (l::local-client-next-id client))) (is (= 3 (getf (funcall stats) :sends)))
             (is (= 1 (getf (funcall stats) :calls))))
        (l:close-local client)) (receive-cleared client))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-client-coalesced-partial-next-prefix-and-body-survive-compaction
  (let* ((first (receive-ping)) (second (into-reply (bytes #x18 42) 2)) (stream (receive-stream first second)))
    (loop for tail from 1 below (length second) do
      (multiple-value-bind (client stats) (receive-fixture stream :steps (list (+ (length first) tail)))
        (let ((out (into-target)))
          (unwind-protect
               (progn (l:client-ping client)
                      (is (= tail (- (l::local-client-input-received client) (l::local-client-input-consumed client))))
                      (is (equal '(:found 2) (multiple-value-list (l:client-get-into client (bytes 1) out :start 4))))
                      (into-guards out 4 (bytes #x18 42)) (is (= 2 (getf (funcall stats) :calls)))
                      (is (= (length stream) (getf (funcall stats) :cursor))))
            (l:close-local client)) (receive-cleared client))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-client-retained-rejection-and-invalid-output-preserve-credit
  (loop for status from 1 to 5 do
    (let ((stream (receive-stream (client-group-reply (bytes #xf6) status) (into-reply (bytes #xf6) 2))) (out (into-target)))
      (multiple-value-bind (client stats) (receive-fixture stream)
        (unwind-protect
             (progn
               (signals l:request-rejected (l:client-get client (bytes 1))) (is (eq :ready (l::local-client-state client)))
               (let ((consumed (l::local-client-input-consumed client)) (received (l::local-client-input-received client)))
                 (signals arcdocdb.conditions:resource-exhausted (l:client-get-into client (bytes 1) (bytes 0)))
                 (is (= consumed (l::local-client-input-consumed client))) (is (= received (l::local-client-input-received client))))
               (is (= 2 (l::local-client-next-id client))) (is (= 1 (getf (funcall stats) :sends)))
               (is (equal '(:found 1) (multiple-value-list (l:client-get-into client (bytes 1) out :start 4))))
               (into-guards out 4 (bytes #xf6)) (is (= 1 (getf (funcall stats) :calls))))
          (l:close-local client)) (receive-cleared client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-IPC-002-client-malformed-retained-frame-is-not-early-authority
  (dolist (second (list (into-reply (bytes #xf6) 3) (bytes 0 0 0 0)
                        (client-group-reply (bytes #x82 #xf5 #x42 #x18 1) 0 2)))
    (multiple-value-bind (client stats) (receive-fixture (receive-stream (receive-ping) second))
      (let ((out (into-target)))
        (unwind-protect
             (progn (is (null (l:client-ping client))) (is (eq :ready (l::local-client-state client)))
                    (signals l:protocol-error (l:client-get-into client (bytes 1) out :start 4))
                    (is (= 1 (getf (funcall stats) :calls))) (is (= 2 (getf (funcall stats) :sends)))
                    (is (every (lambda (n) (= n #xa5)) out)))
          (l:close-local client)) (receive-cleared client)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-client-buffered-frame-still-requires-fresh-deadline
  (dolist (mutation '(nil t))
    (let ((now 0) (stream (receive-stream (receive-ping) (client-group-reply (if mutation (bytes 1) (bytes #x82 #xf4 #xf6)) 0 2))))
      (multiple-value-bind (client stats)
          (receive-fixture stream :clock (lambda () now)
            :on-send (lambda (n) (when (= n 2) (setf now (* 30 internal-time-units-per-second)))))
        (unwind-protect
             (progn (l:client-ping client)
                    (if mutation
                        (let ((seen nil))
                          (handler-case (l:client-put client (bytes 1) (bytes #xf6))
                            (l:outcome-unknown (cause)
                              (is (eq :local-client-deadline (l:protocol-error-reason (l:unknown-cause cause)))) (setf seen t)))
                          (is seen))
                        (let ((seen nil))
                          (handler-case (l:client-get client (bytes 1))
                            (l:protocol-error (cause) (is (eq :local-client-deadline (l:protocol-error-reason cause))) (setf seen t)))
                          (is seen)))
                    (is (= 1 (getf (funcall stats) :calls))))
          (l:close-local client)) (receive-cleared client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-WAL-006
(deftest test-REQ-AFF-004-client-input-EOF-error-and-nonlocal-exit-close-once
  (dolist (steps '((:eof) (1 :eof) (4 :eof) (:error)))
    (dolist (mutation '(nil t))
      (multiple-value-bind (client stats) (receive-fixture (receive-ping) :steps steps)
        (unwind-protect
             (progn
               (if mutation (signals l:outcome-unknown (l:client-put client (bytes 1) (bytes #xf6)))
                   (signals arcdocdb.conditions:arcdocdb-error (l:client-get client (bytes 1))))
               (is (= 1 (getf (funcall stats) :sends))) (is (= 2 (l::local-client-next-id client))))
          (l:close-local client)) (receive-cleared client))))
  (dolist (exit '(:error :throw))
    (let ((cause (make-condition 'arcdocdb.conditions:io-fault :reason :receive-injected :operation :test)))
      (multiple-value-bind (client stats)
          (receive-fixture (receive-ping) :on-recv (lambda (n) (declare (ignore n))
                             (if (eq exit :throw) (throw 'receive-exit :received) (error cause))))
        (unwind-protect
             (progn
               (if (eq exit :throw) (is (eq :received (catch 'receive-exit (l:client-ping client))))
                   (let ((seen nil)) (handler-case (l:client-ping client)
                                      (arcdocdb.conditions:io-fault (actual) (is (eq actual cause)) (setf seen t))) (is seen)))
               (is (= 1 (getf (funcall stats) :calls))))
          (l:close-local client)) (receive-cleared client)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-client-reserved-grant-prefix-rejection-and-offset-invariants
  (dolist (size '(0 4097))
    (let ((wire (make-array 5000 :element-type '(unsigned-byte 8) :initial-element #xbb)))
      (dotimes (i 4) (setf (aref wire i) (ldb (byte 8 (* 8 (- 3 i))) size)))
      (multiple-value-bind (client stats) (receive-fixture wire :limit 4096)
        (fill (l::local-client-input client) #xa5)
        (unwind-protect
             (progn (signals l:protocol-error (l:client-ping client))
                    (is (equal '(4100) (getf (funcall stats) :requests)))
                    (loop for i from 4100 below 65540 do (is (= #xa5 (aref (l::local-client-input client) i)))))
          (l:close-local client)) (receive-cleared client))))
  (dolist (variant '(:order :grant :capacity :type))
    (multiple-value-bind (client stats) (receive-fixture (receive-ping) :limit 4096
          :input (case variant (:capacity (bytes 0 0 0 0)) (:type #(0 0 0 0)) (otherwise (l::local-buffer))))
      (case variant
        (:order (setf (l::local-client-input-consumed client) 1))
        (:grant (setf (l::local-client-input-received client) 4101))
        (otherwise nil))
      (unwind-protect
           (progn (signals arcdocdb.conditions:invariant-violation (l:client-ping client))
                  (is (zerop (getf (funcall stats) :calls))))
        (l:close-local client)) (receive-cleared client))))

;;; REQ: REQ-IPC-002 REQ-AFF-008 REQ-AFF-004
(deftest test-REQ-AFF-008-client-unexpected-input-step-is-an-invariant-failure
  (let ((original (symbol-function 'l::local-transfer-step)))
    (multiple-value-bind (client stats) (receive-fixture (receive-ping))
      (unwind-protect
           (progn
             (setf (symbol-function 'l::local-transfer-step)
                   (lambda (socket buffer start end direction &optional backend)
                     (if (eq direction :input) (values :unexpected 0)
                         (funcall original socket buffer start end direction backend))))
             (signals arcdocdb.conditions:invariant-violation (l:client-ping client))
             (is (zerop (getf (funcall stats) :calls))))
        (setf (symbol-function 'l::local-transfer-step) original) (l:close-local client))
      (receive-cleared client))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-client-prefix-attempt-rechecks-absolute-deadline
  (let ((ticks 0))
    (multiple-value-bind (client stats)
        (receive-fixture (receive-ping) :clock
          (lambda () (if (>= (incf ticks) 3) (* 30 internal-time-units-per-second) 0)))
      (unwind-protect
           (let ((seen nil))
             (handler-case (l:client-ping client)
               (l:protocol-error (cause)
                 (is (eq :local-client-deadline (l:protocol-error-reason cause))) (setf seen t)))
             (is seen) (is (zerop (getf (funcall stats) :calls))))
        (l:close-local client))
      (receive-cleared client))))
