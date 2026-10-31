;;; OWNER: piano privato dell'attore M1 durante manutenzione; nessuno stato condiviso.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010
(defconstant +build-radix-bits+ 7)
(defconstant +build-radix-levels+ 65)
(defconstant +build-radix-fanout+ 128)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (opzione-indice-paginato) u64) id-immagine-costruzione))
(defun id-immagine-costruzione (option)
  "Pre: factory-validated name. Post: exact ID from the fresh name, 1..2^60-1.
INVALID-ARGUMENT before I/O for an unrepresentable ID; no reuse of an existing name."
  (let ((id (parse-integer (opzione-indice-paginato-name option) :start 8 :end 24 :radix 16)))
    (unless (<= 1 id arcdocdb.index.page::+page-id-max+)
      (error 'invalid-argument :reason :engine-image-build-id))
    id))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(defstruct (piano-immagine-motore (:constructor %make-piano-immagine-motore) (:copier nil))
  "Pre: exclusive M1 owner, canonical source and single fragment. Post: metadata without key copies.
Only slot IDs are reordered; engine source and indexes remain intact."
  (source nil :type arcdocdb.index.page:fonte-indice :read-only t)
  (fragment nil :type p:frammento-indice :read-only t)
  (revision 0 :type index :read-only t)
  (high #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (low #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (order #() :type (simple-array (unsigned-byte 32) (*)))
  (aux #() :type (simple-array (unsigned-byte 32) (*)))
  (counts #() :type (simple-array (unsigned-byte 32) (256)) :read-only t)
  (words #() :type (simple-array (unsigned-byte 64) (5)) :read-only t))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato) index) payload-costruzione-immagine))
(defun payload-costruzione-immagine (engine option)
  "Pre: M1 resident index, valid option. Post: conservative reservation of owned array payloads.
Includes worst-case batch keys, plan, builder, radix stack, and verification; excludes headers/GC/RSS.
The controller must reserve runtime metadata and transients separately; no I/O or allocation."
  (let* ((size (opzione-indice-paginato-size option))
         (capacity (nth-value 1 (arcdocdb.index.page::geometria-pagina size)))
         (entry-limit (floor (* capacity 7) 8)))
    (+ (* 16 (p::indice-primario-capacity (motore-index engine))) 1024 40 262144
       (* +build-radix-levels+ +build-radix-fanout+ 8)
       (* size (+ 8 (opzione-indice-paginato-frames option)))
       (* capacity 17) (* entry-limit (+ 8 arcdocdb.record:+max-key-bytes+)) arcdocdb.record:+max-key-bytes+)))
