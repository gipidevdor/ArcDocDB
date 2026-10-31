;;; OWNER: serial M1 actor; callbacks receive only borrowed immutable key spans.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-IDX-007
(declaim (ftype (function (motore p:indice-primario function) index) visit-automatic-resident))
(defun visit-automatic-resident (engine primary visitor)
  "Pre: healthy stable flat root, serial maintenance. Post: every live key visited exactly once.
No global enumeration, copied key or sort array; callback borrows arena and five scratch words."
  (let* ((root (p::acquisisci-root primary)) (directory (p::root-indice-directory root)) (position 0) (count 0)
         (words (motore-words engine)))
    (loop repeat (length directory) while (< position (length directory)) do
      (let ((fragment (svref directory position)))
        (dotimes (slot (p::indice-primario-capacity primary))
          (when (< (aref (p::frammento-indice-controls fragment) slot) 128)
            (unless (eq :live (arcdocdb.index.slots:leggi-slot-v2 (p::frammento-indice-bank fragment) slot words))
              (error 'invariant-violation :reason :engine-auto-slot))
            (let* ((start (ldb (byte 32 0) (aref words 2))) (end (+ start (ldb (byte 16 32) (aref words 2)))))
              (unless (<= 0 start end (length (p::frammento-indice-arena fragment)))
                (error 'invariant-violation :reason :engine-auto-key-span))
              (funcall visitor (p::frammento-indice-arena fragment) start end words)
              (incf count))))
        (incf position (ash 1 (- (p::root-indice-depth root) (p::frammento-indice-depth fragment))))))
    count))

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (motore) null) page-automatic-index))
(defun page-automatic-index (engine)
  "Pre: resident root plus destination fixed cache reserved, no document commit in progress.
Post: complete verified paged root and no resident root retained by engine or GET view."
  (reserve-automatic-transition engine)
  (let* ((auto (motore-automatic-index engine)) (old (motore-index engine))
         (revision (p::indice-primario-revision old)) (new nil) (published nil))
    (unwind-protect
         (progn (setf new (make-automatic-disk engine))
           (osserva-motore engine :auto-page-created)
           (let ((count (visit-automatic-resident engine old
                  (lambda (key start end words)
                    (d:apply-disk-index new 1 key start end (aref words 0) (aref words 1) (aref words 3))))))
             (d:verify-disk-index new)
             (verify-automatic-resident-copy engine old new)
             (unless (and (= count (automatic-index-controller-count auto)) (= count (d:disk-index-count new))
                          (= (automatic-index-controller-key-bytes auto) (d:disk-index-key-bytes new))
                          (= revision (p::indice-primario-revision old)) (eq old (motore-index engine)))
               (error 'invariant-violation :reason :engine-auto-migration-source)))
           (osserva-motore engine :auto-page-verified)
           (require-automatic-admission engine)
           (unless (and (eq old (motore-index engine)) (= revision (p::indice-primario-revision old)))
             (error 'invariant-violation :reason :engine-auto-migration-source))
           (setf (automatic-index-controller-disk auto) new (motore-index engine) nil
                 (automatic-index-controller-resident-charge auto) 0 published t
                 (automatic-index-controller-return-cost auto) (+ (* 96 (automatic-index-controller-count auto)) (automatic-index-controller-key-bytes auto)))
           (incf (automatic-index-controller-transitions auto))
           (osserva-motore engine :auto-page-published))
      (when (and new (not published))
        (tenta-cleanup-motore engine (lambda () (retire-automatic-disk engine new))))))
  nil)

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (motore &optional boolean) null) return-automatic-resident))
(defun return-automatic-resident (engine &optional force)
  "Pre: idle paged root within serial admission. Post: verified resident candidate below the 75% low-water.
Normal candidate quota refusal cancels without publication or faulting the disk source."
  (let* ((auto (motore-automatic-index engine)) (tree (automatic-index-controller-disk auto))
         (cost (+ (* 96 (automatic-index-controller-count auto)) (automatic-index-controller-key-bytes auto)))
         (available (- (automatic-index-controller-budget auto) (automatic-index-controller-fixed auto))))
    (when (automatic-return-allowed-p auto cost available force)
      (reserve-automatic-transition engine)
      (let ((source-root (d:disk-index-root tree)) (source-frontier (d:disk-index-frontier tree))
            (candidate nil))
        (setf (automatic-index-controller-return-cost auto) cost)
        (handler-case (setf candidate (make-automatic-resident auto))
          (resource-exhausted () (return-from return-automatic-resident nil)))
        (osserva-motore engine :auto-resident-created)
        (when (and (build-automatic-resident engine candidate tree)
                   (<= (* 4 (automatic-resident-charge candidate)) (* 3 available)))
          (verify-automatic-resident-copy engine candidate tree)
          (osserva-motore engine :auto-resident-verified)
          (require-automatic-admission engine)
          (unless (and (eq tree (automatic-index-controller-disk auto))
                       (= source-root (d:disk-index-root tree)) (= source-frontier (d:disk-index-frontier tree)))
            (error 'invariant-violation :reason :engine-auto-return-source))
          (let ((charge (automatic-resident-charge candidate)))
            (setf (motore-index engine) candidate (automatic-index-controller-disk auto) nil
                  (automatic-index-controller-resident-charge auto) charge))
          (incf (automatic-index-controller-transitions auto))
          (finish-automatic-retirement engine tree :auto-resident-published)))))
  nil)

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (automatic-index-controller index index boolean) boolean) automatic-return-allowed-p))
(defun automatic-return-allowed-p (auto cost available force)
  "Pre: finite charged scalars. Post: hysteresis decision on variable resident work after fixed reservations.
A failed attempt is retried only after meaningful shrink or a grant change."
  (let ((estimate (+ 8200 (* 41 (automatic-index-controller-capacity auto))
                     (automatic-index-controller-arena auto) (* 2 cost))))
    (and (not (null (automatic-index-controller-disk auto)))
         (or force (<= (* cost 4) (* 3 (automatic-index-controller-return-cost auto))))
         (<= (* 4 estimate) (* 3 available)))))

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (motore p:indice-primario d:disk-index) boolean) build-automatic-resident))
(defun build-automatic-resident (engine candidate tree)
  "Pre: private empty flat candidate, stable disk root. Post: complete verified traversal or explicit normal cancellation.
Only expected quota/capacity refusal returns NIL; all other failures reach the engine boundary."
  (d:visit-disk-index tree
    (lambda (key start end words)
      (if (prepare-automatic-resident engine candidate 1 key start end)
          (progn (apply-automatic-resident engine candidate 1 key start end
                   (aref words 0) (aref words 1) (aref words 3)) nil)
          :stop))))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (motore p:indice-primario d:disk-index) null) verify-automatic-resident-copy))
(defun verify-automatic-resident-copy (engine primary tree)
  "Pre: stable source and structurally verified destination. Post: every key/normalized descriptor matches.
Arena offsets are local to the source; only CSN/location/length and live key length are compared."
  (unless (= (d:disk-index-count tree)
             (visit-automatic-resident engine primary
               (lambda (key start end words)
                 (let ((output (d::disk-index-words tree)))
                   (unless (and (eq :live (d:lookup-disk-index tree key start end output))
                                (= (aref words 0) (aref output 0)) (= (aref words 1) (aref output 1))
                                (= (aref words 3) (aref output 3))
                                (= (- end start) (ldb (byte 16 32) (aref output 2))))
                     (error 'invariant-violation :reason :engine-auto-copy-mismatch))))))
    (error 'invariant-violation :reason :engine-auto-copy-count))
  nil)
