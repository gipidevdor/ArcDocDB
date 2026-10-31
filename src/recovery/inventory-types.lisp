;;;; Descrittori e piani di riconciliazione dei nomi; nessun accesso al filesystem.
;;; OWNER: il chiamante possiede l'inventario; ogni piano possiede le proprie entry.
;;; SHARED: manifest e piani pubblicati immutabili; nessuna scrittura fra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008
(defstruct (segment-file (:constructor %make-segment-file (id form)) (:conc-name %file-))
  "Pre: u64 ID and form verified by the caller. Post: immutable name descriptor.
Zero is a valid ID for CLOSED/REMOVED; types checked with safety3."
  (id 0 :type u64 :read-only t)
  (form :final :type (member :temporary :final) :read-only t))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (u64 (member :temporary :final))
                         (values segment-file &optional)) file-segmento))
(defun file-segmento (id forma)
  "Pre: complete u64 identity and name interpreted as .seg.tmp or .seg by the caller.
Post: owned read-only descriptor; TYPE-ERROR for invalid types, no parsing or I/O."
  (%make-segment-file id forma))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(defstruct (reconciliation-entry
            (:constructor %make-reconciliation-entry (id form action state))
            (:conc-name %re-))
  "Pre: unique plan ID, presence and state verified. Post: immutable scalar decision.
Runtime types prevent states outside the contract; no proof of content integrity."
  (id 0 :type u64 :read-only t)
  (form :absent :type (member :temporary :final :absent :both) :read-only t)
  (action :missing :type (member :use :rename :delete :anomaly :missing :conflict) :read-only t)
  (state :unknown :type (member :active :closed :removed :unknown) :read-only t))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(defstruct (reconciliation-plan
            (:constructor %make-reconciliation-plan (entries health)) (:conc-name %plan-))
  "Pre: owned entries sorted by u64 ID, verified aggregate state.
Post: read-only plan; no inventory vector or manifest hash table exposed.
Safety3 types always active; queries perform no filesystem actions."
  (entries #() :type simple-vector :read-only t)
  (health :ready :type (member :ready :degraded :faulted) :read-only t))
