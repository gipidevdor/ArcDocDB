;;; OWNER: writer con lease verifica il lotto OPEN prima di assegnare CSN o adottare un evento.
;;; SHARED: nessuna prenotazione/radice mutata; header del solo lotto locale.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-005 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto) u32) conta-put-aperti-attivi))
(defun conta-put-aperti-attivi (source batch)
  "Pre: exclusive OPEN without token, count/bytes within budget. Post: exact ordinary headers/shape and count.
At most count headers, no body verification or commit attestation; CSN will be fixed by SEAL.
Valid Prepared/OUTCOME rejected before CSN; complete integrity repeated only after closure."
  (let ((pos 0) (puts 0) (buffer (arcdocdb.wal::lotto-buffer batch))
        (end (lunghezza-lotto batch)) (version (segmento-get-version (sorgente-get-attiva-segment source))))
    (declare (type u32 pos puts))
    (dotimes (i (arcdocdb.wal::lotto-count batch))
      (multiple-value-bind (next kind flags ks vs ve)
          (checked-header buffer pos end version +max-document-bytes+)
        (declare (ignore ks vs ve)) ; lunghezze/forma già controllate, non esiti.
        (unless (< pos next (1+ end)) (error 'invariant-violation :reason :active-open-progress))
        (when (logtest flags +prepared+) (error 'invalid-argument :reason :active-prepared-unsupported))
        (case kind
          (#.+put+ (incf puts)) (#.+tombstone+ nil)
          (#.+outcome+ (error 'invalid-argument :reason :active-outcome-unsupported))
          (otherwise (error 'invariant-violation :reason :active-open-kind)))
        (setf pos next)))
    (unless (= pos end) (error 'invariant-violation :reason :active-open-count))
    puts))

;;; REQ: REQ-WAL-005 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva lotto index) null) verifica-misure-aperte-attive))
(defun verifica-misure-aperte-attive (source batch start)
  "Pre: OPEN without token. Post: ID/version, count, bytes including SEAL, and segment space admitted.
Rejections before CSN; no buffer/event/index mutated, no I/O or array allocation."
  (let* ((segment (sorgente-get-attiva-segment source))
         (size (+ (lunghezza-lotto batch) arcdocdb.wal::+seal-total+)))
    (unless (and (= (arcdocdb.wal::lotto-file-id batch) (segmento-get-low segment))
                 (= (arcdocdb.wal::lotto-version batch) (segmento-get-version segment)))
      (error 'invalid-argument :reason :active-batch-identity))
    (when (zerop (arcdocdb.wal::lotto-count batch)) (error 'invalid-argument :reason :active-open-empty))
    (when (> (arcdocdb.wal::lotto-count batch) (sorgente-get-attiva-batch-records source))
      (error 'resource-exhausted :reason :active-batch-record-budget))
    (when (> size (sorgente-get-attiva-batch-bytes source))
      (error 'resource-exhausted :reason :active-batch-byte-budget))
    (unless (<= +segment-header-bytes+ start (- +segment-max-bytes+ size))
      (error 'resource-exhausted :reason :active-segment-budget)))
  nil)

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-IDX-001 REQ-AFF-008 REQ-AFF-001
(declaim (ftype (function (sorgente-get-attiva t lotto (or null radice-get-attiva)) u32)
                verifica-capienza-get-attiva))
(defun verifica-capienza-get-attiva (source lease batch previous)
  "Pre: exclusive lease, OPEN batch without token; call BEFORE sigilla-lotto-con-csn.
Post: ring, supported shape, contiguity, and peak admitted; returns PUT count, no reservation.
Keep lease, content, and previous stable until sealing/adoption, which rechecks everything.
Rejections without CSN/event; internal integrity/invariants => Archivio FAULTED, original cause propagated."
  (let ((controller (sorgente-get-attiva-controller source)))
    (arcdocdb.series::%check-owner controller lease) (arcdocdb.series::%require-healthy controller)
    (handler-case
        (arcdocdb.wal::esigi-lotto batch :open)
      (invariant-violation (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition)))
    (when (arcdocdb.wal::lotto-csn-registry batch) (error 'invalid-argument :reason :active-open-bound))
    (unless (eq previous (arcdocdb.series::controllore-serie-planned-root controller))
      (error 'invalid-argument :reason :active-root-order))
    (when (= (arcdocdb.series::controllore-serie-count controller)
             (length (arcdocdb.series::controllore-serie-slots controller)))
      (error 'resource-exhausted :reason :serie-full))
    (when (= (arcdocdb.series::controllore-serie-event-generation controller) most-positive-fixnum)
      (error 'resource-exhausted :reason :serie-event-generation))
    (handler-case
        (let ((start (arcdocdb.series::controllore-serie-next-offset controller)))
          (verifica-misure-aperte-attive source batch start)
          (let ((puts (conta-put-aperti-attivi source batch)))
            (verifica-delta-attivo source previous start puts)
            puts))
      (corruption-detected (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition))
      (invariant-violation (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition)))))
