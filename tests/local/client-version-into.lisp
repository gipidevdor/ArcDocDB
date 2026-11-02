;;;; Current-version tokens and caller-owned documents use one verified response.
(in-package #:arcdocdb.local.server.tests)
(defun version-into-reply (document token &optional (id 1))
  (let* ((out (l::local-buffer))
         (end (l::encode-local-version-response out id 0 (not (null document)) token
                (or document (bytes)) (if document (length document) 0))))
    (subseq out 0 end)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-LIM-003
(deftest test-REQ-TXS-002-version-into-exact-document-offset-and-full-u64-token
  (dolist (size '(1 1024 60000)) (dolist (start '(0 4))
    (dolist (token (list 1 #xffffffff #x100000000 most-positive-fixnum (1+ most-positive-fixnum) #xffffffffffffffff))
      (let* ((document (if (= size 1) (bytes #xf6) (arcdocdb.local.wire.tests::get-document size)))
             (client (scripted-group-client (version-into-reply document token) :versions t :fragment 157 :short-io t))
             (out (into-target start)))
        (unwind-protect
             (progn (is (equal (list :found size token)
                               (multiple-value-list (l:client-get-version-into client (bytes 1) out :start start))))
                    (into-guards out start document) (is (eq :ready (l::local-client-state client)))
                    (is (= 2 (l::local-client-next-id client))))
          (l:close-local client)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-version-into-preflight-preserves-output-credit-and-no-I/O
  (multiple-value-bind (client stats) (scripted-group-client (bytes) :versions t)
    (let ((out (into-target)))
      (unwind-protect
           (progn
             (dolist (target (list nil "octets" (make-array 60000)
                                   (make-array 60000 :element-type '(unsigned-byte 8) :fill-pointer 60000)
                                   (make-array 60000 :element-type '(unsigned-byte 8) :displaced-to out)
                                   (l::local-client-input client) (l::local-client-output client)))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-version-into client (bytes 1) target)))
             (signals arcdocdb.conditions:invalid-argument (l:client-get-version-into client out out))
             (dolist (start (list nil -1 1/2 (1+ (length out)) (ash 1 100)))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-version-into client (bytes 1) out :start start)))
             (dolist (size '(0 1 59999))
               (signals arcdocdb.conditions:resource-exhausted
                 (l:client-get-version-into client (bytes 1) (make-array size :element-type '(unsigned-byte 8)))))
             (signals arcdocdb.conditions:resource-exhausted (l:client-get-version-into client (bytes 1) out :start 9))
             (dolist (key (list nil (bytes)))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-version-into client key out)))
             (signals arcdocdb.conditions:resource-exhausted
               (l:client-get-version-into client (make-array 1025 :element-type '(unsigned-byte 8)) out))
             (is (= 1 (l::local-client-next-id client)))
             (setf (l::local-client-next-id client) #x10000000000000000)
             (signals arcdocdb.conditions:resource-exhausted (l:client-get-version-into client (bytes 1) out))
             (is (= #x10000000000000000 (l::local-client-next-id client)))
             (is (eq :ready (l::local-client-state client))) (is (equal '(0 0) (multiple-value-list (funcall stats))))
             (is (every (lambda (n) (= n #xa5)) out)))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-008
(deftest test-REQ-IPC-002-version-into-capability-state-owner-and-BUSY-reentry
  (let ((client (scripted-group-client (bytes))) (out (into-target)))
    (unwind-protect
         (progn (signals arcdocdb.conditions:unsupported-format (l:client-get-version-into client (bytes 1) out))
                (is (= 1 (l::local-client-next-id client))))
      (l:close-local client)))
  (let ((client (scripted-group-client (version-into-reply (bytes #xf6) 1) :versions t)) (out (into-target)))
    (unwind-protect
         (progn
           (signals arcdocdb.conditions:invalid-argument (l:client-get-version-into nil (bytes 1) out))
           (dolist (state '(:connecting :busy :closed))
             (setf (l::local-client-state client) state)
             (signals arcdocdb.conditions:invalid-argument (l:client-get-version-into client (bytes 1) out)))
           (setf (l::local-client-state client) :ready)
           (is (eq :rejected (sb-thread:join-thread (sb-thread:make-thread
                    (lambda () (handler-case (l:client-get-version-into client (bytes 1) out)
                                 (arcdocdb.conditions:invalid-argument () :rejected)))) :timeout 5 :default :timeout)))
           (is (= 1 (l::local-client-next-id client))))
      (l:close-local client)))
  (let ((client nil) (out (into-target)) (checks 0))
    (setf client (receive-fixture (version-into-reply (bytes #xf6) 1) :versions t
                   :clock (lambda () (when (and client (eq :busy (l::local-client-state client)))
                                       (sb-ext:gc :full t)
                                       (signals arcdocdb.conditions:invalid-argument
                                         (l:client-get-version-into client (bytes 1) out)) (incf checks)) 0)))
    (unwind-protect
         (progn (is (equal '(:found 1 1) (multiple-value-list (l:client-get-version-into client (bytes 1) out :start 4))))
                (is (plusp checks)) (into-guards out 4 (bytes #xf6)))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-IPC-002-version-into-malformed-results-share-persistent-validator
  (dolist (payload (list (bytes #x82 #xf5 1) (bytes #x83 #xf6 1 #x41 #xf6)
                         (bytes #x83 #xf5 0 #x41 #xf6) (bytes #x83 #xf4 1 #xf6)
                         (bytes #x83 #xf4 0 #x41 #xf6) (bytes #x83 #xf5 1 #xf6)
                         (bytes #x83 #xf5 1 #x40) (bytes #x83 #xf5 1 #x42 #x18 1)
                         (bytes #x83 #xf5 1 #x42 #xf6 #xf6) (bytes #x83 #xf5 #x20 #x41 #xf6)
                         (bytes #x83 #xf5 #x18 1 #x41 #xf6) (bytes #x83 #xf5 1 #x41 #xff)
                         (concatenate '(vector (unsigned-byte 8)) (bytes #x83 #xf5 1 #x59 #xea #x61)
                           (arcdocdb.local.wire.tests::get-document 60001))))
    (let ((reasons nil))
      (dolist (buffered '(nil t))
        (let ((client (scripted-group-client (client-group-reply payload) :versions t :fragment 2 :short-io t))
              (out (into-target)) (seen nil))
          (unwind-protect
               (progn
                 (handler-case (if buffered (l:client-get-version-into client (bytes 1) out :start 4)
                                   (l:client-get-version client (bytes 1)))
                   (l:protocol-error (cause) (push (l:protocol-error-reason cause) reasons) (setf seen t)))
                 (is seen) (receive-cleared client) (is (every (lambda (n) (= n #xa5)) out)))
            (l:close-local client))))
      (is (= 2 (length reasons))) (is (equal (first reasons) (second reasons))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004
(deftest test-REQ-IPC-002-version-into-rejection-ID-kind-truncation-and-malformed-error
  (loop for status from 1 to 5 do
    (let ((client (scripted-group-client (client-group-reply (bytes #xf6) status) :versions t)) (out (into-target)))
      (unwind-protect
           (let ((seen nil))
             (handler-case (l:client-get-version-into client (bytes 1) out)
               (l:request-rejected (cause) (is (= status (l:rejection-status cause))) (setf seen t)))
             (is seen) (is (eq :ready (l::local-client-state client))) (is (= 2 (l::local-client-next-id client)))
             (is (every (lambda (n) (= n #xa5)) out)))
        (l:close-local client))))
  (dolist (reply (list (version-into-reply (bytes #xf6) 1 2) (client-group-reply (bytes #xf6) 6)
                       (client-group-reply (bytes #x80) 1) (bytes 0 0) (bytes 0 0 0 20 #x80)
                       (arcdocdb.local.wire.tests::framed (arcdocdb.local.wire.tests::body 2 1 6 (bytes #x82 0 #x41 1)))))
    (let ((client (scripted-group-client reply :versions t)) (out (into-target)))
      (unwind-protect
           (progn (signals l:protocol-error (l:client-get-version-into client (bytes 1) out))
                  (receive-cleared client) (is (every (lambda (n) (= n #xa5)) out)))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-008
(deftest test-REQ-TXS-002-version-into-coalesced-absence-and-persistent-ownership
  (let* ((document (bytes #x18 42))
         (stream (receive-stream (version-into-reply document 7) (version-into-reply document 7 2)
                                 (version-into-reply nil 0 3) (receive-ping 4)))
         (out (into-target)))
    (multiple-value-bind (client stats) (receive-fixture stream :versions t)
      (unwind-protect
           (progn
             (is (equal '(:found 2 7) (multiple-value-list (l:client-get-version-into client (bytes 1) out :start 4))))
             (into-guards out 4 document)
             (multiple-value-bind (status copied token) (l:client-get-version client (bytes 1))
               (is (eq :found status)) (is (= 7 token)) (is (equalp copied document))
               (fill out #xa5)
               (is (equal '(:absent 0 0) (multiple-value-list (l:client-get-version-into client (bytes 1) out :start 4))))
               (is (every (lambda (n) (= n #xa5)) out)) (is (null (l:client-ping client)))
               (sb-ext:gc :full t) (is (equalp copied document)))
             (is (= 5 (l::local-client-next-id client))) (is (= 1 (getf (funcall stats) :calls)))
             (is (= 4 (getf (funcall stats) :sends))))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004 REQ-LIM-003
(deftest test-REQ-AFF-004-version-into-expiry-and-nonlocal-exit-never-authorize-output
  (dolist (expire '(t :decode))
    (let ((client (scripted-group-client (version-into-reply (bytes #xf6) 1) :versions t :expire expire)) (out (into-target)))
      (unwind-protect
           (progn (signals l:protocol-error (l:client-get-version-into client (bytes 1) out :start 4))
                  (receive-cleared client)
                  (if (eq expire t) (is (every (lambda (n) (= n #xa5)) out)) (into-guards out 4 (bytes #xf6))))
        (l:close-local client))))
  (let ((client (scripted-group-client (bytes) :versions t :throw-tag 'version-into-stop)) (out (into-target)))
    (unwind-protect
         (progn (is (eq :transferred (catch 'version-into-stop (l:client-get-version-into client (bytes 1) out))))
                (receive-cleared client) (is (every (lambda (n) (= n #xa5)) out)))
      (l:close-local client)))
  (dolist (exit '(:error :throw))
    (let ((client (scripted-group-client (version-into-reply (bytes #xf6) 1) :versions t)) (out (into-target))
          (original (symbol-function 'l::decode-local-version-into))
          (cause (make-condition 'arcdocdb.conditions:io-fault :reason :version-into-after-copy :operation :test)))
      (unwind-protect
           (progn
             (setf (symbol-function 'l::decode-local-version-into)
                   (lambda (&rest args) (apply original args)
                     (if (eq exit :throw) (throw 'version-into-stop :copied) (error cause))))
             (if (eq exit :throw)
                 (is (eq :copied (catch 'version-into-stop (l:client-get-version-into client (bytes 1) out :start 4))))
                 (let ((seen nil))
                   (handler-case (l:client-get-version-into client (bytes 1) out :start 4)
                     (arcdocdb.conditions:io-fault (actual) (is (eq actual cause)) (setf seen t))) (is seen)))
             (receive-cleared client) (into-guards out 4 (bytes #xf6)))
        (setf (symbol-function 'l::decode-local-version-into) original) (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-version-into-full-u64-IDs-and-last-credit
  (dolist (id (list #xffffffff #x100000000 most-positive-fixnum (1+ most-positive-fixnum) #xffffffffffffffff))
    (let ((client (scripted-group-client (version-into-reply (bytes #xf6) 1 id) :versions t)) (out (into-target)))
      (unwind-protect
           (progn (setf (l::local-client-next-id client) id)
                  (is (equal '(:found 1 1) (multiple-value-list (l:client-get-version-into client (bytes 1) out :start 4))))
                  (is (= (1+ id) (l::local-client-next-id client)))
                  (when (= id #xffffffffffffffff)
                    (signals arcdocdb.conditions:resource-exhausted (l:client-get-version-into client (bytes 1) out)))
                  (is (eq :ready (l::local-client-state client))) (into-guards out 4 (bytes #xf6)))
        (l:close-local client)))))
