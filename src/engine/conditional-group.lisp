;;; OWNER: serial M1 actor; only conditional keys independent of all preceding operations.
;;; SHARED: canonical primary CSNs and existing strong group writer; no peer wait or speculative CSN.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-TXS-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (conditional-group-workspace) null) clear-conditional-group))
(defun clear-conditional-group (work)
  "Pre: owning engine, last use complete. Post: no borrowed inputs or scalar results retained on any exit."
  (fill (conditional-group-workspace-operations work) nil) (fill (conditional-group-workspace-positions work) 0)
  (fill (conditional-group-workspace-applied work) 0) (fill (conditional-group-workspace-tokens work) 0)
  (fill (conditional-group-workspace-csns work) 0) nil)

;;; REQ: REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore t t t t t t) null) validate-conditional-group))
(defun validate-conditional-group (engine operations conditions expected tokens applied count)
  "Pre: READY owner and stable borrowed arrays. Post: all domains/aliases/ordinary frames and independence checked before probes.
Invalid input leaves outputs and files unchanged. NIL conditions means all selected keys are conditional and distinct."
  (let ((work (motore-conditional-workspace engine)))
    (unless (and (typep operations 'simple-vector) (typep count '(integer 1 8)) (<= count (length operations))
                 (typep conditions '(or null octets)) (typep applied 'octets)
                 (typep expected '(simple-array (unsigned-byte 64) (*)))
                 (typep tokens '(simple-array (unsigned-byte 64) (*)))
                 (or (null conditions) (<= count (length conditions)))
                 (<= count (length expected)) (<= count (length tokens)) (<= count (length applied))
                 (not (eq conditions applied)) (not (eq expected tokens))
                 (not (eq operations (conditional-group-workspace-operations work)))
                 (not (or (eq tokens (conditional-group-workspace-tokens work)) (eq tokens (conditional-group-workspace-csns work))))
                 (not (or (eq applied (conditional-group-workspace-applied work)) (eq applied (conditional-group-workspace-positions work)))))
      (error 'invalid-argument :reason :engine-conditional-group-input))
    (dotimes (i count)
      (let ((op (svref operations i)))
        (unless (and (typep op 'operazione-scrittura) (or (null conditions) (member (aref conditions i) '(0 1))))
          (error 'invalid-argument :reason :engine-conditional-group-operation))
        (when (or (eq applied (operazione-scrittura-key op)) (eq applied (operazione-scrittura-value op)))
          (error 'invalid-argument :reason :engine-conditional-group-alias))
        (verifica-input-scrittura-motore engine (operazione-scrittura-kind op) (operazione-scrittura-key op)
          (or (operazione-scrittura-value op) (motore-empty engine)))))
    (dotimes (i count)
      (when (or (null conditions) (= 1 (aref conditions i)))
        (dotimes (j i)
          (when (equalp (operazione-scrittura-key (svref operations j)) (operazione-scrittura-key (svref operations i)))
            (error 'invalid-argument :reason :engine-conditional-group-dependency))))))
  nil)

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (motore simple-vector (or null octets) (simple-array (unsigned-byte 64) (*)) (integer 1 8)) (integer 0 8))
                project-conditional-group))
(defun project-conditional-group (engine operations conditions expected count)
  "Pre: validated independence, serial owner and empty scratch. Post: packed applicable operations and complete private conflict tokens.
Each authoritative lookup runs under the existing BUSY guard; no callbacks/yields between probes and writer entry.
Preceding writes cannot affect a conditional key; ordinary later writes retain FIFO semantics."
  (let* ((work (motore-conditional-workspace engine)) (packed (conditional-group-workspace-operations work)) (kept 0))
    (dotimes (i count)
      (let* ((op (svref operations i))
             (current (if (or (null conditions) (= 1 (aref conditions i)))
                          (versione-corrente-indice-motore engine (operazione-scrittura-key op)) 0)))
        (setf (aref (conditional-group-workspace-tokens work) i) current)
        (when (or (and conditions (zerop (aref conditions i))) (= current (aref expected i)))
          (setf (svref packed kept) op (aref (conditional-group-workspace-positions work) kept) i
                (aref (conditional-group-workspace-applied work) i) 1)
          (incf kept)))) kept))

;;; REQ: REQ-TXS-002 REQ-WAL-002 REQ-WAL-006 REQ-MVC-008 REQ-AFF-004
(declaim (ftype (function (motore t t t t t t) (integer 0 8)) scrivi-gruppo-con-condizioni))
(defun scrivi-gruppo-con-condizioni (engine operations conditions expected tokens applied count)
  "Pre: internal serial owner, selected 1..8 stable descriptors; conditional flag 1, ordinary 0; NIL means all conditional.
No conditional key equals an earlier operation key. Separate exclusive output prefixes, no caller access to private scratch.
Post: applicable count and complete APPLIED bytes/CSNs or conflict LIVE tokens after one existing strong group.
Each valid independent SEAL commits its record; acknowledgment follows the covering strong flush and FIFO publication.
Conflicts consume no CSN; an all-conflict group performs no writer preflight/maintenance/append/flush.
Known input/capacity refusal preserves outputs. Existing admitted lookup/write faults propagate without retry.
Independent SEALs retain prefix recovery: this is not a transaction. Scratch clears on every exit."
  (esigi-motore-pronto engine)
  (let ((work (motore-conditional-workspace engine)))
    (unwind-protect
         (progn
           (validate-conditional-group engine operations conditions expected tokens applied count)
           (let ((kept (project-conditional-group engine operations conditions expected count)))
             (when (plusp kept)
               (scrivi-gruppo-documenti engine (conditional-group-workspace-operations work)
                 (conditional-group-workspace-csns work) :count kept)
               (dotimes (i kept)
                 (setf (aref (conditional-group-workspace-tokens work) (aref (conditional-group-workspace-positions work) i))
                       (aref (conditional-group-workspace-csns work) i))))
             (replace tokens (conditional-group-workspace-tokens work) :end1 count :end2 count)
             (replace applied (conditional-group-workspace-applied work) :end1 count :end2 count) kept))
      (clear-conditional-group work))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-WAL-002 REQ-WAL-006 REQ-IDX-013 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (motore t t t t &key (:count t)) (integer 0 8)) scrivi-gruppo-documenti-se-versione))
(defun scrivi-gruppo-documenti-se-versione (engine operations expected tokens applied
                                         &key (count (if (typep operations 'simple-vector) (length operations) 0)))
  "Pre: READY serial owner; stable simple vector of 1..8 distinct-key write descriptors and simple u64 EXPECTED input.
Exclusive separate simple u64 TOKENS and octet APPLIED outputs; COUNT selects bounded prefixes, no private engine scratch.
Post: applied count and complete per-member results, 1/new strong CSN or 0/current live CSN (zero if absent); tails unchanged.
All inputs and independence validated before probes. Conflicts consume no CSN; all-conflict groups skip writer maintenance.
Applied records retain independent SEALs and one covering strong flush/FIFO publication before return, not a transaction.
Known input/capacity refusal preserves outputs. Admitted errors/nonlocal exits fault without acknowledgment or automatic retry;
recovery may retain a sealed prefix. Scratch clears on every exit; no new condition array or caller reference is retained."
  (scrivi-gruppo-con-condizioni engine operations nil expected tokens applied count))
