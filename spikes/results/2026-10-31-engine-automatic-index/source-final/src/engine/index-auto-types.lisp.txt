;;; OWNER: one serial engine; quotas cover reachable buffers and simultaneous migration roots.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-LIM-003
(defstruct (politica-indice-automatico (:constructor %make-politica-indice-automatico (budget size frames max-bytes))
                                    (:copier nil))
  "Pre: validated finite per-Serie grant. Post: immutable automatic policy; no manual backend selection."
  (budget 0 :type index :read-only t)
  (size 4096 :type (member 4096 16384 65536) :read-only t)
  (frames 16 :type (integer 1 4096) :read-only t)
  (max-bytes 1099511627776 :type index :read-only t))

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (&key (:budget t) (:page-size t) (:frames t) (:max-file-bytes t))
                         politica-indice-automatico) crea-politica-indice-automatico))
(defun crea-politica-indice-automatico (&key (budget (floor (sb-ext:dynamic-space-size) 4))
                                          (page-size 4096) (frames 16) (max-file-bytes (ash 1 40)))
  "Pre: finite explicit quota or one quarter of configured SBCL dynamic space. Post: immutable validated policy.
This is a per-Serie grant, not a measurement of free physical RAM. Rejects invalid geometry before I/O."
  (unless (and (typep budget '(integer 1 #.most-positive-fixnum))
               (typep max-file-bytes '(integer 262272 #.(1- (ash 1 60)))))
    (error 'invalid-argument :reason :engine-auto-budget))
  (when (> (* 2 (d:disk-index-charge page-size frames)) budget)
    (error 'resource-exhausted :reason :engine-auto-fixed-budget))
  (%make-politica-indice-automatico budget page-size frames max-file-bytes))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(defstruct (automatic-index-controller (:constructor %make-automatic-index-controller) (:copier nil))
  "Pre: validated policy before admission. Post: one mutable owner; no full resident root retained in paged mode."
  (policy nil :type politica-indice-automatico :read-only t)
  (budget 0 :type index)
  (fixed 0 :type index :read-only t)
  (resident-charge 0 :type index)
  (count 0 :type index)
  (key-bytes 0 :type index)
  (capacity 16 :type (integer 16 65536) :read-only t)
  (arena 1 :type index :read-only t)
  (high 0 :type u32 :read-only t)
  (low 0 :type u32 :read-only t)
  (highs #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (lows #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (rows #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (map nil :type (or null r:mappa-segmento-get))
  (map-source nil :type (or null r:mappa-segmento-get))
  (disk nil :type (or null d:disk-index))
  (ordinal 0 :type index)
  (return-cost 0 :type index)
  (transitions 0 :type index))
