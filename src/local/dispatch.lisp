;;; OWNER: stesso attore del motore; buffer di risposta gia' riservato alla connessione.
;;; SHARED: nessun lease/pin esce da questa chiamata; attesa peer soltanto dopo il ritorno.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-REC-001 REQ-AFF-008
(defun local-record-validator (space)
  "Pre: private startup scratch. Post: readonly callback for the entire committed prefix.
Rejects incompatible Archivio instances before checkpoint or listener, including historical values."
  (lambda (kind buffer ks ke vs ve)
    (unless (<= 1 (- ke ks) 1024)
      (error 'arcdocdb.conditions:unsupported-format :reason :local-stored-key-budget))
    (when (= kind arcdocdb.record:+put+)
      (unless (<= 1 (- ve vs) 60000)
        (error 'arcdocdb.conditions:unsupported-format :reason :local-stored-document-budget))
      (arcdocdb.cbor:verifica-struttura-cbor-minima buffer vs ve space
        :max-bytes 60000 :max-nodes 60000 :max-depth 100))
    nil))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-IDX-001
(defun local-execute (engine connection id opcode key document)
  "Pre: validated arguments, admitted ID, maximum response already reserved. Post: terminal frame.
PUT/DELETE respond after strong; GET finishes copying and releases the pin before sending."
  (let ((out (local-connection-output connection)))
    (case opcode
      (0 (encode-local-response out id 0))
      (1 (encode-local-response out id 0 :csn (e:scrivi-documento engine key document)))
      (2 (multiple-value-bind (status size)
             (e:leggi-documento engine key (local-connection-value connection))
           (encode-local-response out id 0 :found (eq status :found)
             :document (local-connection-value connection) :document-end size)))
      (3 (encode-local-response out id 0 :csn (e:cancella-documento engine key)))
      (otherwise (error 'arcdocdb.conditions:invariant-violation :reason :local-dispatch-opcode)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(defun local-dispatch-command (engine connection id opcode status key document)
  "Pre: decoded envelope/arguments and reserved output. Post: response after the normal admission checks.
One command decoder feeds both immediate dispatch and the same-turn write collector; no duplicate decode."
  (let ((out (local-connection-output connection)))
    (cond
      ((plusp status) (encode-local-response out id status))
      ((not (eq :ready (e:stato-motore engine))) (encode-local-response out id 3))
      ((and (= opcode 2) (< (local-connection-limit connection) 60032)) (encode-local-response out id 5))
      (t (handler-case (local-execute engine connection id opcode key document)
           (arcdocdb.conditions:resource-exhausted (condition)
             (unless (eq :ready (e:stato-motore engine)) (error condition))
             (encode-local-response out id 2)))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection envelope &optional (or null function)) b:index) local-dispatch))
(defun local-dispatch (engine connection envelope &optional clock)
  "Pre: valid envelope and ID; one owner, private buffers. Post: response or propagated fault.
Only RESOURCE-EXHAUSTED with engine still READY is a rejection before admission.
An admitted fault is not translated into busy; the service closes, preserving the cause."
  (case (envelope-code envelope)
    (4 (local-dispatch-write-group engine connection envelope clock))
    (5 (local-dispatch-read-group engine connection envelope clock))
    (6 (local-dispatch-version engine connection envelope clock))
    (7 (local-dispatch-conditional-group engine connection envelope clock))
    (otherwise (multiple-value-bind (status key document)
          (decode-local-command (local-connection-input connection) envelope (local-connection-space connection))
        (local-dispatch-command engine connection (envelope-id envelope) (envelope-code envelope) status key document)))))
