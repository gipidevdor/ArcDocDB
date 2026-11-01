;;;; ADR-0056, profilo M1: u32be e cinque campi CBOR, senza albero di oggetti.
;;; OWNER: chiamante seriale; input immutabile, output e scratch esclusivi.
;;; SHARED: nessuna scrittura condivisa, I/O, reader Lisp o dipendenza sperimentale.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +server-max-frame+ 65536)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +hello-limit+ 4096)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +max-key-bytes+ 1024)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +max-document-bytes+ 60000)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +max-get-frame+ 60032)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +output-buffer-size+ 65540)
;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(defconstant +local-write-group-opcode+ 4)
;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(defconstant +local-write-group-limit+ 8)

;;; REQ: REQ-IPC-002 REQ-AFF-004
(define-condition protocol-error (arcdocdb.conditions:arcdocdb-error) ()
  (:documentation "Pre: wire violation. Post: connection must close; reason without peer data."))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(declaim (ftype (function (t) (values keyword &optional)) protocol-error-reason))
(defun protocol-error-reason (condition)
  "Pre: external condition. Post: protocol reason; INVALID-ARGUMENT for another type.
Ownership: caller's condition, no mutation."
  (unless (typep condition 'protocol-error)
    (error 'arcdocdb.conditions:invalid-argument :reason :local-condition-type))
  (arcdocdb.conditions:error-reason condition))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(defstruct (envelope (:constructor %make-envelope)
                     (:copier nil) (:predicate nil))
  "Pre: private construction after verification. Post: fixed fields and buffer views.
Ownership: caller's immutable buffer until final use; no implicit copy."
  (buffer nil :type (or null b:octets) :read-only t)
  (kind 0 :type (integer 0 3) :read-only t)
  (id 0 :type b:u64 :read-only t)
  (code 0 :type b:u16 :read-only t)
  (payload-start 0 :type b:index :read-only t)
  (payload-end 0 :type b:index :read-only t)
  (max-frame 0 :type (integer 0 17825792) :read-only t)
  (max-inflight 0 :type (integer 0 16) :read-only t)
  (write-groups nil :type boolean :read-only t)
  (frame-limit 65536 :type (integer 4096 17825792) :read-only t))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(declaim (ftype (function (keyword &optional t) nil) %wire-fail))
(defun %wire-fail (reason &optional offset)
  "Pre: internal reason and optional offset. Post: signals PROTOCOL-ERROR without return.
Ownership: no buffer or state retained."
  (error 'protocol-error :reason reason :offset offset))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t t) (values b:index &optional)) %wire-range))
(defun %wire-range (buffer start end)
  "Pre: external arguments. Post: valid half-open simple u8 span, or INVALID-ARGUMENT.
Ownership: verification only, buffer unchanged; no bytes read before guards."
  (unless (and (typep buffer 'b:octets) (typep start 'b:index) (typep end 'b:index)
               (<= start end (length buffer)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-wire-range))
  end)

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (t) (values (integer 4096 17825792) &optional)) %wire-limit))
(defun %wire-limit (limit)
  "Pre: external limit. Post: capacity admitted by the contract, or INVALID-ARGUMENT.
Ownership: no state; does not allocate based on the limit."
  (unless (typep limit '(integer 4096 17825792))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-frame-limit))
  limit)

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (t t t &key (:max-frame t))
                         (values b:u32 b:index &optional)) read-frame-length))
(defun read-frame-length (buffer start end &key (max-frame +server-max-frame+))
  "Pre: caller's buffer, at least four bytes in the span. Post: u32be length and START+4.
Zero/oversize/truncation signal PROTOCOL-ERROR before reserving the body.
Ownership: reads four bytes only; any following bytes are not read."
  (%wire-range buffer start end)
  (%wire-limit max-frame)
  (when (< (- end start) 4) (%wire-fail :local-prefix-truncated end))
  (let ((size 0))
    (dotimes (i 4) (setf size (logior (ash size 8) (aref buffer (+ start i)))))
    (unless (<= 1 size max-frame) (%wire-fail :local-frame-length start))
    (values size (+ start 4))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index)
                         (values (unsigned-byte 3) b:u64 b:index &optional)) %wire-head))
(defun %wire-head (buffer start end)
  "Pre: verified span and immutable buffer. Post: major, u64 argument, minimal-header end.
Propagates product CBOR conditions; no payload or tree constructed."
  (multiple-value-bind (major ai high low next form)
      (cbor:leggi-header-cbor-minimo buffer start end)
    (unless (and (< ai 28) (eq form :argument) (< start next) (<= next end))
      (%wire-fail :local-header start))
    (values major (logior (ash high 32) low) next)))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index b:u64)
                         (values b:u64 b:index &optional)) %wire-uint))
(defun %wire-uint (buffer start end maximum)
  "Pre: verified span, u64 maximum. Post: minimally encoded unsigned value within maximum and increasing cursor.
PROTOCOL-ERROR for type/value; propagates CBOR errors. Ownership: immutable input."
  (multiple-value-bind (major value next) (%wire-head buffer start end)
    (unless (and (= major 0) (<= value maximum)) (%wire-fail :local-uint start))
    (values value next)))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index (integer 0 6) b:u64)
                         (values b:index &optional)) %wire-expect))
