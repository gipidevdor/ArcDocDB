;;; OWNER: un attore I/O; root immutabile prestata, scratch esclusivi del lettore.
;;; SHARED: nessuno; cache e lettore appartengono alla stessa Serie/attore.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003
(defstruct (lettore-indice-pagine (:constructor %make-lettore-indice-pagine
                                   (cache root cursor bucket key-page max-pages max-key-bytes)) (:copier nil))
  "Pre: factory, root dal controller autorevole. Post: scratch privati preallocati.
Lookup seriale di candidati, senza pubblicazione root, MVCC o modifica durevole."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (cache nil :type cache-pagine :read-only t)
  (root nil :type identita-pagina :read-only t)
  (cursor nil :type identita-pagina :read-only t)
  (bucket #() :type octets :read-only t)
  (key-page #() :type octets :read-only t)
  (max-pages 1024 :type index :read-only t)
  (max-key-bytes 1048576 :type index :read-only t)
  (remaining 0 :type index)
  (key-remaining 0 :type index)
  (found-page 0 :type page-number) (found-entry 0 :type index)
  (busy nil :type boolean))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (cache-pagine identita-pagina &key (:max-pages t) (:max-key-bytes t))
                         lettore-indice-pagine) crea-lettore-indice-pagine))
(defun crea-lettore-indice-pagine (cache root &key (max-pages 1024) (max-key-bytes 1048576))
  "Pre: cache dell'owner, immagine stabile, root verificabile dal codec al primo accesso.
Post: due pagine scratch e un cursore privato; nessuna lettura o allocazione nel lookup.
INVALID-ARGUMENT per owner, geometria e budget; nessuna nuova autorita' di commit."
  (unless (eq (cache-pagine-owner cache) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :index-page-cache-owner))
  (unless (and (typep max-pages '(integer 1 65536))
               (typep max-key-bytes '(integer 1 16777216)))
    (error 'invalid-argument :reason :index-page-lookup-budgets))
  (verifica-identita-allineata root (cache-pagine-size cache) 'invalid-argument)
  (flet ((copy-id () (crea-identita-pagina (identita-pagina-serie root) (identita-pagina-image root)
                                         (identita-pagina-page root) (identita-pagina-generation root))))
    (%make-lettore-indice-pagine cache (copy-id) (copy-id)
      (make-array (cache-pagine-size cache) :element-type '(unsigned-byte 8) :initial-element 0)
      (make-array (cache-pagine-size cache) :element-type '(unsigned-byte 8) :initial-element 0)
      max-pages max-key-bytes)))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (lettore-indice-pagine page-number page-number octets) null) leggi-pagina-lookup))
(defun leggi-pagina-lookup (reader page generation target)
  "Pre: BUSY owner, riferimento dal codec o root canonica. Post: copia verificata nel target.
Ogni visita, anche HIT, consuma un credito; RESOURCE-EXHAUSTED non equivale ad ABSENT."
  (unless (lettore-indice-pagine-busy reader)
    (error 'invariant-violation :reason :index-page-lookup-state))
  (when (zerop (lettore-indice-pagine-remaining reader))
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-page-lookup-page-budget))
  (decf (lettore-indice-pagine-remaining reader))
  (let ((cursor (lettore-indice-pagine-cursor reader)))
    (setf (identita-pagina-page cursor) page (identita-pagina-generation cursor) generation)
    (unless (= (copia-pagina-cache (lettore-indice-pagine-cache reader) cursor target) (length target))
      (error 'invariant-violation :reason :index-page-lookup-copy)))
  nil)
