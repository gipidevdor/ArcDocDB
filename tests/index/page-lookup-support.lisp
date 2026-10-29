;;; OWNER: runner seriale; immagini binarie manuali indipendenti dal writer prodotto.
;;; SHARED: nessuno; la callback contiene solo fixture del caso corrente.
;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-AFF-003
(in-package #:arcdocdb.index.page.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(defun lookup-page (size kind body count parameter page &key (next 0))
  (multiple-value-bind (raw start end)
      (raw-page size kind body count parameter :page page :next next :next-generation (if (zerop next) 0 7))
    (cons page (subseq raw start end))))

(defun lookup-reader (size root pages &key (frames 1) (max-pages 1024) (max-key-bytes 1048576))
  (let ((cache (p:crea-cache-pagine size frames
                 (lambda (identity target)
                   (let ((source (cdr (assoc (p::identita-pagina-page identity) pages))))
                     (unless source (error "Pagina fixture assente: ~D" (p::identita-pagina-page identity)))
                     (replace target source) size)))))
    (values (p:crea-lettore-indice-pagine cache (identita-fixture size :page root)
                                        :max-pages max-pages :max-key-bytes max-key-bytes) cache)))

(defun lookup-words ()
  (make-array 5 :element-type '(unsigned-byte 64) :initial-element 99))

(defun lookup-candidate (reader key words &optional (high #x89abcdef) (low 5))
  (p:leggi-indice-pagine reader key 0 (length key) high low words))

(defun lookup-directory (size page left right shift)
  (let ((body (bytes 32)))
    (ref-write body 0 left 8) (ref-write body 8 (if (zerop left) 0 7) 8)
    (ref-write body 16 right 8) (ref-write body 24 (if (zerop right) 0 7) 8)
    (lookup-page size :directory body (+ (if (zerop left) 0 1) (if (zerop right) 0 1))
                 (+ 1 (* shift 256)) page)))

(defun lookup-key (&rest values)
  (make-array (length values) :element-type '(unsigned-byte 8) :initial-contents values))