(defun %wire-expect (buffer start end wanted-major wanted-value)
  "Pre: immutable buffer, fixed expected header. Post: exact minimal-header end.
PROTOCOL-ERROR for a different shape; propagates CBOR conditions without reading a payload."
  (multiple-value-bind (major value next) (%wire-head buffer start end)
    (unless (and (= major wanted-major) (= value wanted-value))
      (%wire-fail :local-payload-shape start))
    next))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index b:index b:index)
                         (values boolean &optional)) %wire-key-less-p))
(defun %wire-key-less-p (buffer left-start left-end right-start right-end)
  "Pre: two complete CBOR keys in the same immutable buffer. Post: bytewise lexicographic order.
No allocation; at most the shorter span, then length comparison."
  (loop for left from left-start below left-end
        for right from right-start below right-end
        for a = (aref buffer left) for b = (aref buffer right)
        when (< a b) do (return-from %wire-key-less-p t)
        when (> a b) do (return-from %wire-key-less-p nil))
  (< (- left-end left-start) (- right-end right-start)))

;;; REQ: REQ-IPC-002 REQ-LIM-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index (integer 0 8))
                         (values b:index &optional)) %wire-ordered-item))
;;; REQ: REQ-IPC-002 REQ-LIM-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index (integer 0 8)
                          (member 4 5) b:u64) (values b:index &optional)) %wire-ordered-container))
(defun %wire-ordered-container (buffer start end depth major count)
  "Pre: minimal scanner complete, definite container. Post: end and strictly ordered maps.
PROTOCOL-ERROR for duplicates/order/depth; recursion <=8, children <= remaining bytes.
Ownership: immutable input; local cursors only, no tree or key list."
  (when (>= depth 8) (%wire-fail :local-envelope-depth start))
  (when (> (* count (if (= major 5) 2 1)) (- end start))
    (%wire-fail :local-container-count start))
  (let ((cursor start) (previous-start start) (previous-end start))
    (dotimes (i count)
      (let* ((key-start cursor)
             (key-end (%wire-ordered-item buffer cursor end (1+ depth))))
        (when (and (= major 5) (plusp i))
          (unless (%wire-key-less-p buffer previous-start previous-end key-start key-end)
            (%wire-fail :local-map-order key-start)))
        (setf previous-start key-start previous-end key-end
              cursor (if (= major 5)
                         (%wire-ordered-item buffer key-end end (1+ depth)) key-end))))
    cursor))

;;; REQ: REQ-IPC-002 REQ-LIM-002 REQ-AFF-008
(defun %wire-ordered-item (buffer start end depth)
  "Pre: item already scanned, array/map depth <=8. Post: item end and ordering of all maps.
Tags skipped in at most END-START steps; recursion only for arrays/maps, maximum eight levels.
PROTOCOL-ERROR for span/depth; ownership: no object derived from payload."
  (let ((cursor start))
    (loop repeat (- end start) do
      (multiple-value-bind (major value next) (%wire-head buffer cursor end)
        (if (= major 6) (setf cursor next)
            (return-from %wire-ordered-item
              (case major
                ((0 1 7) next)
                ((2 3) (let ((finish (+ next value)))
                         (unless (<= finish end) (%wire-fail :local-string-length cursor))
                         finish))
                ((4 5) (%wire-ordered-container buffer next end depth major value))
                (otherwise (%wire-fail :local-major cursor)))))))
    (%wire-fail :local-tag-bound start)))

;;; REQ: REQ-IPC-002 REQ-LIM-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index cbor:spazio-cbor &optional (member 7 8))
                         (values null &optional)) %wire-scan-envelope))
(defun %wire-scan-envelope (buffer start end space &optional (max-depth 8))
  "Pre: bounded span and exclusive scratch. Post: one minimal depth7/8 item and ordered maps without duplicates.
Structural/budget CBOR errors become PROTOCOL-ERROR; no reader or generic tree.
Ownership: scratch reusable after error, buffer unchanged; bounded linear work."
  (handler-case
      (progn
        (multiple-value-bind (nodes depth finish)
            (cbor:verifica-struttura-cbor-minima buffer start end space
              :max-bytes +server-max-frame+ :max-nodes +server-max-frame+ :max-depth max-depth)
          (unless (and (plusp nodes) (<= depth max-depth) (= finish end))
            (%wire-fail :local-envelope-scan start)))
        (unless (= end (%wire-ordered-item buffer start end (- 8 max-depth)))
          (%wire-fail :local-trailing start)))
    (arcdocdb.conditions:corruption-detected (condition)
      (%wire-fail (arcdocdb.conditions:error-reason condition)
                  (arcdocdb.conditions:error-offset condition)))
    (arcdocdb.conditions:resource-exhausted (condition)
      (%wire-fail (arcdocdb.conditions:error-reason condition))))
  nil)

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index)
                         (values (integer 0 3) b:u64 b:u16 b:index &optional)) %wire-fields))
