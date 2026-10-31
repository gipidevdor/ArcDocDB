;;; OWNER: controlli locali del writer; i reader pubblicano solo guasti terminali.
;;; SHARED: nessun accesso a root, arena, risorsa esterna o coordinamento tra Serie.
(in-package #:arcdocdb.index.slots)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-003 REQ-AFF-004
(declaim (ftype (function (banco-slot) null) invalida-banco-slot))
(defun invalida-banco-slot (bank)
  "Pre: trusted boundary or internal defect; repeatable invalidation without mutex.
Post: terminal FAULTED health, no word erased; alone it does not isolate the Serie."
  (sb-thread:barrier (:write))
  (setf (banco-slot-health bank) :faulted)
  nil)

;;; REQ: REQ-IDX-003 REQ-AFF-004
(declaim (ftype (function (banco-slot keyword) nil) guasto-slot))
(defun guasto-slot (bank reason)
  "Pre: bank invariant violated. Post: FAULTED before typed error.
INVARIANT-VIOLATION propagated to Serie boundary; no repair attempt."
  (invalida-banco-slot bank)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-IDX-003 REQ-AFF-004
(declaim (inline esigi-banco-sano base-slot esigi-banco-writer))
(declaim (ftype (function (banco-slot) null) esigi-banco-sano))
(defun esigi-banco-sano (bank)
  "Pre: canonical bank. Post: OPEN health acquired, without mutex or write.
INVARIANT-VIOLATION if terminal; caller discards all data read."
  (let ((health (banco-slot-health bank)))
    (sb-thread:barrier (:read))
    (unless (eq health :open) (guasto-slot bank :index-slot-faulted)))
  nil)

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (banco-slot integer) fixnum) base-slot))
(defun base-slot (bank slot)
  "Pre: canonical bank; slot supplied by probing. Post: valid base in contiguous array.
INVALID-ARGUMENT for slot beyond capacity, before reading or modifying fields."
  (unless (<= 0 slot (1- (banco-slot-capacity bank)))
    (error 'invalid-argument :reason :index-slot-range))
  (* slot (if (banco-slot-retained bank) 6 5)))

;;; REQ: REQ-IDX-003 REQ-IDX-005 REQ-AFF-004
(declaim (ftype (function (banco-slot) null) esigi-banco-writer))
(defun esigi-banco-writer (bank)
  "Pre: Serie writer token; no other writer modifies or freezes the bank.
Post: healthy and writable; INVALID-ARGUMENT if FROZEN, INVARIANT-VIOLATION if FAULTED."
  (esigi-banco-sano bank)
  (unless (eq (banco-slot-state bank) :writable)
    (error 'invalid-argument :reason :index-slot-frozen))
  nil)

;;; REQ: REQ-IDX-003 REQ-IDX-005 REQ-AFF-004
(declaim (ftype (function (banco-slot) null) congela-banco-slot))
(defun congela-banco-slot (bank)
  "Pre: exclusive writer, no mutation in progress; use before root replacement.
Post: permanently FROZEN, data still readable. Repeatable; FAULTED rejected.
Neither publishes a directory nor freezes other fragment banks."
  (esigi-banco-sano bank)
  (sb-thread:barrier (:write))
  (setf (banco-slot-state bank) :frozen)
  (esigi-banco-sano bank)
  nil)
