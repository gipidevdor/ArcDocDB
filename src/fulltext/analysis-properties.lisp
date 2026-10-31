;;;; Ricerca numerica nelle tabelle UCD versionate, senza stringhe o locale del runtime.
(in-package #:arcdocdb.fulltext.analysis)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-007 REQ-SEC-010
(declaim (ftype (function (spazio-full-text vettore-u32 scalare) u32) proprieta-unicode))
(defun proprieta-unicode (space ranges cp)
  "Pre: immutable ranges sorted as triples, scalar. Post: value or zero.
Search bounded by triple count; RESOURCE-EXHAUSTED if work is exhausted."
  (let ((low 0) (high (floor (length ranges) 3)))
    (loop repeat (1+ high) while (< low high) do
      (consuma-lavoro-full-text space)
      (let* ((mid (floor (+ low high) 2)) (position (* mid 3)))
        (cond ((< cp (aref ranges position)) (setf high mid))
              ((> cp (aref ranges (1+ position))) (setf low (1+ mid)))
              (t (return-from proprieta-unicode (aref ranges (+ position 2)))))))
    0))

;;; REQ: REQ-SEC-007 REQ-SEC-010
(declaim (ftype (function (spazio-full-text vettore-u32 scalare) fixnum) trova-mapping))
(defun trova-mapping (space records cp)
  "Pre: triple records sorted by scalar. Post: triple offset or -1.
No table mutation; bounded search and work."
  (let ((low 0) (high (floor (length records) 3)))
    (loop repeat (1+ high) while (< low high) do
      (consuma-lavoro-full-text space)
      (let* ((mid (floor (+ low high) 2)) (position (* mid 3)) (key (aref records position)))
        (cond ((< cp key) (setf high mid)) ((> cp key) (setf low (1+ mid)))
              (t (return-from trova-mapping position)))))
    -1))

;;; REQ: REQ-SEC-007
(declaim (ftype (function (spazio-full-text scalare scalare) u32) composizione-unicode))
(defun composizione-unicode (space first second)
  "Pre: two scalars, exclusive workspace. Post: canonical composition or zero.
Algorithmic Hangul, other nonexcluded UCD pairs; no bignum or global state."
  (cond ((and (<= #x1100 first #x1112) (<= #x1161 second #x1175))
         (+ #xac00 (* (- first #x1100) 588) (* (- second #x1161) 28)))
        ((and (<= #xac00 first #xd7a3) (zerop (mod (- first #xac00) 28))
              (<= #x11a8 second #x11c2)) (+ first (- second #x11a7)))
        (t
         (let ((key (+ (ash first 21) second)) (low 0) (high (floor (length +compose-pairs+) 2)))
           (loop repeat (1+ high) while (< low high) do
             (consuma-lavoro-full-text space)
             (let* ((mid (floor (+ low high) 2)) (offset (* mid 2))
                    (candidate (aref +compose-pairs+ offset)))
               (cond ((< key candidate) (setf high mid)) ((> key candidate) (setf low (1+ mid)))
                     (t (return-from composizione-unicode (aref +compose-pairs+ (1+ offset)))))))
           0))))
