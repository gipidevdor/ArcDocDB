;;; OWNER: synchronous client, immutable borrowed inputs and exclusive caller result prefixes.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (local-client t t t t t) null) check-local-conditional-outputs))
(defun check-local-conditional-outputs (client operations expected tokens applied count)
  "Pre: READY owner, stable external inputs. Post: bounded distinct caller result ownership before encode/send.
INVALID-ARGUMENT for types/count, input/result overlap or private client scratch; caller output is untouched."
  (unless (and (typep count '(integer 1 8)) (typep operations 'simple-vector) (<= count (length operations))
               (typep expected 'local-group-csns) (<= count (length expected))
               (typep tokens 'local-group-csns) (<= count (length tokens))
               (typep applied 'b:octets) (<= count (length applied))
               (not (eq expected tokens))
               (not (or (eq expected (local-client-group-csns client)) (eq expected (local-client-read-spans client))
                        (eq tokens (local-client-group-csns client)) (eq tokens (local-client-read-spans client))))
               (not (or (eq applied (local-client-group-applied client)) (eq applied (local-client-input client))
                        (eq applied (local-client-output client)))))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-conditional-outputs))
  (dotimes (i count)
    (let ((op (svref operations i)))
      (unless (typep op 'e:operazione-scrittura)
        (error 'arcdocdb.conditions:invalid-argument :reason :local-conditional-operation))
      (when (or (eq applied (e::operazione-scrittura-key op)) (eq applied (e::operazione-scrittura-value op)))
        (error 'arcdocdb.conditions:invalid-argument :reason :local-conditional-result-alias)))) nil)

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-002 REQ-WAL-006 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t t &key (:count t)) (integer 0 8)) client-write-group-if))
(defun client-write-group-if (client operations expected tokens applied
                             &key (count (if (typep operations 'simple-vector) (length operations) 0)))
  "Pre: READY owner with :CONDITIONAL-GROUPS T, stable 1..8 distinct-key write descriptors and expected-u64 input.
Exclusive separate token-u64/applied-u8 outputs; selected :COUNT prefix. Expected zero tests absence.
Post: applied count, complete ordered outputs (1/new strong CSN or 0/current live CSN, zero for absence).
Each applied record has an independent SEAL and covering strong flush/FIFO publication before acknowledgment; no transaction.
Input/frame/capability refusal precedes send; authoritative rejection preserves output. Other exchange errors close with OUTCOME-UNKNOWN.
No result is authorized on incomplete exit; no split, downgrade or automatic retry. Private scratch clears on every exit."
  (esigi-local-client client :ready)
  (unless (local-client-conditional-groups client)
    (error 'arcdocdb.conditions:unsupported-format :reason :local-conditional-groups-not-negotiated))
  (check-local-conditional-outputs client operations expected tokens applied count)
  (let ((id (next-local-client-id client)))
    (unwind-protect
         (let ((size (encode-local-conditional-group (local-client-output client) id operations expected count
                       (local-client-space client) (local-client-limit client))))
           (run-local-client-exchange client id size +local-conditional-group-opcode+ count tokens nil applied))
      (fill (local-client-group-csns client) 0) (fill (local-client-group-applied client) 0))))
