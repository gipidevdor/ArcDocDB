;;; OWNER: serial GET actor; one preallocated CLOSED row frame, no rows per historical PUT retained.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-REC-001
(declaim (ftype (function (motore c:control-recuperato rc:closed-recuperato) r:mappa-segmento-get) make-automatic-closed-stub))
(defun make-automatic-closed-stub (engine control token)
  "Pre: canonical CLOSED gate passed. Post: metadata-only published capability, no per-record rows.
The trusted manifest frontier and exact open FD remain mandatory; no EOF-based visibility."
  (let* ((id (nth-value 0 (rc:frontiere-closed-recuperato token)))
         (file (rc::closed-recuperato-input token))
         (end (r::frontiera-closed-resolver (c:manifest-control-recuperato control) id
                                          (motore-scratch engine) (motore-max-file-bytes engine)))
         (segment (g:crea-segmento-get (motore-view engine) file id (motore-scratch engine))))
    (r::%make-mappa-segmento-get segment end (make-array 0 :element-type '(unsigned-byte 32)))))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (motore r:mappa-segmento-get) r:mappa-segmento-get) load-automatic-map))
(defun load-automatic-map (engine source)
  "Pre: serial admitted GET, immutable metadata source. Post: one verified cached row span.
On miss the whole bounded CLOSED prefix is reverified; old wrapper retired before fixed rows are reused."
  (let* ((auto (motore-automatic-index engine)) (segment (r::mappa-segmento-get-segment source))
         (end (r::mappa-segmento-get-end source)) (buffer (motore-scratch engine)) (rows (automatic-index-controller-rows auto)))
    (when (eq source (automatic-index-controller-map-source auto))
      (return-from load-automatic-map (automatic-index-controller-map auto)))
    (setf (automatic-index-controller-map-source auto) nil (automatic-index-controller-map auto) nil)
    (unless (= end (io:leggi-esatto (g::segmento-get-file segment) buffer 0 end 0))
      (error 'invariant-violation :reason :engine-auto-resolver-read))
    (r::verifica-sorgente-resolver buffer end segment (motore-max-records engine) (motore-max-records engine)
                                 (motore-max-records engine) (motore-max-file-bytes engine))
    (let ((position f:+segment-header-bytes+) (count 0) (version (g::segmento-get-version segment)))
      (loop repeat (1+ (floor (- end position) arcdocdb.record:+header-bytes+)) while (< position end) do
        (multiple-value-bind (next kind flags) (r::prossima-cornice-resolver buffer position end version)
          (unless (zerop flags) (error 'unsupported-format :reason :engine-auto-resolver-flags))
          (when (= kind 1)
            (when (>= count (motore-max-records engine)) (error 'invariant-violation :reason :engine-auto-resolver-count))
            (r::copia-riga-resolver buffer position next flags rows rows (* 6 count))
            (incf count))
          (setf position next)))
      (unless (= position end) (error 'invariant-violation :reason :engine-auto-resolver-bound))
      (setf (automatic-index-controller-map auto) (r::%make-mappa-segmento-get segment end rows count)
            (automatic-index-controller-map-source auto) source)
      (automatic-index-controller-map auto))))

;;; REQ: REQ-IDX-013 REQ-FOR-004
(declaim (ftype (function (motore g:contesto-get)
                         (values (member :cache :segment :buffer-required) keyword keyword boolean boolean &optional))
                read-automatic-record))
(defun read-automatic-record (engine context)
  "Pre: CANDIDATE and one owner BUSY. Post: existing record verifier with revalidated CLOSED rows or ACTIVE root.
Cache misses may block. Borrowed fixed rows cannot escape the serial request."
  (unless (motore-busy engine) (error 'invariant-violation :reason :engine-auto-get-admission))
  (multiple-value-bind (sources active) (gd::acquisisci-fonti-serie-get context (motore-controller engine))
    (if (and active (= (ldb (byte 32 32) (aref (g::contesto-get-content context) 1))
                      (g::segmento-get-low (r::sorgente-get-attiva-segment (r::radice-get-attiva-source active)))))
        (multiple-value-bind (segment end flags proof) (r:risolvi-candidato-radice-attiva-get context active)
          (g:leggi-record-get context segment end flags :outcome-offset proof))
        (r:leggi-record-risolto-get context
          (load-automatic-map engine
            (gd:trova-mappa-directory-get context (gd::fonti-get-serie-directory sources)))))))
