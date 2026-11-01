;;;; Existing canonical engine, actor barriers and scripted client failures for one explicit conditional request.
(in-package #:arcdocdb.local.server.tests)
(defun explicit-if-operations (&optional (count 3))
  (let ((ops (make-array count)))
    (dotimes (i count ops) (setf (svref ops i) (e:crea-operazione-scrittura :put (bytes (1+ i)) (bytes #xf6))))))
(defun explicit-if-u64 (&rest values) (apply #'arcdocdb.local.wire.tests::conditional-u64 values))
(defun explicit-if-connection (&key (limit 8) (negotiated t) (deadline 100))
  (l::make-local-connection :limit 65536 :group-limit limit :conditional-groups negotiated :state :pending :deadline deadline))
(defun explicit-if-envelope (connection ops expected &optional (count (length ops)))
  (let* ((buffer (l::local-connection-input connection))
         (end (l::encode-local-conditional-group buffer 1 ops expected count (l::local-connection-space connection) 65536)))
    (l:decode-local-envelope buffer 4 end)))
(defun explicit-if-result (connection end count)
  (let* ((buffer (l::local-connection-output connection)) (tokens (make-array 8 :element-type '(unsigned-byte 64) :initial-element 999))
         (applied (make-array 8 :element-type '(unsigned-byte 8) :initial-element 204))
         (completed (l::decode-local-conditional-response buffer (l:decode-local-envelope buffer 4 end) tokens applied count)))
    (is (every (lambda (v) (= v 999)) (subseq tokens count))) (is (every (lambda (v) (= v 204)) (subseq applied count)))
    (values completed (subseq tokens 0 count) (subseq applied 0 count))))
(defun explicit-if-cleared (connection)
  (arcdocdb.local.wire.tests::conditional-work-cleared (l::local-connection-group-workspace connection)))
(defun explicit-if-client-cleared (client)
  (is (every #'zerop (l::local-client-group-csns client))) (is (every #'zerop (l::local-client-group-applied client))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-explicit-if-admitted-resource-fault-never-becomes-rejection
  (with-engine (engine root :create t :observer
                       (lambda (handle phase) (declare (ignore handle))
                         (when (eq phase :after-flush)
                           (error 'arcdocdb.conditions:resource-exhausted :reason :admitted-fi)) nil))
    (let* ((connection (explicit-if-connection))
           (env (explicit-if-envelope connection (explicit-if-operations 2) (explicit-if-u64 0 0))))
      (signals arcdocdb.conditions:resource-exhausted (l::local-dispatch engine connection env))
      (is (eq :faulted (e:stato-motore engine))) (explicit-if-cleared connection))))

;;; REQ: REQ-IPC-002 REQ-TXS-003 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-explicit-if-client-selected-prefix-all-conflicts-zero-result
  (let ((client (scripted-group-client (client-group-reply (bytes #x81 #x82 #xf4 0)) :conditional-groups t))
        (tokens (csn-output)) (flags (bytes 204 204)))
    (unwind-protect
         (progn
           (is (zerop (l:client-write-group-if client (vector (svref (explicit-if-operations 1) 0) nil)
                                             (explicit-if-u64 99 0) tokens flags :count 1)))
           (is (equalp #(0 999 999 999 999 999 999 999) tokens)) (is (equalp #(0 204) flags))
           (explicit-if-client-cleared client) (is (eq :ready (l::local-client-state client))))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-002 REQ-REC-001 REQ-IDX-013
(deftest test-REQ-TXS-002-explicit-if-mixed-one-flush-and-reopen-all-profiles
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t version mode)) (connection (explicit-if-connection))
            (ops (explicit-if-operations 4)) (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush)))
        (unwind-protect
             (progn
               (e:scrivi-documento engine (bytes 1) (bytes 0))
               (setf (svref ops 1) (e:crea-operazione-scrittura :delete (bytes 2))
                     (svref ops 2) (e:crea-operazione-scrittura :delete (bytes 3)))
               (unwind-protect
                    (progn
                      (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (fd) (incf flushes) (funcall original fd)))
                      (let ((end (l::local-dispatch engine connection (explicit-if-envelope connection ops (explicit-if-u64 1 7 0 0)))))
                        (multiple-value-bind (completed tokens flags) (explicit-if-result connection end 4)
                          (is (= 3 completed)) (is (equalp #(2 0 3 4) tokens)) (is (equalp #(1 0 1 1) flags))))
                      (is (= 1 flushes)))
                 (setf (symbol-function 'arcdocdb.io:durable-flush) original))
               (explicit-if-cleared connection) (arcdocdb.engine.tests::conditional-group-cleared engine))
          (e:chiudi-motore engine)))
      (let ((engine (read-test-open root nil version mode)) (out (bytes 0)))
        (unwind-protect
             (progn
               (multiple-value-bind (status size token) (e:leggi-documento-con-versione engine (bytes 1) out)
                 (is (eq :found status)) (is (= 1 size)) (is (= 2 token)) (is (= #xf6 (aref out 0))))
               (is (eq :absent (e:leggi-documento engine (bytes 3) out)))
               (arcdocdb.engine.tests::check-frontier engine 4))
          (e:chiudi-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-003 REQ-LIM-003 REQ-WAL-006
(deftest test-REQ-TXS-003-explicit-if-all-conflicts-skip-full-ACTIVE-writer
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t version mode :records 1)) (connection (explicit-if-connection))
            (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush)))
        (unwind-protect
             (progn
               (e:scrivi-documento engine (bytes 1) (bytes #xf6))
               (let ((images (arcdocdb.engine.tests::images root)))
                 (unwind-protect
                      (progn
                        (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (fd) (incf flushes) (funcall original fd)))
                        (let ((end (l::local-dispatch engine connection
                                     (explicit-if-envelope connection (explicit-if-operations) (explicit-if-u64 0 99 99)))))
                          (multiple-value-bind (completed tokens flags) (explicit-if-result connection end 3)
                            (is (zerop completed)) (is (equalp #(1 0 0) tokens)) (is (equalp #(0 0 0) flags))))
                        (is (zerop flushes)) (arcdocdb.engine.tests::check-images root images))
                   (setf (symbol-function 'arcdocdb.io:durable-flush) original)))
               (arcdocdb.engine.tests::check-frontier engine 1) (explicit-if-cleared connection))
          (e:chiudi-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-WAL-006
(deftest test-REQ-IPC-002-explicit-if-unadmitted-refusals-never-split
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (read-test-open root t 1 :resident :records 1)))
      (unwind-protect
           (dolist (config '((nil 8 4) (t 1 5) (t 8 2)))
             (destructuring-bind (negotiated limit status) config
               (let* ((connection (explicit-if-connection :negotiated negotiated :limit limit))
                      (env (explicit-if-envelope connection (explicit-if-operations 2) (explicit-if-u64 0 0)))
                      (images (arcdocdb.engine.tests::images root)) (end (l::local-dispatch engine connection env)))
                 (is (= status (l:envelope-code (l:decode-local-envelope (l::local-connection-output connection) 4 end))))
                 (arcdocdb.engine.tests::check-frontier engine 0) (arcdocdb.engine.tests::check-images root images)
                 (is (eq :ready (e:stato-motore engine))) (explicit-if-cleared connection))))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-explicit-if-validation-deadline-precedes-probes
  (with-engine (engine root :create t)
    (let ((connection (explicit-if-connection :deadline 5)) (original (symbol-function 'e::versione-corrente-indice-motore)) (probes 0))
      (unwind-protect
           (progn
             (setf (symbol-function 'e::versione-corrente-indice-motore) (lambda (&rest args) (incf probes) (apply original args)))
             (signals l:protocol-error
               (l::local-dispatch engine connection (explicit-if-envelope connection (explicit-if-operations) (explicit-if-u64 0 0 0))
                 (lambda () (is (svref (l::local-group-workspace-operations (l::local-connection-group-workspace connection)) 2)) 5)))
             (is (zerop probes)) (explicit-if-cleared connection) (arcdocdb.engine.tests::check-frontier engine 0))
        (setf (symbol-function 'e::versione-corrente-indice-motore) original)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006
(deftest test-REQ-IPC-002-explicit-if-drains-earlier-write-before-comparison-and-read
  (with-engine (engine root :create t)
    (let* ((connection (explicit-if-connection)) (first (group-pending 1 1 (bytes 1) (bytes 0)))
           (read (group-pending 1 2 (bytes 1))))
      (setf (l::local-connection-pending connection)
            (explicit-if-envelope connection (explicit-if-operations 1) (explicit-if-u64 1)))
      (conditional-turn engine (vector first connection read))
      (is (= 1 (group-response first 1)))
      (multiple-value-bind (completed tokens flags) (explicit-if-result connection (l::local-connection-size connection) 1)
        (is (= 1 completed)) (is (equalp #(2) tokens)) (is (equalp #(1) flags)))
      (multiple-value-bind (status document) (group-response read 2) (is (eq :found status)) (is (equalp (bytes #xf6) document)))
      (explicit-if-cleared connection))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-WAL-006
(deftest test-REQ-IPC-002-explicit-if-expiry-after-drain-or-response-encoding
  (dolist (phase '(:drain :encode))
    (let ((now 0))
      (with-engine (engine root :create t :observer
                           (lambda (handle step) (declare (ignore handle))
                             (when (and (eq phase :drain) (eq step :after-flush)) (setf now 5)) nil))
        (let ((connection (explicit-if-connection :deadline 5)) (original (symbol-function 'l::encode-local-conditional-response)))
          (setf (l::local-connection-pending connection)
                (explicit-if-envelope connection (explicit-if-operations 1) (explicit-if-u64 0)))
          (unwind-protect
               (progn
                 (when (eq phase :encode)
                   (setf (symbol-function 'l::encode-local-conditional-response)
                         (lambda (&rest args) (prog1 (apply original args) (setf now 5)))))
                 (conditional-turn engine (if (eq phase :drain) (vector (group-pending 1 1 (bytes 9)) connection) (vector connection))
                                   :clock (lambda () now))
                 (is (eq :closed (l::local-connection-state connection)))
                 (arcdocdb.engine.tests::check-frontier engine 1) (explicit-if-cleared connection))
            (setf (symbol-function 'l::encode-local-conditional-response) original)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-explicit-if-post-commit-encoder-error-or-throw-never-retried
  (dolist (nonlocal '(nil t))
    (with-engine (engine root :create t)
      (let* ((connection (explicit-if-connection)) (env (explicit-if-envelope connection (explicit-if-operations 2) (explicit-if-u64 0 0)))
             (original (symbol-function 'l::encode-local-conditional-response)) (reject (symbol-function 'l:encode-local-response))
             (rejections 0) (cause (make-condition 'arcdocdb.conditions:resource-exhausted :reason :encoder-fi)))
        (unwind-protect
             (progn
               (setf (symbol-function 'l::encode-local-conditional-response) (lambda (&rest args) (declare (ignore args))
                                                                              (if nonlocal (throw 'encoder :escaped) (error cause)))
                     (symbol-function 'l:encode-local-response) (lambda (&rest args) (incf rejections) (apply reject args)))
               (if nonlocal (is (eq :escaped (catch 'encoder (l::local-dispatch engine connection env))))
                   (signals arcdocdb.conditions:resource-exhausted (l::local-dispatch engine connection env)))
               (is (zerop rejections)) (arcdocdb.engine.tests::check-frontier engine 2) (explicit-if-cleared connection)
               (is (eq :ready (e:stato-motore engine))))
          (setf (symbol-function 'l::encode-local-conditional-response) original (symbol-function 'l:encode-local-response) reject))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-explicit-if-fragmented-client-complete-prefix-and-tail
  (multiple-value-bind (client stats)
      (scripted-group-client (client-group-reply (bytes #x83 #x82 #xf5 1 #x82 #xf4 9 #x82 #xf5 2))
                             :conditional-groups t :fragment 1 :short-io t)
    (let ((tokens (csn-output)) (flags (make-array 8 :element-type '(unsigned-byte 8) :initial-element 204))
          (expected (explicit-if-u64 0 0 0)))
      (unwind-protect
           (progn
             (is (= 2 (l:client-write-group-if client (explicit-if-operations) expected tokens flags)))
             (is (equalp #(1 9 2 999 999 999 999 999) tokens)) (is (equalp #(1 0 1 204 204 204 204 204) flags))
             (is (every #'zerop expected)) (is (eq :ready (l::local-client-state client)))
             (is (= 2 (l::local-client-next-id client))) (multiple-value-bind (sent polls) (funcall stats) (is (plusp sent)) (is (plusp polls)))
             (explicit-if-client-cleared client))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-WAL-006-explicit-if-client-malformed-late-or-lost-response-preserves-output
  (dolist (config (list (list (client-group-reply (bytes #x82 #x82 #xf5 1 #x82 #xf5 1)) nil)
                       (list (client-group-reply (bytes #x82 #x82 #xf5 1 #x82 #xf4 0) 0 2) nil)
                       (list (client-group-reply (bytes 1) 2) nil) (list (bytes 0 0) nil)
                       (list (client-group-reply (bytes #x82 #x82 #xf5 1 #x82 #xf4 0)) t)
                       (list (client-group-reply (bytes #x82 #x82 #xf5 1 #x82 #xf4 0)) :decode)))
    (destructuring-bind (reply expire) config
      (let ((client (scripted-group-client reply :conditional-groups t :expire expire)) (tokens (csn-output)) (flags (bytes 204 204)))
        (unwind-protect
             (progn
               (signals l:outcome-unknown (l:client-write-group-if client (explicit-if-operations 2) (explicit-if-u64 0 0) tokens flags))
               (is (every (lambda (v) (= v 999)) tokens)) (is (every (lambda (v) (= v 204)) flags))
               (is (eq :closed (l::local-client-state client))) (explicit-if-client-cleared client))
          (l:close-local client))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-LIM-003
(deftest test-REQ-IPC-002-explicit-if-client-known-rejection-ready-with-no-results
  (loop for status from 1 to 5 do
    (let ((client (scripted-group-client (client-group-reply (bytes #xf6) status) :conditional-groups t))
          (tokens (csn-output)) (flags (bytes 204 204)))
      (unwind-protect
           (progn
             (signals l:request-rejected (l:client-write-group-if client (explicit-if-operations 2) (explicit-if-u64 0 0) tokens flags))
             (is (eq :ready (l::local-client-state client))) (is (= 2 (l::local-client-next-id client)))
             (is (every (lambda (v) (= v 999)) tokens)) (is (every (lambda (v) (= v 204)) flags)) (explicit-if-client-cleared client))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-explicit-if-client-preflight-alias-types-capability-and-id
  (multiple-value-bind (client stats) (scripted-group-client (bytes) :conditional-groups t)
    (let ((ops (explicit-if-operations 2)) (expected (explicit-if-u64 0 0)) (tokens (csn-output)) (flags (bytes 204 204)))
      (unwind-protect
           (progn
             (dolist (args (list (list ops expected expected flags) (list ops expected tokens #(0 0))
                                (list ops #(0 0) tokens flags) (list ops expected (l::local-client-group-csns client) flags)
                                (list ops (l::local-client-group-csns client) tokens flags)
                                (list ops expected tokens (l::local-client-group-applied client))
                                (list ops expected tokens (l::local-client-input client))
                                (list (vector (e:crea-operazione-scrittura :put flags (bytes #xf6))) (explicit-if-u64 0) tokens flags)
                                (list ops expected tokens flags :count 0)))
               (signals arcdocdb.conditions:invalid-argument (apply #'l:client-write-group-if client args)))
             (is (= 1 (l::local-client-next-id client))) (is (zerop (funcall stats)))
             (setf (l::local-client-next-id client) 18446744073709551616)
             (signals arcdocdb.conditions:resource-exhausted (l:client-write-group-if client ops expected tokens flags))
             (is (zerop (funcall stats))) (is (every (lambda (v) (= v 999)) tokens)))
        (l:close-local client))))
  (let ((client (scripted-group-client (bytes))))
    (unwind-protect
         (signals arcdocdb.conditions:unsupported-format
           (l:client-write-group-if client (explicit-if-operations 1) (explicit-if-u64 0) (csn-output) (bytes 0)))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-004-explicit-if-client-nonlocal-exit-closes-and-clears
  (let ((client (scripted-group-client (bytes) :conditional-groups t :throw-tag 'escape))
        (tokens (csn-output)) (flags (bytes 204 204)))
    (unwind-protect
         (progn
           (is (eq :transferred (catch 'escape (l:client-write-group-if client (explicit-if-operations 2) (explicit-if-u64 0 0) tokens flags))))
           (is (eq :closed (l::local-client-state client))) (explicit-if-client-cleared client)
           (is (every (lambda (v) (= v 999)) tokens)) (is (every (lambda (v) (= v 204)) flags)))
      (l:close-local client))))
