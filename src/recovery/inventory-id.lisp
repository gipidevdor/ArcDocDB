;;;; Scelta priva di effetti: nessun ID fisico osservato può essere riutilizzato.
;;; OWNER: controller esclusivo possiede manifest/inventario fino alla creazione del temporaneo.
;;; SHARED: piano privato; sole letture, nessun lock o contatore fra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-FOR-003 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (u64 u64 u64 u64) null) verifica-id-segmento-recovery))
(defun verifica-id-segmento-recovery (minimum maximum candidate next)
  "Pre: proposal and u64 frontiers. Post: fresh ID, positive high-water mark, and exact successor.
INVARIANT-VIOLATION for private inconsistency; no mutation or reservation."
  (unless (and (plusp minimum) (>= candidate minimum) (> candidate maximum))
    (error 'invariant-violation :reason :recovery-segment-id-frontier))
  (unless (= next (1+ candidate))
    (error 'invariant-violation :reason :recovery-segment-id-successor))
  nil)

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-FOR-003 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest reconciliation-plan)
                         (values u64 u64 reconciliation-plan &optional)) proponi-id-segmento-da-piano))
(defun proponi-id-segmento-da-piano (manifest plan)
  "Pre: authoritative manifest and its complete canonical plan, sorted and owned by the exclusive caller.
Post: proposal >= high-water mark and beyond names, u64 successor and same plan; no I/O or reservation.
RESOURCE-EXHAUSTED for exhausted IDs; INVARIANT-VIOLATION for an empty plan or inconsistent private frontiers.
Only the two inventory APIs construct the plan; do not reconstruct names from actions."
  (let ((count (numero-azioni-riconciliazione plan)))
    (multiple-value-bind (available minimum) (prossimo-id-segmento manifest)
      (unless available (error 'resource-exhausted :reason :recovery-segment-id-exhausted))
      (unless (plusp count) (error 'invariant-violation :reason :recovery-segment-id-empty-plan))
      (multiple-value-bind (maximum form action state) (azione-riconciliazione plan (1- count))
        (declare (ignore form action state)) ; fatti validati dal planner, nessun esito d'errore.
        (let* ((candidate (max minimum (1+ maximum))) (next (1+ candidate)))
          (unless (typep next 'u64)
            (error 'resource-exhausted :reason :recovery-segment-id-exhausted))
          (verifica-id-segmento-recovery minimum maximum (the u64 candidate) next)
          (values candidate next plan))))))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-FOR-003 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest simple-vector
                          &key (:max-files integer) (:max-segmenti integer))
                         (values u64 u64 reconciliation-plan &optional)) scegli-id-segmento-recovery))
(defun scegli-id-segmento-recovery (manifest files &key (max-files 65536) (max-segmenti 65536))
  "Pre: exclusive recovery, authoritative manifest and complete/stable inventory until the new temporary file.
Post: proposal >= high-water mark and beyond all names, u64 successor and owned plan; no I/O.
Does not reserve IDs, modify the manifest, resolve anomalies, or admit traffic; no durable atomic point.
Planner errors propagated, RESOURCE-EXHAUSTED for exhausted IDs, INVARIANT-VIOLATION for private shape.
Budgets verified by the planner before selection; cold path with allocations, without new locks."
  (proponi-id-segmento-da-piano manifest
    (pianifica-riconciliazione manifest files :max-files max-files :max-segmenti max-segmenti)))
