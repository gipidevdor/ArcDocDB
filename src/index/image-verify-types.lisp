;;; OWNER: verifica privata dell'attore I/O; file readonly prestato, nessuna pubblicazione intermedia.
;;; SHARED: nessuno; buffer limitati e budget cumulativo per l'intera verifica.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (ispezione-immagine (:constructor %make-ispezione-immagine) (:copier nil))
  "Pre: verified source and footer. Post: exclusive scratch without resident key set.
No resource owned beyond call; trusted callback, read-only input, and non-reentrancy."
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
  "Pre: all pages/entries and source passed verification. Post: adoptable read-only capability.
Stable file and namespace borrowed from controller; not a catalog or commit decision."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (file nil :type arcdocdb.io:file-io :read-only t) (seal nil :type sigillo-immagine :read-only t)
  (reader nil :type lettore-indice-pagine :read-only t))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (ispezione-immagine page-number page-number octets) null) carica-pagina-ispezione))
(defun carica-pagina-ispezione (work page generation target)
  "Pre: canonical local reference, exclusive scratch. Post: one global visit charged even on hit.
Exhaustion does not mean absence; no I/O after exhaustion."
  (when (zerop (ispezione-immagine-remaining work))
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-image-visit-budget))
  (decf (ispezione-immagine-remaining work))
  (let ((cursor (ispezione-immagine-cursor work)))
    (setf (identita-pagina-page cursor) page (identita-pagina-generation cursor) generation)
    (unless (= (copia-pagina-cache (lettore-indice-pagine-cache (ispezione-immagine-reader work)) cursor target)
               (length target))
      (error 'invariant-violation :reason :index-image-copy))) nil)