(defun %wire-fields (buffer start end)
  "Pre: complete envelope scanned. Post: kind/id/code and payload start, ID consistent with kind.
PROTOCOL-ERROR for invalid version, unsigned value, kind, status, or ID; immutable input."
  (let ((cursor (%wire-expect buffer start end 4 5)))
    (setf cursor (%wire-expect buffer cursor end 0 1))
    (multiple-value-bind (kind a) (%wire-uint buffer cursor end 3)
      (multiple-value-bind (id b) (%wire-uint buffer a end #xffffffffffffffff)
        (multiple-value-bind (code payload) (%wire-uint buffer b end #xffff)
          (unless (if (< kind 2) (and (zerop id) (zerop code)) (plusp id))
            (%wire-fail :local-envelope-id a))
          (when (and (= kind 3) (> code 5)) (%wire-fail :local-response-status b))
          (values kind id code payload))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index) b:index) %wire-group-offer))
(defun %wire-group-offer (buffer start end)
  "Pre: minimal HELLO with three fields, first two consumed. Post: exact optional key 2/[4] offer end.
Other capabilities, shapes or trailing fields are protocol errors; immutable input, no copy or admission."
  (let ((cursor (%wire-expect buffer start end 0 2)))
    (setf cursor (%wire-expect buffer cursor end 4 1))
    (%wire-expect buffer cursor end 0 +local-write-group-opcode+)))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (b:octets b:index b:index) (values b:index boolean &optional)) %wire-welcome-opcodes))
(defun %wire-welcome-opcodes (buffer start end)
  "Pre: minimal WELCOME, first two fields consumed. Post: exact old/new opcode list and offered group flag.
Only [0,1,2,3] or [0,1,2,3,4], checked in at most five steps; no implicit capability acceptance by a client."
  (let ((cursor (%wire-expect buffer start end 0 2)))
    (multiple-value-bind (major count next) (%wire-head buffer cursor end)
      (unless (and (= major 4) (member count '(4 5))) (%wire-fail :local-welcome-opcodes cursor))
      (setf cursor next)
      (dotimes (opcode count) (setf cursor (%wire-expect buffer cursor end 0 opcode)))
      (values cursor (= count 5)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (b:octets b:index b:index boolean)
                         (values (integer 4096 17825792) (integer 1 16) boolean &optional)) %wire-capacities))
(defun %wire-capacities (buffer start end welcome)
  "Pre: handshake payload scanned. Post: exact maps, valid frame/inflight; exact M1 WELCOME.
PROTOCOL-ERROR for keys, extra data, duplicates, capacity, or opcode; no payload copy."
  (multiple-value-bind (major fields cursor) (%wire-head buffer start end)
    (unless (and (= major 5) (if welcome (= fields 3) (member fields '(2 3))))
      (%wire-fail :local-payload-shape start))
    (setf cursor (%wire-expect buffer cursor end 0 0))
    (multiple-value-bind (frame a) (%wire-uint buffer cursor end 17825792)
      (unless (>= frame 4096) (%wire-fail :local-hello-frame cursor))
      (setf cursor (%wire-expect buffer a end 0 1))
      (multiple-value-bind (inflight b) (%wire-uint buffer cursor end 16)
        (unless (plusp inflight) (%wire-fail :local-hello-inflight cursor))
        (let ((groups nil))
          (setf cursor b)
          (if welcome
              (progn
                (unless (and (<= frame +server-max-frame+) (= inflight 1))
                  (%wire-fail :local-welcome-limits start))
                (multiple-value-setq (cursor groups) (%wire-welcome-opcodes buffer cursor end)))
              (when (= fields 3) (setf cursor (%wire-group-offer buffer cursor end) groups t)))
          (unless (= cursor end) (%wire-fail :local-handshake-trailing cursor))
          (values frame inflight groups))))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t t t) (values null &optional)) %wire-decode-options))
(defun %wire-decode-options (direction expected-kind last-id expected-id)
  "Pre: external options. Post: type-guarded options; INVALID-ARGUMENT before byte access.
Ownership: no state; direction :EITHER or one of the two explicit directions."
  (unless (and (member direction '(:either :client-to-server :server-to-client))
               (typep expected-kind '(or null (integer 0 3))) (typep last-id 'b:u64)
               (typep expected-id '(or null (integer 1 18446744073709551615))))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-decode-options))
  nil)

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t t &key (:space t) (:max-frame t) (:direction t) (:expected-kind t)
                          (:last-id t) (:expected-id t)) (values envelope &optional)) decode-local-envelope))
(defun decode-local-envelope (buffer start end &key (max-frame +server-max-frame+)
                              (direction :either) expected-kind (last-id 0) expected-id space)
  "Pre: BODY without prefix, caller's immutable buffer until final use of views.
Post: verified fixed envelope, one bounded structure per frame; no object tree.
PROTOCOL-ERROR for envelope/direction/ID/budget/trailing; INVALID-ARGUMENT for invalid API use.
Ownership: exclusive SPACE reused; NIL creates fixed scratch, without a zero-allocation promise.
MAX-FRAME is the negotiated limit, distinct from capacities declared in the handshake."
  (%wire-range buffer start end)
  (%wire-limit max-frame)
  (%wire-decode-options direction expected-kind last-id expected-id)
  (unless (typep space '(or null cbor:spazio-cbor))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-cbor-space))
  (unless (<= 1 (- end start) (min max-frame +server-max-frame+))
    (%wire-fail :local-frame-length start))
  (%wire-scan-envelope buffer start end (or space (cbor:crea-spazio-cbor)))
  (multiple-value-bind (kind id code payload) (%wire-fields buffer start end)
    (unless (case direction
              (:either t) (:client-to-server (or (= kind 0) (= kind 2)))
              (:server-to-client (or (= kind 1) (= kind 3)))
              (otherwise nil))
      (%wire-fail :local-direction start))
    (when (and expected-kind (/= expected-kind kind)) (%wire-fail :local-kind start))
    (when (and (= kind 2) (<= id last-id)) (%wire-fail :local-request-id start))
    (when (and expected-id (/= expected-id id)) (%wire-fail :local-response-id start))
    (multiple-value-bind (frame inflight groups)
        (if (< kind 2)
            (progn
              (when (> (- end start) +hello-limit+) (%wire-fail :local-hello-budget start))
              (%wire-capacities buffer payload end (= kind 1))) (values 0 0 nil))
      (%make-envelope :buffer buffer :kind kind :id id :code code
                      :payload-start payload :payload-end end :max-frame frame
                      :max-inflight inflight :write-groups groups :frame-limit max-frame))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t) (values envelope &optional)) %wire-envelope-input))
(defun %wire-envelope-input (buffer envelope)
  "Pre: external input. Post: original envelope bound to the same buffer; INVALID-ARGUMENT otherwise.
Ownership: buffer must remain immutable; verified fields are only views, not durable authority."
  (unless (and (typep buffer 'b:octets) (typep envelope 'envelope)
               (eq buffer (envelope-buffer envelope))
               (< (envelope-payload-start envelope) (envelope-payload-end envelope))
               (<= (envelope-payload-end envelope) (length buffer)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-envelope-input))
  envelope)

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t) (values (integer 4096 17825792) (integer 1 16) &optional))
                decode-local-hello))
(defun decode-local-hello (buffer envelope)
  "Pre: envelope bound to immutable buffer. Post: requested HELLO capacities, without clamping.
PROTOCOL-ERROR for another kind; INVALID-ARGUMENT for invalid buffer/structure identity."
  (%wire-envelope-input buffer envelope)
  (unless (= (envelope-kind envelope) 0) (%wire-fail :local-expected-hello))
  (values (envelope-max-frame envelope) (envelope-max-inflight envelope)))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t &key (:write-groups t))
                          (values (integer 4096 17825792) (integer 1 16) &optional)) decode-local-welcome))
