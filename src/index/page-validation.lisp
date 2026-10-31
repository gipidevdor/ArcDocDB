;;; OWNER: buffer stabile per tutta la verifica, input/output distinti nel writer.
;;; SHARED: nessuna scrittura; nessuna dipendenza dal writer o dal GC.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-AFF-004
(declaim (ftype (function (t page-error keyword) null) esigi-pagina))
(defun esigi-pagina (predicate condition reason)
  "Pre: canonical internal class and predicate already computed. Post: NIL if valid.
Otherwise the requested typed condition without mutations; no error is caught."
  (unless predicate (error condition :reason reason)) nil)

;;; REQ: REQ-IDX-009
(declaim (ftype (function (octets index index) boolean) pagina-zero-p))
(defun pagina-zero-p (buffer start end)
  "Pre: verified range. Post: T for all-zero bytes; no data modified."
  (loop for i from start below end always (zerop (aref buffer i))))

;;; REQ: REQ-IDX-009
(declaim (ftype (function (page-number page-number identita-pagina index page-error) null)
                verifica-riferimento-pagina))
(defun verifica-riferimento-pagina (page generation identity size condition)
  "Pre: numbers in domain, valid size. Post: absent or aligned preceding child.
Requested condition for a partial pair, self/forward reference, or future generation."
  (unless (plusp (nth-value 0 (geometria-pagina size)))
    (error 'invariant-violation :reason :index-page-reference-size))
  (esigi-pagina
   (or (and (zerop page) (zerop generation))
       (and (plusp page) (plusp generation) (zerop (mod page size))
            (< page (identita-pagina-page identity))
            (<= generation (identita-pagina-generation identity))))
   condition :index-page-reference)
  nil)

;;; REQ: REQ-IDX-009
(declaim (ftype (function (octets index identita-pagina index page-error) null)
                verifica-ref-binario))
(defun verifica-ref-binario (buffer offset identity size condition)
  "Pre: sixteen bytes present. Post: canonical reference verified without retaining it.
Requested condition for a number outside the domain or an invalid reference."
  (let ((page (leggi-u64 buffer offset))
        (generation (leggi-u64 buffer (+ offset +reference-generation+))))
    (esigi-pagina (and (<= page +page-id-max+) (<= generation +page-id-max+))
                  condition :index-page-reference-domain)
    (verifica-riferimento-pagina page generation identity size condition))
  nil)

;;; REQ: REQ-IDX-009
(declaim (ftype (function (identita-pagina index page-error) null) verifica-identita-allineata))
(defun verifica-identita-allineata (identity size condition)
  "Pre: canonical identity and admitted size. Post: aligned physical offset.
Requested condition if inconsistent; no allocation or reservation."
  (esigi-pagina (zerop (mod (identita-pagina-page identity) size))
                condition :index-page-alignment)
  nil)

;;; REQ: REQ-IDX-009
(declaim (ftype (function (page-kind) (integer 1 3)) codice-tipo-pagina))
(defun codice-tipo-pagina (kind)
  "Pre: canonical internal type. Post: persistent code; INVARIANT-VIOLATION if unexpected."
  (case kind (:bucket 1) (:directory 2) (:chiave 3)
        (otherwise (error 'invariant-violation :reason :index-page-kind-code))))
