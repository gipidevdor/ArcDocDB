;;;; Independent literals and boundary oracles for negotiated write groups.
(in-package #:arcdocdb.local.wire.tests)

(defun group-put (key doc) (join (bytes #x83 1) (bstr key) (bstr doc)))
(defun group-delete (key) (join (bytes #x82 3) (bstr key)))
(defun group-wire (&rest members) (request 4 (apply #'join (uint (length members) 4) members)))
(defun group-status (wire &optional (limit 8))
  (let ((work (l::make-local-group-workspace)))
    (multiple-value-bind (status count)
        (l::decode-local-write-group wire (envelope wire) (cbor:crea-spazio-cbor) work limit)
      (when (plusp status)
        (is (every #'null (l::local-group-workspace-operations work)))
        (is (every #'zerop (l::local-group-workspace-spans work))))
      (values status count work))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(deftest test-REQ-IPC-002-group-handshake-exact-and-no-downgrade
  (let* ((out (output)) (end (l:encode-local-hello out 4096 :write-groups t)) (wire (subseq out 0 end)))
    (is (equalp (bytes 0 0 0 15 #x85 1 0 0 0 #xa3 0 #x19 #x10 0 1 1 2 #x81 4) wire))
    (is (equal '(4096 1) (multiple-value-list (l:decode-local-hello wire (envelope wire))))))
  (let* ((out (output)) (end (l:encode-local-welcome out 65536 :write-groups t)) (wire (subseq out 0 end)))
    (is (equalp (bytes 0 0 0 21 #x85 1 1 0 0 #xa3 0 #x1a 0 1 0 0 1 1 2 #x85 0 1 2 3 4) wire))
    (is (equal '(65536 1) (multiple-value-list (l:decode-local-welcome wire (envelope wire) :write-groups t))))
    (signals l:protocol-error (l:decode-local-welcome wire (envelope wire))))
  (let* ((out (output)) (end (l:encode-local-welcome out 65536)) (wire (subseq out 0 end)))
    (signals l:protocol-error (l:decode-local-welcome wire (envelope wire) :write-groups t)))
  (dolist (offer (list (bytes #x80) (bytes #x82 4 4) (bytes #x81 3) (bytes #x81 #x18 4) (bytes 4)))
    (signals l:protocol-error (envelope (framed (body 0 0 0 (join (bytes #xa3 0 #x19 #x10 0 1 1 2) offer))))))
  (dolist (bad '(1 :yes))
    (signals arcdocdb.conditions:invalid-argument (l:encode-local-hello (output) 4096 :write-groups bad))
    (signals arcdocdb.conditions:invalid-argument (l:connect-local "/not-opened" :write-groups bad))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-group-full-validation-before-copy-and-budgets
  (let* ((key (bytes 0 #xff)) (doc (bytes #x18 #x2a))
         (wire (group-wire (group-put key doc) (group-delete key))))
    (multiple-value-bind (status count work) (group-status wire)
      (is (zerop status)) (is (= 2 count))
      (let ((op (svref (l::local-group-workspace-operations work) 0)))
        (is (equalp key (arcdocdb.engine::operazione-scrittura-key op)))
        (is (equalp doc (arcdocdb.engine::operazione-scrittura-value op))))
      (fill wire 0)
      (is (equalp key (arcdocdb.engine::operazione-scrittura-key (svref (l::local-group-workspace-operations work) 0))))))
  (is (= 1 (group-status (group-wire))))
  (is (= 5 (group-status (apply #'group-wire (make-list 9 :initial-element (group-delete (bytes 1)))))))
  (is (= 5 (group-status (group-wire (group-delete (bytes 1)) (group-delete (bytes 2))) 1)))
  (dolist (bad (list (group-put (bytes) (bytes 0)) (group-put (bytes 1) (bytes #xff))
                    (bytes #x82 2 #xf6) (group-delete (bytes))))
    (is (= 1 (group-status (group-wire (group-put (bytes 1) (bytes 0)) bad)))))
  (is (= 5 (group-status (group-wire (group-delete (output 1025))))))
  (is (zerop (group-status (group-wire (group-put (output 1024) (get-document 60000))))))
  (is (= 5 (group-status (group-wire (group-put (bytes 1) (get-document 60001)))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-group-encoder-prefix-preflight-and-exact-frame
  (let* ((out (output)) (space (cbor:crea-spazio-cbor))
         (ops (vector (arcdocdb.engine:crea-operazione-scrittura :put (bytes 1) (bytes 0))
                      (arcdocdb.engine:crea-operazione-scrittura :delete (bytes 2)) :bad))
         (end (l::encode-local-write-group out 1 ops 2 space 65536)))
    (is (equalp (subseq out 0 end) (group-wire (group-put (bytes 1) (bytes 0)) (group-delete (bytes 2)))))
    (let ((before (copy-seq out)))
      (signals arcdocdb.conditions:invalid-argument (l::encode-local-write-group out 1 ops 3 space 65536))
      (is (equalp before out))))
  ;; Body = 5 envelope bytes + 1 group array + 7 member/header/key bytes + document.
  (dolist (size '(4083 4084))
    (let* ((out (output)) (before (copy-seq out))
           (ops (vector (arcdocdb.engine:crea-operazione-scrittura :put (bytes 1) (get-document size)))))
      (if (= size 4083)
          (is (= 4100 (l::encode-local-write-group out 1 ops 1 (cbor:crea-spazio-cbor) 4096)))
          (progn
            (signals arcdocdb.conditions:resource-exhausted
              (l::encode-local-write-group out 1 ops 1 (cbor:crea-spazio-cbor) 4096))
            (is (equalp before out)))))))

;;; REQ: REQ-IPC-002 REQ-WAL-006
(deftest test-REQ-WAL-006-group-response-u64-exact-count-order-and-errors
  (let* ((csns (make-array 3 :element-type '(unsigned-byte 64) :initial-contents '(4294967295 4294967296 18446744073709551615)))
         (out (output)) (scratch (make-array 8 :element-type '(unsigned-byte 64)))
         (end (l::encode-local-group-response out 1 csns 3)) (wire (subseq out 0 end)))
    (is (= 3 (l::decode-local-group-response wire (envelope wire) scratch 3)))
    (is (equalp csns (subseq scratch 0 3))))
  (dolist (payload (list (bytes #x82 1 0) (bytes #x82 2 2) (bytes #x82 2 1) (bytes #x81 1) (bytes #x83 1 2 3)))
    (let ((wire (framed (body 3 1 0 payload))))
      (signals l:protocol-error (l::decode-local-group-response wire (envelope wire)
                                (make-array 8 :element-type '(unsigned-byte 64)) 2))))
  (loop for status from 1 to 5 do
    (let ((wire (framed (body 3 1 status (bytes #xf6)))))
      (signals l:request-rejected (l::decode-local-group-response wire (envelope wire)
                                  (make-array 8 :element-type '(unsigned-byte 64)) 2)))))
