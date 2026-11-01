;;;; Startup allocation and finite key vocabularies.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t t &optional t) metriche-serie) crea-metriche-serie))
(defun crea-metriche-serie (serie worker inizio &optional (config nil config-p))
  "Pre: startup identities and injected start in CONFIG's clock unit/domain.
Post: fixed independent counters/histograms owned by this thread. INVALID-ARGUMENT precedes allocation."
  (unless (and (typep serie 'identita-serie-metrica) (typep worker 'campioni)
               (typep inizio 'latenza) (or (not config-p) (configurazione-istogramma-p config)))
    (error 'invalid-argument :reason :metrics-series-config))
  (let ((configuration (if config-p config (crea-configurazione-istogramma))))
    (%make-metriche-serie serie worker inizio (%make-fonte-metriche serie worker)
      (make-array +numero-contatori-metriche+ :element-type '(unsigned-byte 64) :initial-element 0)
      (make-array +numero-celle-code+ :element-type '(unsigned-byte 64) :initial-element 0)
      (crea-istogramma configuration) (crea-istogramma configuration))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (inline %verifica-metriche-owner %limite-metriche))
(declaim (ftype (function (t) metriche-serie) %verifica-metriche-owner))
(defun %verifica-metriche-owner (metrics)
  "Pre: public owner operation. Post: validated partition before mutable state is accessed.
INVALID-ARGUMENT rejects type/owner violations; the request histogram owns the enclosing guard."
  (unless (and (metriche-serie-p metrics)
               (eq (istogramma-latenze-owner (metriche-serie-latenza-richieste metrics))
                   sb-thread:*current-thread*))
    (error 'invalid-argument :reason :metrics-series-owner))
  metrics)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (metriche-serie) (integer 1 #.+massimi-campioni+)) %limite-metriche))
(defun %limite-metriche (metrics)
  "Pre: validated partition. Post: common histogram/counter cap; no mutation or allocation."
  (configurazione-istogramma-limite-campioni
    (istogramma-latenze-configurazione (metriche-serie-latenza-richieste metrics))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t) indice-contatore-metrico) %indice-contatore))
(defun %indice-contatore (key)
  "Pre: public counter key. Post: finite index; INVALID-ARGUMENT rejects unknown keys."
  (or (position key #(:richieste :errori :cache-hit :cache-miss :cache-espulsioni
                      :cache-errori-verifica :wal-append :wal-byte :wal-flush :wal-record) :test #'eq)
      (error 'invalid-argument :reason :metrics-counter-key)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t) (integer 0 1)) %indice-coda))
(defun %indice-coda (kind)
  "Pre: public queue kind. Post: bounded queue index; INVALID-ARGUMENT rejects unknown kinds."
  (or (position kind #(:richieste :wal) :test #'eq)
      (error 'invalid-argument :reason :metrics-queue-kind)))
