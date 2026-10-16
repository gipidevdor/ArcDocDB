;;;; Layout ADR-0054; tutti gli offset sono relativi all'inizio dello span.
(in-package #:arcdocdb.fulltext.format)
(declaim (optimize (safety 3) (debug 2)))
;;; REQ: REQ-SEC-008
(defconstant +header-bytes+ 64)
(defconstant +magic-low+ #x44435241)
(defconstant +magic-high+ #x31584449)
(defconstant +magic-high-offset+ 4)
(defconstant +version-offset+ 8)
(defconstant +kind-offset+ 10)
(defconstant +count-offset+ 12)
(defconstant +flags-offset+ 14)
(defconstant +identity-offset+ 16)
(defconstant +identity-bytes+ 16)
(defconstant +segment-offset+ 32)
(defconstant +length-offset+ 40)
(defconstant +directory-offset+ 48)
(defconstant +header-crc-offset+ 56)
(defconstant +reserved-offset+ 60)
(defconstant +format-version+ 2)
(defconstant +fulltext-kind+ 5)
(defconstant +section-count+ 6)
(defconstant +directory-entry-bytes+ 24)
(defconstant +entry-flags-offset+ 2)
(defconstant +entry-reserved-offset+ 4)
(defconstant +entry-start-offset+ 8)
(defconstant +entry-length-offset+ 16)
(defconstant +sections-offset+ 208)
(defconstant +footer-bytes+ 4)
(defconstant +meta-max-bytes+ 65536)
(defconstant +default-file-budget+ 17179869184)

;;; REQ: REQ-SEC-008
(declaim (ftype (function (index) (values index &optional)) allinea-indice-full-text))
(defun allinea-indice-full-text (offset)
  "Pre: OFFSET index con spazio per sette byte. Post: prossimo multiplo di otto.
INVALID-ARGUMENT per overflow; nessuna mutazione o allocazione prevista."
  (when (> offset (- most-positive-fixnum 7))
    (error 'invalid-argument :reason :fulltext-offset-overflow))
  (logand (+ offset 7) -8))

;;; REQ: REQ-SEC-008
(declaim (ftype (function ((integer 0 5)) (values (member 1 4 16 32) &optional))
                larghezza-sezione-full-text))
(defun larghezza-sezione-full-text (section)
  "Pre: ordinale di sezione 0..5. Post: divisore della lunghezza della sezione.
Nessuna modifica; tipi controllati, META e TERMS hanno byte come unita."
  (case section (1 32) ((3 5) 16) (4 4) (otherwise 1)))
