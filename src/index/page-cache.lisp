;;; OWNER: attore seriale della cache, incluse letture bloccanti sul miss.
;;; SHARED: nessuno; target caller separato, nessuna lease/hazard o lock implicito.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (cache-pagine identita-pagina index) octets) carica-frame-pagina))
(defun carica-frame-pagina (cache identity slot)
  "Pre: owner, BUSY, slot FIFO scelto. Post: frame verificato prima di renderlo HIT.
Qualsiasi uscita incompleta lascia slot invalido, anche su THROW; errori propagati.
Nessun dato committed e' modificato: la cache e' un derivato sacrificabile."
  (let* ((identities (cache-pagine-identities cache))
         (frame (aref (cache-pagine-frames cache) slot))
         (size (cache-pagine-size cache)) (complete nil))
    (unless (cache-pagine-busy cache)
      (error 'invariant-violation :reason :index-page-cache-state))
    (setf (aref identities slot) nil)
    (unwind-protect
         (progn
           ;; Impedisce a una lettura incompleta di riutilizzare una vecchia coda valida.
           (fill frame 0)
           (unless (eql (funcall (cache-pagine-loader cache) identity frame) size)
             (error 'arcdocdb.conditions:io-fault :reason :index-page-cache-short-read :operation :read))
           (verifica-pagina-indice frame 0 size identity)
           (let ((owned (aref (cache-pagine-references cache) slot)))
             (copia-identita-privata identity owned)
             (setf (aref identities slot) owned))
           (setf (cache-pagine-cursor cache) (mod (1+ slot) (length identities))
                 complete t)
           frame)
      (unless complete (setf (aref identities slot) nil)))))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (cache-pagine identita-pagina octets index) null) preflight-copia-pagina))
(defun preflight-copia-pagina (cache identity target start)
  "Pre: input caller stabili. Post: owner, non rientro, geometria e target verificati senza effetti.
INVALID-ARGUMENT lascia target, frame e FIFO intatti. Nessun borrower del buffer interno."
  (unless (eq (cache-pagine-owner cache) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :index-page-cache-owner))
  (when (cache-pagine-busy cache)
    (error 'invalid-argument :reason :index-page-cache-reentry))
  (unless (zerop (mod (identita-pagina-page identity) (cache-pagine-size cache)))
    (error 'invalid-argument :reason :index-page-cache-alignment))
  (check-range target start (+ start (cache-pagine-size cache)))
  (when (find target (cache-pagine-frames cache) :test #'eq)
    (error 'invalid-argument :reason :index-page-cache-alias))
  nil)

;;; REQ: REQ-IDX-009 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (cache-pagine identita-pagina octets &key (:start index))
                         (values index (member :hit :miss) &optional)) copia-pagina-cache))
(defun copia-pagina-cache (cache identity target &key (start 0))
  "Pre: attore I/O owner, target privato. Post: pagina verificata copiata, fine e HIT/MISS.
Miss sincrono e potenzialmente bloccante; nessuna promessa lock-free. Ricerca <= numero frame.
Target intatto se caricamento/verifica fallisce; BUSY rilasciato su ogni uscita.
Nessun riferimento ai frame lascia il modulo; il riuso non invalida copie precedenti."
  (preflight-copia-pagina cache identity target start)
  (let ((identities (cache-pagine-identities cache)))
    (setf (cache-pagine-busy cache) t)
    (unwind-protect
         (let* ((slot (position identity identities
                                :test (lambda (wanted cached)
                                        (and cached (stessa-identita-pagina-p wanted cached)))))
                (frame (if slot (aref (cache-pagine-frames cache) slot)
                           (carica-frame-pagina cache identity (cache-pagine-cursor cache)))))
           (replace target frame :start1 start)
           (values (+ start (cache-pagine-size cache)) (if slot :hit :miss)))
      (setf (cache-pagine-busy cache) nil))))
