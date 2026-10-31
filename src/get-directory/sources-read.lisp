;;; OWNER: worker GET nel compito EBR corrente; nessuna root attraversa le code.
;;; SHARED: una lettura acquire della root locale, nessun lock/heap esplicito sul percorso sano.
(in-package #:arcdocdb.get.directory)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get controllore-serie)
                         (values fonti-get-serie (or null radice-get-attiva) &optional))
                acquisisci-fonti-serie-get))
(defun acquisisci-fonti-serie-get (context controller)
  "Pre: CANDIDATE, caller cleanup installed. Post: sources/root from the SAME acquire read.
Foreign view yields INVALID-ARGUMENT; impossible shape/root-controller/duplicate ID => GET FAULTED.
Does not read planned root, reread root, or close/remove resources."
  (let* ((root (leggi-radice-serie controller))
         (active (when (typep root 'radice-get-attiva) root))
         (sources (if active (contenuto-radice-get-attiva active) root)))
    (unless (typep sources 'fonti-get-serie) (guasto-get context :sources-published-root))
    (let ((directory (fonti-get-serie-directory sources)))
      (unless (eq (directory-get-serie-view directory) (contesto-get-view context))
        (error 'invalid-argument :reason :sources-owner))
      (when active
        (let* ((source (radice-get-attiva-source active)) (segment (sorgente-get-attiva-segment source)))
          (unless (eq (sorgente-get-attiva-controller source) controller)
            (guasto-get context :sources-active-controller))
          (unless (eq (segmento-get-owner segment) (directory-get-serie-view directory))
            (guasto-get context :sources-active-owner))
          (unless (and (zerop (segmento-get-high segment)) (plusp (segmento-get-low segment)))
            (guasto-get context :sources-active-id))
          (when (handler-case (contiene-segmento-directory-get directory (segmento-get-low segment))
                  (invariant-violation (condition) (guasto-get context (error-reason condition))))
            (guasto-get context :sources-active-duplicate))))
      (values sources active))))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get controllore-serie)
                         (values segmento-get u32 arcdocdb.binary:u8 (or null u32) &optional))
                risolvi-candidato-serie-get))
(defun risolvi-candidato-serie-get (context controller)
  "Pre: AVVIA-GET produced CANDIDATE under EBR; controller of current view.
Post: candidate from CLOSED or ACTIVE in the single root acquired AFTER lookup.
Sources published before locations and retained for admitted readers: writer obligation.
Wrong-state rejected before cleanup; other errors/exits release pin, invariant failures cause FAULTED."
  (esigi-stato-get context :candidate)
  (let ((complete nil))
    (unwind-protect
         (multiple-value-bind (sources active) (acquisisci-fonti-serie-get context controller)
           (multiple-value-bind (segment end flags proof)
               (if (and active
                        (= (ldb (byte 32 32) (aref (contesto-get-content context) 1))
                           (segmento-get-low (sorgente-get-attiva-segment (radice-get-attiva-source active)))))
                   (risolvi-candidato-radice-attiva-get context active)
                   (risolvi-candidato-directory-get context (fonti-get-serie-directory sources)))
             (setf complete t)
             (values segment end flags proof)))
      (unless complete (abbandona-get context)))))

;;; REQ: REQ-IDX-001 REQ-CCH-002 REQ-FOR-004 REQ-CMP-007
(declaim (ftype (function (contesto-get controllore-serie)
                         (member :hit :miss :verify-failed :disabled :proof-required :buffer-required))
                sonda-cache-serie-get))
(defun sonda-cache-serie-get (context controller)
  "Pre: CANDIDATE after AVVIA-GET. Post: common probe with sources from root acquired under EBR.
Prepared retains proof-required; no I/O or authorization of private response."
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-serie-get context controller)
    (declare (ignore proof)) ; dato verificato; prepared restituisce proof-required nel nucleo GET.
    (sonda-cache-get context segment end flags)))

;;; REQ: REQ-IDX-001 REQ-CCH-002 REQ-FOR-004 REQ-CMP-007 REQ-CON-004
(declaim (ftype (function (contesto-get controllore-serie)
                         (values (member :cache :segment :buffer-required)
                                 (member :hit :miss :verify-failed :disabled :not-attempted)
                                 (member :inserted :present :busy :unavailable :bypassed :not-attempted)
                                 boolean boolean &optional)) leggi-record-serie-get))
(defun leggi-record-serie-get (context controller)
  "Pre: new AVVIA-GET in I/O worker; controller reacquired, no location/pin in queue.
Post: five common GET outcomes; copy and CONCLUDI-GET with fresh time still mandatory.
Prepared rereads authoritative OUTCOME; errors/exits release pin and preserve cause."
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-serie-get context controller)
    (leggi-record-get context segment end flags :outcome-offset proof)))
