;;;; Oggetti privati posseduti da una ricostruzione.
;;; OWNER: singola chiamata; nessun riferimento al buffer rimane nel risultato.
;;; SHARED: nessuna scrittura condivisa; dopo il ritorno tutte le tabelle sono immutabili.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-008
(defstruct (manifest-limits
            (:constructor %make-manifest-limits
                (edits segments outcomes closed-per-edit removed-per-edit outcomes-per-edit bytes))
            (:conc-name %limits-))
  "Pre: verified budgets. Post: private read-only configuration; zero allowed.
Declared types checked by runtime with safety 3."
  (edits 0 :type index :read-only t)
  (segments 0 :type index :read-only t)
  (outcomes 0 :type index :read-only t)
  (closed-per-edit 0 :type u32 :read-only t)
  (removed-per-edit 0 :type u32 :read-only t)
  (outcomes-per-edit 0 :type u32 :read-only t)
  (bytes 0 :type index :read-only t))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-008
(defstruct (manifest-edit
            (:constructor %make-manifest-edit
                (flags next-id open-id closed-start closed-count removed-start removed-count outcomes))
            (:conc-name %edit-))
  "Pre: structurally verified EDIT payload. Post: temporary spans, never in result.
Caller keeps buffer stable until reconstruction ends."
  (flags 0 :type u8 :read-only t)
  (next-id 0 :type u64 :read-only t)
  (open-id 0 :type u64 :read-only t)
  (closed-start 0 :type index :read-only t)
  (closed-count 0 :type u32 :read-only t)
  (removed-start 0 :type index :read-only t)
  (removed-count 0 :type u32 :read-only t)
  (outcomes 0 :type u32 :read-only t))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-008 REQ-TXM-007
(defstruct (manifest-closed
            (:constructor %make-manifest-closed (valid-bytes outcomes)) (:conc-name %closed-))
  "Pre: verified length and owned TXID/CSN map, identical duplicates coalesced.
Post: private entry immutable after construction; no shared buffer or vector."
  (valid-bytes 0 :type u64 :read-only t)
  (outcomes (make-hash-table :test 'eql) :type hash-table :read-only t))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-008
(defstruct (manifest-state
            (:constructor %make-manifest-state (active next-id closed removed)) (:conc-name %state-))
  "Pre: valid owned initial snapshot. Post: local fold workspace.
NEXT-ID may be 2^64 only in memory to represent exhausted space."
  (active 0 :type u64)
  (next-id 1 :type (integer 1 18446744073709551616))
  (closed (make-hash-table :test 'eql) :type hash-table :read-only t)
  (removed (make-hash-table :test 'eql) :type hash-table :read-only t))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-008
(defstruct (manifest
            (:constructor %make-manifest (active next-id closed removed)) (:conc-name %manifest-))
  "Pre: completed fold and workspace no longer modified. Post: owned read-only result.
APIs expose only scalars; no internal hash table returned."
  (active 0 :type u64 :read-only t)
  (next-id 1 :type (integer 1 18446744073709551616) :read-only t)
  (closed (make-hash-table :test 'eql) :type hash-table :read-only t)
  (removed (make-hash-table :test 'eql) :type hash-table :read-only t))
