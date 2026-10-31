;;; OWNER: all result data copied to caller-owned lists/scalars; no file capability returned.
;;; SHARED: report concerns the locked M1 canonical snapshot only, never an admission gate.
(in-package #:arcdocdb.verify)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-010 REQ-AFF-008
(declaim (ftype (function (inspection) list) inspection-extra-files))
(defun inspection-extra-files (inspection)
  "Pre: frozen directory, canonical inventory already checked. Post: all other bounded leaf names reported.
Index derivatives, hints, unknown files and unpublished CONTROL are not silently certified or opened.
No entry deleted; names and total name bytes retain the canonical I/O inventory bounds."
  (let ((extras nil))
    (loop for name across (io:elenca-directory (inspection-directory inspection)) do
      (unless (or (member name '("control.log" "multiserie.log") :test #'string=)
                  (nth-value 1 (mf::parse-inventory-segment-name name)))
        (push name extras)))
    (sort extras #'string<)))

;;; REQ: REQ-AFF-010 REQ-AFF-009 REQ-AFF-008
(declaim (ftype (function (inspection ra:active-recuperato simple-vector) list) inspection-source-report))
(defun inspection-source-report (inspection active closed)
  "Pre: all prefixes verified, same owned sources. Post: one scalar row per live segment, with EOF distinct from P.
Closed suffix bytes are observed but are not interpreted as committed records; no data capability escapes."
  (let ((rows nil) (cursor 0) (sources (inspection-sources inspection)))
    (dotimes (i (mf:numero-fonti-recovery sources))
      (multiple-value-bind (id state form file size) (mf:fonte-recovery sources i)
        (declare (ignore file)) ; borrowed FD is checked by FONTE-RECOVERY, not a success/error flag.
        (let* ((token (if (eq state :active) active (the rc:closed-recuperato (svref closed cursor))))
               (prefix (if (eq state :active) (nth-value 1 (ra:frontiere-active-recuperato active))
                           (nth-value 1 (rc:frontiere-closed-recuperato token)))))
          (unless (<= prefix size) (error 'invariant-violation :reason :verify-source-prefix))
          (push (list :id id :state state :form form :file-bytes size :valid-prefix prefix
                      :suffix-bytes (- size prefix)) rows)
          (unless (eq state :active) (incf cursor)))))
    (unless (= cursor (length closed)) (error 'invariant-violation :reason :verify-source-report-count))
    (nreverse rows)))

;;; REQ: REQ-AFF-010 REQ-REC-004 REQ-AFF-008
(declaim (ftype (function (inspection b:octets) list) inspect-canonical-storage))
(defun inspect-canonical-storage (inspection archive)
  "Pre: exclusive directory lock, private limits and scratch. Post: complete scoped report candidate.
All canonical readers precede approval; tail/pending/unverified files produce ATTENTION, never a clean result.
Only the outer boundary may return it after resource cleanup; no durable effect or runtime bootstrap."
  (let* ((control (inspection-control inspection))
         (decisions (inspection-decisions inspection archive))
         (manifest (c:manifest-control-recuperato control)))
    (inspection-inventory inspection manifest) ; validated READY plan; actions retained, never executed.
    (multiple-value-bind (active closed) (inspection-read-segments inspection control decisions)
      (inspection-record-order inspection active closed)
      (setf (inspection-stage inspection) :report (inspection-file inspection) nil)
      (multiple-value-bind (present maximum)
          (rc:massimo-csn-serie-recuperata active closed :max-segmenti (inspection-segments inspection))
        (unless (<= (inspection-last-csn inspection) maximum)
          (error 'invariant-violation :reason :verify-maximum-csn))
        (let* ((rows (inspection-source-report inspection active closed))
               (extras (inspection-extra-files inspection))
               (control-frontier (multiple-value-list (c:frontiere-control-recuperato control)))
               (decision-frontier (multiple-value-list (da:frontiere-decisioni-recuperate decisions)))
               (tail (+ (- (first control-frontier) (second control-frontier))
                        (- (first decision-frontier) (second decision-frontier))
                        (loop for row in rows sum (getf row :suffix-bytes)))))
          (list :schema-version 1 :kind :m1-storage-verification :profile :m1-canonical
                :status (if (and (zerop tail) (null extras) (null (inspection-actions inspection))) :clean :attention)
                :version (inspection-version inspection) :records (inspection-data-count inspection)
                :max-csn-present present :max-csn maximum :segments rows :control control-frontier
                :decisions decision-frontier :noncanonical-bytes tail :inventory-actions (inspection-actions inspection)
                :unverified-files extras :coverage (list :canonical-headers :crc :sealed-prefixes :manifest :csn-order)
                :limits (list :m1-only :no-catalog :no-derived-indexes :no-hints :no-application-schema
                          :no-repair :no-durability-attestation :not-a-complete-archivio-verifier)))))))
