;;; OWNER: configurazione immutabile del controller; nessun I/O o stato condiviso mutabile.
;;; SHARED: sola policy readonly, buffer e nomi saranno privati di ogni startup.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (opzione-scoperta-indice (:constructor %make-opzione-scoperta-indice (template names candidates payload)) (:copier nil))
  "Pre: factory validante. Post: profilo e limiti readonly, nessuna scelta di file o prova di commit."
  (template nil :type opzione-indice-paginato :read-only t)
  (names 4096 :type (integer 1 65536) :read-only t)
  (candidates 64 :type (integer 1 1024) :read-only t)
  (payload 16777216 :type (integer 0 536870912) :read-only t))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (opzione-indice-paginato (integer 1 65536) (integer 1 1024)) index)
                payload-scoperta-indice))
(defun payload-scoperta-indice (template names candidates)
  "Pre: profilo valido e limiti verificati. Post: riserva conservativa di payload, non RSS.
Include due inventari con caratteri fino a 4 byte, candidati/transitori, footer e verifica; oggetti/header/GC separati."
  (unless (<= candidates names) (error 'invalid-argument :reason :engine-image-discovery-limits))
  (+ (* names 2 (+ (* 4 255) 16)) (* candidates 1024) 65536 arcdocdb.record:+max-key-bytes+
     (* (opzione-indice-paginato-size template) (+ 6 (opzione-indice-paginato-frames template)))))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (&key (:page-size t) (:frames t) (:max-visits t) (:max-bytes t)
                              (:max-names t) (:max-candidates t) (:max-discovery-payload t)) opzione-scoperta-indice)
                crea-opzione-scoperta-indice))
(defun crea-opzione-scoperta-indice (&key (page-size 4096) (frames 2) (max-visits 16777216)
                                        (max-bytes 268435456) (max-names 4096) (max-candidates 64)
                                        (max-discovery-payload 16777216))
  "Pre: configurazione non fidata, prima dello startup. Post: policy bounded, profilo validato e quota verificata.
INVALID-ARGUMENT per domini, RESOURCE-EXHAUSTED per payload insufficiente; nessun I/O o grande allocazione.
La quota non prenota RAM: residente, metadati e GC restano nella riserva del controller."
  (unless (and (typep max-names '(integer 1 65536)) (typep max-candidates '(integer 1 1024))
               (typep max-discovery-payload '(integer 0 536870912)))
    (error 'invalid-argument :reason :engine-image-discovery-configuration))
  (let ((template (crea-opzione-indice-paginato "primary-0000000000000000.idx.tmp"
                    :page-size page-size :frames frames :max-visits max-visits :max-bytes max-bytes)))
    (when (> (payload-scoperta-indice template max-names max-candidates) max-discovery-payload)
      (error 'resource-exhausted :reason :engine-image-discovery-memory))
    (%make-opzione-scoperta-indice template max-names max-candidates max-discovery-payload)))
