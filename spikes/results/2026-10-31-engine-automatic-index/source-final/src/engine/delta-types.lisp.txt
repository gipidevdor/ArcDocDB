;;; OWNER: attore M1; chiavi e location private, mai condivise o prestate.
;;; SHARED: nessuno; memoria prenotata durante l'attivazione seriale.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defconstant +delta-slot-payload+ 57
  "Array payload per slot: four u32 metadata words, five u64 location words, one state byte.")

;;; REQ: REQ-IDX-011 REQ-LIM-003
(defstruct (delta-indice-motore (:constructor %make-delta-indice-motore) (:copier nil))
  "Pre: private zeroed arrays, validated capacity and canonical seed. Post: exact committed overlay.
State 0 is unpublished, 1 LIVE, 2 TOMBSTONE; public reads require the sole M1 owner."
  (limit 1 :type (integer 1 65536) :read-only t)
  (seed-high 0 :type u32 :read-only t)
  (seed-low 0 :type u32 :read-only t)
  (table #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (content #() :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (states #() :type octets :read-only t)
  (arena #() :type octets :read-only t)
  (count 0 :type u32)
  (used 0 :type u32))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (t t) index) payload-delta-indice))
(defun payload-delta-indice (keys bytes)
  "Pre: configurazione caller non fidata. Post: payload esatto dei quattro array o INVALID-ARGUMENT.
Zero/zero disabilita; altrimenti 1..65536 chiavi, 1..16 MiB arena; tabella al piu' meta' piena."
  (unless (and (typep keys '(integer 0 65536)) (typep bytes '(integer 0 16777216)))
    (error 'invalid-argument :reason :engine-delta-configuration))
  (if (zerop keys)
      (progn (unless (zerop bytes) (error 'invalid-argument :reason :engine-delta-configuration)) 0)
      (progn
        (when (zerop bytes) (error 'invalid-argument :reason :engine-delta-configuration))
        (+ bytes (* +delta-slot-payload+ (ash 1 (integer-length (1- (* 2 keys)))))))))

;;; REQ: REQ-IDX-011 REQ-LIM-003
(declaim (ftype (function (delta-indice-motore) index) payload-delta-allocato))
(defun payload-delta-allocato (delta)
  "Pre: private delta arrays. Post: exact element bytes retained across activation/renewal.
Objects, headers, and GC are excluded; no allocation or mutation."
  (+ (* 4 (length (delta-indice-motore-table delta)))
     (* 8 (length (delta-indice-motore-content delta)))
     (length (delta-indice-motore-states delta)) (length (delta-indice-motore-arena delta))))

;;; REQ: REQ-IDX-011 REQ-LIM-003
(declaim (ftype (function ((integer 0 65536) (integer 0 16777216) &optional u32 u32) (or null delta-indice-motore))
                crea-delta-indice-motore))
(defun crea-delta-indice-motore (keys bytes &optional (seed-high 0) (seed-low 0))
  "Pre: BUSY activation, reserved payload and stable seed. Post: private empty overlay or NIL.
Allocations are confined to maintenance; no caller key retained or GET/PUT allocation."
  (let ((payload (payload-delta-indice keys bytes)))
    (unless (zerop payload)
      (let* ((capacity (/ (- payload bytes) +delta-slot-payload+))
             (delta (%make-delta-indice-motore :limit keys :seed-high seed-high :seed-low seed-low
                      :table (make-array (* capacity 4) :element-type '(unsigned-byte 32) :initial-element 0)
                      :content (make-array (* capacity 5) :element-type '(unsigned-byte 64) :initial-element 0)
                      :states (make-array capacity :element-type '(unsigned-byte 8) :initial-element 0)
                      :arena (make-array bytes :element-type '(unsigned-byte 8) :initial-element 0))))
        (unless (= (length (delta-indice-motore-table delta)) (* 4 (length (delta-indice-motore-states delta))))
          (error 'invariant-violation :reason :engine-delta-layout))
        (unless (= payload (payload-delta-allocato delta))
          (error 'invariant-violation :reason :engine-delta-payload))
        delta))))
