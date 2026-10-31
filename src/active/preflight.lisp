;;; OWNER: un compito esclusivo prima del primo byte scritto nel temporaneo.
;;; SHARED: sole letture di metadati locali; bridge ai controlli interni I/O, senza FD esportati.
(in-package #:arcdocdb.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-FOR-001 REQ-STO-003
(declaim (ftype (function (vista-get-serie file-io file-io file-io u64 integer octets octets) null)
                verifica-preparazione-attiva))
(defun verifica-preparazione-attiva (view input append directory segment-id version header scratch)
  "Pre: reserved namespace, exclusive capabilities, private buffers. Post: preflight without I/O effects.
Positive u32 ID, known format, two 64-byte ranges, no alias; zero written/durable append frontiers.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED/IO-FAULT/UNSUPPORTED-FORMAT before header and syscall."
  (format-limits version)
  (unless (<= 1 segment-id #xffffffff)
    (error 'invalid-argument :reason :active-initialization-id))
  (when (or (eq header scratch) (eq header (arcdocdb.get::vista-get-serie-identity view))
            (eq scratch (arcdocdb.get::vista-get-serie-identity view)))
    (error 'invalid-argument :reason :active-initialization-alias))
  (check-range header 0 +segment-header-bytes+) (check-range scratch 0 +segment-header-bytes+)
  (verifica-capienza-lettura input +segment-header-bytes+)
  (verifica-capienza-append append +segment-header-bytes+ +segment-header-bytes+)
  (arcdocdb.io::esigi-aperto directory :directory)
  (unless (and (eq (arcdocdb.io::file-backend input) (arcdocdb.io::file-backend append))
               (eq (arcdocdb.io::file-backend input) (arcdocdb.io::file-backend directory)))
    (error 'invalid-argument :reason :active-initialization-backend))
  (unless (and (zerop (posizione-scritta append)) (zerop (posizione-durevole append)))
    (error 'invalid-argument :reason :active-initialization-started))
  nil)

;;; REQ: REQ-AFF-001 REQ-STO-003
(declaim (ftype (function (file-io file-io associazione-file) null) verifica-frontiera-iniziale))
(defun verifica-frontiera-iniziale (input append association)
  "Pre: exclusive capabilities and proof from I/O pool. Post: same open capabilities and durable header only.
IO-FAULT/INVALID-ARGUMENT for proof; INVARIANT-VIOLATION for frontiers other than 64.
Does not verify catalog, any SEAL, or presence of other external capabilities."
  (verifica-associazione-file association input append)
  (unless (and (= (posizione-scritta append) +segment-header-bytes+)
               (= (posizione-durevole append) +segment-header-bytes+))
    (error 'invariant-violation :reason :active-initialization-frontier))
  nil)
