;;;; Independent canonical CBOR fixtures, full u64 tokens and complete-result validation.
(in-package #:arcdocdb.local.wire.tests)
(defun version-wire (operation key document token &optional (id 1))
  (framed (body 2 id 6 (join (uint (case operation (0 2) (1 4) (3 3)) 4) (uint operation) (bstr key)
                              (if (zerop operation) (bytes) (uint token)) (if (= operation 1) (bstr document) (bytes))))))
(defun version-response (payload operation &optional (status 0))
  (let ((wire (framed (body 3 1 status payload))))
    (l::decode-local-version-response wire (envelope wire) (cbor:crea-spazio-cbor) operation)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003
(deftest test-REQ-IPC-002-version-eight-capability-combinations-exact-bytes
  (dolist (writes '(nil t)) (dolist (reads '(nil t)) (dolist (versions '(nil t))
    (let* ((caps (join (if writes (bytes 4) (bytes)) (if reads (bytes 5) (bytes)) (if versions (bytes 6) (bytes))))
           (out (output)) (options (list :write-groups writes :read-groups reads :versions versions)))
      (dolist (welcome '(nil t))
        (let* ((end (if welcome (apply #'l:encode-local-welcome out 4096 options) (apply #'l:encode-local-hello out 4096 options)))
               (wire (subseq out 0 end)) (offered (plusp (length caps)))
               (expected (framed (body (if welcome 1 0) 0 0
                              (join (bytes (if (or welcome offered) #xa3 #xa2) 0 #x19 #x10 0 1 1)
                                    (if (or welcome offered) (join (bytes 2) (uint (+ (if welcome 4 0) (length caps)) 4)
                                                        (if welcome (bytes 0 1 2 3) (bytes)) caps) (bytes)))))))
          (is (equalp wire expected))
          (is (equal '(4096 1) (multiple-value-list (if welcome (apply #'l:decode-local-welcome wire (envelope wire) options)
                                                      (l:decode-local-hello wire (envelope wire))))))
          (when welcome
            (signals l:protocol-error (l:decode-local-welcome wire (envelope wire) :write-groups writes :read-groups reads :versions (not versions)))))))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-MVC-006 REQ-AFF-008
(deftest test-REQ-IPC-002-version-request-roundtrip-independent-fixtures
  (dolist (id '(1 24 4294967296 18446744073709551615))
    (dolist (token '(0 1 23 24 255 256 65535 65536 4294967295 4294967296 18446744073709551615))
      (dolist (operation '(0 1 3))
        (let* ((out (output)) (key (bytes 0 #xff 3)) (document (when (= operation 1) (bytes #x18 42)))
               (end (l::encode-local-version out id operation key document token 65536)) (wire (subseq out 0 end)))
          (is (equalp wire (version-wire operation key document token id)))
          (multiple-value-bind (status actual-key actual-doc actual-op actual-token)
              (l::decode-local-version wire (envelope wire) (cbor:crea-spazio-cbor))
            (is (zerop status)) (is (= operation actual-op)) (is (= actual-token (if (zerop operation) 0 token)))
            (fill wire 0) (is (equalp key actual-key)) (is (equalp document actual-doc))))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-version-invalid-complete-request-never-copies
  (let ((original (symbol-function 'l::%wire-copy)) (copies 0))
    (unwind-protect
         (progn
           (setf (symbol-function 'l::%wire-copy) (lambda (&rest args) (incf copies) (apply original args)))
           (dolist (payload (list (bytes #xf6) (bytes #x82 2 #x41 1) (bytes #x82 0 #x40)
                                  (bytes #x83 0 #x41 1 0) (bytes #x83 3 #x41 1 #x20)
                                  (bytes #x84 1 #x41 1 0 #x41 #xff) (bytes #x84 1 #x41 1 0 #x42 0 0)))
             (let ((wire (request 6 payload)))
               (is (= 1 (l::decode-local-version wire (envelope wire) (cbor:crea-spazio-cbor))))))
           (dolist (wire (list (version-wire 3 (output 1025) nil 0) (version-wire 1 (bytes 1) (output 60001) 0)))
             (is (= 5 (l::decode-local-version wire (envelope wire) (cbor:crea-spazio-cbor)))))
           (is (zerop copies)))
      (setf (symbol-function 'l::%wire-copy) original)))
  (let ((out (output)))
    (dolist (bad '(-1 18446744073709551616 nil))
      (fill out 204) (signals arcdocdb.conditions:invalid-argument (l::encode-local-version out 1 1 (bytes 1) (bytes #xf6) bad 65536))
      (is (every (lambda (v) (= v 204)) out)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-MVC-006 REQ-AFF-004
(deftest test-REQ-IPC-002-version-results-exact-shapes-and-token-ranges
  (dolist (token '(1 24 4294967296 18446744073709551615))
    (is (equal (list :applied token) (multiple-value-list (version-response (join (bytes #x82 #xf5) (uint token)) 1))))
    (is (equal (list :conflict token) (multiple-value-list (version-response (join (bytes #x82 #xf4) (uint token)) 3))))
    (is (equalp (list :found (bytes #xf6) token)
                (multiple-value-list (version-response (join (bytes #x83 #xf5) (uint token) (bytes #x41 #xf6)) 0)))))
  (is (equal '(:absent nil 0) (multiple-value-list (version-response (bytes #x83 #xf4 0 #xf6) 0))))
  (is (equal '(:conflict 0) (multiple-value-list (version-response (bytes #x82 #xf4 0) 1))))
  (dolist (payload (list (bytes #x83 #xf4 1 #xf6) (bytes #x83 #xf5 0 #x41 #xf6) (bytes #x83 #xf4 0 #x40)
                         (bytes #x83 #xf5 1 #x41 #xff) (bytes #x83 1 1 #x41 #xf6) (bytes #x82 #xf5 1)))
    (signals l:protocol-error (version-response payload 0)))
  (dolist (payload (list (bytes #x82 #xf5 0) (bytes #x82 #xf4 #x20) (bytes #x83 #xf5 1 #xf6)))
    (signals l:protocol-error (version-response payload 1)))
  (signals l:request-rejected (version-response (bytes #xf6) 1 2))
  (signals l:protocol-error (version-response (bytes 1) 1 2)))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-IPC-002-version-capability-errors-and-preflight
  (dolist (caps (list (bytes #x82 6 4) (bytes #x82 6 6) (bytes #x81 7) (bytes #x81 #x18 6) (bytes #x84 4 5 6 7)))
    (signals l:protocol-error (envelope (framed (body 0 0 0 (join (bytes #xa3 0 #x19 #x10 0 1 1 2) caps))))))
  (dolist (option '(1 :yes "true"))
    (signals arcdocdb.conditions:invalid-argument (l:connect-local "/not-opened" :versions option))
    (signals arcdocdb.conditions:invalid-argument (l:encode-local-hello (output) 4096 :versions option))
    (signals arcdocdb.conditions:invalid-argument (l:encode-local-welcome (output) 4096 :versions option))))
