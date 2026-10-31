;;; OWNER: richiesta di manutenzione seriale dell'attore; mai operazione PUT o swap concorrente.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore opzione-indice-paginato t t) null) preflight-costruzione-immagine))
(defun preflight-costruzione-immagine (engine option budget pages)
  "Pre: owner READY, opzione validata dalla factory. Post: payload finito e nome libero, nessun file creato.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED ordinari preservano admission; IO-FAULT del namespace rende FAULTED."
  (unless (and (typep budget '(integer 0 536870912)) (typep pages '(integer 1 65536)))
    (error 'invalid-argument :reason :engine-image-build-configuration))
  (id-immagine-costruzione option)
  (when (> (payload-costruzione-immagine engine option) budget)
    (error 'resource-exhausted :reason :engine-image-build-memory))
  (let ((names (handler-case (io:elenca-directory (motore-directory engine))
                 (arcdocdb.conditions:arcdocdb-error (condition)
                   (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition))) (error condition)))))
    (when (find (opzione-indice-paginato-name option) names :test #'string=)
      (error 'invalid-argument :reason :engine-image-build-exists)))
  nil)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-001 REQ-AFF-004 REQ-CON-002
(declaim (ftype (function (motore opzione-indice-paginato &key (:max-build-payload t) (:max-pages t))
                         opzione-indice-paginato) costruisci-indice-paginato-motore))
(defun costruisci-indice-paginato-motore (engine option &key (max-build-payload 67108864) (max-pages 65536))
  "Pre: owner READY seriale, nome derivato nuovo; budget payload distinto da metadati/GC e file.
Post: stesso OPTION riutilizzabile allo startup dopo sigillo/flush/verifica, FD locali chiusi.
Backend corrente e dati restano invariati; la prossima scrittura rende obsoleta l'immagine.
Preflight ordinario senza effetti; errore/nonlocal exit dopo ammissione => FAULTED, causa preservata.
Nessun retry, cancellazione o nuova decisione durevole: questa API prepara un derivato privato."
  (esigi-motore-pronto engine)
  (when (motore-automatic-index engine) (error 'invalid-argument :reason :engine-legacy-profile-required))
  (preflight-costruzione-immagine engine option max-build-payload max-pages)
  (let ((complete nil) (cause nil))
    (unwind-protect
         (handler-case
             (progn
               (setf (motore-busy engine) t)
               (let ((plan (prepara-piano-immagine-motore engine)))
                 (osserva-motore engine :image-build-planned)
                 (esegui-costruzione-immagine engine option plan max-pages))
               (unless (and (eq (motore-state engine) :ready)
                            (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))
                 (error 'invariant-violation :reason :engine-image-build-state))
               (setf complete t)
               option)
           (error (condition)
             (setf cause condition)
             (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition)))
             (error condition)))
      (unwind-protect
           (unless (or complete cause)
             (tenta-cleanup-motore engine (lambda () (guasta-motore engine
                (make-condition 'invariant-violation :reason :engine-image-build-unwind)))))
        (setf (motore-busy engine) nil)))))
