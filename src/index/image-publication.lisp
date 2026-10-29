;;; OWNER: vista privata dell'attore I/O della Serie; nessuno swap concorrente o catalogo durevole.
;;; SHARED: nessuno; vecchie capacita' restano prestate finche' il controller le mantiene vive.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010
(defstruct (vista-indice-paginato (:constructor crea-vista-indice-paginato (source)) (:copier nil))
  "Pre: fonte canonica immutabile. Post: vista senza root fino all'adozione di una prova verificata.
Solo l'owner pubblica/legge; il controller possiede i file e le relative durate di vita."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (source nil :type fonte-indice) (current nil :type (or null immagine-indice-verificata)))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (vista-indice-paginato) null) esigi-owner-vista-paginata))
(defun esigi-owner-vista-paginata (view)
  "Pre: vista canonica. Post: owner seriale verificato prima di radici/file; rifiuto senza effetti."
  (unless (eq (vista-indice-paginato-owner view) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :index-image-view-owner)) nil)

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (vista-indice-paginato immagine-indice-verificata) null) pubblica-immagine-verificata))
(defun pubblica-immagine-verificata (view image)
  "Pre: prova completa, fonte della vista corrente e file ancora vivo. Post: sola root in memoria sostituita.
Nessun commit, close o rinomina. Errore prima dello swap conserva integralmente la root precedente."
  (esigi-owner-vista-paginata view)
  (unless (and (eq (immagine-indice-verificata-owner image) sb-thread:*current-thread*)
               (stessa-fonte-indice-p (vista-indice-paginato-source view)
                                     (sigillo-immagine-source (immagine-indice-verificata-seal image))))
    (error 'invalid-argument :reason :index-image-publication-source))
  (arcdocdb.io:verifica-capienza-lettura (immagine-indice-verificata-file image)
                                      (sigillo-immagine-size (immagine-indice-verificata-seal image)))
  (setf (vista-indice-paginato-current view) image) nil)

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (vista-indice-paginato fonte-indice) null) invalida-vista-indice-paginato))
(defun invalida-vista-indice-paginato (view source)
  "Pre: nuova fonte dal gate canonico, owner. Post: root ritirata prima del nuovo legame, senza close/reclaim.
CSN regressivo respinto; stesso CSN con nuovo token e' ammesso per cambio fisico delle fonti."
  (esigi-owner-vista-paginata view)
  (unless (and (equalp (fonte-indice-archive source) (fonte-indice-archive (vista-indice-paginato-source view)))
               (equalp (fonte-indice-series source) (fonte-indice-series (vista-indice-paginato-source view)))
               (>= (fonte-indice-csn source) (fonte-indice-csn (vista-indice-paginato-source view))))
    (error 'invalid-argument :reason :index-image-source-regression))
  (setf (vista-indice-paginato-current view) nil (vista-indice-paginato-source view) source) nil)

;;; REQ: REQ-IDX-010 REQ-IDX-001 REQ-AFF-002
(declaim (ftype (function (vista-indice-paginato octets integer integer (simple-array (unsigned-byte 64) (5)))
                         (member :live :absent)) leggi-vista-indice-paginato))
(defun leggi-vista-indice-paginato (view key start end destination)
  "Pre: owner, fonte stabile della vista, file prestato immutabile. Post: candidato verificato o assenza.
Vista senza root e file chiuso sono errori espliciti, anche quando i frame sarebbero in cache."
  (esigi-owner-vista-paginata view)
  (let ((image (vista-indice-paginato-current view)))
    (unless image (error 'arcdocdb.conditions:resource-exhausted :reason :index-image-not-ready))
    (let ((seal (immagine-indice-verificata-seal image)))
      (arcdocdb.io:verifica-capienza-lettura (immagine-indice-verificata-file image) (sigillo-immagine-size seal))
      (multiple-value-bind (high low)
          (arcdocdb.hash64:xxh64 key start end (sigillo-immagine-seed-high seal) (sigillo-immagine-seed-low seal))
        (leggi-indice-pagine (immagine-indice-verificata-reader image) key start end high low destination)))))