(defun decode-local-welcome (buffer envelope &key (write-groups nil))
  "Pre: envelope bound to immutable buffer, exact requested WRITE-GROUPS boolean. Post: two verified M1 capacities.
PROTOCOL-ERROR for another kind or unsolicited/missing capability; INVALID-ARGUMENT for unbound inputs/options."
  (unless (typep write-groups 'boolean)
    (error 'arcdocdb.conditions:invalid-argument :reason :local-write-groups-option))
  (%wire-envelope-input buffer envelope)
  (unless (= (envelope-kind envelope) 1) (%wire-fail :local-expected-welcome))
  (unless (eq write-groups (envelope-write-groups envelope)) (%wire-fail :local-write-groups-negotiation))
  (values (envelope-max-frame envelope) (envelope-max-inflight envelope)))

;;; REQ: REQ-IPC-002 REQ-LIM-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index cbor:spazio-cbor)
                         (values (member 0 1 5) &optional)) %wire-document-status))
(defun %wire-document-status (buffer start end space)
  "Pre: separate document span and exclusive scratch verified. Post: 0 valid, 1 shape, 5 budget.
One complete minimal CBOR item, depth 100; no content semantics or recursive tree.
Ownership: buffer unchanged; scratch reusable after any product rejection."
  (cond ((zerop (- end start)) 1)
        ((> (- end start) +max-document-bytes+) 5)
        (t (handler-case
               (multiple-value-bind (nodes depth finish)
                   (cbor:verifica-struttura-cbor-minima buffer start end space
                     :max-bytes +max-document-bytes+ :max-nodes +max-document-bytes+ :max-depth 100)
                 (unless (and (plusp nodes) (<= depth 100) (= finish end))
                   (error 'arcdocdb.conditions:invariant-violation :reason :local-document-scan))
                 0)
             (arcdocdb.conditions:corruption-detected () 1)
             (arcdocdb.conditions:resource-exhausted () 5)))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index)
                         (values b:index b:index b:index &optional)) %wire-bstr))
(defun %wire-bstr (buffer start end)
  "Pre: item already scanned. Post: content start, length, bstr end, without copy.
PROTOCOL-ERROR for type/range; ownership: view valid while input is immutable."
  (multiple-value-bind (major size next) (%wire-head buffer start end)
    (unless (and (= major 2) (<= size (- end next))) (%wire-fail :local-bstr start))
    (values next size (+ next size))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index) (values boolean &optional)) %wire-null-p))
