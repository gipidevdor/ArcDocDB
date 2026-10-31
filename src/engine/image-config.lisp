;;; OWNER: configurazione immutabile copiata prima dello startup, nessun FD o dato condiviso.
;;; SHARED: nessuno; selezione esplicita di un derivato privato, senza modifica al catalogo.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (opzione-indice-paginato (:constructor %make-opzione-indice-paginato (name size frames visits bytes)) (:copier nil))
  "Pre: validating factory. Post: private read-only name and budgets; no I/O effect."
  (name "" :type simple-base-string :read-only t)
  (size 4096 :type (member 4096 16384 65536) :read-only t)
  (frames 2 :type (integer 1 64) :read-only t)
  (visits 16777216 :type index :read-only t)
  (bytes 268435456 :type index :read-only t))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t &key (:page-size t) (:frames t) (:max-visits t) (:max-bytes t))
                         opzione-indice-paginato) crea-opzione-indice-paginato))
(defun crea-opzione-indice-paginato (name &key (page-size 4096) (frames 2) (max-visits 16777216)
                                             (max-bytes 268435456))
  "Pre: leaf name primary-<16 lowercase hex digits>.idx.tmp and finite budgets.
Post: configuration copy for APRI-MOTORE :INDEX-IMAGE; every error precedes opening/large allocations.
The name selects a candidate; it does not attest to a commit or catalog decision."
  (unless (and (stringp name) (= (length name) 32) (string= name "primary-" :end1 8)
               (string= name ".idx.tmp" :start1 24)
               (every (lambda (char) (find char "0123456789abcdef")) (subseq name 8 24)))
    (error 'invalid-argument :reason :engine-image-name))
  (unless (and (member page-size '(4096 16384 65536)) (typep frames '(integer 1 64))
               (typep max-visits '(integer 1 #.(1- (ash 1 60))))
               (typep max-bytes '(integer 12288 4295098368)) (>= max-bytes (* 3 page-size)))
    (error 'invalid-argument :reason :engine-image-budgets))
  (%make-opzione-indice-paginato (map 'simple-base-string #'identity name) page-size frames max-visits max-bytes))
