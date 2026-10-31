;;; OWNER: costruttore, due array OUTCOME e istogramma privati dopo preflight del budget.
;;; SHARED: nessuno; lookup su parole u32, nessun boxing u64 necessario.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-004 REQ-AFF-008
(declaim (inline cifra-prova-resolver))
(declaim (ftype (function (resolver-words index (integer 0 7)) u8) cifra-prova-resolver))
(defun cifra-prova-resolver (proofs base digit)
  "Pre: complete entry and DIGIT 0..7. Post: TXID LSD octet without a u64 integer.
Safety 3 array checks always active; no modification or explicit allocation."
  (ldb (byte 8 (* 8 (mod digit 4)))
       (aref proofs (+ base (if (< digit 4) +proof-txid-low+ +proof-txid-high+)))))

;;; REQ: REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (resolver-words resolver-words resolver-words u32 (integer 0 7)) null)
                passata-prove-resolver))
(defun passata-prove-resolver (source target histogram count digit)
  "Pre: distinct arrays of COUNT entries, 256 counters. Post: stable LSD distribution.
INVARIANT-VIOLATION for inconsistent sizes, prefixes, or consumption; loops COUNT and 256.
No allocation during the pass, no source modification."
  (unless (and (= (length source) (* count +proof-words+))
               (= (length source) (length target)) (not (eq source target))
               (= (length histogram) +radix-buckets+))
    (error 'invariant-violation :reason :resolver-radix-shape))
  (fill histogram 0)
  (dotimes (i count)
    (incf (aref histogram (cifra-prova-resolver source (* i +proof-words+) digit))))
  (let ((start 0))
    (declare (type u32 start))
    (dotimes (bucket +radix-buckets+)
      (let ((frequency (aref histogram bucket)))
        (setf (aref histogram bucket) start) (incf start frequency)))
    (unless (= start count) (error 'invariant-violation :reason :resolver-radix-count)))
  (dotimes (i count)
    (let* ((base (* i +proof-words+)) (bucket (cifra-prova-resolver source base digit))
           (position (aref histogram bucket)))
      (unless (< position count) (error 'invariant-violation :reason :resolver-radix-position))
      (dotimes (word +proof-words+)
        (setf (aref target (+ (* position +proof-words+) word)) (aref source (+ base word))))
      (incf (aref histogram bucket))))
  (let ((previous 0))
    (declare (type u32 previous))
    (dotimes (bucket +radix-buckets+)
      (unless (<= previous (aref histogram bucket) count)
        (error 'invariant-violation :reason :resolver-radix-consumption))
      (setf previous (aref histogram bucket)))
    (unless (= previous count) (error 'invariant-violation :reason :resolver-radix-consumption)))
  nil)

;;; REQ: REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (resolver-words) null) verifica-ordine-prove-resolver))
(defun verifica-ordine-prove-resolver (proofs)
  "Pre: array sorted by TXID, stable physical offsets for duplicates. Post: consistent order and duplicates.
Different CSNs for the same TXID are CORRUPTION-DETECTED; equal ones allowed without coalescing.
INVARIANT-VIOLATION for order/offset; loop over verified cardinality."
  (unless (zerop (mod (length proofs) +proof-words+))
    (error 'invariant-violation :reason :resolver-proof-shape))
  (loop for base from +proof-words+ below (length proofs) by +proof-words+
        for prior = (- base +proof-words+)
        for high = (aref proofs (+ base +proof-txid-high+))
        for old-high = (aref proofs (+ prior +proof-txid-high+))
        for low = (aref proofs (+ base +proof-txid-low+))
        for old-low = (aref proofs (+ prior +proof-txid-low+))
        do (unless (or (< old-high high) (and (= old-high high) (<= old-low low)))
             (error 'invariant-violation :reason :resolver-proof-order))
           (when (and (= high old-high) (= low old-low))
             (unless (and (= (aref proofs (+ base +proof-csn-low+))
                             (aref proofs (+ prior +proof-csn-low+)))
                          (= (aref proofs (+ base +proof-csn-high+))
                             (aref proofs (+ prior +proof-csn-high+))))
               (error 'corruption-detected :reason :resolver-conflicting-outcome
                      :offset (aref proofs (+ base +proof-offset+))))
             (unless (< (aref proofs (+ prior +proof-offset+)) (aref proofs (+ base +proof-offset+)))
               (error 'invariant-violation :reason :resolver-proof-physical-order))))
  nil)

;;; REQ: REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (resolver-words) resolver-words) ordina-prove-resolver))
(defun ordina-prove-resolver (proofs)
  "Pre: verified private proofs, budget for two arrays and histogram already authorized.
Post: array stably sorted after eight bounded passes; zero/one proof without scratch.
Propagates invariants/corruption; cold path with bounded explicit allocations."
  (unless (zerop (mod (length proofs) +proof-words+))
    (error 'invariant-violation :reason :resolver-proof-shape))
  (when (<= (length proofs) +proof-words+)
    (verifica-ordine-prove-resolver proofs) (return-from ordina-prove-resolver proofs))
  (let ((source proofs) (target (make-array (length proofs) :element-type '(unsigned-byte 32)))
        (histogram (make-array +radix-buckets+ :element-type '(unsigned-byte 32) :initial-element 0))
        (count (floor (length proofs) +proof-words+)))
    (dotimes (digit 8)
      (passata-prove-resolver source target histogram count digit) (rotatef source target))
    (verifica-ordine-prove-resolver source)
    source))

;;; REQ: REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (resolver-words u32 u32) (values boolean index &optional)) trova-prova-resolver))
(defun trova-prova-resolver (proofs high low)
  "Pre: sorted immutable proofs; TXID as two u32s. Post: first equal entry or NIL/0.
At most 33 steps over u32 cardinality; no I/O, lock, write, or u64 boxing.
INVARIANT-VIOLATION for shape or bound; offset/CSN are not yet a read proof."
  (unless (zerop (mod (length proofs) +proof-words+))
    (error 'invariant-violation :reason :resolver-proof-shape))
  (let ((left 0) (right (floor (length proofs) +proof-words+)))
    (declare (type u32 left right))
    (loop repeat +binary-attempts+
          do (when (= left right)
               (let ((base (* left +proof-words+)))
                 (if (and (< base (length proofs))
                          (= high (aref proofs (+ base +proof-txid-high+)))
                          (= low (aref proofs (+ base +proof-txid-low+))))
                     (return-from trova-prova-resolver (values t base))
                     (return-from trova-prova-resolver (values nil 0)))))
             (let* ((middle (+ left (floor (- right left) 2))) (base (* middle +proof-words+))
                    (mh (aref proofs (+ base +proof-txid-high+)))
                    (ml (aref proofs (+ base +proof-txid-low+))))
               (if (or (< mh high) (and (= mh high) (< ml low)))
                   (setf left (1+ middle)) (setf right middle))))
    (error 'invariant-violation :reason :resolver-proof-search-bound)))
