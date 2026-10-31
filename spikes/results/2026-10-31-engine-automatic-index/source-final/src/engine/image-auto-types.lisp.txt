;;; OWNER: immutable configuration; each engine separately owns its used ordinal.
;;; SHARED: configuration only, no mutable counter between Serie.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-012 REQ-LIM-003
(defstruct (opzione-rinnovo-automatico
             (:constructor %make-opzione-rinnovo-automatico (first policy renewals payload pages)) (:copier nil))
  "Pre: validated image option, policy and finite sequence/budgets. Post: immutable configuration.
No I/O, root, FD or mutable per-engine ordinal is retained by this object."
  (first nil :type opzione-indice-paginato :read-only t)
  (policy nil :type politica-rinnovo-indice :read-only t)
  (renewals 64 :type (integer 1 65536) :read-only t)
  (payload 67108864 :type (integer 0 536870912) :read-only t)
  (pages 65536 :type (integer 1 65536) :read-only t))
