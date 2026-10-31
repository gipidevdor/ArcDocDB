;;; OWNER: stesso thread del writer e dell'attore I/O; contesto GET preallocato esclusivo.
;;; SHARED: nessun reader concorrente; target privato fino alla conclusione verificata.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-CON-004 REQ-CMP-007 REQ-AFF-002 REQ-AFF-008 REQ-CCH-002 REQ-CCH-004
(declaim (ftype (function (motore b:octets b:octets b:index)
                         (values (member :found :absent) b:index &optional))
                leggi-documento-corrente-motore))
(defun leggi-documento-corrente-motore (engine key target start)
  "Pre: owner, MOTORE-BUSY true, validated inputs; canonical view and exclusive GET context.
Post: FOUND with authorized byte count after cache/segment verification, copying and completion; ABSENT with zero,
without modifying TARGET. Engine clock read at startup and fresh at completion.
Every exit abandons GET; a cleanup error does not replace the primary exit."
  (let ((context (motore-get-context engine)) (clock (motore-clock engine)) (complete nil))
    (declare (type (function () b:u64) clock))
    (unwind-protect
         (multiple-value-prog1
             (let ((now (funcall clock)))
               (declare (type b:u64 now))
               (when (= now #xffffffffffffffff)
                 (error 'arcdocdb.conditions:resource-exhausted :reason :engine-get-deadline-overflow))
               ;; La firma attuale e' (context view key snapshot generation now):
               ;; per GET corrente GENERATION deve essere zero; non esiste DEADLINE.
               (case (g:avvia-get context (motore-view engine) key nil 0 now)
                 (:absent
                  (multiple-value-bind (status size) (g:concludi-get context (funcall clock))
                    (unless (and (eq status :absent) (zerop size))
                      (error 'arcdocdb.conditions:invariant-violation :reason :engine-get-absence))
                    (values :absent 0)))
                 (:candidate
                  (case (multiple-value-bind (source cache-status)
                            (if (motore-automatic-index engine) (read-automatic-record engine context)
                                (gd:leggi-record-serie-get context (motore-controller engine)))
                          (unless (eq source :buffer-required) (registra-esito-cache-motore engine cache-status))
                          source)
                    ((:cache :segment) nil)
                    (:buffer-required
                     (error 'arcdocdb.conditions:resource-exhausted :reason :engine-get-record-buffer))
                    (otherwise
                     (error 'arcdocdb.conditions:invariant-violation :reason :engine-get-source)))
                  (let* ((end (g:copia-valore-get context target start)) (copied (- end start)))
                    (multiple-value-bind (status size) (g:concludi-get context (funcall clock))
                      (unless (and (eq status :found) (= size copied) (plusp size))
                        (error 'arcdocdb.conditions:invariant-violation :reason :engine-get-result))
                      (values :found size))))
                 (:retry
                  (error 'arcdocdb.conditions:resource-exhausted :reason :engine-get-retry))
                 (otherwise
                  (error 'arcdocdb.conditions:invariant-violation :reason :engine-get-candidate))))
           (setf complete t))
      (if complete
          (g:abbandona-get context)
          ;; Preserva anche THROW/RETURN se il cleanup incontra un secondo errore.
          (handler-case (g:abbandona-get context)
            (error (cleanup) (push cleanup (motore-cleanup-failures engine))))))))

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-CON-004 REQ-AFF-002 REQ-AFF-004 REQ-LIM-001
(declaim (ftype (function (motore b:octets b:octets &key (:start b:index))
                         (values (member :found :absent) b:index &optional))
                leggi-documento))
(defun leggi-documento (engine key target &key (start 0))
  "Pre: owner thread, READY engine; stable KEY and exclusive TARGET distinct from the key;
START is an index in target, sufficient capacity for the value. Nonreentrant serial API.
Post: (values :FOUND byte-copiati) in TARGET from START, or (:ABSENT 0) without modifying it.
The default clock is the engine's no-argument function; no additional clock/I/O.
Invalid input before GET; every error in the admitted request makes it FAULTED and propagates
the same cause. On error, TARGET contents are not an authorized result."
  (esigi-motore-pronto engine)
  (unless (<= 1 (length key) arcdocdb.record:+max-key-bytes+)
    (error 'arcdocdb.conditions:invalid-argument :reason :engine-key-length))
  (b:check-range target start (length target))
  (when (eq key target)
    (error 'arcdocdb.conditions:invalid-argument :reason :engine-get-output-alias))
  (let ((complete nil) (cause nil))
    (unwind-protect
         (handler-case
             (progn
               (setf (motore-busy engine) t)
               (multiple-value-prog1 (leggi-documento-corrente-motore engine key target start)
                 (unless (and (motore-busy engine) (eq (motore-state engine) :ready)
                              (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))
                   (error 'arcdocdb.conditions:invariant-violation :reason :engine-read-state))
                 (setf complete t)))
           (error (condition)
             (setf cause condition)
             (handler-case (guasta-motore engine condition)
               (error (cleanup) (push cleanup (motore-cleanup-failures engine))))
             (error condition)))
      (unwind-protect
           (unless (or complete cause)
             (handler-case
                 (guasta-motore engine
                                (make-condition 'arcdocdb.conditions:invariant-violation
                                                :reason :engine-read-unwind))
               (error (cleanup) (push cleanup (motore-cleanup-failures engine)))))
        (setf (motore-busy engine) nil)))))
