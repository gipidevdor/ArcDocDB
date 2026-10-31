;;; OWNER: writer locale prepara il contenuto immutabile prima dell'adozione WAL.
;;; SHARED: fonti raggiungibili dal SOLO CAS esistente del controller Serie.
(in-package #:arcdocdb.get.directory)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-008
(defstruct (fonti-get-serie (:constructor %make-fonti-get-serie (directory content)) (:copier nil))
  "Pre: verified CLOSED directory and immutable caller content.
Post: two immutable references; no index, FD, or array duplicated.
The controller retains all sources needed by candidates of readers already admitted."
  (directory nil :type directory-get-serie :read-only t)
  (content nil :type t :read-only t))

;;; REQ: REQ-IDX-001 REQ-AFF-008 REQ-CMP-007
(declaim (ftype (function (directory-get-serie &key (:content t)) fonti-get-serie) crea-fonti-get-serie)
         (ftype (function (fonti-get-serie) t) contenuto-fonti-get-serie))
(defun crea-fonti-get-serie (directory &key (content nil))
  "Pre: complete directory, content/graph immutable until the last reader finishes.
Post: private container ready as a CLOSED root or the content of an ACTIVE root.
TYPE-ERROR for a directory of the wrong type; does not publish or certify lifetime/manifest."
  (%make-fonti-get-serie directory content))

;;; REQ: REQ-IDX-001 REQ-WAL-006
(defun contenuto-fonti-get-serie (sources)
  "Pre: sources prepared or acquired under EBR. Post: caller's original content.
Does not prove publication, immutability of the external graph, or quiescence for reclaim."
  (fonti-get-serie-content sources))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (directory-get-serie u32) boolean) contiene-segmento-directory-get))
(defun contiene-segmento-directory-get (directory id)
  "Pre: immutable canonical directory. Post: ID presence determined with at most seventeen pivots.
Used to reject ACTIVE duplicated in CLOSED; no allocation, I/O, or row lookup.
Impossible geometry/convergence raises INVARIANT-VIOLATION; the caller applies its own fail-stop."
  (let ((ids (directory-get-serie-ids directory)) (left 0) (right (conta-segmenti-directory-get directory)))
    (declare (type index left right))
    (unless (and (= right (length (directory-get-serie-maps directory))) (<= right +directory-max-segments+))
      (error 'invariant-violation :reason :directory-shape))
    (loop repeat +directory-search-attempts+
          do (when (= left right) (return-from contiene-segmento-directory-get nil))
             (let* ((middle (+ left (floor (- right left) 2))) (actual (aref ids middle)))
               (cond ((< actual id) (setf left (1+ middle)))
                     ((> actual id) (setf right middle))
                     (t (return-from contiene-segmento-directory-get t)))))
    (unless (= left right) (error 'invariant-violation :reason :directory-search-bound))
    nil))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-001
(declaim (ftype (function (sorgente-get-attiva t fonti-get-serie) null) verifica-fonti-get-attive))
(defun verifica-fonti-get-attive (source lease sources)
  "Pre: immutable sources and ACTIVE source. Post: lease/health, owner, and nonduplicated ID verified.
INVALID-ARGUMENT before any adoption; impossible geometry => Archivio FAULTED.
No I/O/publication; lifetime and location coverage remain the writer's responsibility."
  (let* ((directory (fonti-get-serie-directory sources))
         (segment (sorgente-get-attiva-segment source))
         (controller (sorgente-get-attiva-controller source)))
    (arcdocdb.series::%check-owner controller lease)
    (arcdocdb.series::%require-healthy controller)
    (unless (eq (directory-get-serie-view directory) (segmento-get-owner segment))
      (error 'invalid-argument :reason :sources-owner))
    (handler-case
        (when (contiene-segmento-directory-get directory (segmento-get-low segment))
          (error 'invalid-argument :reason :sources-active-duplicate))
      (invariant-violation (condition)
        (arcdocdb.series::%mark-fault controller :archive)
        (error condition)))
    nil))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva t fonti-get-serie) radice-get-attiva)
                inizializza-fonti-get-attive))
(defun inizializza-fonti-get-attive (source lease sources)
  "Pre: new ACTIVE with only a durable header, EDIT decided, recovered sources; admission closed.
Post: empty ACTIVE root with CLOSED sources accessible through the canonical CAS, without a batch/CSN/I/O.
Owner/duplicate rejected before the effect; frontier/startup conditions propagated from the factory.
The caller retains sources and FDs under EBR; the first batch uses the returned root as PREVIOUS."
  (verifica-fonti-get-attive source lease sources)
  (inizializza-radice-get-attiva source lease :content sources))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007
(declaim (ftype (function (sorgente-get-attiva t arcdocdb.wal:lotto (or null radice-get-attiva)
                          fonti-get-serie (member :async :group :strong))
                         (values arcdocdb.series:commit-serie index radice-get-attiva &optional))
                registra-lotto-fonti-get-attivo))
(defun registra-lotto-fonti-get-attivo (source lease batch previous sources level)
  "Pre: lease and SEALED/CSN from the normal ACTIVE protocol; immutable sources and content.
Post: planned root with sources from the same view and ACTIVE ID absent from CLOSED.
INVALID-ARGUMENT before adoption for owner/duplicate; the rest is delegated to the WAL protocol.
Only PUBBLICA-COMMIT-SERIE makes the root visible; SEAL preserves the durable point."
  (verifica-fonti-get-attive source lease sources)
  (registra-lotto-get-attivo source lease batch previous sources level))
