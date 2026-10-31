;;; OWNER: scheduler avanza la soglia una volta per gruppo; un solo proprietario reclama un ticket.
;;; SHARED: scansione W e controllo ticket sotto mutex; nessun I/O o callback nella sezione.
(in-package #:arcdocdb.epochs)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-005 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (registro-epoche) null) aggiorna-soglia-reclaim))
(defun aggiorna-soglia-reclaim (registry)
  "Pre: maintenance task. Post: monotonic frontier safe for r < threshold.
One W scan serves multiple tickets; no reader blocked and no file deleted."
  (sb-thread:with-mutex ((registro-epoche-mutex registry))
    (verifica-contatori-epoche registry)
    (let* ((words (registro-epoche-words registry)) (epoch (aref words +word-epoch+))
           (minimum epoch) (announcements (registro-epoche-announcements registry)))
      (declare (type u64 epoch minimum))
      (sb-thread:barrier (:memory))
      (dotimes (worker (length (registro-epoche-readers registry)))
        (let ((pin (aref announcements (* (1+ worker) +stride-epoca+))))
          (declare (type u64 pin))
          (when (> pin epoch) (guasto-epoche registry :epoch-reader-future))
          (unless (zerop pin) (setf minimum (min minimum pin)))))
      ;; Un annuncio vecchio non ancora confermato può arrivare tardi; non abbassa una prova già acquisita.
      (sb-thread:barrier (:memory))
      (setf (aref words +word-threshold+) (max (aref words +word-threshold+) minimum))))
  nil)

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (ritiro u64) boolean) acquisisci-reclaim))
(defun acquisisci-reclaim (ticket expected-generation)
  "Pre: retirement published, original event; threshold updated by the maintenance task.
Post: T assigns exclusive reclaim if r<threshold; NIL leaves the ticket waiting.
No W scan per ticket. A second claim is INVALID-ARGUMENT and does not duplicate I/O."
  (let ((registry (ritiro-registry ticket)))
    (sb-thread:with-mutex ((registro-epoche-mutex registry))
      (verifica-contatori-epoche registry)
      (let* ((slot (esigi-identita-ritiro ticket expected-generation))
             (epoch (aref (registro-epoche-epochs registry) slot)))
        (declare (type u64 epoch))
        (unless (= (aref (registro-epoche-states registry) slot) +retirement-retired+)
          (error 'invalid-argument :reason :retirement-not-available))
        (when (zerop epoch) (guasto-epoche registry :retirement-epoch-zero))
        (when (< epoch (aref (registro-epoche-words registry) +word-threshold+))
          (setf (aref (registro-epoche-states registry) slot) +retirement-claimed+)
          t)))))

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (ritiro u64) null) completa-reclaim))
(defun completa-reclaim (ticket expected-generation)
  "Pre: reclaim already acquired, descriptor closed/file removed according to manifest proof.
Post: strong reference and credit released; idempotent for the same completed identity.
INVALID-ARGUMENT for missing claim/reuse; I/O failure retains the claimed ticket and resource."
  (let ((registry (ritiro-registry ticket)))
    (sb-thread:with-mutex ((registro-epoche-mutex registry))
      (verifica-contatori-epoche registry)
      (let* ((slot (esigi-identita-ritiro ticket expected-generation))
             (state (aref (registro-epoche-states registry) slot)))
        (cond ((= state +retirement-claimed+) (libera-ritiro registry slot +retirement-completed+))
              ((= state +retirement-completed+) nil)
              (t (error 'invalid-argument :reason :retirement-not-claimed))))))
  nil)

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (ritiro u64) t) leggi-risorsa-ritiro))
(defun leggi-risorsa-ritiro (ticket expected-generation)
  "Pre: compaction/reclaim owner, original event. Post: strong reference to the descriptor.
INVALID-ARGUMENT after cancellation/completion/reuse; reading does not assign the right to close it."
  (let ((registry (ritiro-registry ticket)))
    (sb-thread:with-mutex ((registro-epoche-mutex registry))
      (verifica-contatori-epoche registry)
      (let ((slot (esigi-identita-ritiro ticket expected-generation)))
        (unless (<= +retirement-reserved+ (aref (registro-epoche-states registry) slot) +retirement-claimed+)
          (error 'invalid-argument :reason :retirement-resource-released))
        (or (aref (registro-epoche-resources registry) slot)
            (guasto-epoche registry :retirement-resource-missing))))))

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (ritiro u64) (values keyword u64 &optional)) leggi-ritiro))
(defun leggi-ritiro (ticket expected-generation)
  "Pre: event with original generation. Post: consistent keyword state and epoch, for observability.
INVALID-ARGUMENT for an old identity; no claim and no resource released."
  (let ((registry (ritiro-registry ticket)))
    (sb-thread:with-mutex ((registro-epoche-mutex registry))
      (verifica-contatori-epoche registry)
      (let* ((slot (esigi-identita-ritiro ticket expected-generation))
             (state (aref (registro-epoche-states registry) slot)))
        (values (cond ((= state +retirement-reserved+) :reserved)
                      ((= state +retirement-retired+) :retired)
                      ((= state +retirement-claimed+) :claimed)
                      ((= state +retirement-cancelled+) :cancelled)
                      ((= state +retirement-completed+) :completed)
                      (t (guasto-epoche registry :retirement-slot-state)))
                (aref (registro-epoche-epochs registry) slot))))))

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (registro-epoche)
                         (values u64 u64 (integer 0 65536) (integer 0 65536) &optional)) leggi-registro-epoche))
(defun leggi-registro-epoche (registry)
  "Pre: healthy registry. Post: consistent E, threshold, occupied and reserved credits under mutex.
The threshold is an acquired conservative proof, not a census of currently live readers."
  (sb-thread:with-mutex ((registro-epoche-mutex registry))
    (verifica-contatori-epoche registry)
    (let ((words (registro-epoche-words registry)))
      (values (aref words +word-epoch+) (aref words +word-threshold+)
              (registro-epoche-count registry) (registro-epoche-reserved registry)))))
