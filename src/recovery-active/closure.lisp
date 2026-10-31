;;; OWNER: controller prepara una entry CLOSED in un buffer esclusivo, prima di qualunque I/O del checkpoint.
;;; SHARED: solo scalari e array privati immutabili; nessun CSN, file o stato tra Serie.
(in-package #:arcdocdb.recovery.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-001
(declaim (ftype (function (active-recuperato) u64) id-active-recuperato))
(defun id-active-recuperato (recovered)
  "Pre: header already verified against the manifest. Post: full u64 ID of old ACTIVE, without I/O.
No identity from pathname or numeric FD."
  (let ((segment (active-recuperato-segment recovered)))
    (logior (ash (arcdocdb.get::segmento-get-high segment) 32) (arcdocdb.get::segmento-get-low segment))))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (active-recuperato) index) lunghezza-chiusura-active))
(defun lunghezza-chiusura-active (recovered)
  "Pre: complete result. Post: exact CLOSED entry bytes: fixed part plus TXID/CSN pairs.
Does not include the CLOSED count or other EDIT fields; no buffer or modification."
  (+ arcdocdb.storage.format::+closed-fixed-bytes+
     (* arcdocdb.storage.format::+closure-outcome-bytes+ (length (active-recuperato-ids recovered)))))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (active-recuperato octets index) index) scrivi-chiusura-active))
(defun scrivi-chiusura-active (recovered buffer start)
  "Pre: complete result, exclusive BUFFER. Post: canonical CLOSED entry with P and only sorted derived outcomes.
Alias with Serie identity, shape, and range rejected before writing; returns end, rest of buffer unchanged.
No durability or atomicity point: prepares bytes for the future checkpoint."
  (let* ((ids (active-recuperato-ids recovered)) (csns (active-recuperato-csns recovered))
         (count (length ids)) (end (+ start (lunghezza-chiusura-active recovered)))
         (view (arcdocdb.get::segmento-get-owner (active-recuperato-segment recovered))))
    (when (eq buffer (arcdocdb.get::vista-get-serie-identity view))
      (error 'invalid-argument :reason :active-recovery-closure-alias))
    (unless (and (= count (length csns)) (typep count 'u32))
      (error 'invariant-violation :reason :active-recovery-closure-shape))
    (check-range buffer start end)
    (scrivi-u64 buffer start (id-active-recuperato recovered))
    (scrivi-u64 buffer (+ start arcdocdb.storage.format::+closed-valid-bytes-offset+)
                (active-recuperato-prefix recovered))
    (scrivi-u32 buffer (+ start arcdocdb.storage.format::+closed-outcome-count-offset+) count)
    (loop for i below count
          for pos from (+ start arcdocdb.storage.format::+closed-fixed-bytes+)
            by arcdocdb.storage.format::+closure-outcome-bytes+
          do (scrivi-u64 buffer pos (aref ids i))
             (scrivi-u64 buffer (+ pos (/ arcdocdb.storage.format::+closure-outcome-bytes+ 2)) (aref csns i)))
    end))
