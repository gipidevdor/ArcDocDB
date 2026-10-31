;;; OWNER: span e seme esplicito del chiamante, immutati fino al ritorno.
;;; SHARED: nessuno stato; calcolo indipendente tra Serie e worker.
(in-package #:arcdocdb.hash64)
(declaim (optimize (safety 3) (speed 3) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t t) (values u32 u32 &optional)) xxh64))
(defun xxh64 (buffer start end seed-high seed-low)
  "Pre: simple u8 vector, half-open span of 0..65535 bytes, seed in two u32s.
Post: exactly two u32 HIGH/LOW words of XXH64 digest, no modification or shared state.
INVALID-ARGUMENT: types (:hash-arguments), span (:buffer-range), length (:hash-span-limit).
Seed and its management belong to Serie; no implicit randomness.
Noncryptographic function: key equality always requires bytewise comparison."
  (unless (and (typep buffer 'octets) (typep start 'index) (typep end 'index)
               (typep seed-high 'u32) (typep seed-low 'u32))
    (error 'invalid-argument :reason :hash-arguments))
  (check-range buffer start end)
  (when (> (- end start) +max-key-bytes+)
    (error 'invalid-argument :reason :hash-span-limit))
  (let* ((size (the hash-length (- end start)))
         (seed (logior (ash seed-high 32) seed-low))
         (tail-start (+ start (logand size -32)))
         (accumulator (if (< size 32)
                          (logand +mask64+ (+ seed +prime5+))
                          (hash-blocks buffer start size seed))))
    (declare (type u64 seed accumulator) (type index tail-start))
    (setf accumulator (hash-tail buffer tail-start end (logand +mask64+ (+ accumulator size)))
          accumulator (avalanche64 accumulator))
    (values (ldb (byte 32 32) accumulator) (ldb (byte 32 0) accumulator))))