(defun %wire-null-p (buffer start end)
  "Pre: verified span of immutable input. Post: T only for exact minimal NULL.
No condition for a different shape; no bytes read outside the span."
  (and (= (- end start) 1) (= (aref buffer start) #xf6)))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor)
                         (values (integer 0 5) b:index b:index b:index b:index &optional)) %wire-command-spans))
(defun %wire-command-spans (buffer envelope space)
  "Pre: verified REQUEST and exclusive scratch. Post: status and bounded views; no copy.
Command-shape errors ->1, budget ->5, valid unknown ->4; no engine admission."
  (let ((start (envelope-payload-start envelope)) (end (envelope-payload-end envelope))
        (opcode (envelope-code envelope)))
    (case opcode
      (0 (values (if (%wire-null-p buffer start end) 0 1) 0 0 0 0))
      ((1 2 3)
       (let ((cursor (if (= opcode 1) (%wire-expect buffer start end 4 2) start)))
         (multiple-value-bind (ks kl next) (%wire-bstr buffer cursor end)
           (multiple-value-bind (ds dl finish)
               (if (= opcode 1) (%wire-bstr buffer next end) (values 0 0 next))
             (let ((status
                     (cond ((/= finish end) 1) ((zerop kl) 1)
                           ((> kl +max-key-bytes+) 5)
                           ((= opcode 1) (%wire-document-status buffer ds (+ ds dl) space))
                           ((and (= opcode 2) (< (envelope-frame-limit envelope) +max-get-frame+)) 5)
                           (t 0))))
               (values status ks kl ds dl))))))
      (otherwise (values 4 0 0 0 0)))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index) (values b:octets &optional)) %wire-copy))
