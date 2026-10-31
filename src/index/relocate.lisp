;;; OWNER: rilocazione solo nel writer; messaggio originale e destinazione sono privati.
;;; SHARED: confronto/applicazione serializzati nel gettone della stessa Serie.
(in-package #:arcdocdb.index.slots)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-004 REQ-AFF-004
(declaim (inline slot-corrisponde-p))
(declaim (ftype (function (banco-slot fixnum contenuto-slot) boolean) slot-corrisponde-p))
(defun slot-corrisponde-p (bank base expected)
  "Pre: exclusive writer, verified internal fields; private unchanged EXPECTED.
Post: CSN/location identity and complete metadata comparison, without modifications or reader seqlock."
  (let ((words (banco-slot-words bank)))
    (and (= (aref expected 0) (aref words (+ base +slot-csn+)))
         (= (aref expected 1) (aref words (+ base +slot-location+)))
         (= (aref expected 2) (aref words (+ base +slot-key+)))
         (= (aref expected 3) (aref words (+ base +slot-length+)))
         (= (aref expected 4) (if (banco-slot-retained bank) (aref words (+ base +slot-end+)) 0)))))

;;; REQ: REQ-IDX-004 REQ-LIM-001 REQ-AFF-004
(declaim (ftype (function (banco-slot integer contenuto-slot contenuto-slot) boolean) riloca-slot-v2))
(defun riloca-slot-v2 (bank slot expected replacement)
  "Pre: writer and slot/key identity found by caller, verified identical durable copy.
Post: T changes only location if all fields still original; NIL makes no modification.
CSN, key, length, and validity end must remain identical; invalid input rejected beforehand.
No I/O or manifest swap; no source resource reclaimed."
  (esigi-banco-writer bank)
  (let ((base (base-slot bank slot)))
    (esigi-contenuto-slot bank expected)
    (esigi-contenuto-slot bank replacement)
    (unless (and (= (aref expected 0) (aref replacement 0))
                 (= (aref expected 2) (aref replacement 2))
                 (= (aref expected 3) (aref replacement 3))
                 (= (aref expected 4) (aref replacement 4)))
      (error 'invalid-argument :reason :index-slot-relocation-content))
    (sequenza-slot-writer bank base)
    (unless (slot-corrisponde-p bank base expected)
      (esigi-banco-sano bank)
      (return-from riloca-slot-v2 nil))
    (unless (= (aref expected 1) (aref replacement 1)) (cambia-slot bank base replacement))
    (esigi-banco-sano bank)
    t))
