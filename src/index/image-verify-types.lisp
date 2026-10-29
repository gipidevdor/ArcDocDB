;;; OWNER: verifica privata dell'attore I/O; file readonly prestato, nessuna pubblicazione intermedia.
;;; SHARED: nessuno; buffer limitati e budget cumulativo per l'intera verifica.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (ispezione-immagine (:constructor %make-ispezione-immagine) (:copier nil))
  "Pre: fonte e footer verificati. Post: scratch esclusivi senza insieme residente delle chiavi.
Nessuna risorsa posseduta oltre la chiamata; callback fidata, input readonly e non rientro."
  (file nil :type arcdocdb.io:file-io :read-only t)
  (seal nil :type sigillo-immagine :read-only t)
  (reader nil :type lettore-indice-pagine :read-only t)
  (cursor nil :type identita-pagina :read-only t)
  (scan #() :type octets :read-only t) (fragment #() :type octets :read-only t)
  (key #() :type octets :read-only t)
  (expected #() :type (simple-array (unsigned-byte 64) (5)) :read-only t)
  (actual #() :type (simple-array (unsigned-byte 64) (5)) :read-only t)
  (validator #'identity :type function :read-only t)
  (remaining 0 :type index) (seen 0 :type index))

;;; REQ: REQ-IDX-010
(defstruct (immagine-indice-verificata (:constructor %make-immagine-indice-verificata (file seal reader)) (:copier nil))
  "Pre: tutte le pagine/entry e la fonte hanno superato la verifica. Post: capacita' readonly adottabile.
File e namespace stabili prestati dal controller; non e' una decisione di catalogo o commit."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (file nil :type arcdocdb.io:file-io :read-only t) (seal nil :type sigillo-immagine :read-only t)
  (reader nil :type lettore-indice-pagine :read-only t))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (ispezione-immagine page-number page-number octets) null) carica-pagina-ispezione))
(defun carica-pagina-ispezione (work page generation target)
  "Pre: riferimento locale canonico, scratch esclusivo. Post: una visita globale addebitata anche su hit.
Esaurimento non equivale ad assenza; nessun I/O dopo esaurimento."
  (when (zerop (ispezione-immagine-remaining work))
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-image-visit-budget))
  (decf (ispezione-immagine-remaining work))
  (let ((cursor (ispezione-immagine-cursor work)))
    (setf (identita-pagina-page cursor) page (identita-pagina-generation cursor) generation)
    (unless (= (copia-pagina-cache (lettore-indice-pagine-cache (ispezione-immagine-reader work)) cursor target)
               (length target))
      (error 'invariant-violation :reason :index-image-copy))) nil)
