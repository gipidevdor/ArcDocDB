;;; OWNER: attore M1; membership esatta privata, mai condivisa o prestata.
;;; SHARED: nessuno; memoria prenotata durante l'attivazione seriale.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (delta-indice-motore (:constructor %make-delta-indice-motore) (:copier nil))
  "Pre: array privati azzerati e capienza validata. Post: insieme append-only di chiavi toccate.
Non contiene location: il residente canonico decide PUT e assenza, incluse le tombstone."
  (limit 1 :type (integer 1 65536) :read-only t)
  (table #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (arena #() :type octets :read-only t)
  (count 0 :type u32)
  (used 0 :type u32))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (t t) index) payload-delta-indice))
(defun payload-delta-indice (keys bytes)
  "Pre: configurazione caller non fidata. Post: payload esatto dei due array o INVALID-ARGUMENT.
Zero/zero disabilita; altrimenti 1..65536 chiavi, 1..16 MiB arena; tabella al piu' meta' piena."
  (unless (and (typep keys '(integer 0 65536)) (typep bytes '(integer 0 16777216)))
    (error 'invalid-argument :reason :engine-delta-configuration))
  (if (zerop keys)
      (progn (unless (zerop bytes) (error 'invalid-argument :reason :engine-delta-configuration)) 0)
      (progn
        (when (zerop bytes) (error 'invalid-argument :reason :engine-delta-configuration))
        (+ bytes (* 16 (ash 1 (integer-length (1- (* 2 keys)))))))))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function ((integer 0 65536) (integer 0 16777216)) (or null delta-indice-motore))
                crea-delta-indice-motore))
(defun crea-delta-indice-motore (keys bytes)
  "Pre: attivazione BUSY, quota riservata. Post: membership vuota privata o NIL se disabilitata.
Nessuna chiave caller trattenuta; allocazioni solo nella manutenzione, non durante GET/PUT."
  (let ((payload (payload-delta-indice keys bytes)))
    (unless (zerop payload)
      (%make-delta-indice-motore :limit keys
        :table (make-array (/ (- payload bytes) 4) :element-type '(unsigned-byte 32) :initial-element 0)
        :arena (make-array bytes :element-type '(unsigned-byte 8) :initial-element 0)))))
