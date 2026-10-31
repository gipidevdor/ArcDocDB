;;; OWNER: private scalar traversal, no document index or current-record materialization.
;;; SHARED: synchronous canonical visitors; data buffers never escape a call.
(in-package #:arcdocdb.verify)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-010 REQ-AFF-002 REQ-MVC-006 REQ-AFF-008
(declaim (ftype (function (inspection b:octets b:index b:index b:u64 b:index
                          (member 1 2) (or null b:u64)) null) inspection-record))
(defun inspection-record (inspection buffer start end segment offset version prepared)
  "Pre: canonical synchronous data visitor, frozen bytes. Post: positive strictly increasing ordinary CSN.
Only M1 PUT/tombstone with zero flags and u32 segment identity; no borrowed data retained.
Corruption/unsupported conditions retain the physical record offset; no index, value copy or publication."
  (when (or prepared (/= version (inspection-version inspection)) (not (<= 1 segment #xffffffff)))
    (error 'unsupported-format :reason :verify-record-outside-m1 :offset offset))
  (multiple-value-bind (next kind flags) (r:verifica-cornice buffer start end :version version)
    (unless (and (= next end) (member kind '(1 2)) (zerop flags))
      (error 'unsupported-format :reason :verify-record-outside-m1 :offset offset))
    (let ((csn (b:leggi-u64 buffer (+ start r::+stamp-offset+))))
      (unless (> csn (inspection-last-csn inspection))
        (error 'corruption-detected :reason :verify-csn-order :offset offset))
      (setf (inspection-last-csn inspection) csn)
      (incf (inspection-data-count inspection))))
  nil)

;;; REQ: REQ-AFF-010 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (inspection ra:active-recuperato b:u64) null) inspection-active-order))
(defun inspection-active-order (inspection active id)
  "Pre: entire ACTIVE already canonically verified. Post: exact prefix traversed without interpreting its tail.
Rereads from the same FD after CLOSED visitors reused scratch; every frame CRC checked again.
Only ordinary records and SEAL admitted; loop bounded by prefix/header bytes, never EOF repair."
  (let* ((buffer (inspection-scratch inspection)) (position f:+segment-header-bytes+)
         (prefix (nth-value 1 (ra:frontiere-active-recuperato active)))
         (version (nth-value 3 (ra:frontiere-active-recuperato active)))
         (file (g::segmento-get-file (ra:segmento-active-recuperato active))))
    (unless (= version (inspection-version inspection))
      (error 'unsupported-format :reason :verify-active-format))
    (unless (= prefix (io:leggi-esatto file buffer 0 prefix 0))
      (error 'invariant-violation :reason :verify-active-read))
    (loop repeat (floor (- prefix position) r:+header-bytes+) while (< position prefix) do
      (multiple-value-bind (next kind flags) (r:verifica-cornice buffer position prefix :version version)
        (unless (zerop flags) (error 'unsupported-format :reason :verify-record-flags :offset position))
        (case kind
          ((1 2) (inspection-record inspection buffer position next id position version nil))
          (3 nil)
          (otherwise (error 'unsupported-format :reason :verify-record-outside-m1 :offset position)))
        (setf position next)))
    (unless (= position prefix) (error 'invariant-violation :reason :verify-active-consumption)))
  nil)

;;; REQ: REQ-AFF-010 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (inspection ra:active-recuperato simple-vector) null) inspection-record-order))
(defun inspection-record-order (inspection active closed)
  "Pre: complete canonical live set in ID order, frozen namespace. Post: global ordinary M1 CSN order verified.
Each CLOSED reverified before its visitor, ACTIVE independently reread; all cardinalities checked.
No engine helper, data index or replay publication used. Errors reject the complete result."
  (setf (inspection-stage inspection) :record-order)
  (let ((cursor 0) (expected (nth-value 1 (ra:statistiche-active-recuperato active)))
        (sources (inspection-sources inspection)))
    (dotimes (i (mf:numero-fonti-recovery sources))
      (multiple-value-bind (id state form) (mf:fonte-recovery sources i)
        (setf (inspection-file inspection) (mf::nome-fonte-recovery id form))
        (unless (<= 1 id #xffffffff) (error 'unsupported-format :reason :verify-segment-id-outside-m1))
        (case state
          (:active (inspection-active-order inspection active id))
          (:closed
           (unless (< cursor (length closed)) (error 'invariant-violation :reason :verify-closed-count))
           (let ((token (the rc:closed-recuperato (svref closed cursor))))
             (unless (and (= id (nth-value 0 (rc:frontiere-closed-recuperato token)))
                          (= (inspection-version inspection) (nth-value 2 (rc:frontiere-closed-recuperato token))))
               (error 'unsupported-format :reason :verify-closed-format))
             (incf expected (nth-value 1 (rc:statistiche-closed-recuperato token)))
             (arcdocdb.recovery.replay:visita-record-closed-recuperato token (inspection-scratch inspection)
               (inspection-limits inspection)
               (lambda (buffer start end segment offset version prepared)
                 (inspection-record inspection buffer start end segment offset version prepared))))
           (incf cursor))
          (otherwise (error 'invariant-violation :reason :verify-source-state)))))
    (unless (and (= cursor (length closed)) (= expected (inspection-data-count inspection)))
      (error 'invariant-violation :reason :verify-record-count)))
  nil)
