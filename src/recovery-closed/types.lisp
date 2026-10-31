;;; OWNER: risultato completo del recovery; controller conserva CONTROL e input fino al reclaim.
;;; SHARED: legami immutabili, nessun buffer, array o workspace trattenuto/esportato.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-TXM-007 REQ-AFF-008
(defstruct (closed-recuperato
             (:constructor %make-closed-recuperato
                 (control input id prefix version origin batches records prepared local closure aborted
                  csn-present max-csn))
             (:copier nil))
  "Pre: header from the same FD and CLOSED prefix verified in full, prepared data resolved locally.
Post: owned readonly capability and scalars, no buffer/workspace; full u64 ID including zero.
Does not attest to physical EOF, inventory, catalog authority, or traffic admission."
  (control nil :type control-recuperato :read-only t)
  (input nil :type file-io :read-only t)
  (id 0 :type u64 :read-only t)
  (prefix 0 :type index :read-only t)
  (version 2 :type (member 1 2) :read-only t)
  (origin 1 :type (member 1 2) :read-only t)
  (batches 0 :type index :read-only t)
  (records 0 :type index :read-only t)
  (prepared 0 :type index :read-only t)
  (local 0 :type index :read-only t)
  (closure 0 :type index :read-only t)
  (aborted 0 :type index :read-only t)
  (csn-present nil :type boolean :read-only t)
  (max-csn 0 :type u64 :read-only t))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-STO-006
(declaim (ftype (function (closed-recuperato)
                         (values u64 index (member 1 2) (member 1 2) &optional)) frontiere-closed-recuperato))
(defun frontiere-closed-recuperato (recovered)
  "Pre: complete result. Post: ID, P from manifest, version, and origin; no EOF measurement.
TYPE-ERROR for invalid types; no numeric FD or proof of current health."
  (values (closed-recuperato-id recovered) (closed-recuperato-prefix recovered)
          (closed-recuperato-version recovered) (closed-recuperato-origin recovered)))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (closed-recuperato) (values index index index index index index &optional))
                statistiche-closed-recuperato))
(defun statistiche-closed-recuperato (recovered)
  "Pre: complete result. Post: batches, records excluding SEAL, prepared TXIDs, local commits, commits from EDIT, and aborts.
Compaction: zero batches/prepared/outcomes, PUT+TOMBSTONE records; TYPE-ERROR for invalid types.
Counts concern only the prefix and do not attest to visibility or index reconstruction."
  (values (closed-recuperato-batches recovered) (closed-recuperato-records recovered)
          (closed-recuperato-prepared recovered) (closed-recuperato-local recovered)
          (closed-recuperato-closure recovered) (closed-recuperato-aborted recovered)))
