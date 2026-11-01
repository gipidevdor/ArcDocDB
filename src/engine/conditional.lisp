;;; OWNER: the serial M1 owner; no concurrent mutation or asynchronous API reentry is admitted.
;;; SHARED: existing primary CSNs and strong writer only; no new version allocator or durable format.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-IDX-001 REQ-IDX-010 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (motore octets) u64) versione-corrente-indice-motore))
(defun versione-corrente-indice-motore (engine key)
  "Pre: READY serial owner, validated key. Post: authoritative current LIVE CSN, or zero for absence.
The existing primary/delta/paged lookup runs under BUSY, including injected I/O callbacks.
Any admitted lookup error/nonlocal exit faults admission; scratch and BUSY never escape this probe."
  (let ((complete nil) (cause nil) (words (motore-words engine)))
    (unwind-protect
         (handler-case
             (progn
               (setf (motore-busy engine) t)
               (let ((version (case (sonda-indice-motore engine key 0 (length key) (motore-index-context engine) words)
                                (:absent 0)
                                (:live (unless (plusp (aref words 0))
                                         (error 'invariant-violation :reason :engine-conditional-zero-version))
                                       (aref words 0))
                                (otherwise (error 'resource-exhausted :reason :engine-conditional-retry)))))
                 (unless (and (motore-busy engine) (eq (motore-state engine) :ready)
                              (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))
                   (error 'invariant-violation :reason :engine-conditional-state))
                 (setf complete t) version))
           (error (condition)
             (setf cause condition)
             (handler-case (guasta-motore engine condition)
               (error (cleanup) (push cleanup (motore-cleanup-failures engine))))
             (error condition)))
      (unwind-protect
           (unless (or complete cause)
             (handler-case (guasta-motore engine (make-condition 'invariant-violation :reason :engine-conditional-unwind))
               (error (cleanup) (push cleanup (motore-cleanup-failures engine)))))
        (fill words 0) (setf (motore-busy engine) nil)))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-WAL-006 REQ-MVC-006 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore (member 1 2) octets octets t)
                         (values (member :applied :conflict) u64 &optional)) scrivi-record-se-versione-motore))
(defun scrivi-record-se-versione-motore (engine kind key value expected)
  "Pre: READY serial owner and stable inputs. Post: :APPLIED/new strong CSN or :CONFLICT/current LIVE CSN (zero if absent).
Zero EXPECTED is an absence predicate, including a deleted key; positive versions prevent ABA after reinsertion.
Validate input before comparison; conflicts precede capacity checks, maintenance, CSN allocation and WAL effects.
No callback, yield or peer wait occurs between the guarded probe and entry to the existing writer.
Its preflight maintenance preserves logical versions and guards all callbacks against reentry; its strong commit is unchanged."
  (esigi-motore-pronto engine)
  (unless (typep expected 'u64) (error 'invalid-argument :reason :engine-expected-version))
  (verifica-input-scrittura-motore engine kind key value)
  (let ((current (versione-corrente-indice-motore engine key)))
    (if (= expected current)
        (values :applied (scrivi-record-motore engine kind key value))
        (values :conflict current))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-WAL-006 REQ-MVC-006
(declaim (ftype (function (motore octets octets t) (values (member :applied :conflict) u64 &optional))
                scrivi-documento-se-versione))
(defun scrivi-documento-se-versione (engine key value expected)
  "Pre: READY owner, stable key/value, expected u64 version (zero means absent).
Post: :APPLIED/new durable CSN or :CONFLICT/current LIVE CSN or zero, without effects on conflict.
No retry, rollback or exactly-once guarantee after an incomplete admitted write; ordinary strong writer fault rules apply."
  (scrivi-record-se-versione-motore engine arcdocdb.record:+put+ key value expected))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-WAL-006 REQ-MVC-006
(declaim (ftype (function (motore octets t) (values (member :applied :conflict) u64 &optional))
                cancella-documento-se-versione))
(defun cancella-documento-se-versione (engine key expected)
  "Pre: READY owner, stable key, expected u64 version (zero means absent).
Post: :APPLIED/new durable tombstone CSN or :CONFLICT/current LIVE CSN or zero without effects.
A matching absence still commits a tombstone, as ordinary DELETE does; no automatic retry."
  (scrivi-record-se-versione-motore engine arcdocdb.record:+tombstone+ key (motore-empty engine) expected))
