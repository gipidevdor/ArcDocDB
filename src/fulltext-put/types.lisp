;;; OWNER: worker fino a PREPARED, poi writer dopo handoff sincronizzato; restituzione simmetrica.
;;; SHARED: sole configurazioni immutabili fra Serie; nessun contatore o lock condiviso per PUT.
(in-package #:arcdocdb.fulltext.put)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-SEC-010 REQ-WAL-005
(defstruct (preparazione-put-full-text
             (:constructor %preparazione-put-full-text (tasks frame version document-limit key-limit)) (:copier nil))
  "Reusable private context; frame and tasks not exported. All generations
analyze the same owned bytes; captured generation prevents ABA results."
  (tasks #() :type simple-vector :read-only t) (frame #() :type octets :read-only t)
  (version 2 :type (integer 1 2) :read-only t) (document-limit 1 :type index :read-only t)
  (key-limit 1 :type index :read-only t)
  (generation 0 :type index) (size 0 :type index) (value-start 0 :type index) (row 0 :type u32)
  (validated-generation 0 :type index)
  (current 0 :type index) (active nil :type boolean) (work 0 :type index) (work-limit 268435456 :type index)
  (pool nil :type (or null f:riserve-full-text)) (slot nil :type (or null f:riserva-full-text))
  (slot-generation 0 :type index)
  (state :idle :type (member :idle :preparing :prepared :reserving :reserved :appended :cancelled :failed :faulted)))

;;; REQ: REQ-SEC-006 REQ-SEC-010
(declaim (ftype (function (t t) preparazione-put-full-text) verifica-token-put))
(defun verifica-token-put (request generation)
  "Pre: object and generation captured by caller. Post: current identity without effects.
INVALID-ARGUMENT for type/staleness; zero token is never a valid preparation."
  (unless (and (typep request 'preparazione-put-full-text) (typep generation 'index) (plusp generation)
               (= generation (preparazione-put-full-text-generation request)))
    (error 'invalid-argument :reason :fulltext-put-token))
  request)

;;; REQ: REQ-SEC-006
(declaim (ftype (function (t t) keyword) stato-put-full-text))
(defun stato-put-full-text (request generation)
  "Pre: current token, owner access. Post: state without frame, tasks, or partial results."
  (verifica-token-put request generation)
  (preparazione-put-full-text-state request))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-WAL-005
(declaim (ftype (function (preparazione-put-full-text) null) esigi-cornice-put-validata))
(defun esigi-cornice-put-validata (request)
  "Pre: exclusive request, frame/tasks never exposed. Post: current worker attestation.
Frame does not change between CRC verification/analysis and append; only inizia can invalidate it.
Rejects missing/stale attestation without rereading body under writer lease."
  (unless (and (plusp (preparazione-put-full-text-validated-generation request))
               (= (preparazione-put-full-text-generation request) (preparazione-put-full-text-validated-generation request)))
    (error 'invalid-argument :reason :fulltext-put-unvalidated))
  nil)
