;;; OWNER: confini dei lotti dell'attore I/O; unwind chiude i tentativi incompleti.
;;; SHARED: nessuno; preparazione append-only di un derivato, root non pubblicata.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine simple-vector &key (:next (or null riferimento-costruito)))
                         riferimento-costruito) costruisci-bucket-pagine))
(defun costruisci-bucket-pagine (builder entries &key next)
  "Pre: immutable owned entries, logically unique set even in borrowed NEXT overflow.
Post: keys built from the tail and buckets verified append-only; proof returned only for a complete batch.
Failed preflight does not write; error/nonlocal exit after admission makes it FAULTED without rollback.
Memory-bounded maintenance operation, not a hot PUT path or commit point."
  (esigi-costruttore-libero builder)
  (let ((effect nil) (complete nil) (before (costruttore-pagine-written builder)))
    (setf (costruttore-pagine-busy builder) t)
    (unwind-protect
         (let ((pages (pianifica-bucket builder entries next)))
           (setf effect t)
           (emetti-chiavi-piano builder)
           (let* ((body (costruttore-pagine-body builder)) (plan (costruttore-pagine-plan builder))
                  (capacity (length plan)) (cursor (* capacity (1+ +entry-bytes+))))
             (fill body 0) (fill body +page-empty+ :end capacity)
             (dotimes (slot capacity)
               (when (aref plan slot) (setf cursor (scrivi-entry-costruita builder slot (aref plan slot) cursor))))
             (let* ((identity (emetti-pagina-costruita builder :bucket (length entries) capacity cursor
                                 (if next (identita-pagina-page (riferimento-costruito-identity next)) 0)))
                    (proof (prova-pagine-costruite builder identity :bucket 0 plan (vector next))))
               (unless (= (- (costruttore-pagine-written builder) before) pages)
                 (error 'invariant-violation :reason :index-build-page-count))
               (setf complete t) proof)))
      (fill (costruttore-pagine-plan builder) nil)
      (when (and effect (not complete)) (setf (costruttore-pagine-state builder) :faulted))
      (setf (costruttore-pagine-busy builder) nil))))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine t t simple-vector) riferimento-costruito) costruisci-directory-pagine))
(defun costruisci-directory-pagine (builder bits shift children)
  "Pre: owned children from the same builder, immutable during the batch.
Post: directory after all children, routing and order verified; proof without durable authority.
Preflight errors without append; incomplete effect => FAULTED; no implicit reuse or flush."
  (esigi-costruttore-libero builder)
  (let ((effect nil) (complete nil))
    (setf (costruttore-pagine-busy builder) t)
    (unwind-protect
         (let ((count (prepara-directory-costruita builder bits shift children)))
           (setf effect t)
           (let* ((identity (emetti-pagina-costruita builder :directory count (+ bits (* 256 shift))
                                                  (* (length children) +reference-bytes+) 0))
                  (proof (prova-pagine-costruite builder identity :directory (+ bits shift) #() children)))
             (setf complete t) proof))
      (when (and effect (not complete)) (setf (costruttore-pagine-state builder) :faulted))
      (setf (costruttore-pagine-busy builder) nil))))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (riferimento-costruito) identita-pagina) identita-riferimento-costruito))
(defun identita-riferimento-costruito (reference)
  "Pre: complete proof, not authoritative for commit. Post: private identity copy for cache/reader.
Maintenance allocation; does not lend mutable proof metadata to the caller."
  (let ((identity (riferimento-costruito-identity reference)))
    (crea-identita-pagina (identita-pagina-serie identity) (identita-pagina-image identity)
                         (identita-pagina-page identity) (identita-pagina-generation identity))))
