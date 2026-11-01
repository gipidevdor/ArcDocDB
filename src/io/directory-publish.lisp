;;; OWNER: exclusive verified stage/parent, publication only after caller's file and directory flushes.
;;; SHARED: same relative no-replacement rename as file publication; no new native ABI.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io file-io string string) null) pubblica-directory-temporanea))
(defun pubblica-directory-temporanea (parent source source-name target-name)
  "Pre: complete verified durable stage, exclusive stable namespace/capabilities, no concurrent close.
Post: previously absent target bound to the same directory FD; source remains owned and locked.
Atomic publication point: exclusive rename. Parent fsync is the caller's durable-success point.
No overwrite, retry, rollback, deletion or implicit flush. Incomplete effect faults the parent;
an uncertain outcome is inspected after restart rather than retried. Rejections before effects do not fault."
  (esigi-aperto parent :directory) (esigi-aperto source :directory)
  (esigi-nome-foglia source-name) (esigi-nome-foglia target-name)
  (verifica-nomi-temporaneo source-name target-name)
  (unless (eq (file-backend parent) (file-backend source))
    (error 'invalid-argument :reason :io-identity-backend))
  (let ((backend (file-backend parent)))
    (if backend
        (when (or (null (backend-rename-exclusive backend)) (null (backend-directory-identity backend))
                  (null (backend-directory-entry-identity backend)))
          (error 'unsupported-format :reason :io-directory-publish-unavailable))
        (esigi-rinomina-esclusiva-nativa)))
  (verifica-directory-distinte parent source)
  (let ((from (map 'simple-base-string #'identity source-name)) (to (map 'simple-base-string #'identity target-name)))
    (verifica-legame-directory parent source from)
    (rinomina-con-nomi-privati parent from to
      (lambda () (verifica-legame-directory parent source to) (esigi-aperto source :directory)) t))
  nil)
