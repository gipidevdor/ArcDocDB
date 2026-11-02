;;; OWNER: immutable frames, exclusive output/CBOR scratch; no engine or peer capability.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets b:u64 (member 0 1 3) t t t (integer 4096 65536)) b:index) encode-local-version))
(defun encode-local-version (out id operation key document expected limit)
  "Pre: stable external inputs and private output. Post: opcode 6 request, [0,key], [1,key,expected,document] or [3,key,expected].
All input, u64 token, alias, CBOR and negotiated frame checks precede output mutation or send."
  (%wire-request-input out (if (zerop operation) 2 operation) key document)
  (unless (typep expected 'b:u64) (error 'arcdocdb.conditions:invalid-argument :reason :local-expected-version))
  (let ((size (+ 2 (%wire-head-size (length key)) (length key)
                 (if (zerop operation) 0 (%wire-head-size expected))
                 (if (= operation 1) (+ (%wire-head-size (length document)) (length document)) 0))))
    (multiple-value-bind (cursor end) (%wire-output-begin out 2 id +local-version-opcode+ size limit)
      (setf cursor (%wire-put-head out cursor end 4 (case operation (0 2) (1 4) (3 3)))
            cursor (%wire-put-head out cursor end 0 operation)
            cursor (%wire-put-bstr out cursor end key 0 (length key)))
      (unless (zerop operation) (setf cursor (%wire-put-head out cursor end 0 expected)))
      (when (= operation 1) (setf cursor (%wire-put-bstr out cursor end document 0 (length document))))
      (unless (= cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-version-request-end)) end)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor)
                         (values (member 0 1 5) (or null b:octets) (or null b:octets) (member 0 1 3) b:u64 &optional))
                decode-local-version))
