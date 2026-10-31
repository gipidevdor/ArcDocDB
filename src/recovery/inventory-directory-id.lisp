;;; OWNER: controller esclusivo mantiene manifest e namespace stabili fino al nuovo temporaneo.
;;; SHARED: directory prestata, piano posseduto; nessun nuovo lock o contatore fra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-FOR-003 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest arcdocdb.io:file-io
                          &key (:max-files integer) (:max-segmenti integer) (:max-names t)
                               (:max-total-name-bytes t) (:max-name-bytes t))
                         (values u64 u64 reconciliation-plan &optional))
                scegli-id-segmento-recovery-directory))
(defun scegli-id-segmento-recovery-directory
    (manifest directory &key (max-files 65536) (max-segmenti 65536) (max-names 65536)
                            (max-total-name-bytes 16777216) (max-name-bytes 255))
  "Pre: exclusive recovery, authoritative manifest and borrowed open directory, complete stable namespace.
Post: three owned values: fresh ID, u64 successor, canonical plan; one attested enumeration only.
Budgets, names, identity, and lifetime verified by the planner before selection with common postconditions.
Original conditions propagate, RESOURCE-EXHAUSTED if no u64 successor; no partial outcome.
No segment opening, mutation, reservation, or admission; :READY concerns names only.
Opening allocations, no new shared state; durable point remains the protocol's EDIT."
  (let ((plan (pianifica-riconciliazione-directory
                manifest directory :max-files max-files :max-segmenti max-segmenti
                :max-names max-names :max-total-name-bytes max-total-name-bytes
                :max-name-bytes max-name-bytes)))
    (proponi-id-segmento-da-piano manifest plan)))