(defun %wire-copy (buffer start size)
  "Pre: bounded span <=60000 already verified. Post: caller's private simple u8 copy, identical bytes.
INVARIANT-VIOLATION for an internal call beyond the limit; allocation bounded to verified span."
  (unless (and (<= size +max-document-bytes+) (<= (+ start size) (length buffer)))
    (error 'arcdocdb.conditions:invariant-violation :reason :local-copy-span))
  (let ((copy (make-array size :element-type '(unsigned-byte 8))))
    (replace copy buffer :start2 start :end2 (+ start size))
    copy))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t) (values (integer 0 5) (or null b:octets)
                                        (or null b:octets) &optional)) decode-local-command))
(defun decode-local-command (buffer envelope space)
  "Pre: original REQUEST, immutable buffer and exclusive scratch. Post: status, bounded KEY/DOC copies.
NIL/NIL on errors: shape=1, budget=5, valid unknown opcode=4. Opaque keys 1..1024.
Document 1..60000, separate minimal depth 100 item. Invalid API input ->INVALID-ARGUMENT.
Ownership: copies to caller; no engine operation or durable reservation."
  (%wire-envelope-input buffer envelope)
  (unless (typep space 'cbor:spazio-cbor)
    (error 'arcdocdb.conditions:invalid-argument :reason :local-cbor-space))
  (unless (= (envelope-kind envelope) 2) (%wire-fail :local-expected-request))
  (handler-case
      (multiple-value-bind (status ks kl ds dl) (%wire-command-spans buffer envelope space)
        (if (zerop status)
            (values 0 (when (plusp kl) (%wire-copy buffer ks kl))
                    (when (plusp dl) (%wire-copy buffer ds dl)))
            (values status nil nil)))
    (protocol-error () (values 1 nil nil))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor)
                         (values (member :found :absent) (or null b:octets) &optional)) %wire-get-result))
(defun %wire-get-result (buffer envelope space)
  "Pre: structurally valid GET response. Post: :FOUND private copy or :ABSENT NIL.
PROTOCOL-ERROR for invalid boolean/null/document; no copy before all checks."
  (let* ((end (envelope-payload-end envelope))
         (cursor (%wire-expect buffer (envelope-payload-start envelope) end 4 2)))
    (unless (< cursor end) (%wire-fail :local-get-boolean cursor))
    (let ((flag (aref buffer cursor)))
      (unless (or (= flag #xf4) (= flag #xf5)) (%wire-fail :local-get-boolean cursor))
      (incf cursor)
      (if (= flag #xf4)
          (progn
            (unless (%wire-null-p buffer cursor end) (%wire-fail :local-get-absent cursor))
            (values :absent nil))
          (multiple-value-bind (start size finish) (%wire-bstr buffer cursor end)
            (unless (= finish end) (%wire-fail :local-get-trailing finish))
            (unless (zerop (%wire-document-status buffer start finish space))
              (%wire-fail :local-get-document start))
            (values :found (%wire-copy buffer start size)))))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t) (values (or null b:u64 keyword) &optional (or null b:octets)))
                decode-local-response))
(defun decode-local-response (buffer envelope space opcode)
  "Pre: client-correlated RESPONSE, immutable input and exclusive scratch. Post: command result.
PING NIL, PUT/DELETE positive u64 CSN, GET values :FOUND copy/:ABSENT NIL. Status 1..5 ->REQUEST-REJECTED.
PROTOCOL-ERROR for incorrect shape even in errors; no retry or engine contact."
  (%wire-envelope-input buffer envelope)
  (unless (and (typep space 'cbor:spazio-cbor) (typep opcode '(integer 0 65535)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-response-input))
  (unless (= (envelope-kind envelope) 3) (%wire-fail :local-expected-response))
  (let ((start (envelope-payload-start envelope)) (end (envelope-payload-end envelope))
        (status (envelope-code envelope)))
    (when (plusp status)
      (unless (%wire-null-p buffer start end) (%wire-fail :local-error-payload start))
      (error 'request-rejected :reason :local-request-rejected :status status))
    (case opcode
      (0 (unless (%wire-null-p buffer start end) (%wire-fail :local-ping-result start)) nil)
      ((1 3) (multiple-value-bind (csn next) (%wire-uint buffer start end #xffffffffffffffff)
               (unless (and (plusp csn) (= next end)) (%wire-fail :local-csn-result start)) csn))
      (2 (%wire-get-result buffer envelope space))
      (otherwise (%wire-fail :local-unsupported-success start)))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:u64) (values (member 1 2 3 5 9) &optional)) %wire-head-size))
(defun %wire-head-size (value)
  "Pre: verified unsigned64. Post: minimal MT0..6 header size; no allocation or condition.
Ownership: local value, no buffer."
  (cond ((< value 24) 1) ((<= value #xff) 2) ((<= value #xffff) 3)
        ((<= value #xffffffff) 5) (t 9)))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index (integer 0 6) b:u64)
                         (values b:index &optional)) %wire-put-head))
(defun %wire-put-head (out cursor end major value)
  "Pre: exclusive output, preflighted space and u64 argument. Post: product-generated minimal header, increasing end.
Propagates product-writer conditions; no publication or allocation."
  (cbor:scrivi-header-cbor-minimo out cursor end major
                                (ldb (byte 32 32) value) (ldb (byte 32 0) value)))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t t t t t) (values null &optional)) %wire-output-input))
(defun %wire-output-input (out kind id code payload-size limit)
  "Pre: external encoder arguments. Post: valid types/ID/limit before any write.
INVALID-ARGUMENT for type or shape; ownership: exclusive OUT, no source aliasing."
  (unless (and (typep out 'b:octets) (typep kind '(integer 0 3)) (typep id 'b:u64)
               (typep code 'b:u16) (typep payload-size 'b:index) (plusp payload-size))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-encode-input))
  (%wire-limit limit)
  (unless (and (if (< kind 2) (and (zerop id) (zerop code)) (plusp id))
               (if (= kind 3) (<= code 5) t))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-encode-fields))
  nil)

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t t t t) (values b:index b:index &optional)) %wire-output-begin))
(defun %wire-output-begin (out kind id code payload-size limit)
  "Pre: owned output, external parameters. Post: prefix/envelope written, payload cursor and total END.
Complete preflight before writing: INVALID-ARGUMENT or RESOURCE-EXHAUSTED without mutation.
Ownership: no source loan; copy publishable only after payload completion."
  (%wire-output-input out kind id code payload-size limit)
  (let* ((body-size (+ 2 (%wire-head-size kind) (%wire-head-size id)
                        (%wire-head-size code) payload-size))
         (end (+ 4 body-size)))
    (unless (and (<= body-size (min limit +server-max-frame+)) (<= end (length out)))
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-output-budget))
    (dotimes (i 4) (setf (aref out i) (ldb (byte 8 (* 8 (- 3 i))) body-size)))
    (let ((cursor (%wire-put-head out 4 end 4 5)))
      (setf cursor (%wire-put-head out cursor end 0 1)
            cursor (%wire-put-head out cursor end 0 kind)
            cursor (%wire-put-head out cursor end 0 id)
            cursor (%wire-put-head out cursor end 0 code))
      (values cursor end))))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index b:octets b:index b:index)
                         (values b:index &optional)) %wire-put-bstr))
(defun %wire-put-bstr (out cursor end source start size)
  "Pre: valid nonaliasing source span, capacity already verified. Post: bstr with identical bytes and end.
INVARIANT-VIOLATION for internal capacity; ownership: no source copy retained."
  (let* ((next (%wire-put-head out cursor end 2 size)) (finish (+ next size)))
    (unless (and (<= (+ start size) (length source)) (<= finish end))
      (error 'arcdocdb.conditions:invariant-violation :reason :local-bstr-output))
    (replace out source :start1 next :end1 finish :start2 start :end2 (+ start size))
    finish))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (t t t boolean t) (values b:index &optional)) %wire-encode-handshake))
