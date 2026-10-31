(in-package #:arcdocdb.fulltext.put)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-WAL-005 REQ-CON-002
(declaim (ftype (function (f:riserve-full-text preparazione-put-full-text t) null) preflight-append-put))
(defun preflight-append-put (pool request batch)
  "Pre: lease and reserved request. Post: current attestation, same format/segment, and SEAL space.
File-id read from preallocated bytes to avoid u64 boxing in writer.
CRC and frame attested by worker, no body scan under lease; copying only during append."
  (esigi-cornice-put-validata request)
  (unless (and (typep batch 'w:lotto) (eq :reserved (preparazione-put-full-text-state request))
               (eq :segment (w::lotto-kind batch)) (= (w::lotto-version batch) (preparazione-put-full-text-version request)))
    (error 'invalid-argument :reason :fulltext-put-batch))
  (let ((identity (w::lotto-seal-value batch)) (offset r::+seal-file-id-offset+))
    (unless (and (= (leggi-u32 identity offset) (f::riserve-full-text-segment pool))
                 (zerop (leggi-u32 identity (+ offset 4))))
      (error 'invalid-argument :reason :fulltext-put-segment)))
  (unless (eq :ready (f::riserva-full-text-state (preparazione-put-full-text-slot request)))
    (error 'invariant-violation :reason :fulltext-put-run-state))
  (w::verifica-capacita-cornice batch (preparazione-put-full-text-size request))
  nil)

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-WAL-005 REQ-AFF-008 REQ-CON-002
(declaim (ftype (function (t t t t t) (values f:riserva-full-text index index index &optional)) aggiungi-put-full-text))
(defun aggiungi-put-full-text (pool lease request generation batch)
  "Pre: all reservations ready, same open batch/segment. Post: exact copy of analyzed PUT,
reservation transferred with batch/incarnation/ordinal/interval binding; request reusable after handoff.
Prepares memory before durable SEAL; neither assigns CSN, publishes H/ACK, nor resolves prepared records.
Rejections before effects; incomplete exit after transfer => all FAULTED, no rollback."
  (verifica-riserva-put pool lease request generation) (preflight-append-put pool request batch)
  (let* ((slot (preparazione-put-full-text-slot request)) (token (preparazione-put-full-text-slot-generation request))
         (start (w::lotto-used batch)) (number (w::lotto-count batch)) (complete nil))
    (unwind-protect
         (progn
           (f:trasferisci-riserva-full-text pool lease slot token)
           (let ((end (w::append-cornice-verificata batch (preparazione-put-full-text-frame request) 0
                                                  (preparazione-put-full-text-size request))))
             (setf (f::riserva-full-text-record-source slot) batch
                   (f::riserva-full-text-record-incarnation slot) (w::lotto-incarnation batch)
                   (f::riserva-full-text-record-number slot) number (f::riserva-full-text-record-start slot) start
                   (f::riserva-full-text-record-end slot) end (preparazione-put-full-text-state request) :appended)
             (let ((frame (preparazione-put-full-text-frame request)))
               (setf (f::riserva-full-text-put-flags slot) (aref frame r::+flags-offset+)
                     (f::riserva-full-text-put-low slot) (leggi-u32 frame r::+stamp-offset+)
                     (f::riserva-full-text-put-high slot) (leggi-u32 frame (+ r::+stamp-offset+ 4))))
             (unless (= (- end start) (preparazione-put-full-text-size request))
               (error 'invariant-violation :reason :fulltext-put-append-size))
             (setf complete t) (values slot token start end)))
      (unless complete
        (setf (preparazione-put-full-text-state request) :faulted (f::riserve-full-text-state pool) :faulted
              (w::lotto-state batch) :faulted)))))
