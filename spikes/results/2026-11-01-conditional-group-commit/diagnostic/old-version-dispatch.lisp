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
(declaim (ftype (function (e:motore local-connection envelope &optional (or null function)) b:index) local-dispatch-version))
(defun local-dispatch-version (engine connection envelope &optional clock)
  "Pre: complete request, prior writes drained, no peer wait. Post: versioned read or atomic conditional strong mutation.
Capability/shape/read grant/deadline checked before engine admission; conflicts are successful protocol results.
Pins are released before encoding/send; incomplete writes propagate without retry or downgrade."
  (let ((out (local-connection-output connection)) (id (envelope-id envelope)) (value (local-connection-value connection)))
    (cond
      ((not (local-connection-versions connection)) (encode-local-response out id 4))
      ((not (eq :ready (e:stato-motore engine))) (encode-local-response out id 3))
      (t (multiple-value-bind (code key document operation expected)
             (decode-local-version (local-connection-input connection) envelope (local-connection-space connection))
           (when (plusp code) (return-from local-dispatch-version (encode-local-response out id code)))
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
