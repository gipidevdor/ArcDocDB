;;; OWNER: recovery esclusivo mantiene vettore, CONTROL e tutti i FD readonly fino al termine del publisher.
;;; SHARED: tabella seen privata; unico punto atomico e gettone restano nel publisher CONTROL canonico.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (control-recuperato simple-vector &key (:max-segmenti index)) null)
                verifica-closed-completi))
(defun verifica-closed-completi (control closed &key (max-segmenti 65536))
  "Pre: complete stable vector of read-only results from the same CONTROL, exclusive controller.
Post: all and only manifest CLOSED, once per complete ID, with exact P and open FDs.
Budget before seen table; INVALID-ARGUMENT for count/authority/duplicate/frontier, IO-FAULT for lifetime.
Does not verify names/inodes, reread files, admit traffic, or make a change durable."
  (arcdocdb.io::esigi-aperto (arcdocdb.control::control-recuperato-input control) :input)
  (let ((manifest (manifest-control-recuperato control)) (count (length closed)))
    (when (> count max-segmenti) (error 'resource-exhausted :reason :closed-recovery-set-budget))
    (unless (= count (numero-segmenti-chiusi manifest))
      (error 'invalid-argument :reason :closed-recovery-set-count))
    (let ((seen (make-hash-table :test 'eql :size (max 1 count))))
      (loop for item across closed
            do (let* ((entry (the closed-recuperato item)) (id (closed-recuperato-id entry)))
                 (unless (eq (closed-recuperato-control entry) control)
                   (error 'invalid-argument :reason :closed-recovery-set-control))
                 (arcdocdb.io::esigi-aperto (closed-recuperato-input entry) :input)
                 (multiple-value-bind (state prefix outcomes) (trova-segmento manifest id)
                   (declare (ignore outcomes)) ; già verificati nel lettore; nessun esito d'errore.
                   (unless (and (eq state :closed) (= prefix (closed-recuperato-prefix entry)))
                     (error 'invalid-argument :reason :closed-recovery-set-prefix)))
                 (when (gethash id seen) (error 'invalid-argument :reason :closed-recovery-set-duplicate))
                 (setf (gethash id seen) t)))
      (unless (= (hash-table-count seen) count)
        (error 'invariant-violation :reason :closed-recovery-set-consumption)))
    (arcdocdb.io::esigi-aperto (arcdocdb.control::control-recuperato-input control) :input))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-TXM-007 REQ-AFF-001 REQ-AFF-018
(declaim (ftype (function (control-preparato active-recuperato simple-vector &key (:max-segmenti index))
                         control-pubblicato) pubblica-control-con-closed))
(defun pubblica-control-con-closed (prepared active closed &key (max-segmenti 65536))
  "Pre: I/O pool, exclusive recovery and reconciled inventory/namespaces, capabilities kept live.
Post: old CLOSED set verified before claim, then canonical ACTIVE closure/transition/publisher.
Atomicity point: CONTROL rename; acknowledgment after parent fsync, same errors/terminal states as publisher.
No new token, segment reading, CSN, decision forgetting, or traffic admission."
  (verifica-closed-completi (arcdocdb.recovery.active::active-recuperato-control active)
                          closed :max-segmenti max-segmenti)
  (pubblica-control-da-active prepared active))
