;;; OWNER: il worker possiede destinazione, chiave e prova per l'intero compito.
;;; SHARED: seqlock/tag/arena in lettura; soli byte di calore e scarto conservativo in scrittura.
(in-package #:arcdocdb.cache)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CCH-002 REQ-CCH-004 REQ-AFF-002
(declaim (ftype (function (classe-cache octets index octets (or null octets) index index u8 u32
                                      &optional boolean)
                         null) check-cache-buffers))
(defun check-cache-buffers (class buffer start key proof proof-start proof-end flags size
                          &optional (copy-p t))
  "Pre: selected class, stable worker-private buffer/proof.
Post: copy within destination, no destructive alias; prepared proof present.
INVALID-ARGUMENT before copying; does not yet verify record contents."
  (when (or (eq buffer (classe-cache-arena class))
            (and copy-p (or (eq buffer key) (eq buffer proof))))
    (error 'invalid-argument :reason :cache-buffer-alias))
  (unless (and (<= start (length buffer)) (<= size (- (length buffer) start)))
    (error 'invalid-argument :reason :cache-buffer-range))
  (when proof (check-range proof proof-start proof-end))
  (when (and (logbitp 0 flags) (null proof))
    (error 'invalid-argument :reason :cache-outcome-required))
  nil)

;;; REQ: REQ-CCH-002 REQ-CCH-004 REQ-AFF-002
(declaim (ftype (function (classe-cache cache-slot u32 u32 u32 u32 octets index) boolean)
                copia-posto-cache))
(defun copia-posto-cache (class slot high low offset size destination start)
  "Pre: set slot and destination range already validated; one attempt.
Post: T only after consistent seqlock; NIL requires discarding every possibly copied byte.
Odd/exhausted counter, rejection, or changed tag => miss, never waiting or retry."
  (let* ((sequences (classe-cache-sequences class)) (sequence (aref sequences slot)))
    (declare (type u64 sequence))
    (when (or (>= sequence +cache-sequence-limit+) (oddp sequence))
      (return-from copia-posto-cache nil))
    (sb-thread:barrier (:read))
    (unless (and (zerop (aref (classe-cache-disabled class) slot))
                 (zerop (aref (classe-cache-rejected class) slot))
                 (tag-cache-p class slot high low offset size))
      (return-from copia-posto-cache nil))
    (let ((source-start (* slot (classe-cache-size class))))
      (replace destination (classe-cache-arena class) :start1 start :end1 (+ start size)
               :start2 source-start :end2 (+ source-start size)))
    (sb-thread:barrier (:read))
    (and (= sequence (aref sequences slot))
         (zerop (aref (classe-cache-disabled class) slot))
         (zerop (aref (classe-cache-rejected class) slot)))))

;;; REQ: REQ-CCH-004 REQ-AFF-002
(declaim (ftype (function (classe-cache cache-slot octets index u32 octets u32 u32 u8
                                      integer (or null octets) index index)
                         (values boolean index index &optional)) verifica-copia-cache))
(defun verifica-copia-cache (class slot buffer start size key high low flags version proof ps pe)
  "Pre: stable private copy; expected committed identity and caller's authoritative proof.
Post: T and verified ranges only; corrupt copy => conservative slot rejection and NIL.
Only CORRUPTION-DETECTED becomes a miss; other errors propagate, never disk quarantine."
  (handler-case
      (multiple-value-bind (vs ve)
          (verifica-put-parole buffer start (+ start size) key high low flags
                               :version version :proof-buffer proof :proof-start ps :proof-end pe)
        (values t vs ve))
    (corruption-detected ()
      (setf (aref (classe-cache-rejected class) slot) 1)
      (sb-thread:barrier (:write))
      (values nil 0 0))))

;;; REQ: REQ-CCH-001 REQ-CCH-002 REQ-CCH-004 REQ-AFF-002 REQ-OBS-002
(declaim (ftype (function (cache-serie u32 u32 u32 u32 octets u32 u32 u8 octets index
                                     &key (:version integer) (:proof-buffer (or null octets))
                                     (:proof-start index) (:proof-end index))
                         (values (member :hit :miss :verify-failed) index index &optional))
                cerca-record-cache))
(defun cerca-record-cache (cache segment-high segment-low offset size key csn-high csn-low flags
                          destination start &key (version 2) proof-buffer
                                                (proof-start 0) (proof-end 0))
  "Pre: visible version resolved by index within EBR task; private destination.
Post: HIT and value range only after consistent copy and complete verification; MISS/VERIFY-FAILED: zero ranges.
Negative outcomes may dirty destination: do not consume it. VERIFY-FAILED requires a metric/alarm
and segment reread; other conditions propagate. Already rejected/disabled slots
are skipped within the eight ways; every copy rechecks availability and sequence.
No retry, I/O, or read lock."
  (check-cache-request segment-high segment-low offset size key csn-high csn-low flags version)
  (let ((class (scegli-classe-cache cache size)))
    (unless class (return-from cerca-record-cache (values :miss 0 0)))
    (check-cache-buffers class destination start key proof-buffer proof-start proof-end flags size)
    (let ((base (* +cache-ways+ (insieme-cache class segment-high segment-low offset))))
      (dotimes (way +cache-ways+ (values :miss 0 0))
        (let ((slot (+ base way)))
          (when (and (zerop (aref (classe-cache-disabled class) slot))
                     (zerop (aref (classe-cache-rejected class) slot))
                     (tag-cache-p class slot segment-high segment-low offset size))
            (unless (copia-posto-cache class slot segment-high segment-low offset size destination start)
              (return-from cerca-record-cache (values :miss 0 0)))
            (multiple-value-bind (verified vs ve)
                (verifica-copia-cache class slot destination start size key csn-high csn-low flags
                                      version proof-buffer proof-start proof-end)
              (unless verified (return-from cerca-record-cache (values :verify-failed 0 0)))
              (setf (aref (classe-cache-references class) slot) 1
                    (aref (classe-cache-reread class) slot) 1)
              (return-from cerca-record-cache (values :hit vs ve)))))))))
