;;; OWNER: worker GET nello stesso compito EBR del lookup e della risposta privata.
;;; SHARED: sola lettura degli array immutabili; nessun lock, I/O o scrittura globale.
(in-package #:arcdocdb.get.directory)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get directory-get-serie u32) mappa-segmento-get)
                cerca-mappa-directory-get))
(defun cerca-mappa-directory-get (context directory id)
  "Pre: CANDIDATE, canonical directory acquired under EBR. Post: map with the exact ID.
At most seventeen steps for 65.536 segments; no explicit allocation or I/O.
Impossible shape or missing ID makes GET FAULTED, never an absent document."
  (let* ((ids (directory-get-serie-ids directory)) (maps (directory-get-serie-maps directory))
         (left 0) (right (length ids)))
    (declare (type index left right))
    (unless (and (= right (length maps)) (<= right +directory-max-segments+))
      (guasto-get context :directory-shape))
    (loop repeat +directory-search-attempts+
          do (when (= left right) (guasto-get context :directory-location-absent))
             (let* ((middle (+ left (floor (- right left) 2))) (actual (aref ids middle)))
               (cond ((< actual id) (setf left (1+ middle)))
                     ((> actual id) (setf right middle))
                     (t (let ((map (svref maps middle)))
                          (unless (typep map 'mappa-segmento-get)
                            (guasto-get context :directory-shape))
                          (return-from cerca-mappa-directory-get map))))))
    (guasto-get context :directory-location-absent)))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get directory-get-serie) mappa-segmento-get)
                trova-mappa-directory-get))
(defun trova-mappa-directory-get (context directory)
  "Pre: CANDIDATE; controller acquired directory AFTER AVVIA-GET, in the same epoch.
Post: map selected by the candidate's segment; incorrect order rejected before cleanup.
Errors/nonlocal exits release EBR; foreign view INVALID-ARGUMENT, missing map FAULTED.
The map does not authorize the value: the resolver and GET still verify source/record/proof."
  (esigi-stato-get context :candidate)
  (let ((complete nil))
    (unwind-protect
         (progn
           (unless (eq (directory-get-serie-view directory) (contesto-get-view context))
             (error 'invalid-argument :reason :directory-source-owner))
           (let* ((location (aref (contesto-get-content context) 1))
                  (map (cerca-mappa-directory-get context directory (ldb (byte 32 32) location))))
             (declare (type u64 location))
             (setf complete t)
             map))
      (unless complete (abbandona-get context)))))

;;; REQ: REQ-IDX-001 REQ-FOR-004 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get directory-get-serie)
                         (values segmento-get u32 arcdocdb.binary:u8 (or null u32) &optional))
                risolvi-candidato-directory-get))
(defun risolvi-candidato-directory-get (context directory)
  "Pre: CANDIDATE and directory acquired under EBR after primary lookup.
Post: capability, frontier, storage flags, and CLOSED resolver proof for the candidate.
Propagates faults and cleanup; CSN/size/FD still verified, no response authorized."
  (risolvi-candidato-get context (trova-mappa-directory-get context directory)))

;;; REQ: REQ-IDX-001 REQ-CCH-002 REQ-FOR-004 REQ-CMP-007
(declaim (ftype (function (contesto-get directory-get-serie)
                         (member :hit :miss :verify-failed :disabled :proof-required :buffer-required))
                sonda-cache-directory-get))
(defun sonda-cache-directory-get (context directory)
  "Pre: CANDIDATE and directory in the same epoch. Post: GET probe outcomes, no I/O.
Prepared requires the I/O pool; response private until copying and snapshot completion."
  (sonda-cache-risolta-get context (trova-mappa-directory-get context directory)))

;;; REQ: REQ-IDX-001 REQ-CCH-002 REQ-FOR-004 REQ-CMP-007 REQ-CON-004
(declaim (ftype (function (contesto-get directory-get-serie)
                         (values (member :cache :segment :buffer-required)
                                 (member :hit :miss :verify-failed :disabled :not-attempted)
                                 (member :inserted :present :busy :unavailable :bypassed :not-attempted)
                                 boolean boolean &optional)) leggi-record-directory-get))
(defun leggi-record-directory-get (context directory)
  "Pre: new AVVIA-GET in the I/O pool, directory reacquired under the new epoch.
Post: five GET outcomes from the selected map; no location or pin migrates between pools.
Errors/nonlocal exits release EBR; copying/completion with fresh time mandatory."
  (leggi-record-risolto-get context (trova-mappa-directory-get context directory)))
