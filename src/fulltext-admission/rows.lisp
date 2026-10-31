;;; OWNER: writer sotto lease; directory privata, non condivisa con reader o altre Serie.
;;; SHARED: nessuno stato tra Serie; entry trasferite mai rimosse da questa API.
(in-package #:arcdocdb.fulltext.admission)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-SEC-010
(declaim (ftype (function (riserve-full-text u32) index) posizione-riga-riserve))
(defun posizione-riga-riserve (pool row)
  "Pre: verified pool, private sorted directory, capacity <=1024.
Post: lower-bound in 0..count with at most 11 comparisons; does not read slots or body.
INVARIANT-VIOLATION => pool FAULTED if counters or convergence are inconsistent."
  (let ((low 0) (high (riserve-full-text-row-count pool)) (rows (riserve-full-text-rows pool)))
    (unless (<= high (length rows) 1024) (errore-interno-riserve pool :fulltext-row-count))
    (dotimes (i 11)
      (when (= low high) (return))
      (let ((middle (floor (+ low high) 2)))
        (if (< (aref rows middle) row) (setf low (1+ middle)) (setf high middle))))
    (unless (<= 0 low high (riserve-full-text-row-count pool))
      (errore-interno-riserve pool :fulltext-row-search))
    (unless (= low high) (errore-interno-riserve pool :fulltext-row-search))
    low))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-CON-002
(declaim (ftype (function (riserve-full-text index u32) riserva-full-text) slot-riga-riserve))
(defun slot-riga-riserve (pool position row)
  "Pre: lower-bound matching ROW. Post: canonical live slot and same row/generation.
Does not expose data; lost mapping or canceled slot => pool FAULTED before return."
  (unless (and (< position (riserve-full-text-row-count pool))
               (= row (aref (riserve-full-text-rows pool) position)))
    (errore-interno-riserve pool :fulltext-row-entry))
  (let ((index (aref (riserve-full-text-row-slots pool) position)))
    (unless (< index (length (riserve-full-text-slots pool))) (errore-interno-riserve pool :fulltext-row-slot))
    (let ((slot (svref (riserve-full-text-slots pool) index)))
      (unless (and (typep slot 'riserva-full-text)
                   (= index (riserva-full-text-position slot)) (eq pool (riserva-full-text-pool slot))
                   (= row (riserva-full-text-row slot)) (plusp (riserva-full-text-generation slot))
                   (member (riserva-full-text-state slot) '(:copying :ready :transferred)))
        (errore-interno-riserve pool :fulltext-row-slot))
      slot)))

;;; REQ: REQ-SEC-003 REQ-SEC-004 REQ-SEC-006 REQ-CON-002
(declaim (ftype (function (t t t) (values (member :absent :pending :transferred) (or null riserva-full-text) index &optional))
                trova-riga-trasferita-full-text))
(defun trova-riga-trasferita-full-text (pool lease row)
  "Pre: writer lease and u32 row. Post: state, transferred slot/generation, or NIL/0.
COPYING/READY return PENDING without a handle: the PUT bridge retains private ownership.
ABSENT does not certify a snapshot. No allocation, waiting, I/O, or MVCC visibility."
  (verifica-writer-riserve pool lease)
  (unless (typep row 'u32) (error 'invalid-argument :reason :fulltext-row-input))
  (let ((position (posizione-riga-riserve pool row)))
    (if (and (< position (riserve-full-text-row-count pool)) (= row (aref (riserve-full-text-rows pool) position)))
        (let ((slot (slot-riga-riserve pool position row)))
          (if (eq :transferred (riserva-full-text-state slot))
              (values :transferred slot (riserva-full-text-generation slot)) (values :pending nil 0)))
        (values :absent nil 0))))
