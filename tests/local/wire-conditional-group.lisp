;;;; Independent CBOR bytes and complete-prefix oracles for opcode 7; no engine or socket.
(in-package #:arcdocdb.local.wire.tests)
(defun conditional-u64 (&rest values)
  (make-array (length values) :element-type '(unsigned-byte 64) :initial-contents values))
(defun conditional-wire-member (opcode key token &optional document)
  (join (uint (if (= opcode 1) 4 3) 4) (uint opcode) (bstr key) (uint token)
        (if (= opcode 1) (bstr document) (bytes))))
(defun conditional-wire-decode (wire &optional (limit 8))
  (let ((work (l::make-local-group-workspace)))
    (multiple-value-bind (status count)
        (l::decode-local-conditional-group wire (envelope wire) (cbor:crea-spazio-cbor) work limit)
      (values status count work))))
(defun conditional-work-cleared (work)
  (is (every #'null (l::local-group-workspace-operations work)))
  (dolist (a (list (l::local-group-workspace-spans work) (l::local-group-workspace-csns work)
                   (l::local-group-workspace-expected work) (l::local-group-workspace-conditions work)
                   (l::local-group-workspace-applied work))) (is (every #'zerop a))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-004-conditional-explicit-nonlocal-copy-clears-whole-workspace
  (let* ((wire (request 7 (join (bytes #x82) (conditional-wire-member 3 (bytes 1) 7)
                                            (conditional-wire-member 3 (bytes 2) 9))))
         (work (l::make-local-group-workspace)) (original (symbol-function 'l::%wire-copy)) (copies 0))
    (unwind-protect
         (progn
           (setf (symbol-function 'l::%wire-copy)
                 (lambda (&rest args) (when (= 2 (incf copies)) (throw 'copy :escaped)) (apply original args)))
           (is (eq :escaped (catch 'copy (l::decode-local-conditional-group wire (envelope wire) (cbor:crea-spazio-cbor) work 8))))
           (conditional-work-cleared work))
      (setf (symbol-function 'l::%wire-copy) original))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003
(deftest test-REQ-IPC-002-conditional-explicit-sixteen-capabilities-exact-old-and-new-bytes
  (dolist (writes '(nil t)) (dolist (reads '(nil t)) (dolist (versions '(nil t)) (dolist (conditional '(nil t))
    (let* ((caps (join (if writes (bytes 4) (bytes)) (if reads (bytes 5) (bytes))
                       (if versions (bytes 6) (bytes)) (if conditional (bytes 7) (bytes))))
           (out (output)) (options (list :write-groups writes :read-groups reads :versions versions :conditional-groups conditional)))
      (dolist (welcome '(nil t))
        (let* ((end (if welcome (apply #'l:encode-local-welcome out 4096 options) (apply #'l:encode-local-hello out 4096 options)))
               (wire (subseq out 0 end)) (offered (plusp (length caps)))
               (expected (framed (body (if welcome 1 0) 0 0
                              (join (bytes (if (or welcome offered) #xa3 #xa2) 0 #x19 #x10 0 1 1)
                                    (if (or welcome offered)
                                        (join (bytes 2) (uint (+ (if welcome 4 0) (length caps)) 4)
                                              (if welcome (bytes 0 1 2 3) (bytes)) caps) (bytes)))))))
          (is (equalp wire expected))
          (is (equal '(4096 1) (multiple-value-list
                                (if welcome (apply #'l:decode-local-welcome wire (envelope wire) options)
                                    (l:decode-local-hello wire (envelope wire))))))
          (is (eq conditional (l::envelope-conditional-groups (envelope wire))))
          (when welcome
            (signals l:protocol-error (l:decode-local-welcome wire (envelope wire) :write-groups writes :read-groups reads
                                                             :versions versions :conditional-groups (not conditional)))))))))))
  (dolist (bad '(1 :yes "true"))
    (signals arcdocdb.conditions:invalid-argument (l:connect-local "/not-opened" :conditional-groups bad))
    (signals arcdocdb.conditions:invalid-argument (l:encode-local-hello (output) 4096 :conditional-groups bad)))
  (dolist (caps (list (bytes #x82 7 7) (bytes #x82 7 4) (bytes #x81 8) (bytes #x81 #x18 7)))
    (signals l:protocol-error (envelope (framed (body 0 0 0 (join (bytes #xa3 0 #x19 #x10 0 1 1 2) caps)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-conditional-explicit-request-independent-u64-fixtures
  (dolist (token '(0 1 23 24 255 256 65535 65536 4294967296 18446744073709551615))
    (dolist (count '(1 2 8))
      (let ((ops (make-array count)) (versions (make-array count :element-type '(unsigned-byte 64) :initial-element token))
            (payload (uint count 4)) (out (output)))
        (dotimes (i count)
          (let* ((put (evenp i)) (key (bytes 0 #xff i)) (doc (when put (bytes #xf6))))
            (setf (svref ops i) (arcdocdb.engine:crea-operazione-scrittura (if put :put :delete) key doc)
                  payload (join payload (conditional-wire-member (if put 1 3) key token doc)))))
        (let* ((end (l::encode-local-conditional-group out #xffffffffffffffff ops versions count (cbor:crea-spazio-cbor) 65536))
               (wire (subseq out 0 end)))
          (is (equalp wire (request 7 payload #xffffffffffffffff)))
          (multiple-value-bind (status actual work) (conditional-wire-decode wire)
            (is (zerop status)) (is (= count actual))
            (is (equalp versions (subseq (l::local-group-workspace-expected work) 0 count)))
            (fill wire 0)
            (dotimes (i count)
              (is (equalp (bytes 0 #xff i) (arcdocdb.engine::operazione-scrittura-key
                                          (svref (l::local-group-workspace-operations work) i)))))
            (l::clear-local-group-workspace work) (conditional-work-cleared work)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-conditional-explicit-invalid-last-member-before-copies
  (let ((original (symbol-function 'l::%wire-copy)) (copies 0) (valid (conditional-wire-member 1 (bytes 1) 0 (bytes #xf6))))
    (unwind-protect
         (progn
           (setf (symbol-function 'l::%wire-copy) (lambda (&rest args) (incf copies) (apply original args)))
           (dolist (last (list (bytes #xf6) (bytes #x83 3 #x41 2 #x20) (bytes #x83 3 #x40 0)
                              (bytes #x84 1 #x41 2 0 #x41 #xff) (bytes #x84 1 #x41 2 0 #x42 0 0)
                              (conditional-wire-member 3 (bytes 1) 0)))
             (multiple-value-bind (status count work) (conditional-wire-decode (request 7 (join (bytes #x82) valid last)))
               (is (= 1 status)) (is (zerop count)) (conditional-work-cleared work)))
           (dolist (payload (list (bytes #x80) (join (bytes #x82) valid (conditional-wire-member 3 (bytes 2) 0))))
             (multiple-value-bind (status count work) (conditional-wire-decode (request 7 payload) 1)
               (is (= (if (= #x80 (aref payload 0)) 1 5) status)) (is (zerop count)) (conditional-work-cleared work)))
           (let ((wire (request 7 (join (bytes #x81) (conditional-wire-member 3 (output 1025) 0)))))
             (is (= 5 (conditional-wire-decode wire))))
           (is (zerop copies)))
      (setf (symbol-function 'l::%wire-copy) original))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-conditional-explicit-full-frame-and-preflight-output-preservation
  (let* ((document (get-document 60000)) (out (output)) (space (cbor:crea-spazio-cbor))
         (ops (vector (arcdocdb.engine:crea-operazione-scrittura :put (bytes 1) document)
                      (arcdocdb.engine:crea-operazione-scrittura :put (bytes 2) document)))
         (expected (conditional-u64 0 0)))
    (let ((end (l::encode-local-conditional-group out 1 ops expected 1 space 65536)))
      (is (zerop (conditional-wire-decode (subseq out 0 end)))))
    (fill out 204)
    (signals arcdocdb.conditions:resource-exhausted (l::encode-local-conditional-group out 1 ops expected 2 space 65536))
    (is (every (lambda (n) (= n 204)) out))
    (setf (svref ops 1) (svref ops 0))
    (signals arcdocdb.conditions:invalid-argument (l::encode-local-conditional-group out 1 ops expected 2 space 65536))
    (is (every (lambda (n) (= n 204)) out))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-008
(deftest test-REQ-IPC-002-conditional-explicit-mixed-results-and-malformed-final-result
  (let ((out (output)) (tokens (conditional-u64 1 #xffffffffffffffff 2)) (flags (bytes 1 0 1)))
    (let* ((end (l::encode-local-conditional-response out 1 tokens flags 3)) (wire (subseq out 0 end)))
      (is (equalp wire (framed (body 3 1 0 (join (bytes #x83 #x82 #xf5 1 #x82 #xf4)
                                                   (uint #xffffffffffffffff) (bytes #x82 #xf5 2))))))
      (is (= 2 (l::decode-local-conditional-response wire (envelope wire) tokens flags 3)))))
  (dolist (payload (list (bytes #x81 #x82 #xf5 0) (bytes #x81 #x82 #xf4 #x20) (bytes #x81 #x82 1 1)
                         (bytes #x82 #x82 #xf5 1 #x82 #xf5 1) (bytes #x82 #x82 #xf5 2 #x82 #xf5 1)
                         (bytes #x82 #x82 #xf5 1 #x83 #xf4 0 #xf6)))
    (let ((wire (framed (body 3 1 0 payload))))
      (signals l:protocol-error (l::decode-local-conditional-response wire (envelope wire)
                                 (conditional-u64 0 0) (bytes 0 0) (if (= #x81 (aref payload 0)) 1 2)))))
  (let ((wire (framed (body 3 1 0 (bytes #x82 #x82 #xf4 0 #x82 #xf4 0)))))
    (is (zerop (l::decode-local-conditional-response wire (envelope wire) (conditional-u64 9 9) (bytes 9 9) 2))))
  (loop for status from 1 to 5 do
    (let ((wire (framed (body 3 1 status (bytes #xf6)))))
      (signals l:request-rejected (l::decode-local-conditional-response wire (envelope wire) (conditional-u64 0) (bytes 0) 1)))))
