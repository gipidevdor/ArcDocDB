;;;; Caller-owned grouped results: one grammar, exact outputs, complete preflight and owned cleanup.
(in-package #:arcdocdb.local.server.tests)
(defun rg-into-arena (&optional (start 4) (tail 4))
  (make-array (+ start l:+server-max-frame+ tail) :element-type '(unsigned-byte 8) :initial-element #xa5))
(defun rg-into-lengths (&optional (size 10)) (make-array size :element-type '(unsigned-byte 64) :initial-element 999))
(defun rg-into-reply (documents &optional (id 1))
  (let* ((size (1+ (loop for doc across documents sum (if doc (+ 2 (l::%wire-head-size (length doc)) (length doc)) 3))))
         (payload (make-array size :element-type '(unsigned-byte 8))) (cursor 1))
    (setf (aref payload 0) (logior #x80 (length documents)))
    (loop for doc across documents do
      (setf (aref payload cursor) #x82 (aref payload (1+ cursor)) (if doc #xf5 #xf4)) (incf cursor 2)
      (if doc (setf cursor (l::%wire-put-bstr payload cursor size doc 0 (length doc)))
          (progn (setf (aref payload cursor) #xf6) (incf cursor))))
    (is (= size cursor)) (client-group-reply payload 0 id)))
(defun rg-into-guards (arena lengths start documents)
  (dotimes (i start) (is (= #xa5 (aref arena i))))
  (let ((cursor start))
    (loop for doc across documents for index from 0 do
      (is (= (if doc (length doc) 0) (aref lengths index)))
      (when doc (dotimes (i (length doc)) (is (= (aref doc i) (aref arena (+ cursor i))))) (incf cursor (length doc))))
    (loop for i from cursor below (length arena) do (is (= #xa5 (aref arena i)))))
  (loop for i from (length documents) below (length lengths) do (is (= 999 (aref lengths i)))))
(defun rg-into-untouched (arena lengths)
  (is (every (lambda (n) (= #xa5 n)) arena)) (is (every (lambda (n) (= 999 n)) lengths)))
(defun rg-into-clean (client) (is (every #'zerop (l::local-client-read-spans client))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-AFF-008
(deftest test-REQ-IPC-002-read-group-into-packed-missing-null-duplicates-and-legacy-copy
  (dolist (start '(0 4))
    (let* ((docs (vector (bytes #x18 42) nil (bytes #xf6) (bytes #x18 42))) (keys (vector (bytes 1) (bytes 2) (bytes 3) (bytes 1)))
           (arena (rg-into-arena start 0)) (lengths (rg-into-lengths))
           (client (scripted-group-client (receive-stream (rg-into-reply docs) (rg-into-reply docs 2)) :read-groups t)))
      (unwind-protect
           (progn
             (is (equal '(4 5) (multiple-value-list (l:client-get-group-into client keys arena lengths :start start))))
             (rg-into-guards arena lengths start docs) (rg-into-clean client)
             (let ((legacy (l:client-get-group client keys)))
               (is (equalp legacy docs)) (is (not (eq (svref legacy 0) (svref legacy 3))))
               (fill arena 0) (fill lengths 0) (is (equalp legacy docs)))
             (is (eq :ready (l::local-client-state client))) (is (= 3 (l::local-client-next-id client))) (rg-into-clean client))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-read-group-into-maximum-document-aggregate-above-60000-and-all-absent
  (dolist (docs (list (vector (arcdocdb.local.wire.tests::get-document 60000))
                     (make-array 8 :initial-contents (loop for i below 8 collect
                       (let ((doc (arcdocdb.local.wire.tests::get-document 8184))) (fill doc (+ 65 i) :start 3) doc)))
                     (make-array 8 :initial-element nil)))
    (let* ((keys (make-array (length docs) :initial-element (bytes 1))) (arena (rg-into-arena)) (lengths (rg-into-lengths))
           (total (loop for doc across docs sum (if doc (length doc) 0)))
           (client (scripted-group-client (rg-into-reply docs) :read-groups t :fragment 157 :short-io t)))
      (unwind-protect
           (progn (is (equal (list (length docs) total)
                             (multiple-value-list (l:client-get-group-into client keys arena lengths :start 4))))
                  (rg-into-guards arena lengths 4 docs) (rg-into-clean client))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-read-group-into-output-shapes-counts-starts-and-complete-grant
  (multiple-value-bind (client stats) (scripted-group-client (bytes) :read-groups t)
    (let ((keys (vector (bytes 1))) (arena (rg-into-arena 0 0)) (lengths (rg-into-lengths)))
      (unwind-protect
           (progn
             (dolist (count '(nil 0 -1 2 9 1.0))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client keys arena lengths :count count)))
             (dolist (bad (list nil #() '(1) "key"))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client bad arena lengths)))
             (dolist (bad (list nil #(1 2) (make-array 65536 :element-type '(unsigned-byte 8) :adjustable t)
                               (make-array 65536 :element-type '(unsigned-byte 8) :displaced-to arena)))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client keys bad lengths)))
             (dolist (bad (list nil #(0) (make-array 1 :element-type '(unsigned-byte 32))
                               (make-array 1 :element-type '(unsigned-byte 64) :adjustable t)
                               (make-array 1 :element-type '(unsigned-byte 64) :displaced-to lengths)
                               (make-array 0 :element-type '(unsigned-byte 64))))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client keys arena bad)))
             (dolist (start '(nil -1 0.0 65537))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client keys arena lengths :start start)))
             (signals arcdocdb.conditions:resource-exhausted (l:client-get-group-into client keys arena lengths :start 1))
             (signals arcdocdb.conditions:resource-exhausted (l:client-get-group-into client keys (rg-into-arena 0 -1) lengths))
             (rg-into-untouched arena lengths) (is (equal '(0 0) (multiple-value-list (funcall stats)))))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-read-group-into-rejects-selected-key-and-each-client-buffer-alias
  (dolist (variant '(:input :output :spans :csns :key))
    (multiple-value-bind (client stats) (scripted-group-client (bytes) :read-groups t)
      (let* ((arena (case variant (:input (l::local-client-input client)) (:output (l::local-client-output client))
                         (otherwise (rg-into-arena 0 0))))
             (lengths (case variant (:spans (l::local-client-read-spans client)) (:csns (l::local-client-group-csns client))
                           (otherwise (rg-into-lengths))))
             (keys (vector (if (eq variant :key) arena (bytes 1)))))
        (fill arena #xa5) (fill lengths 999)
        (unwind-protect
             (progn (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client keys arena lengths))
                    (rg-into-untouched arena lengths) (is (equal '(0 0) (multiple-value-list (funcall stats))))
                    (is (= 1 (l::local-client-next-id client))))
          (l:close-local client))))))

;;; REQ: REQ-IPC-002 REQ-AFF-008 REQ-AFF-004
(deftest test-REQ-IPC-002-read-group-into-requires-owner-ready-and-negotiation
  (let ((keys (vector (bytes 1))) (arena (rg-into-arena)) (lengths (rg-into-lengths)))
    (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into nil keys arena lengths))
    (multiple-value-bind (client stats) (scripted-group-client (bytes) :read-groups t)
      (unwind-protect
           (progn
             (dolist (state '(:connecting :busy :closed))
               (setf (l::local-client-state client) state)
               (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client keys arena lengths)))
             (setf (l::local-client-state client) :ready)
             (is (eq :refused (sb-thread:join-thread (sb-thread:make-thread
                  (lambda () (handler-case (l:client-get-group-into client keys arena lengths)
                               (arcdocdb.conditions:invalid-argument () :refused)))) :timeout 5 :default :timeout)))
             (is (equal '(0 0) (multiple-value-list (funcall stats)))) (rg-into-untouched arena lengths))
        (l:close-local client)))
    (multiple-value-bind (client stats) (scripted-group-client (bytes))
      (unwind-protect
           (progn (signals arcdocdb.conditions:unsupported-format (l:client-get-group-into client keys arena lengths))
                  (is (equal '(0 0) (multiple-value-list (funcall stats)))) (rg-into-untouched arena lengths))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-LIM-003
(deftest test-REQ-IPC-002-read-group-into-every-authoritative-status-keeps-output-and-next-response
  (loop for status from 1 to 5 do
    (let* ((docs (vector (bytes #xf6) nil)) (keys (vector (bytes 1) (bytes 2)))
           (arena (rg-into-arena)) (lengths (rg-into-lengths))
           (client (scripted-group-client (receive-stream (client-group-reply (bytes #xf6) status) (rg-into-reply docs 2)) :read-groups t)))
      (unwind-protect
           (progn (signals l:request-rejected (l:client-get-group-into client keys arena lengths :start 4))
                  (rg-into-untouched arena lengths) (rg-into-clean client) (is (eq :ready (l::local-client-state client)))
                  (is (= 2 (l::local-client-next-id client)))
                  (is (equal '(2 1) (multiple-value-list (l:client-get-group-into client keys arena lengths :start 4))))
                  (rg-into-guards arena lengths 4 docs) (rg-into-clean client))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-IPC-002-read-group-into-malformed-last-members-and-frames-never-copy
  (let ((bad (list (client-group-reply (bytes #x82 #x82 #xf5 #x41 #xf6 #x82 #xf5 #x40))
                   (client-group-reply (bytes #x82 #x82 #xf5 #x41 #xf6 #x82 #xf5 #x42 #x18 1))
                   (client-group-reply (bytes #x82 #x82 #xf5 #x41 #xf6 #x82 #xf5 #x42 #xf6 #xf6))
                   (client-group-reply (bytes #x82 #x82 #xf5 #x41 #xf6 #x82 #xf6 #xf6))
                   (client-group-reply (bytes #x82 #x82 #xf5 #x41 #xf6 #x82 #xf4 #x41 #xf6))
                   (client-group-reply (bytes #x81 #x82 #xf4 #xf6))
                   (client-group-reply (bytes #x82 #x82 #xf4 #xf6 #x82 #xf4 #xf6 #xf6))
                   (rg-into-reply (vector nil nil) 2) (client-group-reply (bytes #xf6) 6)
                   (client-group-reply (bytes #x80) 1)
                   (arcdocdb.local.wire.tests::framed (arcdocdb.local.wire.tests::body 2 1 2 (bytes #x41 #xf6)))
                   (bytes 0 0) (bytes 0 0 0 20 #x80))))
    (dolist (reply bad)
      (let ((client (scripted-group-client reply :read-groups t :fragment 3 :short-io t))
            (arena (rg-into-arena)) (lengths (rg-into-lengths)))
        (unwind-protect
             (progn (signals l:protocol-error (l:client-get-group-into client (vector (bytes 1) (bytes 2)) arena lengths :start 4))
                    (rg-into-untouched arena lengths) (rg-into-clean client) (is (eq :closed (l::local-client-state client))))
          (l:close-local client))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-read-group-into-expiry-before-and-after-copy-is-not-success
  (dolist (phase '(t :decode))
    (let* ((docs (vector (bytes #xf6) (bytes #x18 42)))
           (client (scripted-group-client (rg-into-reply docs) :read-groups t :expire phase))
           (arena (rg-into-arena)) (lengths (rg-into-lengths)))
      (unwind-protect
           (progn (signals l:protocol-error (l:client-get-group-into client (vector (bytes 1) (bytes 2)) arena lengths :start 4))
                  (if (eq phase t) (rg-into-untouched arena lengths) (rg-into-guards arena lengths 4 docs))
                  (is (eq :closed (l::local-client-state client))) (rg-into-clean client))
        (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-004-read-group-into-nonlocal-before-send-and-after-copy-retains-cause
  (let ((client (scripted-group-client (bytes) :read-groups t :throw-tag 'rg-stop)) (arena (rg-into-arena)) (lengths (rg-into-lengths)))
    (unwind-protect
         (progn (is (eq :transferred (catch 'rg-stop (l:client-get-group-into client (vector (bytes 1)) arena lengths))))
                (rg-into-untouched arena lengths) (rg-into-clean client) (is (eq :closed (l::local-client-state client))))
      (l:close-local client)))
  (dolist (exit '(:error :throw))
    (let* ((docs (vector (bytes #xf6))) (client (scripted-group-client (rg-into-reply docs) :read-groups t))
           (arena (rg-into-arena)) (lengths (rg-into-lengths)) (original (symbol-function 'l::decode-local-read-group-into))
           (cause (make-condition 'arcdocdb.conditions:io-fault :reason :rg-into-after-copy :operation :test)))
      (unwind-protect
           (progn
             (setf (symbol-function 'l::decode-local-read-group-into)
                   (lambda (&rest args) (apply original args) (if (eq exit :throw) (throw 'rg-stop :copied) (error cause))))
             (if (eq exit :throw)
                 (is (eq :copied (catch 'rg-stop (l:client-get-group-into client (vector (bytes 1)) arena lengths :start 4))))
                 (let ((seen nil)) (handler-case (l:client-get-group-into client (vector (bytes 1)) arena lengths :start 4)
                                    (arcdocdb.conditions:io-fault (actual) (is (eq actual cause)) (setf seen t))) (is seen)))
             (rg-into-guards arena lengths 4 docs) (rg-into-clean client) (is (eq :closed (l::local-client-state client))))
        (setf (symbol-function 'l::decode-local-read-group-into) original) (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-read-group-into-selected-prefix-key-and-frame-preflight
  (multiple-value-bind (client stats) (scripted-group-client (bytes) :read-groups t)
    (let ((arena (rg-into-arena)) (lengths (rg-into-lengths)))
      (unwind-protect
           (progn
             (dolist (bad (list nil (bytes) #(1)))
               (signals arcdocdb.conditions:invalid-argument (l:client-get-group-into client (vector bad) arena lengths)))
             (signals arcdocdb.conditions:resource-exhausted
               (l:client-get-group-into client (vector (make-array 1025 :element-type '(unsigned-byte 8))) arena lengths))
             (setf (l::local-client-limit client) 4096)
             (signals arcdocdb.conditions:resource-exhausted
               (l:client-get-group-into client (make-array 8 :initial-element (make-array 1024 :element-type '(unsigned-byte 8))) arena lengths))
             (rg-into-untouched arena lengths) (is (= 1 (l::local-client-next-id client)))
             (is (equal '(0 0) (multiple-value-list (funcall stats)))))
        (l:close-local client))))
  (let* ((docs (vector (bytes #xf6))) (client (scripted-group-client (rg-into-reply docs) :read-groups t))
         (arena (rg-into-arena)) (lengths (rg-into-lengths)))
    (unwind-protect
         (progn (is (equal '(1 1) (multiple-value-list (l:client-get-group-into client (vector (bytes 1) arena nil) arena lengths :count 1 :start 4))))
                (rg-into-guards arena lengths 4 docs) (rg-into-clean client))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-read-group-into-last-u64-ID-completes-once
  (let* ((docs (vector (bytes #xf6))) (client (scripted-group-client (rg-into-reply docs #xffffffffffffffff) :read-groups t))
         (arena (rg-into-arena)) (lengths (rg-into-lengths)))
    (unwind-protect
         (progn (setf (l::local-client-next-id client) #xffffffffffffffff)
                (is (equal '(1 1) (multiple-value-list (l:client-get-group-into client (vector (bytes 1)) arena lengths :start 4))))
                (rg-into-guards arena lengths 4 docs) (rg-into-clean client)
                (signals arcdocdb.conditions:resource-exhausted (l:client-get-group-into client (vector (bytes 1)) arena lengths :start 4))
                (rg-into-guards arena lengths 4 docs) (is (eq :ready (l::local-client-state client))))
      (l:close-local client))))
