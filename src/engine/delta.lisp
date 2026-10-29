;;; OWNER: attore M1, membership append-only tra due pubblicazioni; nessun GET concorrente.
;;; SHARED: nessuno; sonde limitate alla tabella prenotata, confronto esatto oltre il digest.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (delta-indice-motore octets index index u32 u32)
                         (values index boolean &optional)) sonda-delta-indice))
(defun sonda-delta-indice (delta key start end high low)
  "Pre: range chiave valido, delta sano seriale. Post: slot libero o identita' esatta, senza copie.
Linear probing limitato alla capacita'; tabella satura e' INVARIANT-VIOLATION, mai assenza."
  (b:check-range key start end)
  (unless (< start end) (error 'invariant-violation :reason :engine-delta-empty-key))
  (let* ((table (delta-indice-motore-table delta)) (capacity (/ (length table) 4))
         (mask (1- capacity)) (arena (delta-indice-motore-arena delta)))
    (dotimes (step capacity)
      (let* ((slot (* 4 (logand (+ low step) mask))) (size (aref table (+ slot 3))))
        (when (zerop size) (return-from sonda-delta-indice (values slot nil)))
        (when (and (= high (aref table slot)) (= low (aref table (+ slot 1))) (= size (- end start)))
          (let ((offset (aref table (+ slot 2))))
            (when (null (mismatch key arena :start1 start :end1 end :start2 offset :end2 (+ offset size)))
              (return-from sonda-delta-indice (values slot t)))))))
    (error 'invariant-violation :reason :engine-delta-table-full)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (motore octets boolean) null) registra-chiave-delta-motore))
(defun registra-chiave-delta-motore (engine key publish)
  "Pre: owner READY preflight, oppure BUSY prima del CSN quando PUBLISH vero.
Post: capienza verificata senza effetti, oppure membership copiata prima del WAL.
Esaurimento ordinario preserva READY nel preflight; commit incompleto impone FAULTED."
  (esigi-owner-motore engine)
  (let ((delta (motore-delta engine)))
    (when delta
      (unless (motore-paged engine) (error 'invariant-violation :reason :engine-delta-without-image))
      (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key 0 (length key))
        (multiple-value-bind (slot found) (sonda-delta-indice delta key 0 (length key) high low)
          (unless found
            (let* ((used (delta-indice-motore-used delta)) (end (+ used (length key)))
                   (table (delta-indice-motore-table delta)))
              (when (or (= (delta-indice-motore-count delta) (delta-indice-motore-limit delta))
                        (> end (length (delta-indice-motore-arena delta))))
                (error 'resource-exhausted :reason :engine-delta-capacity))
              (when publish
                (unless (motore-busy engine) (error 'invariant-violation :reason :engine-delta-admission))
                (replace (delta-indice-motore-arena delta) key :start1 used)
                (setf (aref table slot) high (aref table (+ slot 1)) low
                      (aref table (+ slot 2)) used (aref table (+ slot 3)) (length key)
                      (delta-indice-motore-used delta) end)
                (incf (delta-indice-motore-count delta)))))))))
  nil)

;;; REQ: REQ-IDX-010 REQ-IDX-001
(declaim (ftype (function (motore octets index index) boolean) chiave-nel-delta-motore-p))
(defun chiave-nel-delta-motore-p (engine key start end)
  "Pre: GET BUSY seriale, range valido. Post: T solo per identita' di una chiave toccata.
NIL senza delta; digest uguali non sostituiscono il confronto dei byte, nessuna allocazione."
  (esigi-owner-motore engine)
  (unless (motore-busy engine) (error 'invariant-violation :reason :engine-delta-read-admission))
  (let ((delta (motore-delta engine)))
    (if delta
        (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key start end)
          (nth-value 1 (sonda-delta-indice delta key start end high low)))
        nil)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-001
(declaim (ftype (function (motore octets) null) verifica-capienza-delta-motore))
(defun verifica-capienza-delta-motore (engine key)
  "Pre: owner READY, input validato. Post: quota ammessa senza mutazioni o CSN.
RESOURCE-EXHAUSTED resta ordinario; ogni guasto interno rende FAULTED conservando la primaria."
  (handler-case (registra-chiave-delta-motore engine key nil)
    (resource-exhausted (condition) (error condition))
    (error (condition)
      (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition)))
      (error condition)))
  nil)
