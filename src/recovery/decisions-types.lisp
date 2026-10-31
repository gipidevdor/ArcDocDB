;;;; Oggetti privati del risultato; nessun accessore pubblico espone vettori.
;;; OWNER: singola ricostruzione, poi proprietario della tabella restituita.
;;; SHARED: nessuna scrittura condivisa; i campi del risultato sono sola lettura.
(in-package #:arcdocdb.recovery.decisions)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-TXM-005 REQ-REC-001 REQ-AFF-008
(defstruct (origine-decisioni (:constructor %make-origine-decisioni ()) (:copier nil))
  "Pre: a new replay table. Post: unique EQ identity, without entries, buffer, or FD.
The marker is private and is not a signature or capability for external input; no mutable data.
Retaining the marker does not retain the decision table.")

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-FOR-003
(defstruct (decision-entry
            (:constructor %make-decision-entry (txid csn count participants source-offset))
            (:conc-name %entry-))
  "Pre: verified DECISION; ID16 values copied, sorted, and distinct, COUNT >=2.
Post: owned entry with read-only fields; no alias to the input buffer.
Declared types are preconditions checked by the runtime with safety 3."
  (txid 0 :type u64 :read-only t)
  (csn 0 :type u64 :read-only t)
  (count 0 :type u16 :read-only t)
  (participants (make-array 0 :element-type '(unsigned-byte 8)) :type octets :read-only t)
  (source-offset 0 :type u64 :read-only t))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008
(defstruct (decision-table (:constructor %make-decision-table (entries)) (:conc-name %table-))
  "Pre: private ENTRIES, sorted by unique TXIDs; verified owned entries.
Post: complete table, read-only fields; no vector exposed by public APIs.
Declared types are preconditions detected by the runtime; no durable effect."
  (entries (make-array 0 :element-type t) :type simple-vector :read-only t)
  (origin (%make-origine-decisioni) :type origine-decisioni :read-only t))

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (decision-entry) null) check-entry-shape))
(defun check-entry-shape (entry)
  "Pre: private ENTRY. Post: at least two participants and ID16 vector of the exact size.
Signals INVARIANT-VIOLATION for inconsistent internal construction; no modification."
  (unless (>= (%entry-count entry) 2)
    (error 'invariant-violation :reason :decision-entry-count))
  (unless (= (length (%entry-participants entry)) (* (%entry-count entry) +participant-id-bytes+))
    (error 'invariant-violation :reason :decision-entry-size))
  nil)
