;;; OWNER: slot esclusivo del worker; la sezione non attraversa rete, parcheggio o migrazione.
;;; SHARED: E letto soltanto; un annuncio u64 per worker, nessun RMW o mutex sul percorso riuscito.
(in-package #:arcdocdb.epochs)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-005 REQ-CMP-007
(declaim (inline epoca-attiva-p))
(declaim (ftype (function (lettore-epoca) boolean) epoca-attiva-p))
(defun epoca-attiva-p (reader)
  "Pre: owning worker only, or controller after join; no resource read.
Post: T if its own slot is announced, even after FAULTED. Used for task cleanup.
Does not authorize dereference, entry by other workers, or cancellation of a live reader."
  (not (zerop (aref (registro-epoche-announcements (lettore-epoca-registry reader))
                   (lettore-epoca-offset reader)))))

;;; REQ: REQ-CMP-005 REQ-CMP-007 REQ-AFF-008
(declaim (inline entra-epoca esci-epoca))
(declaim (ftype (function (lettore-epoca) boolean) entra-epoca))
(defun entra-epoca (reader)
  "Pre: exclusive owning worker, no location/root read beforehand; inactive slot.
Post: T permits one section, NIL if E changes during announcement: requeue the task.
One attempt only. Nonlocal exit before admission frees the slot; no internal retry."
  (let* ((registry (lettore-epoca-registry reader)) (offset (lettore-epoca-offset reader))
         (announcements (registro-epoche-announcements registry)) (words (registro-epoche-words registry)))
    (esigi-epoche-sane registry)
    (unless (zerop (aref announcements offset))
      (error 'invalid-argument :reason :epoch-reader-already-active))
    (let ((epoch (sb-thread:barrier (:read) (aref words +word-epoch+))) (admitted nil))
      (declare (type u64 epoch))
      (when (zerop epoch) (guasto-reader-epoca registry :epoch-zero))
      (unwind-protect
           (progn
             (setf (aref announcements offset) epoch)
             ;; Store->load: annuncio visibile PRIMA della conferma e di ogni accesso alla risorsa.
             (sb-thread:barrier (:memory))
             (let ((confirmed (sb-thread:barrier (:read) (aref words +word-epoch+))))
               (declare (type u64 confirmed))
               (when (< confirmed epoch) (guasto-reader-epoca registry :epoch-regression))
               (esigi-epoche-sane registry)
               (setf admitted (= confirmed epoch))))
        (unless admitted
          (sb-thread:barrier (:memory))
          (setf (aref announcements offset) 0)))
      admitted)))

;;; REQ: REQ-CMP-005 REQ-CMP-007
(declaim (ftype (function (lettore-epoca) null) esci-epoca))
(defun esci-epoca (reader)
  "Pre: same admitted worker/task, final access complete. Post: inactive slot.
Cleanup allowed even after FAULTED; INVALID-ARGUMENT for an already inactive slot.
The caller uses UNWIND-PROTECT only after T from ENTRA-EPOCA; no nested sections."
  (let ((announcements (registro-epoche-announcements (lettore-epoca-registry reader)))
        (offset (lettore-epoca-offset reader)))
    (when (zerop (aref announcements offset))
      (error 'invalid-argument :reason :epoch-reader-inactive))
    (sb-thread:barrier (:memory))
    (setf (aref announcements offset) 0))
  nil)
