;;; OWNER: serial actor; bounded projection of membership/counts without modifying the primary index.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-WAL-006
(declaim (ftype (function (simple-vector index index) boolean) group-same-key-p))
(defun group-same-key-p (operations left right)
  "Pre: validated immutable descriptors, indices within count<=8. Post: exact key equality, no digest assumption."
  (equalp (operazione-scrittura-key (svref operations left)) (operazione-scrittura-key (svref operations right))))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-WAL-006
(declaim (ftype (function (motore simple-vector index) null) group-project-primary))
(defun group-project-primary (engine operations count)
  "Pre: healthy current resident root, stable inputs, sole owner. Post: exact membership before each operation.
Latest earlier equal key overrides initial membership; slots/fragments belong to the unchanged current root.
Only fixed workspace changes; canonical writer probes retain integrity/fail-stop checks."
  (let* ((primary (motore-index engine)) (work (motore-write-workspace engine)))
    (dotimes (i count)
      (let* ((operation (the operazione-scrittura (svref operations i))) (key (operazione-scrittura-key operation)))
        (multiple-value-bind (high low) (p:digest-chiave-indice primary key 0 (length key))
          (let ((fragment (p:frammento-corrente-indice primary high)))
            (p::esigi-frammento-writer primary fragment high)
            (multiple-value-bind (slot found) (p::sonda-writer fragment key 0 (length key) low (motore-words engine))
              (setf (svref (write-group-workspace-fragments work) i) fragment
                    (aref (write-group-workspace-slots work) i) (if found slot -1)
                    (aref (write-group-workspace-present work) i) (if found 1 0))
              (dotimes (j i)
                (when (group-same-key-p operations i j)
                  (setf (aref (write-group-workspace-present work) i)
                        (if (= 1 (operazione-scrittura-kind (svref operations j))) 1 0))))))))))
  nil)

;;; REQ: REQ-IDX-005 REQ-LIM-003 REQ-WAL-006
(declaim (ftype (function (write-group-workspace simple-vector index p:frammento-indice)
                         (values index index index &optional)) group-fragment-demand))
(defun group-fragment-demand (work operations count fragment)
  "Pre: exact projected membership and unchanged root. Post: maximum live count, extra arena and mutations.
DELETE releases no arena; repeated PUT reuses an existing key until a DELETE makes a subsequent PUT new."
  (let ((live (p::frammento-indice-live fragment)) (peak (p::frammento-indice-live fragment)) (bytes 0) (changes 0))
    (dotimes (i count)
      (when (eq fragment (svref (write-group-workspace-fragments work) i))
        (let* ((op (the operazione-scrittura (svref operations i)))
               (present (plusp (aref (write-group-workspace-present work) i))))
          (case (operazione-scrittura-kind op)
            (1 (incf changes) (unless present (incf live) (incf bytes (length (operazione-scrittura-key op)))))
            (2 (when present (incf changes) (decf live)))
            (otherwise (error 'invariant-violation :reason :engine-group-kind)))
          (setf peak (max peak live)))))
    (values peak bytes changes)))

;;; REQ: REQ-IDX-003 REQ-IDX-005 REQ-AFF-008 REQ-WAL-006
(declaim (ftype (function (p:indice-primario p:frammento-indice octets index) null) group-check-free-credits))
(defun group-check-free-credits (primary fragment key count)
  "Pre: root/fragment stable, at most COUNT<=8 pending mutations. Post: credit for every possible new slot.
Visit whole probe groups until COUNT initial EMPTY/DELETED slots have been checked, or all C slots.
Earlier deletions can add slots only from initial exact-key probes checked separately. At most C slots;
extra candidates in the last group cover the writer's preference for DELETED over EMPTY. No reservation."
  (multiple-value-bind (high low) (p:digest-chiave-indice primary key 0 (length key))
    (p::esigi-frammento-writer primary fragment high)
    (let* ((bank (p::frammento-indice-bank fragment)) (capacity (arcdocdb.index.slots::banco-slot-capacity bank))
           (controls (p::frammento-indice-controls fragment)) (base (p::inizio-gruppo low capacity)) (free 0))
      (dotimes (group (ash capacity -4))
        (dotimes (i p::+group-size+)
          (let* ((slot (+ base i)) (control (aref controls slot)))
            (unless (p::controllo-valido-p control) (p::guasto-indice primary :primary-control-corrupt))
            (when (>= control 128)
              (incf free)
              (when (< (arcdocdb.index.slots:credito-scrittura-slot bank slot) count)
                (error 'resource-exhausted :reason :primary-slot-rebuild-required)))))
        (when (>= free count) (return))
        (setf base (logand (+ base p::+group-size+) (1- capacity))))))
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-IDX-007 REQ-WAL-006
(declaim (ftype (function (motore simple-vector index index) null) group-check-primary-row))
(defun group-check-primary-row (engine operations count i)
  "Pre: exact projection, sole writer, no index mutation since projection. Post: cumulative fragment and slot budgets.
Raises the canonical capacity reason before CSN; applies no hypothetical payload or live index change."
  (let* ((work (motore-write-workspace engine)) (primary (motore-index engine))
         (fragment (the p:frammento-indice (svref (write-group-workspace-fragments work) i)))
         (op (the operazione-scrittura (svref operations i))) (slot (aref (write-group-workspace-slots work) i))
         (bank (p::frammento-indice-bank fragment)))
    (multiple-value-bind (peak bytes changes) (group-fragment-demand work operations count fragment)
      (when (> peak (* 7 (ash (arcdocdb.index.slots::banco-slot-capacity bank) -3)))
        (error 'resource-exhausted :reason :primary-fragment-load))
      (when (> (+ bytes (p::frammento-indice-used fragment)) (length (p::frammento-indice-arena fragment)))
        (error 'resource-exhausted :reason :primary-key-arena-full))
      (when (plusp changes)
        (when (>= slot 0)
          (when (< (arcdocdb.index.slots:credito-scrittura-slot bank slot) count)
            (error 'resource-exhausted :reason :primary-slot-rebuild-required)))
        (when (and (= 1 (operazione-scrittura-kind op)) (zerop (aref (write-group-workspace-present work) i)))
          (group-check-free-credits primary fragment (operazione-scrittura-key op) count)))))
  nil)

;;; REQ: REQ-IDX-005 REQ-IDX-007 REQ-WAL-006
(declaim (ftype (function (motore simple-vector index) null) group-check-primary))
(defun group-check-primary (engine operations count)
  "Pre: stable resident root and fixed workspace. Post: cumulative capacity and revision headroom before CSN.
Revision demand counts PUTs and present DELETEs; no bank, key arena, directory or revision is changed."
  (group-project-primary engine operations count)
  (let ((changes 0) (work (motore-write-workspace engine)))
    (dotimes (i count)
      (when (or (= 1 (operazione-scrittura-kind (svref operations i)))
                (plusp (aref (write-group-workspace-present work) i))) (incf changes)))
    (when (and (plusp changes) (> (+ changes (p::indice-primario-revision (motore-index engine))) (1- p::+revision-limit+)))
      (error 'resource-exhausted :reason :primary-index-revision-exhausted)))
  (dotimes (i count) (group-check-primary-row engine operations count i))
  nil)
