;;; OWNER: il writer di bootstrap possiede selettore, indice e due scratch distinti.
;;; SHARED: sola preparazione del payload privato; nessuna pubblicazione o coordinamento fra Serie.
(in-package #:arcdocdb.recovery.selection)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (u64 u64 index index) null) verifica-location-indice-recuperata))
(defun verifica-location-indice-recuperata (csn segment offset bytes)
  "Pre: verified winning PUT. Post: positive CSN and location representable in primary v2/current GET.
INVALID-ARGUMENT for zero CSN, ID not a positive u32, offset/end beyond u32; no truncation or effect.
These are recipient limits, not new limits on the reader or recovery u64 segment-ids."
  (unless (plusp csn) (error 'invalid-argument :reason :recovery-index-csn))
  (unless (<= 1 segment #xffffffff) (error 'invalid-argument :reason :recovery-index-segment-id))
  (unless (and (<= offset #xffffffff) (<= (+ offset bytes) #xffffffff))
    (error 'invalid-argument :reason :recovery-index-location))
  nil)

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-006 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (selettore-versione-recuperata contenuto-slot
                          (member :none :put :tombstone) u64 u64 index index) null)
                prepara-payload-indice-recuperato))
(defun prepara-payload-indice-recuperato (selector source kind csn segment offset bytes)
  "Pre: selector read succeeded, free context, and distinct SOURCE; full key attested by the caller.
Post: live v2 payload for PUT, five zeros for NONE/TOMBSTONE; no index modified.
Compatibility before writes; private inconsistency => selector FAULTED, no deliverable payload."
  (case kind
    (:put
     (verifica-location-indice-recuperata csn segment offset bytes)
     (setf (aref source 0) csn (aref source 1) (logior (ash segment 32) offset)
           (aref source 2) (logior (ash (selection-length selector) 32) (ash 1 48))
           (aref source 3) bytes (aref source 4) 0)
     (unless (arcdocdb.index.slots::contenuto-vivo-valido-p
              (aref source 0) (aref source 1) (aref source 2) (aref source 3) (aref source 4) nil)
       (guasto-selettore selector :recovery-index-payload)))
    ((:none :tombstone) (fill source 0))
    (otherwise (guasto-selettore selector :recovery-index-kind)))
  nil)
