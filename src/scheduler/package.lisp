;;;; Politica locale del pool di calcolo; nessun attuatore di thread.
;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(defpackage #:arcdocdb.scheduler
  (:use #:cl)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation)
  (:export #:controllore-pool #:crea-controllore-pool
           #:aggiorna-controllore-pool #:leggi-controllore-pool))
