;;; OWNER: serial service actor; prior writes drained, existing value/output buffers reserved.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (e:motore (member 1 3) b:octets (or null b:octets) b:u64)
                         (values (member 0 2) (member :applied :conflict) b:u64 &optional)) local-version-mutation))
(defun local-version-mutation (engine operation key document expected)
  "Pre: validated request and serial owner. Post: authoritative conflict or completed strong write; preflight resource refusal is 2.
Only the engine call is caught: later encoding/deadline failures cannot become a false pre-write rejection."
  (handler-case
      (multiple-value-bind (status version)
          (if (= operation 1) (e:scrivi-documento-se-versione engine key document expected)
              (e:cancella-documento-se-versione engine key expected))
        (values 0 status version))
    (arcdocdb.conditions:resource-exhausted (condition)
      (unless (eq :ready (e:stato-motore engine)) (error condition))
      (values 2 :conflict 0))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-WAL-006 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection b:u64 (member 0 1 5) (or null b:octets) (or null b:octets)
                                  (member 0 1 3) b:u64 (or null function)) b:index) local-dispatch-version-command))
(defun local-dispatch-version-command (engine connection id code key document operation expected clock)
  "Pre: whole decoded request and drained earlier writes. Post: checked version result or authoritative refusal.
Shared by immediate dispatch and collector fallback; encoding remains outside the engine resource catch."
  (let ((out (local-connection-output connection)) (value (local-connection-value connection)))
    (cond
      ((not (local-connection-versions connection)) (encode-local-response out id 4))
      ((not (eq :ready (e:stato-motore engine))) (encode-local-response out id 3))
      ((plusp code) (encode-local-response out id code))
      (t (progn
           (check-local-read-group-deadline connection clock)
           (if (zerop operation)
               (if (< (local-connection-limit connection) 60040) (encode-local-response out id 5)
                   (multiple-value-bind (status size version) (e:leggi-documento-con-versione engine key value)
                     (check-local-read-group-deadline connection clock)
                     (encode-local-version-response out id operation (eq :found status) version value size)))
               (multiple-value-bind (rejection status version) (local-version-mutation engine operation key document expected)
                 (check-local-read-group-deadline connection clock)
                 (if (plusp rejection) (encode-local-response out id rejection)
                     (encode-local-version-response out id operation (eq :applied status) version value 0)))))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection envelope &optional (or null function)) b:index) local-dispatch-version))
(defun local-dispatch-version (engine connection envelope &optional clock)
  "Pre: complete request and drained earlier writes. Post: versioned GET or conditional strong result.
Unnegotiated/unavailable requests reject before decode; no peer wait, retry or unknown-outcome downgrade."
  (cond
    ((not (local-connection-versions connection)) (encode-local-response (local-connection-output connection) (envelope-id envelope) 4))
    ((not (eq :ready (e:stato-motore engine))) (encode-local-response (local-connection-output connection) (envelope-id envelope) 3))
    (t (multiple-value-bind (code key document operation expected)
           (decode-local-version (local-connection-input connection) envelope (local-connection-space connection))
         (local-dispatch-version-command engine connection (envelope-id envelope) code key document operation expected clock)))))
