;;; OWNER: one frozen read-only source set; canonical decoders retain all format decisions.
;;; SHARED: only inspection-local registry identities; no operational CSN or writer.
(in-package #:arcdocdb.verify)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-010 REQ-REC-004 REQ-AFF-008
(declaim (ftype (function (inspection) c:control-recuperato) inspection-control))
(defun inspection-control (inspection)
  "Pre: locked directory. Post: canonical CONTROL prefix, CRCs and manifest verified; no effects.
Reader budgets and typed errors propagate to the inspection boundary, including unclassifiable damage."
  (setf (inspection-stage inspection) :control)
  (multiple-value-bind (file size) (inspection-input inspection "control.log")
    (let ((control (c:leggi-control-recuperato (inspection-view inspection) file size
                     (inspection-scratch inspection) :max-bytes (inspection-bytes inspection)
                     :max-segmenti (* 2 (inspection-segments inspection)))))
      (setf (inspection-version inspection) (nth-value 3 (c:frontiere-control-recuperato control)))
      (when (> (1+ (mf:numero-segmenti-chiusi (c:manifest-control-recuperato control)))
               (inspection-segments inspection))
        (error 'resource-exhausted :reason :verify-segment-budget))
      control)))

;;; REQ: REQ-AFF-010 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (inspection b:octets) da:decisioni-recuperate) inspection-decisions))
(defun inspection-decisions (inspection identity)
  "Pre: complete CONTROL, explicit Archivio UUID. Post: complete canonical empty decision table for M1.
Full multiseries transactions or mixed log formats are UNSUPPORTED-FORMAT, never silently approved."
  (setf (inspection-stage inspection) :decisions)
  (multiple-value-bind (file size) (inspection-input inspection "multiserie.log")
    (let* ((scope (g::vista-get-serie-scope (inspection-view inspection)))
           (archive (da:crea-archivio-recovery scope identity))
           (decisions (da:leggi-decisioni-recuperate archive file size (inspection-scratch inspection)
                        :max-bytes (inspection-bytes inspection) :max-batches (inspection-records inspection)
                        :max-batch-records (inspection-records inspection)
                        :max-batch-bytes (inspection-bytes inspection))))
      (unless (and (zerop (da:numero-decisioni-recuperate decisions))
                   (= (inspection-version inspection)
                      (nth-value 3 (da:frontiere-decisioni-recuperate decisions))))
        (error 'unsupported-format :reason :verify-decisions-outside-m1))
      decisions)))

;;; REQ: REQ-AFF-010 REQ-AFF-018 REQ-AFF-008
(declaim (ftype (function (inspection mf::manifest) mf::reconciliation-plan) inspection-inventory))
(defun inspection-inventory (inspection manifest)
  "Pre: immutable manifest and locked namespace. Post: complete inventory, including pending actions.
Missing/conflicting/anomalous final files reject verification before opening segments; no action is executed."
  (setf (inspection-stage inspection) :inventory (inspection-file inspection) nil)
  (let ((plan (mf:pianifica-riconciliazione-directory manifest (inspection-directory inspection)
                :max-segmenti (* 2 (inspection-segments inspection))
                :max-files (+ 16 (* 4 (inspection-segments inspection))))))
    (dotimes (i (mf:numero-azioni-riconciliazione plan))
      (multiple-value-bind (id form action state) (mf:azione-riconciliazione plan i)
        (unless (eq action :use)
          (push (list :id id :form form :action action :state state) (inspection-actions inspection)))))
    (setf (inspection-actions inspection) (nreverse (inspection-actions inspection)))
    ;; READY attests required-name availability only; an unknown final file is still an anomaly.
    (unless (and (eq :ready (mf:stato-riconciliazione plan))
                 (notany (lambda (row) (member (getf row :action) '(:anomaly :missing :conflict)))
                         (inspection-actions inspection)))
      (error 'corruption-detected :reason :verify-inventory-not-ready))
    plan))

;;; REQ: REQ-AFF-010 REQ-REC-004 REQ-AFF-008
(declaim (ftype (function (inspection c:control-recuperato da:decisioni-recuperate)
                         (values ra:active-recuperato simple-vector &optional)) inspection-read-segments))
(defun inspection-read-segments (inspection control decisions)
  "Pre: READY inventory, frozen canonical sources. Post: all live segment prefixes and M1 semantics verified.
Owned sources registered before decoding; byte/record limits propagate without partial approval."
  (setf (inspection-stage inspection) :segments)
  (let ((sources (mf:apri-fonti-recovery (c:manifest-control-recuperato control)
                   (inspection-directory inspection) :max-segmenti (* 2 (inspection-segments inspection))
                   :max-files (+ 16 (* 4 (inspection-segments inspection)))
                   :max-file-bytes (inspection-bytes inspection) :max-transfer (inspection-bytes inspection)
                   :max-total-file-bytes (* (inspection-segments inspection) (inspection-bytes inspection)))))
    (setf (inspection-sources inspection) sources)
    (rs:leggi-serie-recuperata control sources decisions (inspection-scratch inspection)
      (inspection-limits inspection)
      :before-source (lambda (id state form)
                       (declare (ignore state)) ; diagnostic identity only, canonical reader enforces the state.
                       (setf (inspection-file inspection) (mf::nome-fonte-recovery id form))
                       nil))))
