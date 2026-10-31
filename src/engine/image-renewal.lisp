;;; OWNER: attore M1; una admission BUSY copre costruzione e pubblicazione, nessun borrower.
;;; SHARED: nessuno; delta e FD privati, nessun punto durevole oltre il SEAL canonico dei dati.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato t t) index) payload-rinnovo-immagine))
(defun payload-rinnovo-immagine (engine option keys bytes)
  "Pre: READY owner, canonical option; untrusted delta quotas. Post: payload reservation for every phase.
Sums plan/builder/verification, old cache/delta, new verification and new delta, without assuming GC.
Excludes headers/objects/RSS; no I/O or intentional allocation; INVALID-ARGUMENT for delta quotas."
  (esigi-owner-motore engine)
  (+ (payload-delta-indice keys bytes)
     (payload-costruzione-immagine engine option)
     (payload-attivazione-immagine engine option)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore opzione-indice-paginato t t t t) null) preflight-rinnovo-immagine))
(defun preflight-rinnovo-immagine (engine option budget pages keys bytes)
  "Pre: READY owner before any effect. Post: quota for the entire request and new name verified.
Ordinary INVALID-ARGUMENT/RESOURCE-EXHAUSTED preserve view, delta, files, and CSN; faulty namespace => FAULTED."
  (unless (and (typep budget '(integer 0 536870912)) (typep pages '(integer 1 65536)))
    (error 'invalid-argument :reason :engine-image-renewal-configuration))
  (when (> (payload-rinnovo-immagine engine option keys bytes) budget)
    (error 'resource-exhausted :reason :engine-image-renewal-memory))
  (preflight-costruzione-immagine engine option budget pages)
  nil)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore opzione-indice-paginato index (or null delta-indice-motore)) null)
                esegui-rinnovo-immagine))
(defun esegui-rinnovo-immagine (engine option pages delta)
  "Pre: BUSY owner and total quota reserved. Post: image of the same source published with an empty delta.
Derived preparation: no data or catalog commit. Errors/nonlocal exits impose FAULTED at the boundary.
Before swap, the old view remains owned; afterward, the new FD follows engine cleanup."
  (unless (motore-busy engine) (error 'invariant-violation :reason :engine-image-renewal-admission))
  (let ((plan (prepara-piano-immagine-motore engine)))
    (osserva-motore engine :image-build-planned)
    (esegui-costruzione-immagine engine option plan pages)
    (osserva-motore engine :image-renewal-built)
    (verifica-fonte-costruzione engine plan)
    (prepara-attivazione-immagine engine option delta))
  nil)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-001 REQ-AFF-004 REQ-CON-002 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato &key (:max-maintenance-payload t)
                         (:max-pages t) (:delta-keys t) (:delta-key-bytes t)) opzione-indice-paginato)
                rinnova-indice-paginato-motore))
(defun rinnova-indice-paginato-motore (engine option &key (max-maintenance-payload 67108864)
                                                        (max-pages 65536) (delta-keys 0) (delta-key-bytes 0))
  "Pre: READY owner, new name; quota covers all phases and previous resources without implicit GC.
Post: OPTION built, verified, and active, optional empty delta; canonical data/CSN unchanged.
Single serial admission: no GET or write between phases, even from callbacks.
Ordinary preflight preserves READY; every admitted error/nonlocal exit => FAULTED with cause preserved.
No retry or deletion: an incomplete file or complete unpublished file remains a private derivative."
  (esigi-motore-pronto engine)
  (when (motore-automatic-index engine) (error 'invalid-argument :reason :engine-legacy-profile-required))
  (preflight-rinnovo-immagine engine option max-maintenance-payload max-pages delta-keys delta-key-bytes)
  (let ((complete nil) (cause nil))
    (unwind-protect
         (handler-case
             (progn
               (setf (motore-busy engine) t)
               (esegui-rinnovo-immagine engine option max-pages (crea-delta-configurato-motore engine delta-keys delta-key-bytes))
               (unless (and (motore-busy engine) (eq (motore-state engine) :ready)
                            (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))
                 (error 'invariant-violation :reason :engine-image-renewal-state))
               (setf complete t)
               option)
           (error (condition)
             (setf cause condition)
             (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition)))
             (error condition)))
      (unwind-protect
           (unless (or complete cause)
             (tenta-cleanup-motore engine (lambda () (guasta-motore engine
                (make-condition 'invariant-violation :reason :engine-image-renewal-unwind)))))
        (setf (motore-busy engine) nil)))))
