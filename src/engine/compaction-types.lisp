;;; OWNER: private bounded full-prefix maintenance; no key-count-sized heap arrays.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
;;; REQ: REQ-CMP-001 REQ-LIM-003
(defconstant +compaction-signature-bytes+ 512)

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-LIM-003
(defstruct (compaction-plan (:constructor make-compaction-plan (control sources active closed maximum)) (:copier nil))
  (control nil :type c:control-recuperato :read-only t)
  (sources nil :type mf::recovery-sources :read-only t)
  (active nil :type ra:active-recuperato :read-only t)
  (closed #() :type simple-vector :read-only t)
  (maximum 0 :type u64 :read-only t) (minimum-live 0 :type u64)
  (signature (make-array 0 :element-type '(unsigned-byte 8)) :type octets) (signature-ready nil :type boolean)
  (input-bytes 0 :type index) (output-bytes 0 :type index) (records 0 :type index)
  (output-count 0 :type index) (current-end 64 :type index) (current-records 0 :type index)
  (first-id 0 :type u64) (outputs nil :type list)
  (buffer (make-array 0 :element-type '(unsigned-byte 8)) :type octets) (used 0 :type index) (append nil :type (or null io:file-io))
  (reader nil :type (or null io:file-io)) (id 0 :type u64))

;;; REQ: REQ-CMP-001 REQ-IDX-013
(declaim (ftype (function (motore) index) compaction-live-count))
(defun compaction-live-count (engine)
  "Pre: stable serial current index. Post: exact current live key count without key enumeration or copying."
  (if (motore-automatic-index engine) (automatic-index-controller-count (motore-automatic-index engine))
      (let* ((root (p::acquisisci-root (motore-index engine))) (directory (p::root-indice-directory root))
             (position 0) (count 0))
        (loop repeat (length directory) while (< position (length directory)) do
          (let ((fragment (svref directory position)))
            (incf count (p::frammento-indice-live fragment))
            (incf position (ash 1 (- (p::root-indice-depth root) (p::frammento-indice-depth fragment))))))
        count)))

;;; REQ: REQ-CMP-001 REQ-IDX-001 REQ-IDX-013
(declaim (ftype (function (motore octets index index) (member :live :absent :retry-limit)) compaction-probe))
(defun compaction-probe (engine buffer start end)
  "Pre: owner BUSY, stable canonical key span. Post: current descriptor in engine scratch words, no key copy."
  (if (motore-automatic-index engine)
      (probe-automatic-index engine buffer start end (motore-index-context engine) (motore-words engine))
      (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) buffer start end)
        (p:leggi-indice-primario (motore-index engine) buffer start end high low
                               (motore-index-context engine) (motore-words engine)))))

;;; REQ: REQ-CMP-001 REQ-CMP-007
(defstruct (compaction-output (:constructor make-compaction-output (id reader append end records)) (:copier nil))
  (id 0 :type u64 :read-only t) (reader nil :type io:file-io :read-only t)
  (append nil :type io:file-io :read-only t) (end 64 :type index :read-only t)
  (records 0 :type index :read-only t))

;;; REQ: REQ-CMP-001 REQ-LIM-003
(defstruct (compaction-verifier (:constructor make-compaction-verifier (buffer)) (:copier nil))
  (buffer (make-array 0 :element-type '(unsigned-byte 8)) :type octets :read-only t)
  (file nil :type (or null io:file-io)) (segment 0 :type u64) (start 0 :type index) (end 0 :type index))

;;; REQ: REQ-CMP-001 REQ-IDX-013 REQ-AFF-002 REQ-LIM-003
(declaim (ftype (function (motore compaction-plan) u64) compaction-live-floor))
(defun compaction-live-floor (engine plan)
  "Pre: BUSY frozen current index. Post: conservative minimum live CSN, zero disables the shortcut.
Walk only overwrite-heavy history. Empty indexes retain the maximum witness; no key-count-sized storage.
Independent output membership/count verification remains mandatory if any derived index fact is wrong."
  (let* ((live (compaction-live-count engine)) (minimum (compaction-plan-maximum plan)) (count 0)
         (auto (motore-automatic-index engine)) (tree (when auto (automatic-index-controller-disk auto))))
    (when (<= (motore-history-records engine) (* 2 live)) (return-from compaction-live-floor 0))
    (setf (compaction-plan-signature plan)
          (make-array +compaction-signature-bytes+ :element-type '(unsigned-byte 8) :initial-element 0))
    (flet ((observe (words)
             (let ((csn (aref words 0)))
               (unless (<= 1 csn (compaction-plan-maximum plan))
                 (error 'invariant-violation :reason :engine-compaction-floor-csn))
               (let* ((bit (mod csn (* 8 +compaction-signature-bytes+))) (at (ash bit -3))
                      (signature (compaction-plan-signature plan)))
                 (setf (aref signature at) (logior (aref signature at) (ash 1 (logand bit 7)))))
               (incf count) (setf minimum (min minimum csn))) nil))
      (if tree
          (unless (d:visit-disk-index tree
                    (lambda (key start end words) (declare (ignore key start end)) (observe words)))
            (error 'invariant-violation :reason :engine-compaction-floor-cancelled))
          (let* ((root (p::acquisisci-root (motore-index engine))) (directory (p::root-indice-directory root))
                 (position 0) (words (motore-words engine)))
            (loop repeat (length directory) while (< position (length directory)) do
              (let ((fragment (svref directory position)))
                (dotimes (slot (length (p::frammento-indice-controls fragment)))
                  (when (< (aref (p::frammento-indice-controls fragment) slot) 128)
                    (unless (eq :live (arcdocdb.index.slots:leggi-slot-v2 (p::frammento-indice-bank fragment) slot words))
                      (error 'invariant-violation :reason :engine-compaction-floor-slot))
                    (observe words)))
                (incf position (ash 1 (- (p::root-indice-depth root) (p::frammento-indice-depth fragment)))))))))
    (unless (= count live) (error 'invariant-violation :reason :engine-compaction-floor-count))
    (setf (compaction-plan-signature-ready plan) t) minimum))

;;; REQ: REQ-CMP-001 REQ-IDX-013 REQ-AFF-002
(declaim (inline compaction-csn-possible-p))
(declaim (ftype (function (compaction-plan u64) boolean) compaction-csn-possible-p))
(defun compaction-csn-possible-p (plan csn)
  "Pre: frozen verified live-CSN signature or disabled. Post: NIL proves absence; T still needs exact lookup.
Fixed memory, modulo collisions yield false positives only; output coverage remains independent."
  (or (not (compaction-plan-signature-ready plan))
      (let ((bit (mod csn (* 8 +compaction-signature-bytes+))))
        (not (zerop (logand (aref (compaction-plan-signature plan) (ash bit -3))
                           (ash 1 (logand bit 7))))))))
