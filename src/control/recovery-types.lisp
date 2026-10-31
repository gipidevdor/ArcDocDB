;;; OWNER: recovery esclusivo della Serie mantiene input e vista canonici fino alla pubblicazione.
;;; SHARED: manifest posseduto immutabile; nessun buffer o stato tra Serie.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-FOR-003 REQ-AFF-008
(defstruct (control-recuperato
             (:constructor %make-control-recuperato (view input manifest size prefix status version)) (:copier nil))
  "Pre: read-only file read through caller-attested EOF; header and EDIT prefix verified.
Post: canonical bindings and owned manifest, without aliases to read buffer.
Does not attest to catalog, physical EOF measurement, inventory, or segment prefixes."
  (view nil :type arcdocdb.get:vista-get-serie :read-only t)
  (input nil :type file-io :read-only t)
  (manifest nil :type arcdocdb.recovery.manifest::manifest :read-only t)
  (size 0 :type index :read-only t)
  (prefix 0 :type index :read-only t)
  (status :complete :type (member :complete :tail) :read-only t)
  (version 2 :type (member 1 2) :read-only t))

;;; REQ: REQ-REC-001 REQ-AFF-009
(declaim (ftype (function (control-recuperato)
                         (values index index (member :complete :tail) (member 1 2) &optional))
                frontiere-control-recuperato))
(defun frontiere-control-recuperato (recovered)
  "Pre: complete result. Post: attested EOF, absolute prefix, state, and format of file read.
No buffer, numeric FD, or proof of current health; TYPE-ERROR for invalid types."
  (values (control-recuperato-size recovered) (control-recuperato-prefix recovered)
          (control-recuperato-status recovered) (control-recuperato-version recovered)))

;;; REQ: REQ-REC-001 REQ-FOR-003
(declaim (ftype (function (control-recuperato) arcdocdb.recovery.manifest::manifest)
                manifest-control-recuperato))
(defun manifest-control-recuperato (recovered)
  "Pre: complete result. Post: owned sealed-prefix manifest, accessed through queries.
No table exposed or confirmation of named segments' presence/integrity."
  (control-recuperato-manifest recovered))
