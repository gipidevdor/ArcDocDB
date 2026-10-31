;;; OWNER: private bounded full-prefix maintenance; no key-count-sized heap arrays.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-LIM-003
(defstruct (compaction-plan (:constructor make-compaction-plan (control sources active closed maximum)) (:copier nil))
  (control nil :type c:control-recuperato :read-only t)
  (sources nil :type mf::recovery-sources :read-only t)
  (active nil :type ra:active-recuperato :read-only t)
  (closed #() :type simple-vector :read-only t)
  (maximum 0 :type u64 :read-only t)
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
  (file nil :type (or null io:file-io)) (start 0 :type index) (end 0 :type index))
