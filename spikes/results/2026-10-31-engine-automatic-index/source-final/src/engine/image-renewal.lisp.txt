;;; OWNER: attore M1; una admission BUSY copre costruzione e pubblicazione, nessun borrower.
;;; SHARED: nessuno; delta e FD privati, nessun punto durevole oltre il SEAL canonico dei dati.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato t t) index) payload-rinnovo-immagine))
(defun payload-rinnovo-immagine (engine option keys bytes)
  "Pre: owner READY, opzione canonica; quote delta non fidate. Post: riserva dei payload di tutte le fasi.
Somma piano/builder/verifica, vecchia cache/delta, nuova verifica e nuovo delta, senza supporre GC.
Esclude header/oggetti/RSS; nessun I/O o allocazione intenzionale; INVALID-ARGUMENT per quote delta."
  (esigi-owner-motore engine)
  (+ (payload-delta-indice keys bytes)
     (payload-costruzione-immagine engine option)
     (payload-attivazione-immagine engine option)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore opzione-indice-paginato t t t t) null) preflight-rinnovo-immagine))
(defun preflight-rinnovo-immagine (engine option budget pages keys bytes)
  "Pre: owner READY prima di qualsiasi effetto. Post: quota dell'intera richiesta e nome nuovo verificati.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED ordinari preservano vista, delta, file e CSN; namespace guasto => FAULTED."
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
  "Pre: owner BUSY e quota totale riservata. Post: immagine della stessa fonte pubblicata con delta vuoto.
Preparazione derivata: nessun commit dati o catalogo. Errori/nonlocal exit impongono FAULTED al confine.
Prima dello swap la vecchia vista resta posseduta; dopo il nuovo FD segue il cleanup del motore."
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
  "Pre: owner READY, nome nuovo; quota copre tutte le fasi e risorse precedenti senza GC implicito.
Post: OPTION costruita, verificata e attiva, delta vuoto opzionale; dati/CSN canonici invariati.
Unica admission seriale: nessuna GET o scrittura fra le fasi, nemmeno da callback.
Preflight ordinario conserva READY; ogni errore/nonlocal exit ammesso => FAULTED con causa preservata.
Nessun retry o cancellazione: file incompleto o completo non pubblicato resta un derivato privato."
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