(defun %wire-encode-handshake (out frame inflight welcome groups)
  "Pre: external capacities and exclusive output. Post: exact HELLO/WELCOME including prefix.
INVALID-ARGUMENT for limits; output preflight before writing, handshake <=4096."
  (unless (typep groups 'boolean)
    (error 'arcdocdb.conditions:invalid-argument :reason :local-write-groups-option))
  (%wire-limit frame)
  (unless (and (typep inflight '(integer 1 16))
               (if welcome (and (<= frame +server-max-frame+) (= inflight 1)) t))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-encode-capacities))
  (let ((size (+ 3 (%wire-head-size frame) (%wire-head-size inflight)
                 (if welcome (if groups 7 6) (if groups 3 0)))))
    (multiple-value-bind (cursor end) (%wire-output-begin out (if welcome 1 0) 0 0 size +hello-limit+)
      (setf cursor (%wire-put-head out cursor end 5 (if (or welcome groups) 3 2))
            cursor (%wire-put-head out cursor end 0 0)
            cursor (%wire-put-head out cursor end 0 frame)
            cursor (%wire-put-head out cursor end 0 1)
            cursor (%wire-put-head out cursor end 0 inflight))
      (when (or welcome groups)
        (setf cursor (%wire-put-head out cursor end 0 2)
              cursor (%wire-put-head out cursor end 4 (if welcome (if groups 5 4) 1)))
        (if welcome
            (dotimes (opcode (if groups 5 4)) (setf cursor (%wire-put-head out cursor end 0 opcode)))
            (setf cursor (%wire-put-head out cursor end 0 +local-write-group-opcode+))))
      (unless (= cursor end)
        (error 'arcdocdb.conditions:invariant-violation :reason :local-handshake-output))
      end)))

;;; REQ: REQ-IPC-002
(declaim (ftype (function (t t &key (:inflight t) (:write-groups t)) (values b:index &optional)) encode-local-hello))
(defun encode-local-hello (out frame &key (inflight 1) (write-groups nil))
  "Pre: exclusive OUT, client capacities and optional WRITE-GROUPS boolean. Post: exact HELLO END with prefix.
NIL retains legacy bytes; T offers only opcode 4. No data operation or implicit capability.
Propagates preflight INVALID-ARGUMENT/RESOURCE-EXHAUSTED; ownership remains with caller."
  (%wire-encode-handshake out frame inflight nil write-groups))

;;; REQ: REQ-IPC-002
(declaim (ftype (function (t t &key (:write-groups t)) (values b:index &optional)) encode-local-welcome))
(defun encode-local-welcome (out frame &key (write-groups nil))
  "Pre: exclusive OUT, negotiated M1 frame and WRITE-GROUPS boolean. Post: WELCOME END with prefix, inflight 1.
Opcodes [0,1,2,3], plus 4 only for an explicit offer; NIL retains legacy bytes.
Propagates INVALID-ARGUMENT/RESOURCE-EXHAUSTED before writing; ownership remains with caller."
  (%wire-encode-handshake out frame 1 t write-groups))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t t t &key (:max-frame t)) (values b:index &optional)) encode-local-frame))
(defun encode-local-frame (out kind id code payload &key (max-frame +server-max-frame+))
  "Pre: exclusive nonaliasing OUT, PAYLOAD already CBOR-encoded. Post: END of complete frame with prefix.
Bounded minimal/depth7/order validation before writing; no generic tree.
INVALID-ARGUMENT for API/aliasing, PROTOCOL-ERROR for CBOR, RESOURCE-EXHAUSTED for capacity."
  (unless (and (typep out 'b:octets) (typep payload 'b:octets) (not (eq out payload)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-encode-payload))
  (unless (<= 1 (length payload) +server-max-frame+)
    (error 'arcdocdb.conditions:resource-exhausted :reason :local-payload-budget))
  (%wire-scan-envelope payload 0 (length payload) (cbor:crea-spazio-cbor) 7)
  (multiple-value-bind (cursor end) (%wire-output-begin out kind id code (length payload) max-frame)
    (replace out payload :start1 cursor :end1 end)
    end))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t t &optional (or null cbor:spazio-cbor)) (values null &optional)) %wire-request-input))