(defun decode-local-version (buffer envelope space)
  "Pre: complete opcode 6 REQUEST. Post: status/key/document/operation/expected; full validation before copies.
Malformed shape is status 1, bounded key/document refusal 5; no engine lookup on refusal."
  (%wire-envelope-input buffer envelope)
  (unless (and (= 2 (envelope-kind envelope)) (= +local-version-opcode+ (envelope-code envelope)))
    (%wire-fail :local-version-request))
  (handler-case
      (let ((end (envelope-payload-end envelope)))
        (multiple-value-bind (major count cursor) (%wire-head buffer (envelope-payload-start envelope) end)
          (unless (= major 4) (%wire-fail :local-version-array))
          (multiple-value-bind (operation next) (%wire-uint buffer cursor end 3)
            (unless (and (member operation '(0 1 3)) (= count (case operation (0 2) (1 4) (3 3))))
              (%wire-fail :local-version-operation))
            (multiple-value-bind (ks size after-key) (%wire-bstr buffer next end)
              (when (zerop size) (return-from decode-local-version (values 1 nil nil 0 0)))
              (when (> size +max-key-bytes+) (return-from decode-local-version (values 5 nil nil 0 0)))
              (multiple-value-bind (expected after-version)
                  (if (zerop operation) (values 0 after-key) (%wire-uint buffer after-key end #xffffffffffffffff))
                (multiple-value-bind (ds document-size finish)
                    (if (= operation 1) (%wire-bstr buffer after-version end) (values 0 0 after-version))
                  (unless (= finish end) (%wire-fail :local-version-trailing))
                  (when (= operation 1)
                    (let ((status (%wire-document-status buffer ds finish space)))
                      (unless (zerop status) (return-from decode-local-version (values status nil nil 0 0)))))
                  (values 0 (%wire-copy buffer ks size) (when (= operation 1) (%wire-copy buffer ds document-size))
                          operation expected)))))))
    (protocol-error () (values 1 nil nil 0 0))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-LIM-003
(declaim (ftype (function (b:octets b:u64 (member 0 1 3) boolean b:u64 b:octets b:index) b:index) encode-local-version-response))
(defun encode-local-version-response (out id operation success version document size)
  "Pre: reserved output and completed canonical engine result. Post: [boolean,CSN,document/null] for GET, [boolean,CSN] otherwise.
No I/O/engine call; impossible result shapes are invariants, never authoritative pre-write rejections."
  (unless (and (if success (plusp version) (or (not (zerop operation)) (zerop version)))
               (if (and (zerop operation) success) (<= 1 size +max-document-bytes+) (zerop size)))
    (error 'arcdocdb.conditions:invariant-violation :reason :local-version-result))
  (let ((payload (+ 2 (%wire-head-size version)
                    (if (zerop operation) (if success (+ (%wire-head-size size) size) 1) 0))))
    (multiple-value-bind (cursor end) (%wire-output-begin out 3 id 0 payload +server-max-frame+)
      (setf cursor (%wire-put-head out cursor end 4 (if (zerop operation) 3 2))
            (aref out cursor) (if success #xf5 #xf4)) (incf cursor)
      (setf cursor (%wire-put-head out cursor end 0 version))
      (when (zerop operation)
        (if success (setf cursor (%wire-put-bstr out cursor end document 0 size))
            (progn (setf (aref out cursor) #xf6) (incf cursor))))
      (unless (= cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-version-response-end)) end)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor (member 0 1 3))
                         (values (member :found :absent :applied :conflict) b:u64 b:index b:index &optional))
                %wire-version-response-spans))
(defun %wire-version-response-spans (buffer envelope space operation)
  "Pre: correlated complete RESPONSE. Post: status/CSN/document-offset/size, zero spans except for a found GET.
Exact shape, booleans, positive success token, absence zero/null, embedded CBOR and end verified before copying.
Only valid error/null is REQUEST-REJECTED; malformed results are PROTOCOL-ERROR. Borrowed spans never escape input ownership."
  (%wire-envelope-input buffer envelope)
  (unless (= 3 (envelope-kind envelope)) (%wire-fail :local-expected-response))
  (let ((end (envelope-payload-end envelope)) (cursor (envelope-payload-start envelope)))
    (when (plusp (envelope-code envelope))
      (unless (%wire-null-p buffer cursor end) (%wire-fail :local-error-payload))
      (error 'request-rejected :reason :local-request-rejected :status (envelope-code envelope)))
    (setf cursor (%wire-expect buffer cursor end 4 (if (zerop operation) 3 2)))
    (unless (and (< cursor end) (member (aref buffer cursor) '(#xf4 #xf5))) (%wire-fail :local-version-boolean))
    (let ((success (= #xf5 (aref buffer cursor))))
      (multiple-value-bind (version next) (%wire-uint buffer (1+ cursor) end #xffffffffffffffff)
        (when (and success (zerop version)) (%wire-fail :local-version-zero))
        (if (zerop operation)
            (if success
                (multiple-value-bind (start size finish) (%wire-bstr buffer next end)
                  (unless (and (= finish end) (zerop (%wire-document-status buffer start end space)))
                    (%wire-fail :local-version-document))
                  (values :found version start size))
                (progn (unless (and (zerop version) (%wire-null-p buffer next end)) (%wire-fail :local-version-absence))
                       (values :absent 0 0 0)))
            (progn (unless (= next end) (%wire-fail :local-version-trailing))
                   (values (if success :applied :conflict) version 0 0)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor (member 0 1 3)) (values keyword t &optional b:u64))
                decode-local-version-response))
(defun decode-local-version-response (buffer envelope space operation)
  "Pre: correlated complete RESPONSE and exclusive scratch. Post: original persistent GET copy/CSN or mutation status/CSN.
The shared complete validator precedes allocation; protocol and authoritative rejection conditions propagate unchanged."
  (multiple-value-bind (status version offset size) (%wire-version-response-spans buffer envelope space operation)
    (if (zerop operation)
        (values status (when (eq status :found) (%wire-copy buffer offset size)) version)
        (values status version))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor b:octets b:index)
                         (values (member :found :absent) b:index b:u64 &optional)) decode-local-version-into))
(defun decode-local-version-into (buffer envelope space target start)
  "Pre: correlated versioned GET, immutable input and exclusive distinct target. Post: FOUND/size/CSN or ABSENT/0/0.
Shared complete grammar/token/document validation and output bounds precede the exact copy; no document allocation.
Alias/range errors propagate before copying; malformed/rejected responses never modify TARGET or expose borrowed spans."
  (when (eq target buffer)
    (error 'arcdocdb.conditions:invalid-argument :reason :local-get-output-alias))
  (b:check-range target start start)
  (multiple-value-bind (status version offset size) (%wire-version-response-spans buffer envelope space 0)
    (b:check-range target start (+ start size))
    (when (eq status :found)
      (replace target buffer :start1 start :end1 (+ start size) :start2 offset :end2 (+ offset size)))
    (values (the (member :found :absent) status) size version)))
