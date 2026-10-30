;;; OWNER: policy immutabile del controller; richieste seriali del solo attore M1.
;;; SHARED: policy condivisibile readonly, nessun contatore o scrittura fra Serie.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (politica-rinnovo-indice (:constructor %make-politica-rinnovo-indice (soglia)) (:copier nil))
  "Pre: soglia validata 1..100. Post: policy immutabile, nessun timer, I/O o quota assegnata."
  (soglia 75 :type (integer 1 100) :read-only t))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (&key (:soglia-percentuale t)) politica-rinnovo-indice) crea-politica-rinnovo-indice))
(defun crea-politica-rinnovo-indice (&key (soglia-percentuale 75))
  "Pre: configurazione controller. Post: policy immutabile; INVALID-ARGUMENT per soglia fuori 1..100.
Allocazione solo di configurazione; la percentuale non e' una misura della memoria libera o RSS."
  (unless (and (typep soglia-percentuale 'fixnum) (<= 1 soglia-percentuale 100))
    (error 'invalid-argument :reason :engine-image-maintenance-policy))
  (%make-politica-rinnovo-indice soglia-percentuale))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (delta-indice-motore politica-rinnovo-indice) boolean) delta-oltre-soglia-p))
(defun delta-oltre-soglia-p (delta policy)
  "Pre: delta privato stabile. Post: T se chiavi o byte raggiungono la soglia inclusiva.
Confronti interi esatti senza divisione: anche u32*100 resta fixnum SBCL64; nessuna allocazione.
Contatori fuori quota o nullita' incoerente segnalano INVARIANT-VIOLATION, mai un falso mantenimento."
  (let ((count (delta-indice-motore-count delta)) (used (delta-indice-motore-used delta))
        (limit (delta-indice-motore-limit delta)) (bytes (length (delta-indice-motore-arena delta)))
        (percent (politica-rinnovo-indice-soglia policy)))
    (unless (and (<= count limit) (<= count used bytes))
      (error 'invariant-violation :reason :engine-image-maintenance-counters))
    (unless (eq (zerop count) (zerop used))
      (error 'invariant-violation :reason :engine-image-maintenance-empty))
    (or (>= (* count 100) (* limit percent)) (>= (* used 100) (* bytes percent)))))

;;; REQ: REQ-IDX-010 REQ-CON-002 REQ-AFF-001
(declaim (ftype (function (motore politica-rinnovo-indice) boolean) rinnovo-indice-richiesto-p))
(defun rinnovo-indice-richiesto-p (engine policy)
  "Pre: owner READY con immagine e delta attivi. Post: decisione copiata, nessun I/O o prenotazione.
INVALID-ARGUMENT per modo senza delta; contatori corrotti rendono FAULTED conservando la primaria.
Non autorizza un PUT futuro e non garantisce spazio per una chiave non ancora osservata."
  (esigi-motore-pronto engine)
  (let ((delta (motore-delta engine)))
    (unless delta (error 'invalid-argument :reason :engine-image-maintenance-without-delta))
    (handler-case
        (progn
          (unless (motore-paged engine) (error 'invariant-violation :reason :engine-image-maintenance-without-view))
          (delta-oltre-soglia-p delta policy))
      (error (condition)
        (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition)))
        (error condition)))))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-CON-002
(declaim (ftype (function (motore politica-rinnovo-indice opzione-indice-paginato
                         &key (:max-maintenance-payload t) (:max-pages t)) (member :mantieni :rinnovato))
                mantieni-indice-paginato-motore))
(defun mantieni-indice-paginato-motore (engine policy option &key (max-maintenance-payload 67108864) (max-pages 65536))
  "Pre: owner READY con delta; OPTION candidato da usare soltanto quando la soglia richiede il rinnovo.
Post: MANTIENI senza I/O oppure RINNOVATO dopo richiesta completa, con le stesse quote del delta.
Nessun timer, retry, scelta di modo o nome generato; configurazioni errate rifiutate anche nel no-op.
Il rinnovo eredita preflight e confine FAULTED; non si consuma un CSN e non si ammette una scrittura."
  (esigi-motore-pronto engine)
  (unless (and (typep max-maintenance-payload '(integer 0 536870912)) (typep max-pages '(integer 1 65536)))
    (error 'invalid-argument :reason :engine-image-maintenance-configuration))
  (if (rinnovo-indice-richiesto-p engine policy)
      (let ((delta (motore-delta engine)))
        (rinnova-indice-paginato-motore engine option :max-maintenance-payload max-maintenance-payload
          :max-pages max-pages :delta-keys (delta-indice-motore-limit delta)
          :delta-key-bytes (length (delta-indice-motore-arena delta)))
        :rinnovato)
      :mantieni))
