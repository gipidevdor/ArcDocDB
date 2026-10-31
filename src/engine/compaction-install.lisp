;;; OWNER: durable decision before relocation/reclamation; no reader admitted during installation.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-AFF-018
(declaim (ftype (function (compaction-plan) (values (simple-array (unsigned-byte 64) (*))
                                                  (simple-array (unsigned-byte 64) (*)) &optional)) compaction-output-vectors))
(defun compaction-output-vectors (plan)
  "Pre: verified output list. Post: bounded metadata vectors, not proportional to live keys."
  (let* ((count (length (compaction-plan-outputs plan)))
         (ids (make-array count :element-type '(unsigned-byte 64))) (ends (make-array count :element-type '(unsigned-byte 64))))
    (loop for output in (compaction-plan-outputs plan) for n from 0 do
      (setf (aref ids n) (compaction-output-id output) (aref ends n) (compaction-output-end output)))
    (values ids ends)))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-MVC-006 REQ-AFF-001
(declaim (ftype (function (motore compaction-plan dar:decisioni-recuperate ac:insieme-serie-recovery) null) compaction-install))
(defun compaction-install (engine plan decisions set)
  "Pre: all outputs independently verified, old sources stable and no reserved data CSN. Post: complete replacement and reclaim.
Canonical decision precedes location publication; all failures/nonlocal exits require fail-stop and normal recovery."
  (let* ((id (+ (compaction-plan-first-id plan) (compaction-plan-output-count plan)))
         (active (prepara-active-motore engine id)))
    (multiple-value-bind (ids ends) (compaction-output-vectors plan)
      (compaction-publish-control engine (compaction-plan-control plan) active ids ends
                                 (compaction-retired-ids engine (compaction-plan-control plan)) :replace))
    (dolist (output (compaction-plan-outputs plan))
      (io:stabilizza-nome-temporaneo (motore-directory engine) (compaction-output-reader output)
        (nome-segmento-motore (compaction-output-id output) :temporary) (nome-segmento-motore (compaction-output-id output) :final)))
    (compaction-retire-source-sets engine)
    (multiple-value-bind (current sources recovered closed csns) (recupera-fonti-motore engine decisions set)
      (verifica-ordine-fonti-motore engine current sources decisions closed)
      (verifica-csn-rotazione-motore engine csns)
      (rs:stabilizza-nomi-serie-recuperata (motore-directory engine) sources recovered closed :max-segmenti (motore-max-segments engine))
      (osserva-motore engine :compaction-canonical-ready)
      (compaction-relocate-index engine plan)
      (adotta-fonti-rotazione-motore engine current closed)
      (s:rilascia-controllore-serie (motore-controller engine) (motore-lease engine))
      (setf (motore-lease engine) nil)
      (adotta-active-motore engine (motore-runtime engine) active)
      (ritira-risorse-rotazione-motore engine sources)
      (osserva-motore engine :compaction-relocated)
      (let ((control (leggi-control-motore engine)))
        (compaction-reclaim-removed engine control)
        (compaction-prune-removed engine active control))
      (ritira-risorse-rotazione-motore engine sources))) nil)
