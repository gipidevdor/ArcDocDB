;;;; Caller-owned output, complete wire validation and synchronous client ownership.
(in-package #:arcdocdb.local.server.tests)
(defun into-target (&optional (start 4) (tail 4))
  (make-array (+ start l:+max-document-bytes+ tail) :element-type '(unsigned-byte 8) :initial-element #xa5))
(defun into-reply (document &optional (id 1))
  (let* ((out (l::local-buffer)) (end (l:encode-local-response out id 0 :found (not (null document)) :document document)))
    (subseq out 0 end)))
(defun into-guards (out start document)
  (dotimes (i start) (is (= #xa5 (aref out i))))
  (dotimes (i (length document)) (is (= (aref document i) (aref out (+ start i)))))
  (loop for i from (+ start (length document)) below (length out) do (is (= #xa5 (aref out i)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-get-into-exact-output-offsets-and-maximum-document
  (dolist (size '(1 1024 60000)) (dolist (start '(0 4))
    (let* ((document (if (= size 1) (bytes #xf6) (arcdocdb.local.wire.tests::get-document size)))
           (client (scripted-group-client (into-reply document) :fragment 157 :short-io t))
           (out (into-target start (if (zerop start) 0 4))))
      (unwind-protect
           (progn (is (equal (list :found size) (multiple-value-list (l:client-get-into client (bytes 1) out :start start))))
                  (into-guards out start document) (is (eq :ready (l::local-client-state client)))
                  (is (= 2 (l::local-client-next-id client))))
        (l:close-local client))))))

;;; REQ: REQ-IPC-002 REQ-AFF-008 REQ-IDX-001
(deftest test-REQ-IPC-002-get-into-absence-reuse-and-legacy-independent-copy
  (let* ((document (bytes #x18 42))
         (reply (concatenate '(vector (unsigned-byte 8)) (into-reply document) (into-reply document 2)
                             (into-reply nil 3) (client-group-reply (bytes #xf6) 0 4)))
         (client (scripted-group-client reply :fragment 3 :short-io t)) (out (into-target)))
    (unwind-protect
         (progn
           (is (equal '(:found 2) (multiple-value-list (l:client-get-into client (bytes 1) out :start 4))))
           (multiple-value-bind (status copied) (l:client-get client (bytes 1))
             (is (eq :found status)) (is (equalp document copied)) (fill out #xa5) (is (equalp document copied)))
           (is (equal '(:absent 0) (multiple-value-list (l:client-get-into client (bytes 1) out :start 4))))
           (is (every (lambda (n) (= n #xa5)) out)) (is (null (l:client-ping client)))
           (is (eq :ready (l::local-client-state client))) (is (= 5 (l::local-client-next-id client))))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-get-into-output-preflight-never-sends-or-consumes-ID
  (multiple-value-bind (client stats) (scripted-group-client (into-reply (bytes #xf6)))
    (let* ((out (into-target))
           (invalid (list nil 1 "bytes" (make-array 60000) (make-array 60000 :element-type '(unsigned-byte 8) :fill-pointer 60000)
                          (make-array 60000 :element-type '(unsigned-byte 8) :displaced-to out)
                          (l::local-client-input client) (l::local-client-output client))))
      (unwind-protect
           (progn
             (dolist (target invalid) (signals arcdocdb.conditions:invalid-argument (l:client-get-into client (bytes 1) target)))
             (signals arcdocdb.conditions:invalid-argument (l:client-get-into client out out))
             (dolist (start (list nil -1 0.5 (1+ (length out)) (ash 1 100)))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-into client (bytes 1) out :start start)))
             (dolist (size '(0 1 59999))
               (signals arcdocdb.conditions:resource-exhausted
                 (l:client-get-into client (bytes 1) (make-array size :element-type '(unsigned-byte 8)))))
             (signals arcdocdb.conditions:resource-exhausted (l:client-get-into client (bytes 1) out :start 9))
             (is (every (lambda (n) (= n #xa5)) out)) (is (= 1 (l::local-client-next-id client)))
             (is (eq :ready (l::local-client-state client))) (is (equal '(0 0) (multiple-value-list (funcall stats)))))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-008 REQ-LIM-003
(deftest test-REQ-IPC-002-get-into-key-ID-state-and-owner-preflight
  (multiple-value-bind (client stats) (scripted-group-client (into-reply (bytes #xf6)))
    (let ((out (into-target)))
      (unwind-protect
           (progn
             (signals arcdocdb.conditions:invalid-argument (l:client-get-into nil (bytes 1) out))
             (dolist (key (list nil (bytes)))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-into client key out)))
             (signals arcdocdb.conditions:resource-exhausted
               (l:client-get-into client (make-array 1025 :element-type '(unsigned-byte 8)) out))
             (setf (l::local-client-next-id client) #x10000000000000000)
             (signals arcdocdb.conditions:resource-exhausted (l:client-get-into client (bytes 1) out))
             (is (= #x10000000000000000 (l::local-client-next-id client)))
             (dolist (state '(:connecting :busy :closed))
               (setf (l::local-client-state client) state)
               (signals arcdocdb.conditions:invalid-argument (l:client-get-into client (bytes 1) out)))
             (setf (l::local-client-state client) :ready)
             (is (eq :rejected (sb-thread:join-thread
                  (sb-thread:make-thread (lambda ()
                    (handler-case (l:client-get-into client (bytes 1) out)
                      (arcdocdb.conditions:invalid-argument () :rejected)))) :timeout 5 :default :timeout)))
             (is (equal '(0 0) (multiple-value-list (funcall stats)))) (is (every (lambda (n) (= n #xa5)) out)))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-LIM-003
(deftest test-REQ-IPC-002-get-into-authoritative-rejections-preserve-buffer-and-credit
  (loop for status from 1 to 5 do
    (let ((client (scripted-group-client (client-group-reply (bytes #xf6) status))) (out (into-target)) (seen nil))
      (unwind-protect
           (progn
             (handler-case (l:client-get-into client (bytes 1) out :start 4)
               (l:request-rejected (cause) (is (= status (l:rejection-status cause))) (setf seen t)))
             (is seen) (is (eq :ready (l::local-client-state client))) (is (= 2 (l::local-client-next-id client)))
             (is (every (lambda (n) (= n #xa5)) out)))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-IPC-002-get-into-malformed-responses-never-copy
  (let ((bad (list (client-group-reply (bytes #x82 #xf5 #x41 #xf6) 0 2)
                   (client-group-reply (bytes #xf6) 6) (client-group-reply (bytes #x80) 1)
                   (arcdocdb.local.wire.tests::framed (arcdocdb.local.wire.tests::body 2 1 2 (bytes #x41 #xf6)))
                   (client-group-reply (bytes #x82 #xf6 #x41 #xf6)) (client-group-reply (bytes #x82 #xf4 #x41 #xf6))
                   (client-group-reply (bytes #x82 #xf5 #x40)) (client-group-reply (bytes #x82 #xf5 #x42 #x18 1))
                   (client-group-reply (bytes #x82 #xf5 #x42 #xf6 #xf6)) (client-group-reply (bytes #x81 #xf4))
                   (client-group-reply (concatenate '(vector (unsigned-byte 8)) (bytes #x82 #xf5 #x59 #xea #x61)
                                                     (arcdocdb.local.wire.tests::get-document 60001)))
                   (bytes 0 0) (bytes 0 0 0 10 #x80))))
    (dolist (reply bad)
      (let ((client (scripted-group-client reply :fragment 2 :short-io t)) (out (into-target)))
        (unwind-protect
             (progn (signals l:protocol-error (l:client-get-into client (bytes 1) out :start 4))
                    (is (eq :closed (l::local-client-state client))) (is (= 2 (l::local-client-next-id client)))
                    (is (every (lambda (n) (= n #xa5)) out)))
          (l:close-local client))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-get-into-expiry-before-and-after-copy
  (dolist (phase '(t :decode))
    (let ((client (scripted-group-client (into-reply (bytes #xf6)) :expire phase)) (out (into-target)))
      (unwind-protect
           (progn (signals l:protocol-error (l:client-get-into client (bytes 1) out :start 4))
                  (is (eq :closed (l::local-client-state client)))
                  (if (eq phase t) (is (every (lambda (n) (= n #xa5)) out)) (into-guards out 4 (bytes #xf6))))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-004-get-into-nonlocal-exit-before-send-and-after-copy-closes
  (let ((client (scripted-group-client (into-reply (bytes #xf6)) :throw-tag 'into-stop)) (out (into-target)))
    (unwind-protect
         (progn (is (eq :transferred (catch 'into-stop (l:client-get-into client (bytes 1) out))))
                (is (eq :closed (l::local-client-state client))) (is (every (lambda (n) (= n #xa5)) out)))
      (l:close-local client)))
  (dolist (exit '(:error :throw))
    (let ((client (scripted-group-client (into-reply (bytes #xf6)))) (out (into-target))
          (original (symbol-function 'l::decode-local-get-into))
          (cause (make-condition 'arcdocdb.conditions:io-fault :reason :into-after-copy :operation :test)))
      (unwind-protect
           (progn
             (setf (symbol-function 'l::decode-local-get-into)
                   (lambda (&rest args) (apply original args) (if (eq exit :throw) (throw 'into-stop :copied) (error cause))))
             (if (eq exit :throw) (is (eq :copied (catch 'into-stop (l:client-get-into client (bytes 1) out :start 4))))
                 (let ((seen nil)) (handler-case (l:client-get-into client (bytes 1) out :start 4)
                                    (arcdocdb.conditions:io-fault (actual) (is (eq actual cause)) (setf seen t))) (is seen)))
             (is (eq :closed (l::local-client-state client))) (into-guards out 4 (bytes #xf6)))
        (setf (symbol-function 'l::decode-local-get-into) original) (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-get-into-last-u64-ID-completes-exactly-once
  (let ((client (scripted-group-client (into-reply (bytes #xf6) #xffffffffffffffff))) (out (into-target)))
    (unwind-protect
         (progn (setf (l::local-client-next-id client) #xffffffffffffffff)
                (is (equal '(:found 1) (multiple-value-list (l:client-get-into client (bytes 1) out :start 4))))
                (signals arcdocdb.conditions:resource-exhausted (l:client-get-into client (bytes 1) out :start 4))
                (is (eq :ready (l::local-client-state client))) (is (= #x10000000000000000 (l::local-client-next-id client)))
                (into-guards out 4 (bytes #xf6)))
      (l:close-local client))))
