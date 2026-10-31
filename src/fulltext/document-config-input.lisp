(in-package #:arcdocdb.fulltext.document)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-003 REQ-SEC-010
(declaim (ftype (function (t index index) index) controlla-testo-configurazione))
(defun controlla-testo-configurazione (text minimum maximum)
  "Pre: cold data. Post: bounded UTF-8 span, or INVALID-ARGUMENT/UTF-8 error.
No copy before total-budget verification."
  (unless (and (typep text 'octets) (<= minimum (length text) maximum))
    (error 'invalid-argument :reason :fulltext-config-text))
  (length text))

;;; REQ: REQ-SEC-003 REQ-SEC-010
(declaim (ftype (function (simple-vector index) (values index index &optional)) misure-campi-documento))
(defun misure-campi-documento (fields max-memory)
  "Pre: 1..16 fields represented as vectors. Post: conservative META and memory limits before copies.
Arrays and paths have known length; no external list or recursion."
  (let ((bytes 0) (keys 0) (prior 0))
    (dotimes (i (length fields))
      (let ((field (svref fields i)))
        (unless (and (typep field '(simple-vector 3)) (typep (svref field 0) '(integer 1 65535))
                     (> (svref field 0) prior) (typep (svref field 2) 'simple-vector)
                     (<= 1 (length (svref field 2)) 100))
          (error 'invalid-argument :reason :fulltext-config-field))
        (setf prior (svref field 0))
        (incf bytes (controlla-testo-configurazione (svref field 1) 1 64))
        (let ((path (svref field 2)))
          (incf keys (length path))
          (dotimes (j (length path))
            (incf bytes (controlla-testo-configurazione (svref path j) 0 65536))))))
    (let ((meta (+ 256 (* 32 (length fields)) (* 9 keys) bytes))
          (memory (+ 8192 (* 128 (length fields)) (* 64 keys) (* 2 bytes))))
      (when (> meta f::+meta-max-bytes+) (error 'resource-exhausted :reason :fulltext-config-meta-budget))
      (when (> memory max-memory) (error 'resource-exhausted :reason :fulltext-config-memory))
      (values meta memory))))

;;; REQ: REQ-SEC-003
(declaim (ftype (function (simple-vector simple-vector) boolean) percorsi-uguali-p))
(defun percorsi-uguali-p (first second)
  "Pre: validated vector paths and <=100 keys. Post: exact equality, no locale."
  (and (= (length first) (length second))
       (loop for i below (length first) always (equalp (svref first i) (svref second i)))))

;;; REQ: REQ-SEC-003
(declaim (ftype (function (simple-vector) null) controlla-duplicati-configurazione))
(defun controlla-duplicati-configurazione (fields)
  "Pre: validated fields. Post: no duplicate alias/path, at most 120 pairs."
  (dotimes (i (length fields))
    (dotimes (j i)
      (let ((first (svref fields i)) (second (svref fields j)))
        (when (or (equalp (svref first 1) (svref second 1))
                  (percorsi-uguali-p (svref first 2) (svref second 2)))
          (error 'invalid-argument :reason :fulltext-config-duplicate)))))
  nil)
