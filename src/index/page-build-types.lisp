;;; OWNER: un costruttore per attore I/O; derivati privati fino alla futura pubblicazione.
;;; SHARED: nessuno; input a lotti limitati, nessun inventario globale di PageRef.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003
(defstruct (costruttore-pagine (:constructor %make-costruttore-pagine
                               (domain size sink preflight seed-high seed-low max-pages offset body buffer plan external heads))
                              (:copier nil))
  "Pre: factory, private resources, trusted sink. Post: bounded append-only sequence.
No commit or published root; incomplete effect causes FAULTED without offset reuse."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (domain nil :type identita-pagina :read-only t)
  (size 4096 :type (member 4096 16384 65536) :read-only t)
  (sink #'identity :type function :read-only t)
  (preflight #'identity :type function :read-only t)
  (seed-high 0 :type u32 :read-only t) (seed-low 0 :type u32 :read-only t)
  (max-pages 1 :type index :read-only t)
  (offset 4096 :type page-number)
  (written 0 :type index)
  (file nil :type (or null arcdocdb.io:file-io))
  (state :open :type (member :open :faulted :sealed)) (busy nil :type boolean)
  (body #() :type octets :read-only t) (buffer #() :type octets :read-only t)
  (plan #() :type simple-vector :read-only t)
  (external #() :type octets :read-only t)
  (heads #() :type (simple-array (unsigned-byte 64) (*)) :read-only t))

;;; REQ: REQ-IDX-001 REQ-IDX-009
(defstruct (entry-costruzione (:constructor %make-entry-costruzione (owner key high low csn location bytes)) (:copier nil))
  "Pre: validated factory. Post: copied key and immutable ordinary candidate.
No record declared committed by this structure; caller's authority."
  (owner nil :type costruttore-pagine :read-only t) (key #() :type octets :read-only t)
  (high 0 :type u32 :read-only t) (low 0 :type u32 :read-only t)
  (csn 1 :type u64 :read-only t) (location 0 :type u64 :read-only t) (bytes 0 :type u32 :read-only t))

;;; REQ: REQ-IDX-009 REQ-LIM-003
(defstruct (riferimento-costruito (:constructor %make-riferimento-costruito
                                  (owner identity kind count ceiling high-and high-or low-and low-or)) (:copier nil))
  "Pre: all subset pages delivered to sink. Post: local proof with digest summary.
Does not prove flush, global uniqueness, or MVCC visibility; retains no children or keys."
  (owner nil :type costruttore-pagine :read-only t) (identity nil :type identita-pagina :read-only t)
  (kind :bucket :type (member :bucket :directory) :read-only t)
  (count 0 :type index :read-only t) (ceiling 0 :type (integer 0 64) :read-only t)
  (high-and #xffffffff :type u32 :read-only t) (high-or 0 :type u32 :read-only t)
  (low-and #xffffffff :type u32 :read-only t) (low-or 0 :type u32 :read-only t))
