;;; OWNER: writer possiede il lotto SEALED prima dell'adozione/dispatch; copia solo metadati.
;;; SHARED: nessun indice/FD modificato; la verifica in memoria non prova write o fsync.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (octets u32 (member 1 2) u32) u32) conta-put-attivi))
(defun conta-put-attivi (buffer end version records)
  "Pre: fully verified/stable batch, known SEAL count. Post: ordinary PUT count.
Valid Prepared/OUTCOME explicitly rejected as an integration not yet supported.
At most records+1 headers; RESOURCE/INVALID/INVARIANT propagated, no value copy."
  (let ((pos 0) (puts 0))
    (declare (type u32 pos puts))
    (dotimes (i (1+ records))
      (multiple-value-bind (next kind flags) (prossima-cornice-resolver buffer pos end version)
        (when (logtest flags +prepared+)
          (error 'invalid-argument :reason :active-prepared-unsupported))
        (case kind
          (#.+put+ (incf puts)) (#.+tombstone+ nil)
          (#.+outcome+ (error 'invalid-argument :reason :active-outcome-unsupported))
          (#.+seal+
           (unless (and (= i records) (= next end))
             (error 'invariant-violation :reason :active-seal-position))
           (return-from conta-put-attivi puts))
          (otherwise (error 'invariant-violation :reason :active-frame-kind)))
        (setf pos next)))
    (error 'invariant-violation :reason :active-scan-bound)))

;;; REQ: REQ-WAL-005 REQ-FOR-003 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto) u32) verifica-lotto-attivo))
(defun verifica-lotto-attivo (source batch)
  "Pre: lease and token already checked, exclusive sealed batch. Post: exact CRC/SEAL/CSN and PUTs counted.
Reads only the new batch: does not reread ACTIVE or assume EOF or durability.
Typed errors before adoption; bytes not retained in the result."
  (verifica-ritiro-lotto batch)
  (let* ((segment (sorgente-get-attiva-segment source)) (size (lunghezza-lotto batch))
         (start (inizio-lotto batch)) (buffer (arcdocdb.wal::lotto-buffer batch)))
    (unless (and (= (arcdocdb.wal::lotto-file-id batch) (segmento-get-low segment))
                 (= (arcdocdb.wal::lotto-version batch) (segmento-get-version segment)))
      (error 'invalid-argument :reason :active-batch-identity))
    (unless (<= +segment-header-bytes+ start (- +segment-max-bytes+ size))
      (error 'resource-exhausted :reason :active-segment-budget))
    (when (> size (sorgente-get-attiva-batch-bytes source))
      (error 'resource-exhausted :reason :active-batch-byte-budget))
    (multiple-value-bind (next stamp durable count)
        (verifica-lotto buffer 0 size (segmento-get-low segment) :version (segmento-get-version segment)
                        :file-offset start :max-records (sorgente-get-attiva-batch-records source)
                        :max-bytes (sorgente-get-attiva-batch-bytes source))
      (unless (and (= next size) (= count (arcdocdb.wal::lotto-count batch)) (<= durable start))
        (error 'invariant-violation :reason :active-batch-result))
      (multiple-value-bind (slot high low) (leggi-csn-lotto batch)
        (declare (ignore slot)) ; identità del token già verificata dal controller, non un esito.
        (unless (and (= high (ldb (byte 32 32) stamp)) (= low (ldb (byte 32 0) stamp)))
          (error 'invariant-violation :reason :active-batch-csn)))
      (conta-put-attivi buffer size (segmento-get-version segment) count))))

;;; REQ: REQ-IDX-001 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto resolver-words &optional index index) null) copia-put-attivi))
(defun copia-put-attivi (source batch rows &optional (first 0) (limit (length rows)))
  "Pre: ordinary batch already verified, stable buffer, exclusive unpublished row span [FIRST,LIMIT).
Post: absolute offsets/size/flags/CSN copied, proof zero; no reference to reusable bytes/event.
At most count+1 headers; INVARIANT-VIOLATION for count/range, no partial publication."
  (unless (and (<= first limit (length rows)) (zerop (mod (length rows) +row-words+))
               (zerop (mod first +row-words+)) (zerop (mod limit +row-words+)))
    (error 'invariant-violation :reason :active-row-shape))
  (let ((pos 0) (used first) (buffer (arcdocdb.wal::lotto-buffer batch))
        (end (lunghezza-lotto batch)) (start (inizio-lotto batch))
        (version (segmento-get-version (sorgente-get-attiva-segment source))))
    (declare (type u32 pos) (type index used))
    (loop repeat (1+ (arcdocdb.wal::lotto-count batch))
          do (multiple-value-bind (next kind flags) (prossima-cornice-resolver buffer pos end version)
               (when (= kind +seal+)
                 (unless (and (= next end) (= used limit))
                   (error 'invariant-violation :reason :active-row-count))
                 (return-from copia-put-attivi nil))
               (when (= kind +put+)
                 (unless (<= (+ used +row-words+) limit)
                   (error 'invariant-violation :reason :active-row-count))
                 (setf (aref rows (+ used +row-offset+)) (+ start pos)
                       (aref rows (+ used +row-size+)) (- next pos)
                       (aref rows (+ used +row-flags+)) flags
                       (aref rows (+ used +row-csn-low+)) (leggi-u32 buffer (+ pos +stamp-offset+))
                       (aref rows (+ used +row-csn-high+)) (leggi-u32 buffer (+ pos +stamp-offset+ 4))
                       (aref rows (+ used +row-proof+)) 0)
                 (incf used +row-words+))
               (setf pos next)))
    (error 'invariant-violation :reason :active-scan-bound)))
