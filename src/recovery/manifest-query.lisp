;;;; Query scalari del manifest completato; nessun contenitore privato esportato.
;;; OWNER: proprietario del manifest immutabile restituito dalla ricostruzione.
;;; SHARED: sola lettura; nessuna scrittura o sincronizzazione condivisa tra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (manifest) (values u64 &optional)) segmento-attivo))
(defun segmento-attivo (manifest)
  "Pre: fully reconstructed manifest. Post: nonzero ACTIVE, no modification.
Contract type violations signal TYPE-ERROR with safety 3."
  (%manifest-active manifest))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-018
(declaim (ftype (function (manifest) (values boolean u64 &optional)) prossimo-id-segmento))
(defun prossimo-id-segmento (manifest)
  "Pre: complete manifest. Post: presence and u64 high-water, NIL/0 if ID space exhausted.
The value2^64 exists only internally in memory; no different sentinel is read or written on disk.
Contract type violations signal TYPE-ERROR with safety 3."
  (let ((next (%manifest-next-id manifest)))
    (if (typep next 'u64) (values t next) (values nil 0))))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (manifest) (values index &optional)) numero-segmenti-chiusi))
(defun numero-segmenti-chiusi (manifest)
  "Pre: complete manifest. Post: number of unique present CLOSED IDs, no modification.
Contract type violations signal TYPE-ERROR with safety 3."
  (hash-table-count (%manifest-closed manifest)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-018
(declaim (ftype (function (manifest) (values index &optional)) numero-segmenti-rimossi))
(defun numero-segmenti-rimossi (manifest)
  "Pre: complete manifest. Post: number of unique recorded REMOVED IDs, no modification.
Contract type violations signal TYPE-ERROR with safety 3."
  (hash-table-count (%manifest-removed manifest)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-TXM-007 REQ-AFF-018
(declaim (ftype (function (manifest u64)
                         (values (member :active :closed :removed :unknown) u64 index &optional))
                trova-segmento))
(defun trova-segmento (manifest id)
  "Pre: complete manifest, u64 ID. Post: state, valid-bytes, and unique outcome count.
Length/count are zero for ACTIVE, REMOVED, and UNKNOWN; no internal reference exposed.
Contract type violations signal TYPE-ERROR with safety 3."
  (cond
    ((= id (%manifest-active manifest)) (values :active 0 0))
    ((gethash id (%manifest-closed manifest))
     (let ((entry (the manifest-closed (gethash id (%manifest-closed manifest)))))
       (values :closed (%closed-valid-bytes entry) (hash-table-count (%closed-outcomes entry)))))
    ((gethash id (%manifest-removed manifest)) (values :removed 0 0))
    (t (values :unknown 0 0))))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (manifest u64 u64) (values boolean u64 &optional)) trova-esito-chiusura))
(defun trova-esito-chiusura (manifest segment-id txid)
  "Pre: complete manifest and u64 ID/TXID. Post: presence and CSN, NIL/0 if segment/outcome absent.
Present zero CSN is distinguishable from absence; all u64 words are compared.
Contract type violations signal TYPE-ERROR with safety 3."
  (let ((entry (gethash segment-id (%manifest-closed manifest))))
    (if entry
        (multiple-value-bind (csn present) (gethash txid (%closed-outcomes entry))
          (if present (values t csn) (values nil 0)))
        (values nil 0))))
