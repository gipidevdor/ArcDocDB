;;; OWNER: workspace privato del recovery; aggiornamento solo dopo verifica integrale del prefisso.
;;; SHARED: due scalari locali, nessun registro CSN o stato condiviso fra Serie.
(in-package #:arcdocdb.recovery.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-TXM-007
(declaim (ftype (function (workspace-active u64) null) registra-csn-active))
(defun registra-csn-active (workspace csn)
  "Pre: CSN from an already verified source; never TXID, offset, or control log order.
Post: observed maximum and presence independent of zero value; private workspace only.
TYPE-ERROR for invalid types; no container allocation, I/O, or version assignment."
  (setf (workspace-active-max-csn workspace) (max csn (workspace-active-max-csn workspace))
        (workspace-active-csn-present workspace) t)
  nil)

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-TXM-007
(declaim (ftype (function (active-recuperato) (values boolean u64 &optional))
                massimo-csn-active-recuperato))
(defun massimo-csn-active-recuperato (recovered)
  "Pre: complete immutable result. Post: presence and maximum CSN observed in the prefix and resolved outcomes.
Includes writer SEAL and OUTCOME without local prepared data; excludes tail and prepared TXID stamps.
NIL/0 if no source; TYPE-ERROR for invalid types. Does not initialize the Archivio registry."
  (values (active-recuperato-csn-present recovered) (active-recuperato-max-csn recovered)))
