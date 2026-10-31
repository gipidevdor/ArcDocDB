(in-package #:arcdocdb.fulltext.admission)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-CON-002 REQ-SEC-010
(declaim (ftype (function (riserve-full-text keyword) nil) errore-interno-riserve))
(defun errore-interno-riserve (pool reason)
  "Pre: false invariant. Post: pool FAULTED, data retained; the caller stops the Serie.
No rollback, reservation release, or ACK; propagates INVARIANT-VIOLATION."
  (setf (riserve-full-text-state pool) :faulted)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-CON-002 REQ-SEC-006 REQ-SEC-010
(declaim (ftype (function (t t) null) verifica-writer-riserve))
(defun verifica-writer-riserve (pool lease)
  "Pre: writer entry. Post: current queue/thread lease and healthy pool.
INVALID-ARGUMENT before effects for lease/type; invariants => pool FAULTED."
  (unless (typep pool 'riserve-full-text) (error 'invalid-argument :reason :fulltext-reservation-pool))
  (ex::%check-lease (riserve-full-text-queue pool) lease)
  (unless (and (eq :healthy (riserve-full-text-state pool)) (not (riserve-full-text-effect pool)))
    (errore-interno-riserve pool :fulltext-reservation-faulted))
  (unless (and (<= (riserve-full-text-count pool) (length (riserve-full-text-slots pool)))
               (= (riserve-full-text-row-count pool) (riserve-full-text-count pool))
               (= (length (riserve-full-text-rows pool)) (length (riserve-full-text-row-slots pool))
                  (length (riserve-full-text-slots pool)))
               (<= (riserve-full-text-staging-used pool) (riserve-full-text-delta-used pool)
                   (riserve-full-text-delta-limit pool))
               (<= (riserve-full-text-staging-used pool) (riserve-full-text-staging-limit pool)))
    (errore-interno-riserve pool :fulltext-reservation-counters))
  (dotimes (i (length (riserve-full-text-configs pool)))
    (unless (<= 0 (aref (riserve-full-text-used pool) i)
                (- (aref (riserve-full-text-file-limits pool) i) (aref (riserve-full-text-fixed pool) i)))
      (errore-interno-riserve pool :fulltext-reservation-file-counter)))
  nil)

;;; REQ: REQ-SEC-006 REQ-SEC-010
(declaim (ftype (function (riserve-full-text t t) riserva-full-text) verifica-token-riserva))
(defun verifica-token-riserva (pool slot generation)
  "Pre: verified writer. Post: canonical slot and captured generation, without mutations.
INVALID-ARGUMENT for a foreign/stale capability; no lookup by reusable ID."
  (unless (and (typep slot 'riserva-full-text) (eq pool (riserva-full-text-pool slot))
               (typep generation 'index) (plusp generation) (= generation (riserva-full-text-generation slot)))
    (error 'invalid-argument :reason :fulltext-reservation-token))
  (unless (and (< (riserva-full-text-position slot) (length (riserve-full-text-slots pool)))
               (eq slot (svref (riserve-full-text-slots pool) (riserva-full-text-position slot))))
    (errore-interno-riserve pool :fulltext-reservation-slot))
  slot)

;;; REQ: REQ-SEC-006 REQ-SEC-010
(declaim (ftype (function (riserve-full-text boolean) null) termina-effetto-riserve))
(defun termina-effetto-riserve (pool complete)
  "Pre: exclusive-effect cleanup. Post: incomplete exit makes it FAULTED without rollback.
Loans and costs remain for diagnosis; does not suppress the original transfer."
  (unless complete (setf (riserve-full-text-state pool) :faulted))
  (setf (riserve-full-text-effect pool) nil)
  nil)
