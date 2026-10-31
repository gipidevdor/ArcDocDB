;;; OWNER: manutenzione prenota prima della rilocazione; pubblica solo dopo rimozione di ogni riferimento.
;;; SHARED: mutex una volta per segmento ritirato; il registro conserva la risorsa senza callback/I/O.
(in-package #:arcdocdb.epochs)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (registro-epoche t) (values ritiro u64 &optional)) prenota-ritiro))
(defun prenota-ritiro (registry resource)
  "Pre: RESOURCE is a canonical non-NIL descriptor, still referenced; no swap already performed.
Post: ticket and original generation, strong reference and slot/E-advance credits.
RESOURCE-EXHAUSTED before mutation for K/u64; INVALID-ARGUMENT for NIL or duplicate."
  (when (null resource) (error 'invalid-argument :reason :retirement-resource-null))
  (sb-thread:with-mutex ((registro-epoche-mutex registry))
    (verifica-contatori-epoche registry)
    (let* ((words (registro-epoche-words registry)) (capacity (length (registro-epoche-states registry)))
           (last (aref words +word-generation+)) (epoch (aref words +word-epoch+)))
      (declare (type u64 last epoch))
      (when (= (registro-epoche-count registry) capacity)
        (error 'resource-exhausted :reason :retirement-capacity))
      (when (or (= last +max-epoca+) (= (registro-epoche-reserved registry) (- +max-epoca+ epoch)))
        (error 'resource-exhausted :reason :retirement-sequence-exhausted))
      (let ((slot (trova-slot-ritiro registry resource)) (generation (1+ last)) (complete nil))
        (declare (type u64 generation))
        (unwind-protect
             (progn
               (setf (aref (registro-epoche-generations registry) slot) generation
                     (aref (registro-epoche-epochs registry) slot) 0
                     (aref (registro-epoche-resources registry) slot) resource
                     (aref (registro-epoche-states registry) slot) +retirement-reserved+
                     (aref words +word-generation+) generation
                     (registro-epoche-cursor registry) (if (= (1+ slot) capacity) 0 (1+ slot)))
               (incf (registro-epoche-count registry))
               (incf (registro-epoche-reserved registry))
               (setf complete t)
               (values (aref (registro-epoche-retirements registry) slot) generation))
          (unless complete (marca-guasto-epoche registry)))))))

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (registro-epoche retirement-slot (unsigned-byte 8)) null) libera-ritiro))
(defun libera-ritiro (registry slot terminal-state)
  "Pre: mutex, state/original identity verified by the caller. Post: resource and credit released.
Only cancellation before swap or completion after reclamation; interruption causes fail-stop."
  (let ((complete nil))
    (unwind-protect
         (progn
           (when (= terminal-state +retirement-cancelled+) (decf (registro-epoche-reserved registry)))
           (setf (aref (registro-epoche-resources registry) slot) nil
                 (aref (registro-epoche-states registry) slot) terminal-state)
           (decf (registro-epoche-count registry))
           (setf complete t))
      (unless complete (marca-guasto-epoche registry))))
  nil)

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (ritiro u64) null) annulla-ritiro))
(defun annulla-ritiro (ticket expected-generation)
  "Pre: no swap/reference removed; original event. Post: free credit, same identity idempotent.
INVALID-ARGUMENT if retirement is already published, reused, or completed with another outcome."
  (let ((registry (ritiro-registry ticket)))
    (sb-thread:with-mutex ((registro-epoche-mutex registry))
      (verifica-contatori-epoche registry)
      (let* ((slot (esigi-identita-ritiro ticket expected-generation))
             (state (aref (registro-epoche-states registry) slot)))
        (cond ((= state +retirement-reserved+) (libera-ritiro registry slot +retirement-cancelled+))
              ((= state +retirement-cancelled+) nil)
              (t (error 'invalid-argument :reason :retirement-cannot-cancel))))))
  nil)

;;; REQ: REQ-CMP-005 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (ritiro u64) null) pubblica-ritiro))
(defun pubblica-ritiro (ticket expected-generation)
  "Pre: every index/retained-version reference removed; resource still readable and ticket reserved.
Post: r=E, E advanced without wrap; reclaim events must retain generation.
Makes nothing durable and deletes no files. Duplicate/reuse: INVALID-ARGUMENT; interruption: FAULTED."
  (let ((registry (ritiro-registry ticket)))
    (sb-thread:with-mutex ((registro-epoche-mutex registry))
      (verifica-contatori-epoche registry)
      (let* ((slot (esigi-identita-ritiro ticket expected-generation)) (words (registro-epoche-words registry))
             (epoch (aref words +word-epoch+)) (complete nil))
        (declare (type u64 epoch))
        (unless (= (aref (registro-epoche-states registry) slot) +retirement-reserved+)
          (error 'invalid-argument :reason :retirement-not-reserved))
        (unless (and (plusp (registro-epoche-reserved registry)) (< epoch +max-epoca+))
          (guasto-epoche registry :retirement-epoch-credit))
        (unwind-protect
             (progn
               ;; Unlink->E: i reader della nuova epoca devono vedere la rimozione dei riferimenti.
               (sb-thread:barrier (:memory))
               (setf (aref (registro-epoche-epochs registry) slot) epoch
                     (aref (registro-epoche-states registry) slot) +retirement-retired+
                     (aref words +word-epoch+) (1+ epoch))
               (sb-thread:barrier (:memory))
               (decf (registro-epoche-reserved registry))
               (setf complete t))
          (unless complete (marca-guasto-epoche registry))))))
  nil)
