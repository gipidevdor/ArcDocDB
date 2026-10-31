;;; OWNER: risultato completo immutabile; FD tenuto aperto dal controller nel recovery.
;;; SHARED: query scalari concorrenti; nessun vettore, buffer o stato mutabile esportato.
(in-package #:arcdocdb.recovery.archive)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (decisioni-recuperate) (values boolean u64 &optional))
                massimo-csn-decisioni-recuperate))
(defun massimo-csn-decisioni-recuperate (recovered)
  "Pre: complete decision log bound to Archivio; controller keeps FD open.
Post: presence and maximum CSN of every DECISION, even without prepared records in open Serie.
Propagates typed conditions; checks lifetime, without I/O, mutations, or traffic admission."
  (arcdocdb.io::esigi-aperto (decisioni-recuperate-input recovered) :input)
  (arcdocdb.recovery.decisions:massimo-csn-decisioni (decisioni-recuperate-table recovered)))

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-AFF-009
(declaim (ftype (function (decisioni-recuperate)
                         (values index index (member :complete :tail) (member 1 2) &optional))
                frontiere-decisioni-recuperate))
(defun frontiere-decisioni-recuperate (recovered)
  "Pre: complete result. Post: attested EOF, absolute prefix, state, and format read.
No buffer or numeric FD exported; TYPE-ERROR for invalid types, no proof of future health."
  (values (decisioni-recuperate-size recovered) (decisioni-recuperate-prefix recovered)
          (decisioni-recuperate-status recovered) (decisioni-recuperate-version recovered)))

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (decisioni-recuperate) (values index &optional)) numero-decisioni-recuperate))
(defun numero-decisioni-recuperate (recovered)
  "Pre: complete result. Post: unique TXID count after coalescing identical duplicates.
TYPE-ERROR for invalid types; no mutation or syscall."
  (numero-decisioni (decisioni-recuperate-table recovered)))

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-TXM-001 REQ-AFF-008
(declaim (ftype (function (decisioni-recuperate u64) (values boolean u64 u16 &optional))
                trova-decisione-recuperata))
(defun trova-decisione-recuperata (recovered txid)
  "Pre: complete result and opaque u64 TXID. Post: presence, CSN, and count; NIL/0/0 if absent.
Present zero remains distinct from absence; typed replay/query errors propagated."
  (trova-decisione (decisioni-recuperate-table recovered) txid))

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-TXM-001 REQ-AFF-008
(declaim (ftype (function (decisioni-recuperate u64 octets integer integer) boolean)
                partecipante-decisione-recuperata-p))
(defun partecipante-decisione-recuperata-p (recovered txid identity start end)
  "Pre: complete result, stable caller ID. Post: exact ID16 participant presence.
Range and length checked even for absent TXID; original conditions propagated, no alias exported."
  (partecipante-decisione-p (decisioni-recuperate-table recovered) txid identity start end))
