;;; OWNER: controller conserva directory e FD fino al reclaim EBR autorizzato.
;;; SHARED: gli array copiati sono privati e immutabili dopo la costruzione.
(in-package #:arcdocdb.get.directory)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(defconstant +directory-max-segments+ 65536)
(defconstant +directory-search-attempts+ 17)
(defconstant +directory-entry-bytes+ 12) ; u32 + riferimento su SBCL a 64 bit.
(deftype directory-ids () '(simple-array (unsigned-byte 32) (*)))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-008
(defstruct (directory-get-serie
             (:constructor %make-directory-get-serie (view ids maps)) (:copier nil))
  "Pre: canonical CLOSED maps and sorted distinct positive IDs, owned arrays.
Post: immutable directory of this view only; no public array or accessor.
The controller publishes before locations and retains every FD until EBR reclamation."
  (view nil :type vista-get-serie :read-only t)
  (ids #() :type directory-ids :read-only t)
  (maps #() :type simple-vector :read-only t))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (directory-get-serie) index) conta-segmenti-directory-get)
         (ftype (function (directory-get-serie) index) payload-directory-get-serie))
(defun conta-segmenti-directory-get (directory)
  "Pre: completed directory. Post: view cardinality, including zero.
Does not certify live-resource count or primary publication."
  (length (directory-get-serie-ids directory)))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(defun payload-directory-get-serie (directory)
  "Pre: completed directory. Post: payload of both arrays, twelve bytes per segment on SBCL64.
Excludes Lisp headers/objects, maps, FDs, and retained roots; does not measure RSS or global peak."
  (* +directory-entry-bytes+ (conta-segmenti-directory-get directory)))
