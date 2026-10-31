;;; OWNER: controller configura; writer costruisce frammenti e piani; worker possiede scratch.
;;; SHARED: riferimenti read-only salvo root/arena pubblicate e salute terminale.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-LIM-001
(defconstant +ctrl-empty+ 255)
(defconstant +ctrl-deleted+ 254)
(defconstant +group-size+ 16)
(defconstant +lookup-budget+ 8)
(defconstant +revision-limit+ (ash 1 60))

;;; REQ: REQ-IDX-007 REQ-AFF-008
(defstruct (root-indice (:constructor %make-root-indice (depth generation directory)) (:copier nil))
  "Pre: valid directory of 2^DEPTH canonical references. Post: immutable, no previous root.
Increasing generation <2^60; no directory array or accessor exposed by API."
  (depth 0 :type (integer 0 30) :read-only t)
  (generation 0 :type (integer 0 #.most-positive-fixnum) :read-only t)
  (directory #() :type simple-vector :read-only t))

;;; REQ: REQ-IDX-001 REQ-IDX-007 REQ-AFF-008
(defstruct (indice-primario (:constructor %make-indice-primario
                               (capacity max-depth directory-budget fragment-budget seed-high seed-low)) (:copier nil))
  "Pre: controller, limits checked before allocations. Post: domain of one Serie.
ROOT published indivisibly; writer-only REVISION without wrap; FAULTED terminal."
  (capacity 8192 :type (integer 16 65536) :read-only t)
  (max-depth 20 :type (integer 0 30) :read-only t)
  (directory-budget 8388608 :type (integer 8 #.most-positive-fixnum) :read-only t)
  (fragment-budget 8388608 :type (integer 1 #.most-positive-fixnum) :read-only t)
  (seed-high nil :type (or null u32) :read-only t)
  (seed-low nil :type (or null u32) :read-only t)
  (root nil :type (or null root-indice))
  (revision 0 :type (integer 0 #.most-positive-fixnum))
  (health :open :type (member :open :faulted)))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-AFF-008
(defstruct (frammento-indice (:constructor %make-frammento-indice
                              (owner depth prefix bank controls arena)) (:copier nil))
  "Pre: canonical domain, fixed geometry, private arrays. Post: BUILDING outside root.
Published keys are not overwritten; permanently RETIRED, retained by GC."
  (owner nil :type indice-primario :read-only t)
  (depth 0 :type (integer 0 30) :read-only t)
  (prefix 0 :type (unsigned-byte 30) :read-only t)
  (bank nil :type banco-slot :read-only t)
  (controls #() :type octets :read-only t)
  (arena #() :type octets)
  (used 0 :type (integer 0 #x100000000))
  (live 0 :type (integer 0 65536))
  (exposure :building :type (member :building :published :retired)))

;;; REQ: REQ-IDX-003 REQ-CON-004 REQ-AFF-008
(defstruct (contesto-indice (:constructor %make-contesto-indice (words)) (:copier nil))
  "Pre: preallocated per worker or writer, exclusive. Post: five-u64 scratch, no result.
Does not cross queues; no root reference retained after call."
  (words #() :type contenuto-slot :read-only t)
  (remaining 0 :type (integer 0 8))
  (busy nil :type boolean))

;;; REQ: REQ-IDX-005 REQ-IDX-007 REQ-AFF-008
(defstruct (pubblicazione-indice (:constructor %make-pubblicazione-indice
                                 (owner expected revision source first second replacement)) (:copier nil))
  "Pre: writer, one prepared rebuild or split. Post: single-use plan, rejected if REVISION changes.
Retains source/root until plan release; no external resource or durability."
  (owner nil :type indice-primario :read-only t)
  (expected nil :type root-indice :read-only t)
  (revision 0 :type fixnum :read-only t)
  (source nil :type frammento-indice :read-only t)
  (first nil :type frammento-indice :read-only t)
  (second nil :type (or null frammento-indice) :read-only t)
  (replacement nil :type root-indice :read-only t)
  (state :prepared :type (member :prepared :published :faulted)))
