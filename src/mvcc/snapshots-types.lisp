;;; OWNER: un registro snapshot per Archivio, legato al suo unico registro CSN.
;;; SHARED: metadati sotto mutex; salute solo verso FAULTED, anche dal confine Archivio senza attesa.
(in-package #:arcdocdb.mvcc)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-MVC-004 REQ-MVC-007 REQ-AFF-008
(defconstant +snapshot-free+ 0)
(defconstant +snapshot-waiting+ 1)
(defconstant +snapshot-active+ 2)
(defconstant +snapshot-closed+ 3)
(defconstant +snapshot-wait-expired+ 4)
(defconstant +snapshot-age-expired+ 5)

;;; REQ: REQ-MVC-007 REQ-AFF-008
(defstruct (registro-snapshot
            (:constructor %make-registro-snapshot
                (csns lifetime wait csns-array generations deadlines wait-deadlines states words mutex))
            (:copier nil))
  "Pre: private preallocated arrays. Post: empty registry, threshold=MAX-U64.
WORDS[0]=last generation, WORDS[1]=threshold. Generation zero indicates mutation/unassigned."
  (csns nil :type registro-csn :read-only t)
  (lifetime 1 :type u64 :read-only t) (wait 1 :type u64 :read-only t)
  (csns-array #() :type csn-words :read-only t)
  (generations #() :type csn-words :read-only t)
  (deadlines #() :type csn-words :read-only t)
  (wait-deadlines #() :type csn-words :read-only t)
  (states #() :type (simple-array (unsigned-byte 8) (*)) :read-only t)
  (words #() :type csn-words :read-only t)
  (mutex nil :type sb-thread:mutex :read-only t)
  (count 0 :type (integer 0 65536))
  (cursor 0 :type csn-slot) (sweep-cursor 0 :type csn-slot)
  (health :open :type (member :open :faulted)))

;;; REQ: REQ-MVC-004 REQ-MVC-007
(defstruct (contesto-snapshot (:constructor %make-contesto-snapshot (registry word)) (:copier nil))
  "Pre: reusable context, bound to one Archivio only. Post: unassigned identity.
WORD[0]=generation, WORD[1]=CSN. The consumer retains the original identity before reuse."
  (registry nil :type registro-snapshot :read-only t)
  (word #() :type csn-words :read-only t)
  (slot 0 :type csn-slot))

;;; REQ: REQ-MVC-004 REQ-MVC-007 REQ-AFF-008
(declaim (ftype (function (registro-csn integer integer integer) registro-snapshot)
                crea-registro-snapshot))
(defun crea-registro-snapshot (csns capacity lifetime-ticks wait-ticks)
  "Pre: one monotonic time base for all calls; durations in the same units.
Post: K fixed slots, zero snapshots. INVALID-ARGUMENT before allocation for budgets/intervals.
No global clock or thread; the caller supplies NOW from the injectable environment."
  (unless (and (<= 1 capacity +max-csn-slots+)
               (<= 1 wait-ticks lifetime-ticks +max-csn+))
    (error 'invalid-argument :reason :snapshot-registry-configuration))
  (let ((words (make-array 2 :element-type '(unsigned-byte 64) :initial-element 0)))
    (setf (aref words 1) +max-csn+)
    (%make-registro-snapshot
     csns lifetime-ticks wait-ticks
     (make-array capacity :element-type '(unsigned-byte 64) :initial-element 0)
     (make-array capacity :element-type '(unsigned-byte 64) :initial-element 0)
     (make-array capacity :element-type '(unsigned-byte 64) :initial-element 0)
     (make-array capacity :element-type '(unsigned-byte 64) :initial-element 0)
     (make-array capacity :element-type '(unsigned-byte 8) :initial-element +snapshot-free+)
     words (sb-thread:make-mutex :name "ArcDocDB: snapshot Archivio"))))

;;; REQ: REQ-MVC-007 REQ-AFF-008
(declaim (ftype (function (registro-snapshot) contesto-snapshot) crea-contesto-snapshot))
(defun crea-contesto-snapshot (registry)
  "Pre: Archivio registry. Post: preallocated context, without a reserved slot or pin.
Health checked at registration; no array exported."
  (%make-contesto-snapshot registry
                          (make-array 2 :element-type '(unsigned-byte 64) :initial-element 0)))
