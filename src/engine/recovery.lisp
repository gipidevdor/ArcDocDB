;;; OWNER: startup esclusivo verifica tutti i byte prima di checkpoint, indice e admission.
;;; SHARED: solo token canonici e piano scalare esistenti, nessuna scrittura fra Serie.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (motore dar:archivio-recovery) dar:decisioni-recuperate) leggi-decisioni-motore))
(defun leggi-decisioni-motore (engine archive)
  "Pre: configured M1 Archivio, exclusive namespace. Post: complete empty canonical replay.
2PC not admitted in M1: UNSUPPORTED-FORMAT before any recovery effect."
  (multiple-value-bind (file size) (input-motore engine "multiserie.log")
    (let ((decisions (dar:leggi-decisioni-recuperate archive file size (motore-scratch engine)
                      :max-bytes (motore-max-file-bytes engine))))
      (unless (zerop (dar:numero-decisioni-recuperate decisions))
        (error 'unsupported-format :reason :engine-multiseries-outside-m1))
      decisions)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-AFF-008
(declaim (ftype (function (motore) rs:limiti-recovery-serie) limiti-motore))
(defun limiti-motore (engine)
  "Pre: validated configuration. Post: readonly limits for canonical readers; no budget clamping.
M1 rejects prepared/outcome; ordinary compaction uses the existing canonical format."
  (rs:crea-limiti-recovery-serie :max-segmenti (motore-max-segments engine)
     :budget-riferimenti (* 8 (motore-max-segments engine))
     :max-byte-totali (* (motore-max-file-bytes engine) (motore-max-segments engine))
     :max-bytes (motore-max-file-bytes engine) :max-records (motore-max-records engine)
     :max-batches (motore-max-records engine) :max-batch-records (motore-max-records engine)
     :max-batch-bytes (motore-max-file-bytes engine) :max-prepared 0 :max-outcomes 0 :max-esiti-chiusura 0))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-MVC-006 REQ-AFF-008
(declaim (ftype (function (motore dar:decisioni-recuperate ac:insieme-serie-recovery)
                         (values c:control-recuperato mf::recovery-sources ra:active-recuperato simple-vector
                                 ac:piano-csn-archivio &optional)) recupera-fonti-motore))
(defun recupera-fonti-motore (engine decisions set)
  "Pre: canonical lock and decision log, admission closed. Post: entire Serie and CSN gate verified.
M1 accepts ordinary full-prefix compaction and positive REMOVED authority; owned sources and readonly old segments, no effects."
  (let* ((control (leggi-control-motore engine))
         (sources (fonti-motore engine control)))
    (unless (= (nth-value 3 (c:frontiere-control-recuperato control)) (motore-version engine))
      (error 'unsupported-format :reason :engine-configured-format))
    (dotimes (i (mf:numero-fonti-recovery sources))
      (unless (<= 1 (nth-value 0 (mf:fonte-recovery sources i)) #xffffffff)
        (error 'unsupported-format :reason :engine-location-range)))
    (multiple-value-bind (active closed)
        (rs:leggi-serie-recuperata control sources decisions (motore-scratch engine) (limiti-motore engine))
      (let ((plan (ac:crea-piano-csn-archivio set decisions (vector active) (vector closed)
                    :max-segmenti-serie (motore-max-segments engine)
                    :max-segmenti-totali (motore-max-segments engine))))
        (values control sources active closed plan)))))

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-FOR-003 REQ-AFF-018
(declaim (ftype (function (motore ra:active-recuperato u64) a:segmento-attivo-preparato)
                checkpoint-motore))
(defun checkpoint-motore (engine recovered id)
  "Pre: complete gate succeeded, exclusive namespace. Post: old ACTIVE closed, fresh new ID decided.
Atomic point: existing CONTROL publisher; returns after parent fsync. No truncation or retry."
  (leggi-control-motore engine) ; reader canonico completo lascia nello scratch solo byte verificati.
  (let ((stamp (b:leggi-u64 (motore-scratch engine)
                           (+ f:+log-header-bytes+ arcdocdb.record::+stamp-offset+))))
    (when (= stamp #xffffffffffffffff) (error 'resource-exhausted :reason :engine-control-stamp))
    (let ((prepared (prepara-active-motore engine id)))
      (conserva-control-incompleto-motore engine id)
      (let* ((checkpoint (arcdocdb.recovery.checkpoint:crea-checkpoint-da-active recovered prepared (1+ stamp)
                           :max-segmenti (* 2 (motore-max-segments engine))))
             (output (prepara-control-motore engine checkpoint)))
        (osserva-motore engine :checkpoint-prepared)
        (ra:pubblica-control-da-active output recovered)
        (osserva-motore engine :checkpoint-published))
      prepared)))
