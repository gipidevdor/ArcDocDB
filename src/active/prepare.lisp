;;; OWNER: un compito del pool I/O; header stabile e scratch esclusivo fino al ritorno.
;;; SHARED: nessun indice/catalogo pubblicato; cleanup delle capacità resta al controller.
(in-package #:arcdocdb.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-001 REQ-FOR-002 REQ-AFF-002
(declaim (ftype (function (octets octets) null) verifica-rilettura-header))
(defun verifica-rilettura-header (header scratch)
  "Pre: two stable complete ranges, after reading/CRC. Post: exact equality of 64 bytes.
CORRUPTION-DETECTED for a difference, including created-at, version, and reserved fields; no mutation."
  (check-range header 0 +segment-header-bytes+) (check-range scratch 0 +segment-header-bytes+)
  (unless (loop for i below +segment-header-bytes+ always (= (aref header i) (aref scratch i)))
    (error 'corruption-detected :reason :active-initialization-readback :offset 0))
  nil)

;;; REQ: REQ-STO-003 REQ-FOR-001 REQ-FOR-002 REQ-AFF-001 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (vista-get-serie file-io file-io file-io u64 u64 octets octets
                         &key (:version integer)) segmento-attivo-preparato) prepara-segmento-attivo))
(defun prepara-segmento-attivo (view input append directory segment-id created-at header scratch
                               &key (version 2))
  "Pre: I/O pool, new O_EXCL temporary file, reserved namespace; DIRECTORY is the authoritative parent.
Post: canonical header written, file synchronized, readback/CRC/identity/bytes verified, parent fsync.
Returns the complete wrapper; no EDIT, rename, publication, or client acknowledgment.
Typed faults propagate without retry/rollback/close; no partial result. The caller performs cleanup.
The opening atomicity point is the future durable EDIT, not these preparation flushes."
  (verifica-preparazione-attiva view input append directory segment-id version header scratch)
  (let* ((association (associa-file input append))
         (log (crea-log-io append :segment segment-id :version version)))
    (unless (= (scrivi-header-segmento header 0 (arcdocdb.get::vista-get-serie-identity view)
                                      segment-id created-at :version version) +segment-header-bytes+)
      (error 'invariant-violation :reason :active-initialization-header))
    (unless (= (append-esatto append header 0 +segment-header-bytes+) +segment-header-bytes+)
      (error 'invariant-violation :reason :active-initialization-write))
    (unless (= (durable-flush append) +segment-header-bytes+)
      (error 'invariant-violation :reason :active-initialization-flush))
    (let ((segment (crea-segmento-get view input segment-id scratch)))
      (verifica-rilettura-header header scratch)
      (unless (zerop (durable-flush directory))
        (error 'invariant-violation :reason :active-initialization-directory))
      (arcdocdb.io::esigi-aperto directory :directory)
      (verifica-frontiera-iniziale input append association)
      (%make-segmento-attivo-preparato log segment association))))
