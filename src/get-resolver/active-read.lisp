;;; OWNER: worker GET nel proprio EBR acquisisce la radice pubblicata, mai quella pianificata.
;;; SHARED: sola lettura controller locale/directory/righe; nessun lock o scrittura inter-Serie.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get radice-get-attiva)
                         (values segmento-get u32 u8 null &optional)) risolvi-candidato-radice-attiva-get))
(defun risolvi-candidato-radice-attiva-get (context root)
  "Pre: CANDIDATE; published ROOT acquired AFTER the pin in the same EBR task.
Post: page from ONLY the captured root; NIL proof for ordinary, no controller reread.
The caller attests publication and lifetime: a planned root does not authorize GET.
Foreign view INVALID-ARGUMENT; invariants FAULTED; errors/exits release EBR."
  (esigi-stato-get context :candidate)
  (let ((complete nil))
    (unwind-protect
         (progn
           (unless (eq (segmento-get-owner (sorgente-get-attiva-segment (radice-get-attiva-source root)))
                       (contesto-get-view context))
             (error 'invalid-argument :reason :active-source-owner))
           (multiple-value-bind (segment end flags proof)
               (if (sorgente-get-attiva-arena (radice-get-attiva-source root))
                   (risolvi-candidato-arena-attiva context root)
                   (let ((page (trova-pagina-attiva context root (ldb (byte 32 0) (aref (contesto-get-content context) 1)))))
                     (risolvi-candidato-get context page)))
             (when proof (guasto-get context :active-unexpected-proof))
             (setf complete t)
             (values segment end flags nil)))
      (unless complete (abbandona-get context)))))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get sorgente-get-attiva)
                         (values segmento-get u32 u8 null &optional)) risolvi-candidato-attivo-get))
(defun risolvi-candidato-attivo-get (context source)
  "Pre: CANDIDATE under EBR, source bound to the candidate's segment.
Post: root published with acquire semantics, resolver of the captured view; no frontier from H/EOF.
Controller health propagated; impossible root/source FAULTED; errors release EBR."
  (esigi-stato-get context :candidate)
  (let ((complete nil))
    (unwind-protect
         (progn
           (unless (eq (segmento-get-owner (sorgente-get-attiva-segment source)) (contesto-get-view context))
             (error 'invalid-argument :reason :active-source-owner))
           (let ((root (leggi-radice-serie (sorgente-get-attiva-controller source))))
             (unless (and (typep root 'radice-get-attiva) (eq (radice-get-attiva-source root) source))
               (guasto-get context :active-published-root))
             (multiple-value-bind (segment end flags proof) (risolvi-candidato-radice-attiva-get context root)
               (setf complete t)
               (values segment end flags proof))))
      (unless complete (abbandona-get context)))))

;;; REQ: REQ-CCH-002 REQ-IDX-001 REQ-WAL-006
(declaim (ftype (function (contesto-get sorgente-get-attiva)
                         (member :hit :miss :verify-failed :disabled :proof-required :buffer-required))
                sonda-cache-attiva-get))
(defun sonda-cache-attiva-get (context source)
  "Pre: CANDIDATE after AVVIA-GET under EBR. Post: GET probe with published ordinary page.
No explicit I/O/heap allocation; result remains provisional until copying and CONCLUDI-GET."
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-attivo-get context source)
    (declare (ignore proof)) ; NIL già verificato: nessun esito d'errore scartato.
    (sonda-cache-get context segment end flags)))

;;; REQ: REQ-CCH-002 REQ-IDX-001 REQ-CON-004 REQ-WAL-006
(declaim (ftype (function (contesto-get sorgente-get-attiva)
                         (values (member :cache :segment :buffer-required)
                                 (member :hit :miss :verify-failed :disabled :not-attempted)
                                 (member :inserted :present :busy :unavailable :bypassed :not-attempted)
                                 boolean boolean &optional)) leggi-record-attivo-get))
(defun leggi-record-attivo-get (context source)
  "Pre: new AVVIA-GET in the I/O pool and source acquired in the new epoch.
Post: read/cache from the read-only FD, bytes only within the candidate's published page.
Does not migrate a pin or authorize a response; copying and final verification with fresh time remain mandatory."
  (multiple-value-bind (segment end flags proof) (risolvi-candidato-attivo-get context source)
    (leggi-record-get context segment end flags :outcome-offset proof)))
