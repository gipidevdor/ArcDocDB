;;; OWNER: il controller costruisce un contesto per slot EBR; solo il worker lo modifica.
;;; SHARED: legami immutabili ai registri dello stesso Archivio, nessun contatore comune.
(in-package #:arcdocdb.read)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-004 REQ-MVC-005 REQ-AFF-008
(defconstant +word-generation+ 0)
(defconstant +word-snapshot-csn+ 1)
(defconstant +word-start-time+ 2)
(defconstant +word-confirmed-csn+ 3)
(deftype read-words () '(simple-array (unsigned-byte 64) (*)))

;;; REQ: REQ-CON-004 REQ-CMP-007 REQ-MVC-004 REQ-AFF-004 REQ-AFF-008
(defstruct (contesto-lettura
            (:constructor %make-contesto-lettura (reader snapshots words)) (:copier nil))
  "Pre: exclusive reader, registries from the same Archivio, four private words.
Post: inactive, no snapshot or result retained. Does not cross queues or migrations.
FAULTED prevents reuse; cleanup remains allowed after the task ends."
  (reader nil :type lettore-epoca :read-only t)
  (snapshots nil :type registro-snapshot :read-only t)
  (words #() :type (simple-array (unsigned-byte 64) (4)) :read-only t)
  (snapshot nil :type (or null contesto-snapshot))
  (state :idle :type (member :idle :entering :active :faulted)))

;;; REQ: REQ-CON-004 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (lettore-epoca registro-snapshot) contesto-lettura) crea-contesto-lettura))
(defun crea-contesto-lettura (reader snapshots)
  "Pre: controller assigns exactly one context to READER and registries from the same Archivio.
Post: context and buffers preallocated before pools start; no pin or thread created.
INVALID-ARGUMENT if the reader is already active. Total capacity bounded by EBR-domain workers."
  (when (epoca-attiva-p reader) (error 'invalid-argument :reason :read-worker-busy))
  (%make-contesto-lettura reader snapshots
                        (make-array 4 :element-type '(unsigned-byte 64) :initial-element 0)))

;;; REQ: REQ-CON-004 REQ-AFF-004
(declaim (ftype (function (contesto-lettura) (member :idle :entering :active :faulted))
                stato-contesto-lettura))
(defun stato-contesto-lettura (context)
  "Pre: owning worker or controller after join. Post: local state, without pin or mutex.
Not a concurrent worker check; no external resource returned."
  (contesto-lettura-state context))