(defun %wire-request-input (out opcode key document &optional space)
  "Pre: external encoder input. Post: valid shape/budget/aliasing before writing.
Opaque key; separate minimal document. INVALID-ARGUMENT or RESOURCE-EXHAUSTED for rejection.
Ownership: input immutable until return, exclusive output."
  (unless (and (typep out 'b:octets) (typep opcode 'b:u16))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-request-input))
  (when (= opcode 0)
    (unless (and (null key) (null document))
      (error 'arcdocdb.conditions:invalid-argument :reason :local-ping-arguments))
    (return-from %wire-request-input nil))
  (unless (and (typep key 'b:octets) (not (eq key out)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-key-input))
  (when (<= opcode 3)
    (unless (plusp (length key))
      (error 'arcdocdb.conditions:invalid-argument :reason :local-key-empty))
    (when (> (length key) +max-key-bytes+)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-key-budget)))
  (if (= opcode 1)
      (progn
        (unless (and (typep document 'b:octets) (not (eq document out)))
          (error 'arcdocdb.conditions:invalid-argument :reason :local-document-input))
        (case (%wire-document-status document 0 (length document) (or space (cbor:crea-spazio-cbor)))
          (0 nil)
          (1 (error 'arcdocdb.conditions:invalid-argument :reason :local-document-form))
          (5 (error 'arcdocdb.conditions:resource-exhausted :reason :local-document-budget))
          (otherwise (error 'arcdocdb.conditions:invariant-violation :reason :local-document-status))))
      (unless (null document)
        (error 'arcdocdb.conditions:invalid-argument :reason :local-unexpected-document)))
  nil)

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t t t) (values b:index &optional)) encode-local-request))
(defun encode-local-request (out id opcode key doc)
  "Pre: exclusive output and stable arguments. Post: complete REQUEST frame from 0, END includes prefix.
For an unknown opcode, KEY contains the encoded CBOR payload and DOC NIL; no Lisp reader.
Propagates typed rejections before output; identical bounded binary copies."
  (%wire-request-input out opcode key doc)
  (when (> opcode 3) (return-from encode-local-request (encode-local-frame out 2 id opcode key)))
  (let ((size (case opcode
                (0 1)
                (1 (+ 1 (%wire-head-size (length key)) (length key)
                        (%wire-head-size (length doc)) (length doc)))
                ((2 3) (+ (%wire-head-size (length key)) (length key)))
                (otherwise (error 'arcdocdb.conditions:invariant-violation :reason :local-opcode)))))
    (multiple-value-bind (cursor end) (%wire-output-begin out 2 id opcode size +server-max-frame+)
      (case opcode
        (0 (setf (aref out cursor) #xf6 cursor (1+ cursor)))
        (1 (setf cursor (%wire-put-head out cursor end 4 2)
                 cursor (%wire-put-bstr out cursor end key 0 (length key))
                 cursor (%wire-put-bstr out cursor end doc 0 (length doc))))
        ((2 3) (setf cursor (%wire-put-bstr out cursor end key 0 (length key))))
        (otherwise (error 'arcdocdb.conditions:invariant-violation :reason :local-opcode)))
      (unless (= cursor end)
        (error 'arcdocdb.conditions:invariant-violation :reason :local-request-output))
      end)))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t t t t t t t) (values b:index &optional)) %wire-response-size))
(defun %wire-response-size (out status csn csn-p found found-p document document-end end-p)
  "Pre: external arguments. Post: bounded payload size, checks before output.
INVALID-ARGUMENT for shape/aliasing, RESOURCE-EXHAUSTED for an oversized document.
Ownership: engine document copied without retaining pins, no engine validation here."
  (unless (and (typep out 'b:octets) (typep status '(integer 0 5)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-response-input))
  (when (plusp status) (return-from %wire-response-size 1))
  (when csn-p
    (unless (and (typep csn 'b:u64) (plusp csn) (not found-p) (null document) (not end-p))
      (error 'arcdocdb.conditions:invalid-argument :reason :local-response-csn))
    (return-from %wire-response-size (%wire-head-size csn)))
  (unless found-p
    (unless (and (null document) (not end-p))
      (error 'arcdocdb.conditions:invalid-argument :reason :local-response-ping))
    (return-from %wire-response-size 1))
  (unless (typep found 'boolean)
    (error 'arcdocdb.conditions:invalid-argument :reason :local-response-found))
  (unless found (return-from %wire-response-size 3))
  (unless (and (typep document 'b:octets) (not (eq out document))
               (typep document-end 'b:index) (<= 1 document-end (length document)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-response-document))
  (when (> document-end +max-document-bytes+)
    (error 'arcdocdb.conditions:resource-exhausted :reason :local-response-document-budget))
  (+ 2 (%wire-head-size document-end) document-end))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (t t t &key (:csn t) (:found t) (:document t) (:document-end t))
                         (values b:index &optional)) encode-local-response))
(defun encode-local-response (out id status &key (csn nil csn-p) (found nil found-p)
                             document (document-end nil end-p))
  "Pre: exclusive OUT already reserved; positive :CSN for write, :FOUND supplied-p for GET, absent for PING.
Post: END with prefix; :DOCUMENT-END is byte count from 0, GET miss [false,null].
Typed rejections before output; an engine result is not retried by the codec.
Ownership: document copied, no pin/lease retained by the complete frame."
  (let* ((size-end (if (and document (not end-p) (typep document 'b:octets))
                       (length document) document-end))
         (size (%wire-response-size out status csn csn-p found found-p document size-end end-p)))
    (multiple-value-bind (cursor end) (%wire-output-begin out 3 id status size +server-max-frame+)
      (cond
        ((or (plusp status) (and (not csn-p) (not found-p)))
         (setf (aref out cursor) #xf6 cursor (1+ cursor)))
        (csn-p (setf cursor (%wire-put-head out cursor end 0 csn)))
        (t (setf cursor (%wire-put-head out cursor end 4 2))
           (setf (aref out cursor) (if found #xf5 #xf4)) (incf cursor)
           (if found (setf cursor (%wire-put-bstr out cursor end document 0 size-end))
               (setf (aref out cursor) #xf6 cursor (1+ cursor)))))
      (unless (= cursor end)
        (error 'arcdocdb.conditions:invariant-violation :reason :local-response-output))
      end)))
