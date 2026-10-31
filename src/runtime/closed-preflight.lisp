;;; OWNER: coordinatore esclusivo del bootstrap; vettori, namespace e FD congelati.
;;; SHARED: sole letture di binding e capacità; nessuna pubblicazione o modifica CSN.
(in-package #:arcdocdb.runtime)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (t t t t) arcdocdb.binary:index) verifica-budget-closed-runtime))
(defun verifica-budget-closed-runtime (closed maps maximum budget)
  "Pre: coordinator's stable inputs. Post: shape, cardinality, and budgets before scans/arrays.
INVALID-ARGUMENT for shape/configuration/count; RESOURCE-EXHAUSTED for capacity/payload.
New-array peak: 20*N bytes on 64-bit SBCL; excludes wrappers, gate hash tables, shared arrays, and GC."
  (unless (and (typep closed 'simple-vector) (typep maps 'simple-vector))
    (error 'invalid-argument :reason :runtime-closed-vectors))
  (unless (and (typep maximum 'arcdocdb.binary:index) (<= 1 maximum 65536)
               (typep budget 'arcdocdb.binary:index))
    (error 'invalid-argument :reason :runtime-closed-configuration))
  (let ((count (length closed)))
    (unless (= count (length maps)) (error 'invalid-argument :reason :runtime-closed-count))
    (when (> count maximum)
      (error 'arcdocdb.conditions:resource-exhausted :reason :runtime-closed-segment-budget))
    (when (> (* 20 count) budget)
      (error 'arcdocdb.conditions:resource-exhausted :reason :runtime-closed-payload-budget))
    count))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-MVC-007 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (archivio-recovery arcdocdb.get:vista-get-serie
                          arcdocdb.control:control-recuperato) arcdocdb.get:vista-get-serie)
                verifica-autorita-closed-runtime))
(defun verifica-autorita-closed-runtime (archive view control)
  "Pre: canonical Archivio and authoritative Serie CONTROL, exclusive bootstrap without readers.
Post: old view in Archivio scope, new view in canonical runtime scope, same UUID.
INVALID-ARGUMENT for absent runtime/scope/identity; corrupt binding propagates INVARIANT-VIOLATION.
Does not certify the catalog, rebuild the primary index, or copy cache/pins from bootstrap."
  (let ((runtime (trova-runtime-archivio archive))
        (old (arcdocdb.control::control-recuperato-view control)))
    (unless runtime (error 'invalid-argument :reason :runtime-closed-unbound))
    (unless (eq (arcdocdb.get::vista-get-serie-scope old)
                (arcdocdb.recovery.archive::archivio-recovery-scope archive))
      (error 'invalid-argument :reason :runtime-closed-bootstrap-scope))
    (unless (eq (arcdocdb.get::vista-get-serie-scope view) (ambito-runtime-archivio runtime))
      (error 'invalid-argument :reason :runtime-closed-target-scope))
    (unless (equalp (arcdocdb.get::vista-get-serie-identity old)
                    (arcdocdb.get::vista-get-serie-identity view))
      (error 'invalid-argument :reason :runtime-closed-serie-identity))
    old))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-FOR-004 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (arcdocdb.get:vista-get-serie t t u32) u32) verifica-mappa-closed-runtime))
(defun verifica-mappa-closed-runtime (old recovered map previous)
  "Pre: complete CLOSED set already verified, stable parallel vectors; PREVIOUS is the preceding ID.
Post: canonical bootstrap-view map, same EQ FD, ID, P, version, and result origin.
INVALID-ARGUMENT for types, order, lifetime, or disagreement; no I/O or u64 storage-ID truncation."
  (unless (typep recovered 'arcdocdb.recovery.closed:closed-recuperato)
    (error 'invalid-argument :reason :runtime-closed-result))
  (let* ((id (arcdocdb.get.directory::verifica-mappa-directory-get old map previous))
         (entry (the arcdocdb.get.resolver:mappa-segmento-get map))
         (segment (arcdocdb.get.resolver::mappa-segmento-get-segment entry)))
    (unless (eq (arcdocdb.get::segmento-get-file segment)
                (arcdocdb.recovery.closed::closed-recuperato-input recovered))
      (error 'invalid-argument :reason :runtime-closed-file))
    (unless (and (= id (arcdocdb.recovery.closed::closed-recuperato-id recovered))
                 (= (arcdocdb.get.resolver::mappa-segmento-get-end entry)
                    (arcdocdb.recovery.closed::closed-recuperato-prefix recovered))
                 (= (arcdocdb.get::segmento-get-version segment)
                    (arcdocdb.recovery.closed::closed-recuperato-version recovered))
                 (= (arcdocdb.get::segmento-get-origin segment)
                    (arcdocdb.recovery.closed::closed-recuperato-origin recovered)))
      (error 'invalid-argument :reason :runtime-closed-source))
    id))
