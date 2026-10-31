;;;; ADR0040§3: un piano completo, conservativo per collisioni fra i due nomi.
;;; OWNER: workspace EQL e vettore delle decisioni esclusivi della singola chiamata.
;;; SHARED: nessuna scrittura su manifest/inventario; piani indipendenti fra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest simple-vector integer integer) (values index &optional))
                check-inventory-budgets))
(defun check-inventory-budgets (manifest files max-files max-segments)
  "Pre: complete manifest and stable inventory. Post: physical budgets and workspace bound.
INVALID-ARGUMENT for non-index budgets; RESOURCE-EXHAUSTED before any coalescing."
  (unless (typep max-files 'index)
    (error 'invalid-argument :reason :inventory-budget))
  (unless (typep max-segments 'index)
    (error 'invalid-argument :reason :inventory-budget))
  (when (> (length files) max-files)
    (error 'resource-exhausted :reason :inventory-file-budget))
  (let ((live (1+ (numero-segmenti-chiusi manifest))))
    (when (> live max-segments)
      (error 'resource-exhausted :reason :inventory-segment-budget))
    (unless (typep (+ live (length files)) 'index)
      (error 'resource-exhausted :reason :inventory-plan-budget))
    (+ live (length files))))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (simple-vector) (values hash-table &optional)) inventory-presence))
(defun inventory-presence (files)
  "Pre: stable inventory within the physical budget. Post: private EQL map ID→mask1/2/3.
INVALID-ARGUMENT for an invalid descriptor or repeated name; no partial entry exported.
The loop has length(FILES) steps; both names for an ID remain distinguishable."
  (let ((presence (make-hash-table :test 'eql)))
    (dotimes (i (length files))
      (let ((file (aref files i)))
        (unless (typep file 'segment-file)
          (error 'invalid-argument :reason :inventory-entry :offset i))
        (let* ((bit (case (%file-form file)
                      (:temporary 1) (:final 2)
                      (otherwise (error 'invariant-violation :reason :inventory-form))))
               (old (gethash (%file-id file) presence 0)))
          (unless (zerop (logand bit old))
            (error 'invalid-argument :reason :inventory-duplicate :offset i))
          (setf (gethash (%file-id file) presence) (logior bit old)))))
    (unless (<= (hash-table-count presence) (length files))
      (error 'invariant-violation :reason :inventory-count))
    presence))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest hash-table index) (values list &optional)) inventory-ids))
(defun inventory-ids (manifest presence bound)
  "Pre: private map and bound=physical names+1+CLOSED. Post: sorted union of distinct u64 IDs.
INVARIANT-VIOLATION for internal inconsistency; loops over already bounded cardinalities.
SORT modifies only the private list; no manifest hash table is modified."
  (unless (plusp (segmento-attivo manifest))
    (error 'invariant-violation :reason :inventory-active))
  (setf (gethash (segmento-attivo manifest) presence)
        (gethash (segmento-attivo manifest) presence 0))
  (maphash (lambda (id entry)
             (unless (typep entry 'manifest-closed)
               (error 'invariant-violation :reason :inventory-closed))
             (setf (gethash id presence) (gethash id presence 0)))
           (%manifest-closed manifest))
  (unless (<= (hash-table-count presence) bound)
    (error 'invariant-violation :reason :inventory-count))
  (let ((ids nil))
    (maphash (lambda (id mask)
               (unless (typep mask '(integer 0 3))
                 (error 'invariant-violation :reason :inventory-presence))
               (push id ids)) presence)
    (sort ids #'<)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-018
(declaim (ftype (function ((member :active :closed :removed :unknown)
                          (member :temporary :final) (member :use :rename :delete :anomaly)) null)
                check-single-file-action))
(defun check-single-file-action (state form action)
  "Pre: state, form, and action within declared types, checked with safety3.
Post: no removal without proof and no rename of a nonlive ID.
INVARIANT-VIOLATION for inconsistent implications; no mutation or I/O."
  (when (eq action :delete)
    (unless (or (eq state :removed) (and (eq state :unknown) (eq form :temporary)))
      (error 'invariant-violation :reason :inventory-delete-proof)))
  (when (eq action :rename)
    (unless (member state '(:active :closed))
      (error 'invariant-violation :reason :inventory-rename-proof)))
  nil)

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-018
(declaim (ftype (function ((member :active :closed :removed :unknown) (member :temporary :final))
                         (values (member :use :rename :delete :anomaly) &optional))
                single-file-action))
(defun single-file-action (state form)
  "Pre: authoritative state and one name only. Post: ADR0040§3 action, without durable effects.
INVARIANT-VIOLATION for unexpected state; unknown final is never deleted."
  (let ((action (case state
                  ((:active :closed) (if (eq form :temporary) :rename :use))
                  (:removed :delete)
                  (:unknown (if (eq form :temporary) :delete :anomaly))
                  (otherwise (error 'invariant-violation :reason :inventory-state)))))
    (check-single-file-action state form action)
    action))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest u64 (integer 0 3))
                         (values reconciliation-entry &optional)) inventory-entry))
(defun inventory-entry (manifest id mask)
  "Pre: ID from the bounded union, verified private mask. Post: one immutable entry.
INVARIANT-VIOLATION for an absent nonlive ID; conflict takes precedence over every single-file action."
  (let* ((state (trova-segmento manifest id))
         (entry
           (case mask
             (0 (unless (member state '(:active :closed))
                  (error 'invariant-violation :reason :inventory-missing-state))
                (%make-reconciliation-entry id :absent :missing state))
             (1 (%make-reconciliation-entry id :temporary (single-file-action state :temporary) state))
             (2 (%make-reconciliation-entry id :final (single-file-action state :final) state))
             (3 (%make-reconciliation-entry id :both :conflict state))
             (otherwise (error 'invariant-violation :reason :inventory-presence)))))
    (unless (and (= (%re-id entry) id) (eq (%re-state entry) state)
                 (eq (%re-form entry) (aref #(:absent :temporary :final :both) mask)))
      (error 'invariant-violation :reason :inventory-entry-proof))
    entry))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008
(declaim (ftype (function (reconciliation-entry) (values (integer 0 2) &optional)) entry-severity))
(defun entry-severity (entry)
  "Pre: planner-constructed entry. Post: severity 0 unless a required name is missing or
conflicting: 1 for CLOSED, 2 for ACTIVE.
INVARIANT-VIOLATION for unexpected state; unknown anomaly/conflict does not attest to contents."
  (when (eq (%re-action entry) :missing)
    (unless (member (%re-state entry) '(:active :closed))
      (error 'invariant-violation :reason :inventory-missing-state)))
  (let ((severity (if (member (%re-action entry) '(:missing :conflict))
                      (case (%re-state entry)
                        (:active 2) (:closed 1) ((:removed :unknown) 0)
                        (otherwise (error 'invariant-violation :reason :inventory-state)))
                      0)))
    (when (plusp severity)
      (unless (member (%re-action entry) '(:missing :conflict))
        (error 'invariant-violation :reason :inventory-severity-proof)))
    severity))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-REC-004 REQ-AFF-008 REQ-AFF-017 REQ-AFF-018
(declaim (ftype (function (manifest simple-vector &key (:max-files integer) (:max-segmenti integer))
                         (values reconciliation-plan &optional)) pianifica-riconciliazione))
(defun pianifica-riconciliazione (manifest files &key (max-files 65536) (max-segmenti 65536))
  "Pre: complete manifest, complete/stable inventory of names interpreted by the caller.
Post: owned plan in u64 ID order, availability status for required names only.
Propagates typed errors; no plan on error, no I/O, aliasing, or input mutation.
Does not verify headers/CRCs/physical identity or attest that the Serie can admit traffic.
Opening path with allocations, loops bounded by verified budgets and cardinalities."
  (let* ((bound (check-inventory-budgets manifest files max-files max-segmenti))
         (presence (inventory-presence files))
         (ids (inventory-ids manifest presence bound))
         (entries (make-array (length ids) :element-type t))
         (severity 0) (pos 0))
    (dolist (id ids)
      (let ((entry (inventory-entry manifest id (gethash id presence))))
        (setf (aref entries pos) entry severity (max severity (entry-severity entry))))
      (incf pos))
    (unless (= pos (hash-table-count presence))
      (error 'invariant-violation :reason :inventory-count))
    (%make-reconciliation-plan entries
                              (case severity
                                (0 :ready) (1 :degraded) (2 :faulted)
                                (otherwise (error 'invariant-violation :reason :inventory-health))))))
